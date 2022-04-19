output "s3_bucket_arn" {
  description = "The S3 Bucket ARN."
  value       = try(aws_s3_bucket.bucket[0].bucket, var.s3_bucket_arn)
}

output "iam_role_arn" {
  description = "The IAM Role ARN."
  value       = try(aws_iam_role.role[0].arn, var.iam_role_arn)
}

output "kinesisanalyticsv2_application" {
  description = "All attributes for the Kinesis Analytics application."
  value       = aws_kinesisanalyticsv2_application.app
}

output "cloudwatch_log_group_arn" {
  description = "The Cloudwatch Log Group ARN."
  value       = aws_cloudwatch_log_group.group.arn
}

output "cloudwatch_log_stream_arn" {
  description = "The Cloudwatch Log Stream ARN."
  value       = aws_cloudwatch_log_stream.stream.arn
}
