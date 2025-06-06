output "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  value       = module.autoscaling.autoscaling_group_name
}

output "launch_template_id" {
  description = "Launch Template ID"
  value       = module.autoscaling.launch_template_id
}

output "iam_instance_profile_arn" {
  description = "IAM Instance Profile ARN"
  value       = module.autoscaling.iam_instance_profile_arn
}
