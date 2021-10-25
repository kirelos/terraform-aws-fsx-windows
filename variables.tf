variable "storage_capacity" {
  description = "Storage capacity (GiB) of the file system. Minimum of 32 and maximum of 65536. If the storage type is set to HDD the minimum value is 2000."
}
variable "subnet_ids" {
  type        = list
  description = "A list of IDs for the subnets that the file system will be accessible from. To specify more than a single subnet set deployment_type to MULTI_AZ_1."
}
variable "throughput_capacity" {
  description = "Throughput (megabytes per second) of the file system in power of 2 increments. Minimum of 8 and maximum of 2048."
}
variable "active_directory_id" {
  description = "The ID for an existing Microsoft Active Directory instance that the file system should join when it's created. Cannot be specified with self_managed_active_directory."
  default     = null
}
variable "automatic_backup_retention_days" {
  description = "The number of days to retain automatic backups. Minimum of 0 and maximum of 35. Defaults to 7. Set to 0 to disable."
  default     = null
}
variable "copy_tags_to_backups" {
  description = "A boolean flag indicating whether tags on the file system should be copied to backups. Defaults to false."
  default     = null
}
variable "daily_automatic_backup_start_time" {
  description = "The preferred time (in HH:MM format) to take daily automatic backups, in the UTC time zone."
  default     = null
}
variable "kms_key_id" {
  description = "ARN for the KMS Key to encrypt the file system at rest. Defaults to an AWS managed KMS Key."
  default     = null
}
variable "security_group_ids" {
  type        = list
  description = "A list of IDs for the security groups that apply to the specified network interfaces created for file system access. These security groups will apply to all network interfaces."
  default     = []
}
variable "skip_final_backup" {
  description = "When enabled, will skip the default final backup taken when the file system is deleted. This configuration must be applied separately before attempting to delete the resource to have the desired behavior. Defaults to false."
  default     = null
}
# variable "tags" {
#   description = "A map of tags to assign to the file system."
#   type        = map
#   default     = null
# }
variable "weekly_maintenance_start_time" {
  description = "The preferred start time (in d:HH:MM format) to perform weekly maintenance, in the UTC time zone."
  default     = null
}
variable "self_managed_active_directory" {
  description = "Configuration block that Amazon FSx uses to join the Windows File Server instance to your self-managed (including on-premises) Microsoft Active Directory (AD) directory. Cannot be specified with active_directory_id."
  type        = list(any)
  default     = []
}

variable "security_group_enabled" {
  type        = bool
  description = "Whether to create default Security Group for EFS."
  default     = true
}

variable "security_group_description" {
  type        = string
  default     = "EFS Security Group"
  description = "The Security Group description."
}

variable "security_group_use_name_prefix" {
  type        = bool
  default     = false
  description = "Whether to create a default Security Group with unique name beginning with the normalized prefix."
}

variable "security_group_rules" {
  type = list(any)
  default = [
    {
      type        = "egress"
      from_port   = 0
      to_port     = 65535
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    },
    {
      type        = "ingress"
      from_port   = 445
      to_port     = 445
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow 445 inbound traffic"
    },
    {
      type        = "ingress"
      from_port   = 5985
      to_port     = 5985
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow 5985 inbound traffic"
    }
  ]
  description = <<-EOT
    A list of maps of Security Group rules. 
    The values of map is fully complated with `aws_security_group_rule` resource. 
    To get more info see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule .
  EOT
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}