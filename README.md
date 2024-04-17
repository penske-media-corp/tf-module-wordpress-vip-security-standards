## Requirements

The following requirements are needed by this module:

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (~> 5.0.0)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (~> 5.0.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_iam_role.wpvip_backup_shipper_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) (resource)
- [aws_iam_role.wpvip_log_shipper_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) (resource)
- [aws_iam_role_policy.WPVIPBackupShipperAccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) (resource)
- [aws_iam_role_policy.WPVIPLogShipperAccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) (resource)
- [aws_iam_policy_document.assume_role_db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.assume_role_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id)

Description: The aws account id

Type: `string`

### <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region)

Description: The aws region that is being deployed into

Type: `string`

### <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit)

Description: The name of the business unit. Valid options are sk | pmc

Type: `string`

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The name of the environment that the resources belong to

Type: `string`

### <a name="input_state_bucket"></a> [state\_bucket](#input\_state\_bucket)

Description: The name of the state bucket

Type: `string`

### <a name="input_wpvip-site-id"></a> [wpvip-site-id](#input\_wpvip-site-id)

Description: The Site ID number generated by the wordpress VIP dashboard

Type: `number`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_iam_user_identifier_s3_backup"></a> [iam\_user\_identifier\_s3\_backup](#input\_iam\_user\_identifier\_s3\_backup)

Description: ARN of the Wordpress VIP IAM user to access the VIP backups bucket

Type: `string`

Default: `"arn:aws:iam::297161530160:user/WPVIPS3BackupShipper"`

### <a name="input_iam_user_identifier_s3_http_logs"></a> [iam\_user\_identifier\_s3\_http\_logs](#input\_iam\_user\_identifier\_s3\_http\_logs)

Description: ARN of the Wordpress VIP IAM user to access the http logs bucket

Type: `string`

Default: `"arn:aws:iam::297161530160:user/WPVIPS3LogShipper"`

### <a name="input_vip_s3_db_backup_bucket_arn"></a> [vip\_s3\_db\_backup\_bucket\_arn](#input\_vip\_s3\_db\_backup\_bucket\_arn)

Description: Bucket arn of the vip db backups bucket

Type: `string`

Default: `""`

### <a name="input_vip_s3_http_logs_bucket_arn"></a> [vip\_s3\_http\_logs\_bucket\_arn](#input\_vip\_s3\_http\_logs\_bucket\_arn)

Description: Bucket arn of the vip http logs backups bucket

Type: `string`

Default: `""`

## Outputs

The following outputs are exported:

### <a name="output_wpvip_backup_role_arn"></a> [wpvip\_backup\_role\_arn](#output\_wpvip\_backup\_role\_arn)

Description: n/a

### <a name="output_wpvip_http_logs_role_arn"></a> [wpvip\_http\_logs\_role\_arn](#output\_wpvip\_http\_logs\_role\_arn)

Description: n/a
