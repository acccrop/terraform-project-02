
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "${var.environment}-eks"
  cluster_version = var.eks.version
  subnets         = var.vpc.private_subnets

  tags = var.tags

  vpc_id = var.vpc.vpc_id

  node_groups = {
    default = {
      desired_capacity = var.eks.nodes_count_min
      max_capacity     = var.eks.nodes_count_max
      min_capacity     = var.eks.nodes_count_min

      instance_types = [var.eks.instance_type]

      k8s_labels = var.tags
    }
  }

  map_roles    = var.eks.access.roles
  map_users    = var.eks.access.users
  map_accounts = var.eks.access.accounts

  cluster_endpoint_public_access_cidrs = var.eks.access.cidr
}