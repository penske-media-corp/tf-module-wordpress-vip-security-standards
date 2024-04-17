##################
# Global variables
##################

variable "aws_region" {
  description = "The aws region that is being deployed into"
  type        = string
}

variable "aws_account_id" {
  description = "The aws account id"
  type        = string
}

variable "business_unit" {
  description = "The name of the business unit. Valid options are sk | pmc"
  type        = string
}

variable "environment" {
  description = "The name of the environment that the resources belong to"
  type        = string
}

variable "state_bucket" {
  description = "The name of the state bucket"
  type        = string
}

##################
# Site Specific variables
##################

variable "vip_s3_db_backup_bucket_arn" {
    description  = "Bucket arn of the vip db backups bucket"
    type         = string
    default      = ""
}

variable "vip_s3_http_logs_bucket_arn" {
    description  = "Bucket arn of the vip http logs backups bucket"
    type         = string
    default      = ""
}

variable "iam_user_identifier_s3_backup" {
    description = "ARN of the Wordpress VIP IAM user to access the VIP backups bucket"
    type        = string
    default     = "arn:aws:iam::297161530160:user/WPVIPS3BackupShipper"
}

variable "iam_user_identifier_s3_http_logs" {
    description = "ARN of the Wordpress VIP IAM user to access the http logs bucket"
    type        = string
    default     = "arn:aws:iam::297161530160:user/WPVIPS3LogShipper"
}

variable "wpvip-site-id" {
  description = "The Site ID number generated by the wordpress VIP dashboard"
  type        = number
}
