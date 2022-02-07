module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.47.0"

  name                 = "${var.environment}-vpc"
  cidr                 = var.vpc.cidr.vpc
  azs                  = var.vpc.availability_zones
  private_subnets      = var.vpc.cidr.private_subnets
  public_subnets       = var.vpc.cidr.public_subnets
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = merge({
    "kubernetes.io/cluster/${var.environment}-eks" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }, var.tags)

  private_subnet_tags = merge({
    "kubernetes.io/cluster/${var.environment}-eks" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }, var.tags)
}
