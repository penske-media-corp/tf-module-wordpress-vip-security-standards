output "wpvip_backup_role_arn" {
  value = aws_iam_role.wpvip_backup_shipper_access.arn
}

output "wpvip_http_logs_role_arn" {
   value = aws_iam_role.wpvip_log_shipper_access.arn
}
