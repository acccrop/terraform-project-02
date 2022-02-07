output "vpc_id" {
  description = "VPC Id"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "Private Subnet Ids"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "Public Subnet Ids"
  value       = module.vpc.public_subnets
}

