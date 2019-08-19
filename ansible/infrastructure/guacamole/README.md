### guacamole ansible playbook

This playbook installs Guacamole in Docker

### Installation:

1. Install the Ansible roles that are dependencies for the playbook to run:

`ansible-galaxy install -r requirements.yml`

2. Edit the variables in `inventory` to reflect the values appropriate for your install.

3. Run the playbook:

`ansible-playbook -i inventory guacamole.yml`


### Post-install:

Before accessing the web interface of Guacamole, the Postgres Docker container needs to be initialized with Guacamole's schema. To generate an sql file for this, use the following command:

```
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > initdb.sql
```


Then copy the sql file to the postgres Docker container:

```
docker cp initdb.sql guac_pg:initdb.sql
```

Then execute the following command to run the sql file against the Postgres Docker instance:

```
docker exec -it guac_pg psql -U db_username -d guacamole_db -a -f initdb.sql
```


Access the web interface for Guacamole on port 9600 of the remote server.

Default Username/Password:
`guacadmin/guacadmin`
