# kali-rdp-packer
I put this packer template together to build an AMI I could use to quickly Kali EC2 boxes for teams to use during Baruch's CIS4093 final project. This script will generate an up to date Kali AMI w/ RDP configured that you can then deploy in your desired CTF configuration either via AWS GUI, API, Terraform, etc.

## Usage
1. Define your `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables
2. Update `vpc_id` and `subnet_id` with your desired VPC and subnet to spin up the temporary EC2 instance. This is the instance that will be used to create the AMI and will destroyed after the AMI is created. Alternatively, you can leave these blank to use the default VPC configuration
3. Run `packer build` to begin generating the AMI
4. Once you have the AMI created, you can optionally use the `add_users.sh` script during deployment to generate user accounts with random passwords (note that passwords will be logged - this was an acceptable risk given our setup, but you'll want to make your own assessment)
