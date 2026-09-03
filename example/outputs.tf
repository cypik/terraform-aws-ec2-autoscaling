################################################################################
# Launch template
################################################################################

output "launch_template_id" {
  value       = { for k, v in module.autoscaling : k => v.launch_template_id }
  description = "The ID of the launch template"
}

output "launch_template_arn" {
  value       = { for k, v in module.autoscaling : k => v.launch_template_arn }
  description = "The ARN of the launch template"
}

output "launch_template_name" {
  value       = { for k, v in module.autoscaling : k => v.launch_template_name }
  description = "The name of the launch template"
}

output "launch_template_latest_version" {
  value       = { for k, v in module.autoscaling : k => v.launch_template_latest_version }
  description = "The latest version of the launch template"
}

output "launch_template_default_version" {
  value       = { for k, v in module.autoscaling : k => v.launch_template_default_version }
  description = "The default version of the launch template"
}

################################################################################
# Autoscaling group
################################################################################

output "autoscaling_group_id" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_group_id }
  description = "The autoscaling group id"
}

output "autoscaling_group_name" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_group_name }
  description = "The autoscaling group name"
}

output "autoscaling_group_arn" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_group_arn }
  description = "The ARN for this AutoScaling Group"
}

output "autoscaling_group_min_size" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_group_min_size }
  description = "The minimum size of the autoscale group"
}

output "autoscaling_group_max_size" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_group_max_size }
  description = "The maximum size of the autoscale group"
}

output "autoscaling_group_desired_capacity" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_group_desired_capacity }
  description = "The number of Amazon EC2 instances that should be running in the group"
}

output "autoscaling_group_default_cooldown" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_group_default_cooldown }
  description = "Time between a scaling activity and the succeeding scaling activity"
}

output "autoscaling_group_health_check_grace_period" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_group_health_check_grace_period }
  description = "Time after instance comes into service before checking health"
}

output "autoscaling_group_health_check_type" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_group_health_check_type }
  description = "EC2 or ELB. Controls how health checking is done"
}

output "autoscaling_group_availability_zones" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_group_availability_zones }
  description = "The availability zones of the autoscale group"
}

output "autoscaling_group_vpc_zone_identifier" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_group_vpc_zone_identifier }
  description = "The VPC zone identifier"
}

output "autoscaling_group_load_balancers" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_group_load_balancers }
  description = "The load balancer names associated with the autoscaling group"
}

output "autoscaling_group_target_group_arns" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_group_target_group_arns }
  description = "List of Target Group ARNs that apply to this AutoScaling Group"
}

output "autoscaling_group_enabled_metrics" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_group_enabled_metrics }
  description = "List of metrics enabled for collection"
}

################################################################################
# Autoscaling group schedule / policy
################################################################################

output "autoscaling_schedule_arns" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_schedule_arns }
  description = "ARNs of autoscaling group schedules"
}

output "autoscaling_policy_arns" {
  value       = { for k, v in module.autoscaling : k => v.autoscaling_policy_arns }
  description = "ARNs of autoscaling policies"
}

################################################################################
# IAM Role / Instance Profile
################################################################################

output "iam_role_name" {
  value       = { for k, v in module.autoscaling : k => v.iam_role_name }
  description = "The name of the IAM role"
}

output "iam_role_arn" {
  value       = { for k, v in module.autoscaling : k => v.iam_role_arn }
  description = "The Amazon Resource Name (ARN) specifying the IAM role"
}

output "iam_role_unique_id" {
  value       = { for k, v in module.autoscaling : k => v.iam_role_unique_id }
  description = "Stable and unique string identifying the IAM role"
}

output "iam_instance_profile_arn" {
  value       = { for k, v in module.autoscaling : k => v.iam_instance_profile_arn }
  description = "ARN assigned by AWS to the instance profile"
}

output "iam_instance_profile_id" {
  value       = { for k, v in module.autoscaling : k => v.iam_instance_profile_id }
  description = "Instance profile's ID"
}

output "iam_instance_profile_unique" {
  value       = { for k, v in module.autoscaling : k => v.iam_instance_profile_unique }
  description = "Stable and unique string identifying the IAM instance profile"
}
