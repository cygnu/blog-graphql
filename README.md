## Usage

terraform.tfvars
```hcl
aws_region              = "eu-west-1"
aws_vpc_name            = "blog-graphql"
aws_vpc_cidr            = "10.0.0.0/16"
aws_vpc_azs             = ["eu-west-1a", "eu-west-1b"]
aws_vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
aws_vpc_public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
```