### logging ansible playbook

Target OS: Ubuntu 18.04

Install dependencies on remote host prior to running playbook against host:

```
sudo apt-get update && sudo apt-get install python3 python3-pip -y
```


This playbook will configure log shipping to a remote server ready to listen for incoming logs.
