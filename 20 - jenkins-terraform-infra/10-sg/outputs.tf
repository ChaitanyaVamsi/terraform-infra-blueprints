output "all_sg_ids" {
  value = module.sg[*].sg_id
  description = "List of all Security Group IDs created by the SG modules"
}