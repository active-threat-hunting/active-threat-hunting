### kolide-launcher ansible playbook

This playbook installs Kolide's [launcher](https://github.com/kolide/launcher) on Windows, MacOS and Linux. 

### Installation:

1. Download the [latest release of launcher](https://github.com/kolide/launcher/releases) and put it in files/launcher.zip.


2. Edit the variables in `inventory` (or win_inventory if running against Windows) to reflect the values appropriate for your install.

3. Run the playbook (for Linux):

`ansible-playbook -i inventory launcher.yml`

or for Windows inventory:

`ansible-playbook -i win_inventory launcher.yml`


### Additional information:

Change `self_signed_ssl: "true"` to 'self_signed_ssl: "false"` if using a valid SSL certificate on the Fleet server.
