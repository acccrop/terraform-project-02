locals {
  tags = merge({
    Environment = var.environment
  }, var.tags)
}

provider "kubernetes" {
  host                   = module.app.cluster_endpoint
  cluster_ca_certificate = module.app.cluster_ca_certificate_base64
  token                  = module.app.cluster_token
  load_config_file       = false
  version                = "~> 1.11"
}

module "network" {
  source  = "../components/network"
  environment = var.environment
  tags = var.tags
  vpc = var.vpc
}

module "app" {
  source  = "../components/app"
  environment = var.environment
  tags = var.tags
  vpc = {
    vpc_id = module.network.vpc_id
    private_subnets = module.network.private_subnets
  }
  eks = var.eks
}


