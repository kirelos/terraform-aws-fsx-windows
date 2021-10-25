locals {
  security_group_enabled = module.this.enabled && var.security_group_enabled
}

resource "aws_fsx_windows_file_system" "fsx" {
  storage_capacity                  = var.storage_capacity
  subnet_ids                        = var.subnet_ids
  throughput_capacity               = var.throughput_capacity
  active_directory_id               = var.active_directory_id
  automatic_backup_retention_days   = var.automatic_backup_retention_days
  copy_tags_to_backups              = var.copy_tags_to_backups
  daily_automatic_backup_start_time = var.daily_automatic_backup_start_time
  kms_key_id                        = var.kms_key_id
  security_group_ids                = compact(
    sort(concat(
      [module.security_group.id],
      var.security_group_ids
    ))
  )
  skip_final_backup                 = var.skip_final_backup
  tags                              = var.tags
  weekly_maintenance_start_time     = var.weekly_maintenance_start_time

  dynamic "self_managed_active_directory" {
    for_each = var.self_managed_active_directory

    content {
      dns_ips                                = lookup(self_managed_active_directory.value, "dns_ips", null)
      domain_name                            = lookup(self_managed_active_directory.value, "domain_name", null)
      password                               = lookup(self_managed_active_directory.value, "password", null)
      username                               = lookup(self_managed_active_directory.value, "username", null)
      file_system_administrators_group       = lookup(self_managed_active_directory.value, "file_system_administrators_group", null)
      organizational_unit_distinguished_name = lookup(self_managed_active_directory.value, "organizational_unit_distinguished_name", null)
    }
  }
}

module "security_group" {
  source  = "cloudposse/security-group/aws"
  version = "0.3.1"

  use_name_prefix = var.security_group_use_name_prefix
  rules           = var.security_group_rules
  vpc_id          = var.vpc_id
  description     = var.security_group_description

  enabled = local.security_group_enabled
  context = module.this.context
}
