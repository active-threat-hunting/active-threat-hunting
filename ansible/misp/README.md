### misp ansible playbook

Target OS: Ubuntu 18.04

Install dependencies on remote host prior to running playbook against host:

```
sudo apt-get update && sudo apt-get install python3 python3-pip -y
```

Edit the variables in `inventory` to reflect the values appropriate for your install.

Run the playbook:

`ansible-playbook -i inventory misp.yml`


After the install, it would be recommended to use firewall rules to restrict access to your Hive instance. The ports exposed externally by this playbook are  
