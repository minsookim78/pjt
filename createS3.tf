
#createS3.tf :alb 로그를 위한 S3 버킷 생성
resource "aws_s3_bucket" "hholic-alb-s3" {
    bucket = "hholic-alb-log.com"
    policy = <<EOF
{
        "Version": "2012-10-17",
        "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "AWS": "arn:aws:iam::${var.alb_account_id_east}:root","AWS": "arn:aws:iam::${var.alb_account_id_west}:root"
                    },
        "Action": "s3:PutObject",
        "Resource": "arn:aws:s3:::hholic-alb-log.com/*"
        }
    ]
}
EOF
lifecycle_rule {
id = "log_lifecycle"
prefix = ""
enabled = true
transition {
days = 30
storage_class = "GLACIER"
}
expiration {
days = 90
}
}
lifecycle {
prevent_destroy = false
}
}