### fleetctl ansible playbook

This playbook installs the `fleetctl` binary for managing Kolide Fleet.

### Installation:

1. Install the Ansible roles that are dependencies for the playbook to run:

`ansible-galaxy install -r requirements.yml`


2. Edit the variables in `inventory` to reflect the values appropriate for your install.

3. Run the playbook:

`ansible-playbook -i inventory fleetctl.yml`


### Post-install:

For Linux/MacOS, `fleetctl` will be installed at `/usr/local/bin/fleetctl`. On Windows, `fleetctl.exe will be installed at `C:\ProgramData\fleet\fleetctl.exe`
