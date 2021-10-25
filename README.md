## FSx for Windows Module - AWS

Use this module to create a FSx for Windows in AWS.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| active\_directory\_id | The ID for an existing Microsoft Active Directory instance that the file system should join when it's created. Cannot be specified with self\_managed\_active\_directory. | `any` | `null` | no |
| automatic\_backup\_retention\_days | The number of days to retain automatic backups. Minimum of 0 and maximum of 35. Defaults to 7. Set to 0 to disable. | `any` | `null` | no |
| copy\_tags\_to\_backups | A boolean flag indicating whether tags on the file system should be copied to backups. Defaults to false. | `any` | `null` | no |
| daily\_automatic\_backup\_start\_time | The preferred time (in HH:MM format) to take daily automatic backups, in the UTC time zone. | `any` | `null` | no |
| kms\_key\_id | ARN for the KMS Key to encrypt the file system at rest. Defaults to an AWS managed KMS Key. | `any` | `null` | no |
| security\_group\_ids | A list of IDs for the security groups that apply to the specified network interfaces created for file system access. These security groups will apply to all network interfaces. | `list` | `null` | no |
| self\_managed\_active\_directory | Configuration block that Amazon FSx uses to join the Windows File Server instance to your self-managed (including on-premises) Microsoft Active Directory (AD) directory. Cannot be specified with active\_directory\_id. | `list(any)` | `[]` | no |
| skip\_final\_backup | When enabled, will skip the default final backup taken when the file system is deleted. This configuration must be applied separately before attempting to delete the resource to have the desired behavior. Defaults to false. | `any` | `null` | no |
| storage\_capacity | Storage capacity (GiB) of the file system. Minimum of 32 and maximum of 65536. If the storage type is set to HDD the minimum value is 2000. | `any` | n/a | yes |
| subnet\_ids | A list of IDs for the subnets that the file system will be accessible from. To specify more than a single subnet set deployment\_type to MULTI\_AZ\_1. | `list` | n/a | yes |
| tags | A map of tags to assign to the file system. | `map` | `null` | no |
| throughput\_capacity | Throughput (megabytes per second) of the file system in power of 2 increments. Minimum of 8 and maximum of 2048. | `any` | n/a | yes |
| weekly\_maintenance\_start\_time | The preferred start time (in d:HH:MM format) to perform weekly maintenance, in the UTC time zone. | `any` | `null` | no |
| security\_group\_enabled | Whether to create default Security Group for EFS. | `bool` | `true` | no |
| security\_group\_use\_name\_prefix | Whether to create a default Security Group with unique name beginning with the normalized prefix. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Amazon Resource Name of the file system. |
| dns\_name | DNS name for the file system, e.g. fs-12345678.corp.example.com (domain name matching the Active Directory domain name) |
| id | Identifier of the file system, e.g. fs-12345678 |
| security_group_arn | FSX Security Group ARN |
| security_group_id | FSX Security Group ID |
| security_group_name | FSX Security Group name |