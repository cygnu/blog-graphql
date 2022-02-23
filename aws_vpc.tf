module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"
  # insert the 8 required variables here
  name = var.name_prefix
  cidr = var.aws_vpc_cidr

  azs             = ["${var.aws_region}a", "${var.aws_region}c"]
  private_subnets = var.aws_vpc_private_subnets
  public_subnets  = var.aws_vpc_public_subnets

  # Single NAT Gateway
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  # enable_vpn_gateway = true

  tags = {
    Name        = "${var.tag_name}-vpc"
    Terraform   = "true"
    Environment = "prod"
  }
}
