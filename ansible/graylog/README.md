### graylog-install ansible playbook

Target OS: Ubuntu 18.04

Install dependencies on remote host prior to running playbook against host:

```
sudo apt-get update && sudo apt-get install python3 python3-pip -y
```

Edit the variables in `graylog.yml` to reflect the values appropriate for your install.
