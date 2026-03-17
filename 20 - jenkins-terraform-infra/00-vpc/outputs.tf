output "my_vpc_id" {
  value = module.vpc.vpc_id // here vpc_id is there in modules output.tf , thia gives us vpc-id
}

output "pubic_subnet_ids" {
 value = module.vpc.pubic_subnet_ids
}

output "private_subnet_ids" {
   value = module.vpc.private_subnet_ids
}

output "database_subnet_ids" {
   value = module.vpc.private_subnet_ids
}

# Outputs in Terraform are used to expose resource values so they can be reused by other resources, modules, or shown to the user