output "ec2_ip" {
  description = "EC2 IP"
  value       = module.ec2_module.ec2_ip
}

output "sns_arn" {
  value = module.sns.sns_arn
}