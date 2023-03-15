data "aws_availability_zones" "azs" {}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"
  name = "micro-app"
  cidr = var.vpc_cidr_block
  private_subnets = var.private_subnet_cidr_blocks
  public_subnets = var.public_subnet_cidr_blocks
  azs = data.aws_availablity_zones.azs.names

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernates.io/cluster/eks-cluster-micro-app" = "shared"
  
  public_subnet_tags = {
    "kubernates.io/cluster/eks-cluster-micro-app" = "shared"
    "kubernates.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernates.io/cluster/eks-cluster-micro-app" = "shared"
    "kubernates.io/role/elb" = 1
  }
  }
