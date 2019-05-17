### graylog-install ansible playbook

Target OS: Ubuntu 18.04

Install dependencies on remote host prior to running playbook against host:

```
sudo apt-get update && sudo apt-get install python3 python3-pip -y
```

Edit the variables in `graylog.yml` to reflect the values appropriate for your install.



After the install, it would be recommended to use firewall rules to restrict access to your Graylog instance. Specifically only allow connections to ports 27017, 9200, 9300 from localhost and deny all others (with exceptions made as needed).
