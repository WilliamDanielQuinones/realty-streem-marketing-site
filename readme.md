## Manual steps if re-creating instance

Manual steps after plan/applying new instance:
- Register Named Servers from DNZ Zone created in Lightsail to Domain Register
- Add record of '@.realtystreem.com' to marketing-site-ip resource if it isn't there already from DNZ Zone created in Lightsail

## Local Development

To update the infrastructure, run `terraform plan` then `terraform apply` and type 'yes' when prompted if changes are correct.

#### Initial set up

- Install AWS CLI

- Ensure that your credentials file in users/user/.aws has Access Key and Secret Key value for the proper AWS Account

- Install Terraform

- Run `terraform init` in this root project folder. This only has to be done once to initialize terraform in your directory.

#### Sanity Checks

To check if you have AWS CLI installed, run:
``` aws --version ```

To check if you have Terraform installed, run:
``` terraform -v ```

### Helpful Links

Installing and configuring AWS CLI
- <https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html>
- <https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html>

Installing Terraform
- <https://learn.hashicorp.com/terraform/getting-started/install.html>
