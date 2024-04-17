data "aws_iam_policy_document" "assume_role_db" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [var.iam_user_identifier_s3_backup]
    }

    actions = ["sts:AssumeRole"]

    condition  {
      test     = "StringEquals"
      variable = "sts:ExternalId"

      values   = ["wpvip-site-${var.wpvip-site-id}"]
    }
  }
}

data "aws_iam_policy_document" "assume_role_logs" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [var.iam_user_identifier_s3_http_logs]
    }

    actions = ["sts:AssumeRole"]

    condition  {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = ["wpvip-site-${var.wpvip-site-id}"]
    }
  }
}

resource "aws_iam_role" "wpvip_backup_shipper_access" {
  name = "WPVIPBackupShipperAccess-Site-${var.wpvip-site-id}" 
  path = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role_db.json
  force_detach_policies = true
  tags = {
    Application = "wordpress-vip-security-standards"
    Department  = "pep-engineering"
    Environment = "${var.environment}"
    Managed     = "Terraform"
    Team        = "wordpress-vip"
  }
}

resource "aws_iam_role" "wpvip_log_shipper_access" {
  name = "WPVIPLogShipperAccess-Site-${var.wpvip-site-id}"
  path = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role_logs.json
  force_detach_policies = true
  tags = {
    Application = "wordpress-vip-security-standards"
    Department  = "pep-engineering"
    Environment = "${var.environment}"
    Managed     = "Terraform"
    Team        = "wordpress-vip"
  }
}

resource "aws_iam_role_policy" "WPVIPBackupShipperAccess" {
    name = "WPVIPBackupShipperAccess-${var.wpvip-site-id}"
    role = "${aws_iam_role.wpvip_backup_shipper_access.id}"

    policy = jsonencode({

    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "${var.vip_s3_db_backup_bucket_arn}"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
              "s3:PutObject",
              "s3:GetObject",
              "s3:PutObjectAcl",
            ],
            "Resource": [
                "${var.vip_s3_db_backup_bucket_arn}/*"
            ]
        },
     ]
   })
}

resource "aws_iam_role_policy" "WPVIPLogShipperAccess" {
    name = "WPVIPLogShipperAccess-${var.wpvip-site-id}"
    role = "${aws_iam_role.wpvip_log_shipper_access.id}"

    policy = jsonencode({

    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "${var.vip_s3_http_logs_bucket_arn}"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
              "s3:PutObject",
              "s3:GetObject",
              "s3:PutObjectAcl",
            ],
            "Resource": [
                "${var.vip_s3_http_logs_bucket_arn}/*"
            ]
        },
     ]
   })
}
