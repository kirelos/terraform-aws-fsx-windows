output "arn" {
  description = "Amazon Resource Name of the file system."
  value       = aws_fsx_windows_file_system.fsx.arn
}
output "dns_name" {
  description = "DNS name for the file system, e.g. fs-12345678.corp.example.com (domain name matching the Active Directory domain name)"
  value       = aws_fsx_windows_file_system.fsx.dns_name
}
output "id" {
  description = "Identifier of the file system, e.g. fs-12345678"
  value       = aws_fsx_windows_file_system.fsx.id
}

output "security_group_id" {
  value       = module.security_group.id
  description = "EFS Security Group ID"
}

output "security_group_arn" {
  value       = module.security_group.arn
  description = "EFS Security Group ARN"
}

output "security_group_name" {
  value       = module.security_group.name
  description = "EFS Security Group name"
}