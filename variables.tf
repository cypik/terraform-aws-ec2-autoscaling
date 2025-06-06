################################################################################
# Autoscaling group
################################################################################

variable "create" {
  type    = bool
  default = true
  description = "Determines whether to create autoscaling group or not"
}

variable "ignore_desired_capacity_changes" {
  type    = bool
  default = false
  description = "Determines whether the `desired_capacity` value is ignored after initial apply. See README note for more details"
}

variable "name" {
  type    = string
  default = ""
  description = "Name used across the resources created"
}

variable "use_name_prefix" {
  type    = bool
  default = true
  description = "Determines whether to use `name` as is or create a unique name beginning with the `name` as the prefix"
}

variable "instance_name" {
  type    = string
  default = ""
  description = "Name that is propogated to launched EC2 instances via a tag - if not provided, defaults to `var.name`"
}

variable "launch_template_id" {
  type    = string
  default = null
  description = "ID of an existing launch template to be used (created outside of this module)"
}

variable "launch_template_version" {
  type    = string
  default = null
  description = "Launch template version. Can be version number, `$Latest`, or `$Default`"
}

variable "availability_zones" {
  type    = list(string)
  default = null
  description = "A list of one or more availability zones for the group. Used for EC2-Classic and default subnets when not specified with `vpc_zone_identifier` argument. Conflicts with `vpc_zone_identifier`"
}

variable "vpc_zone_identifier" {
  type    = list(string)
  default = null
  description = "A list of subnet IDs to launch resources in. Subnets automatically determine which availability zones the group will reside. Conflicts with `availability_zones`"
}

variable "min_size" {
  type    = number
  default = null
  description = "The minimum size of the autoscaling group"
}

variable "max_size" {
  type    = number
  default = null
  description = "The maximum size of the autoscaling group"
}

variable "desired_capacity" {
  type    = number
  default = null
  description = "The number of Amazon EC2 instances that should be running in the autoscaling group"
}

variable "desired_capacity_type" {
  type    = string
  default = null
  description = "The unit of measurement for the value specified for desired_capacity. Supported for attribute-based instance type selection only. Valid values: `units`, `vcpu`, `memory-mib`."
}

variable "capacity_rebalance" {
  type    = bool
  default = null
  description = "Indicates whether capacity rebalance is enabled"
}

variable "min_elb_capacity" {
  type    = number
  default = null
  description = "Setting this causes Terraform to wait for this number of instances to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes"
}

variable "wait_for_elb_capacity" {
  type    = number
  default = null
  description = "Setting this will cause Terraform to wait for exactly this number of healthy instances in all attached load balancers on both create and update operations. Takes precedence over `min_elb_capacity` behavior."
}


variable "wait_for_capacity_timeout" {
  type    = string
  default = null
  description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. (See also Waiting for Capacity below.) Setting this to '0' causes Terraform to skip all Capacity Waiting behavior."
}

variable "default_cooldown" {
  type    = number
  default = null
  description = "The amount of time, in seconds, after a scaling activity completes before another scaling activity can start"
}

variable "default_instance_warmup" {
  type    = number
  default = null
  description = "Amount of time, in seconds, until a newly launched instance can contribute to the Amazon CloudWatch metrics. This delay lets an instance finish initializing before Amazon EC2 Auto Scaling aggregates instance metrics, resulting in more reliable usage data. Set this value equal to the amount of time that it takes for resource consumption to become stable after an instance reaches the InService state."
}

variable "protect_from_scale_in" {
  type    = bool
  default = false
  description = "Allows setting instance protection. The autoscaling group will not select instances with this setting for termination during scale in events."
}

variable "load_balancers" {
  type    = list(string)
  default = []
  description = "A list of elastic load balancer names to add to the autoscaling group names. Only valid for classic load balancers. For ALBs, use `target_group_arns` instead"
}

variable "target_group_arns" {
  type    = list(string)
  default = []
  description = "A set of `aws_alb_target_group` ARNs, for use with Application or Network Load Balancing"
}

variable "placement_group" {
  type    = string
  default = null
  description = "The name of the placement group into which you'll launch your instances, if any"
}

variable "health_check_type" {
  type    = string
  default = null
  description = "`EC2` or `ELB`. Controls how health checking is done"
}

variable "health_check_grace_period" {
  type    = number
  default = null
  description = "Time (in seconds) after instance comes into service before checking health"
}

variable "force_delete" {
  type    = bool
  default = null
  description = "Allows deleting the Auto Scaling Group without waiting for all instances in the pool to terminate. You can force an Auto Scaling Group to delete even if it's in the process of scaling a resource. Normally, Terraform drains all the instances before deleting the group. This bypasses that behavior and potentially leaves resources dangling"
}

variable "termination_policies" {
  type    = list(string)
  default = []
  description = "A list of policies to decide how the instances in the Auto Scaling Group should be terminated. The allowed values are `OldestInstance`, `NewestInstance`, `OldestLaunchConfiguration`, `ClosestToNextInstanceHour`, `OldestLaunchTemplate`, `AllocationStrategy`, `Default`"
}

variable "suspended_processes" {
  type    = list(string)
  default = []
  description = "A list of processes to suspend for the Auto Scaling Group. The allowed values are `Launch`, `Terminate`, `HealthCheck`, `ReplaceUnhealthy`, `AZRebalance`, `AlarmNotification`, `ScheduledActions`, `AddToLoadBalancer`, `InstanceRefresh`. Note that if you suspend either the `Launch` or `Terminate` process types, it can prevent your Auto Scaling Group from functioning properly"
}

variable "max_instance_lifetime" {
  type    = number
  default = null
  description = "The maximum amount of time, in seconds, that an instance can be in service, values must be either equal to 0 or between 86400 and 31536000 seconds"
}

variable "enabled_metrics" {
  type    = list(string)
  default = []
  description = "A list of metrics to collect. The allowed values are `GroupDesiredCapacity`, `GroupInServiceCapacity`, `GroupPendingCapacity`, `GroupMinSize`, `GroupMaxSize`, `GroupInServiceInstances`, `GroupPendingInstances`, `GroupStandbyInstances`, `GroupStandbyCapacity`, `GroupTerminatingCapacity`, `GroupTerminatingInstances`, `GroupTotalCapacity`, `GroupTotalInstances`"
}

variable "metrics_granularity" {
  type    = string
  default = null
  description = "The granularity to associate with the metrics to collect. The only valid value is `1Minute`"
}

variable "service_linked_role_arn" {
  type    = string
  default = null
  description = "The ARN of the service-linked role that the ASG will use to call other AWS services"
}

variable "initial_lifecycle_hooks" {
  type    = list(map(string))
  default = []
  description = "One or more Lifecycle Hooks to attach to the Auto Scaling Group before instances are launched. The syntax is exactly the same as the separate `aws_autoscaling_lifecycle_hook` resource, without the `autoscaling_group_name` attribute. Please note that this will only work when creating a new Auto Scaling Group. For all other use-cases, please use `aws_autoscaling_lifecycle_hook` resource"
}

variable "instance_refresh" {
  type    = any
  default = {}
  description = "If this block is configured, start an Instance Refresh when this Auto Scaling Group is updated"
}

variable "use_mixed_instances_policy" {
  type    = bool
  default = false
  description = "Determines whether to use a mixed instances policy in the autoscaling group or not"
}

variable "mixed_instances_policy" {
  type    = any
  default = null
  description = "Configuration block containing settings to define launch targets for Auto Scaling groups"
}

variable "delete_timeout" {
  type    = string
  default = null
  description = "Delete timeout to wait for destroying autoscaling group"
}

variable "tags" {
  type    = map(string)
  default = {}
  description = "A map of tags to assign to resources"
}

variable "warm_pool" {
  type    = any
  default = {}
  description = "If this block is configured, add a Warm Pool to the specified Auto Scaling group"
}

variable "ebs_optimized" {
  type    = bool
  default = null
  description = "If true, the launched EC2 instance will be EBS-optimized"
}

variable "image_id" {
  type    = string
  default = ""
  description = "The AMI from which to launch the instance"
}

variable "instance_type" {
  type    = string
  default = null
  description = "The type of the instance. If present then `instance_requirements` cannot be present"
}

variable "instance_requirements" {
  type    = any
  default = {}
  description = "The attribute requirements for the type of instance. If present then `instance_type` cannot be present"
}

variable "key_name" {
  type    = string
  default = null
  description = "The key name that should be used for the instance"
}

variable "user_data" {
  type    = string
  default = null
  description = "The Base64-encoded user data to provide when launching the instance"
}

variable "security_groups" {
  type    = list(string)
  default = []
  description = "A list of security group IDs to associate"
}

variable "enable_monitoring" {
  type    = bool
  default = true
  description = "Enables/disables detailed monitoring"
}

variable "metadata_options" {
  type    = map(string)
  default = {}
  description = "Customize the metadata options for the instance"
}

variable "autoscaling_group_tags" {
  type    = map(string)
  default = {}
  description = "A map of additional tags to add to the autoscaling group"
}

variable "ignore_failed_scaling_activities" {
  type    = bool
  default = false
  description = "Whether to ignore failed Auto Scaling scaling activities while waiting for capacity. The default is false -- failed scaling activities cause errors to be returned."
}

################################################################################
# Launch template
################################################################################

variable "create_launch_template" {
  type        = bool
  default     = true
  description = "Determines whether to create launch template or not"
}

variable "launch_template_name" {
  type        = string
  default     = ""
  description = "Name of launch template to be created"
}

variable "launch_template_use_name_prefix" {
  type        = bool
  default     = true
  description = "Determines whether to use `launch_template_name` as is or create a unique name beginning with the `launch_template_name` as the prefix"
}

variable "launch_template_description" {
  type        = string
  default     = null
  description = "Description of the launch template"
}

variable "default_version" {
  type        = string
  default     = null
  description = "Default Version of the launch template"
}

variable "update_default_version" {
  type        = string
  default     = null
  description = "Whether to update Default Version each update. Conflicts with `default_version`"
}

variable "disable_api_termination" {
  type        = bool
  default     = null
  description = "If true, enables EC2 instance termination protection"
}

variable "disable_api_stop" {
  type        = bool
  default     = null
  description = "If true, enables EC2 instance stop protection"
}

variable "instance_initiated_shutdown_behavior" {
  type        = string
  default     = null
  description = "Shutdown behavior for the instance. Can be `stop` or `terminate`. (Default: `stop`)"
}

variable "kernel_id" {
  type        = string
  default     = null
  description = "The kernel ID"
}

variable "ram_disk_id" {
  type        = string
  default     = null
  description = "The ID of the ram disk"
}

variable "block_device_mappings" {
  type        = list(any)
  default     = []
  description = "Specify volumes to attach to the instance besides the volumes specified by the AMI"
}

variable "capacity_reservation_specification" {
  type        = any
  default     = {}
  description = "Targeting for EC2 capacity reservations"
}

variable "cpu_options" {
  type        = map(string)
  default     = {}
  description = "The CPU options for the instance"
}

variable "credit_specification" {
  type        = map(string)
  default     = {}
  description = "Customize the credit specification of the instance"
}

variable "elastic_gpu_specifications" {
  type        = map(string)
  default     = {}
  description = "The elastic GPU to attach to the instance"
}

variable "elastic_inference_accelerator" {
  type        = map(string)
  default     = {}
  description = "Configuration block containing an Elastic Inference Accelerator to attach to the instance"
}

variable "enclave_options" {
  type        = map(string)
  default     = {}
  description = "Enable Nitro Enclaves on launched instances"
}

variable "hibernation_options" {
  type        = map(string)
  default     = {}
  description = "The hibernation options for the instance"
}

variable "instance_market_options" {
  type        = any
  default     = {}
  description = "The market (purchasing) option for the instance"
}

variable "license_specifications" {
  type        = map(string)
  default     = {}
  description = "A list of license specifications to associate with"
}

variable "maintenance_options" {
  type        = any
  default     = {}
  description = "The maintenance options for the instance"
}

variable "network_interfaces" {
  type        = list(any)
  default     = []
  description = "Customize network interfaces to be attached at instance boot time"
}

variable "placement" {
  type        = map(string)
  default     = {}
  description = "The placement of the instance"
}

variable "private_dns_name_options" {
  type        = map(string)
  default     = {}
  description = "The options for the instance hostname. The default values are inherited from the subnet"
}

variable "tag_specifications" {
  type        = list(any)
  default     = []
  description = "The tags to apply to the resources during launch"
}

################################################################################
# Autoscaling group schedule
################################################################################

variable "create_schedule" {
  type        = bool
  default     = true
  description = "Determines whether to create autoscaling group schedule or not"
}

variable "schedules" {
  type        = map(any)
  default     = {}
  description = "Map of autoscaling group schedule to create"
}

################################################################################
# Autoscaling policy
################################################################################

variable "create_scaling_policy" {
  type        = bool
  default     = true
  description = "Determines whether to create target scaling policy schedule or not"
}

variable "scaling_policies" {
  type        = any
  default     = {}
  description = "Map of target scaling policy schedule to create"
}

################################################################################
# IAM Role / Instance Profile
################################################################################

variable "create_iam_instance_profile" {
  type        = bool
  default     = false
  description = "Determines whether an IAM instance profile is created or to use an existing IAM instance profile"
}

variable "iam_instance_profile_arn" {
  type        = string
  default     = null
  description = "Amazon Resource Name (ARN) of an existing IAM instance profile. Used when `create_iam_instance_profile` = `false`"
}

variable "iam_instance_profile_name" {
  type        = string
  default     = null
  description = "The name of the IAM instance profile to be created (`create_iam_instance_profile` = `true`) or existing (`create_iam_instance_profile` = `false`)"
}

variable "iam_role_name" {
  type        = string
  default     = null
  description = "Name to use on IAM role created"
}

variable "iam_role_use_name_prefix" {
  type        = bool
  default     = true
  description = "Determines whether the IAM role name (`iam_role_name`) is used as a prefix"
}

variable "iam_role_path" {
  type        = string
  default     = null
  description = "IAM role path"
}

variable "iam_role_description" {
  type        = string
  default     = null
  description = "Description of the role"
}

variable "iam_role_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IAM role"
}

variable "iam_role_policies" {
  type        = map(string)
  default     = {}
  description = "IAM policies to attach to the IAM role"
}

variable "iam_role_tags" {
  type        = map(string)
  default     = {}
  description = "A map of additional tags to add to the IAM role created"
}

variable "putin_khuylo" {
  type        = bool
  default     = true
  description = "Do you agree that Putin doesn't respect Ukrainian sovereignty and territorial integrity? More info: https://en.wikipedia.org/wiki/Putin_khuylo!"
}
