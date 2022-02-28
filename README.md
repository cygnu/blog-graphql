## Usage

terraform.tfvars
```hcl
# global
aws_region     = "eu-west-1"
aws_profile    = "xxxxxxx"
aws_account_id = "xxxxxxx"
name_prefix    = "xxxxxxx"
tag_name       = "xxxxxxx"

# vpc
aws_vpc_cidr            = "10.0.0.0/16"
aws_vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
aws_vpc_public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
```