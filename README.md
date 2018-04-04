# cloud-systools

cloud-systools is a suite of helpers and small CLI's tools designed to make the process of installing and configured cloud based servers and services easier.

## Helpers

| Name                     | Description                                                  | Usage                                              |
| ------------------------ | ------------------------------------------------------------ | -------------------------------------------------- |
| if_exists                | Shorthand for `if [ -e $file]`                               | `if_exists file || touch file`                     |
| extract                  | Extracts multiple format archives                            | `extract a.zip; extract a.tgz`                     |
| install_git_sync         | Checks out and keeps a git repository synchronized with a local folder. <br> Links `.hooks/post-merge` -> `.git/hooks/post-merge` if it exists | `install_git_sync {git_repo} {local path}`         |
| install_rpm              | Installs an RPM from an HTTP location. <br> Checks if the package is installed by filename, rather than downloading | `install_rpm http://host/big_app.rpm`              |
| install_service          | Creates a new systemd service                                | `install_service {name} {cmd}`                     |
| install_service_override | Overrides properties for an existing service                 | `install_service_override {service} {key}={value}` |
| install_timer            | Creates a new systemd based timer task                       | `install_timer {name} {cmd} [time unit]`           |
| install_bin              | Downloads a file to `/usr/bin/` and `chmod +x`' it           | `install_bin`                                      |
| deploy_file              | Downloads and copies a file into a directory in a safe manner | `deploy_file {url} {dir}`                          |
| extract                  | Extract different type of archives silently                  |                                                    |
| create_service_account   | Creates a new user and home directory meant for for running services | `create_service_account java`                      |
| bootstrap_volume         | Partitions, formats and mounts a volume                      | `bootstrap_volume {dev} {mount} {type} [owner]`    |
| port.py                  | Pings all ports on all A records returned                    | `port.py google.com 80,443`                        |
|                          |                                                              |                                                    |

### AWS Specific Tools

| Name                    | Description                                                  | Usage                                             |
| ----------------------- | ------------------------------------------------------------ | ------------------------------------------------- |
| aws_list_hosts          | Lists all hosts in an AWS account in a format suitable for `/etc/hosts` | `aws_list_hosts > /etc/hosts`                     |
| aws_list_instances      | List all instances in a simplified JSON format               | `aws_list_instances | jq '.[] | [.name,.ip]'`     |
| aws_list_targets        | List all instances registered with an ELB                    | `aws_list_targets {elb name}`                     |
| aws_register_target     | Register an instance with an ELB                             | `aws_register_target {elb} {instance-id}`         |
| aws_deregister_target   | De-register an instance with an ELB                          | `aws_deregister_target {elb} {instance-id}`       |
| aws_environment_updater | Updates **/etc/environment** with the IP's of instance groups and  **/etc/secrets.json** with SSM secrets | `install_timer /usr/bin/aws_environment_updater ` |
| install_aws_codecommit  | Configures git credentials to use AWS                        | `install_aws_codecommit [profile]`                |

