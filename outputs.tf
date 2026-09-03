################################################################################
# Launch template
################################################################################

output "launch_template_id" {
  value       = try(aws_launch_template.main[0].id, null)
  description = "The ID of the launch template"
}

output "launch_template_arn" {
  value       = try(aws_launch_template.main[0].arn, null)
  description = "The ARN of the launch template"
}

output "launch_template_name" {
  value       = try(aws_launch_template.main[0].name, null)
  description = "The name of the launch template"
}

output "launch_template_latest_version" {
  value       = try(aws_launch_template.main[0].latest_version, null)
  description = "The latest version of the launch template"
}

output "launch_template_default_version" {
  value       = try(aws_launch_template.main[0].default_version, null)
  description = "The default version of the launch template"
}

################################################################################
# Autoscaling group
################################################################################

output "autoscaling_group_id" {
  value       = try(aws_autoscaling_group.main[0].id, aws_autoscaling_group.idc[0].id, null)
  description = "The autoscaling group id"
}

output "autoscaling_group_name" {
  value       = try(aws_autoscaling_group.main[0].name, aws_autoscaling_group.idc[0].name, null)
  description = "The autoscaling group name"
}

output "autoscaling_group_arn" {
  value       = try(aws_autoscaling_group.main[0].arn, aws_autoscaling_group.idc[0].arn, null)
  description = "The ARN for main AutoScaling Group"
}

output "autoscaling_group_min_size" {
  value       = try(aws_autoscaling_group.main[0].min_size, aws_autoscaling_group.idc[0].min_size, null)
  description = "The minimum size of the autoscale group"
}

output "autoscaling_group_max_size" {
  value       = try(aws_autoscaling_group.main[0].max_size, aws_autoscaling_group.idc[0].max_size, null)
  description = "The maximum size of the autoscale group"
}

output "autoscaling_group_desired_capacity" {
  value       = try(aws_autoscaling_group.main[0].desired_capacity, aws_autoscaling_group.idc[0].desired_capacity, null)
  description = "The number of Amazon EC2 instances that should be running in the group"
}

output "autoscaling_group_default_cooldown" {
  value       = try(aws_autoscaling_group.main[0].default_cooldown, aws_autoscaling_group.idc[0].default_cooldown, null)
  description = "Time between a scaling activity and the succeeding scaling activity"
}

output "autoscaling_group_health_check_grace_period" {
  value       = try(aws_autoscaling_group.main[0].health_check_grace_period, aws_autoscaling_group.idc[0].health_check_grace_period, null)
  description = "Time after instance comes into service before checking health"
}

output "autoscaling_group_health_check_type" {
  value       = try(aws_autoscaling_group.main[0].health_check_type, aws_autoscaling_group.idc[0].health_check_type, null)
  description = "EC2 or ELB. Controls how health checking is done"
}

output "autoscaling_group_availability_zones" {
  value       = try(aws_autoscaling_group.main[0].availability_zones, aws_autoscaling_group.idc[0].availability_zones, [])
  description = "The availability zones of the autoscale group"
}

output "autoscaling_group_vpc_zone_identifier" {
  value       = try(aws_autoscaling_group.main[0].vpc_zone_identifier, aws_autoscaling_group.idc[0].vpc_zone_identifier, [])
  description = "The VPC zone identifier"
}

output "autoscaling_group_load_balancers" {
  value       = try(aws_autoscaling_group.main[0].load_balancers, aws_autoscaling_group.idc[0].load_balancers, [])
  description = "The load balancer names associated with the autoscaling group"
}

output "autoscaling_group_target_group_arns" {
  value       = try(aws_autoscaling_group.main[0].target_group_arns, aws_autoscaling_group.idc[0].target_group_arns, [])
  description = "List of Target Group ARNs that apply to main AutoScaling Group"
}

output "autoscaling_group_enabled_metrics" {
  value       = try(aws_autoscaling_group.main[0].enabled_metrics, aws_autoscaling_group.idc[0].enabled_metrics, [])
  description = "List of metrics enabled for collection"
}

################################################################################
# Autoscaling group schedule
################################################################################

output "autoscaling_schedule_arns" {
  value       = { for k, v in aws_autoscaling_schedule.main : k => v.arn }
  description = "ARNs of autoscaling group schedules"
}

################################################################################
# Autoscaling Policy
################################################################################

output "autoscaling_policy_arns" {
  value       = { for k, v in aws_autoscaling_policy.main : k => v.arn }
  description = "ARNs of autoscaling policies"
}

################################################################################
# IAM Role / Instance Profile
################################################################################

output "iam_role_name" {
  value       = try(aws_iam_role.main[0].name, null)
  description = "The name of the IAM role"
}

output "iam_role_arn" {
  value       = try(aws_iam_role.main[0].arn, null)
  description = "The Amazon Resource Name (ARN) specifying the IAM role"
}

output "iam_role_unique_id" {
  value       = try(aws_iam_role.main[0].unique_id, null)
  description = "Stable and unique string identifying the IAM role"
}

output "iam_instance_profile_arn" {
  value       = try(aws_iam_instance_profile.main[0].arn, var.iam_instance_profile_arn)
  description = "ARN assigned by AWS to the instance profile"
}

output "iam_instance_profile_id" {
  value       = try(aws_iam_instance_profile.main[0].id, null)
  description = "Instance profile's ID"
}

output "iam_instance_profile_unique" {
  value       = try(aws_iam_instance_profile.main[0].unique_id, null)
  description = "Stable and unique string identifying the IAM instance profile"
}
