################################################################################
# AWS S3
################################################################################
resource "aws_s3_bucket" "bucket" {
  count         = var.create_s3_bucket ? 1 : 0
  bucket        = var.name
  force_destroy = true
}

resource "aws_s3_object" "jar" {
  bucket = aws_s3_bucket.bucket[0].id
  key    = basename(var.jar)
  source = var.jar
}

################################################################################
# AWS CloudWatch
################################################################################
resource "aws_cloudwatch_log_group" "group" {
  name = var.name
}

resource "aws_cloudwatch_log_stream" "stream" {
  name           = var.name
  log_group_name = aws_cloudwatch_log_group.group.name
}

################################################################################
# AWS IAM
################################################################################
resource "aws_iam_role" "role" {
  count                 = var.create_iam_role ? 1 : 0
  name                  = var.name
  force_detach_policies = true
  assume_role_policy    = <<-EOT
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "kinesisanalytics.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]
    }
  EOT
}

data "template_file" "kinesis_policy" {
  count    = var.create_iam_role ? 1 : 0
  template = file("${path.module}/templates/kinesis_policy.tpl")
  vars = {
    bucket_arn     = try(aws_s3_bucket.bucket[0].arn, var.s3_bucket_arn)
    log_group_arn  = aws_cloudwatch_log_group.group.arn
    log_stream_arn = aws_cloudwatch_log_stream.stream.arn
  }
}

resource "aws_iam_policy" "kinesis_policy" {
  count  = var.create_iam_role ? 1 : 0
  name   = "${var.name}-kinesis-app-policy"
  policy = data.template_file.kinesis_policy[0].rendered
}

resource "aws_iam_policy_attachment" "kinesis_attachment" {
  count      = var.create_iam_role ? 1 : 0
  name       = "${var.name}-kinesis-app-policy"
  roles      = [aws_iam_role.role[0].name]
  policy_arn = aws_iam_policy.kinesis_policy[0].arn
}


################################################################################
# AWS EC2 Security Group
################################################################################
data "aws_subnet" "selected" {
  id = var.subnet_ids[0]
}

resource "aws_security_group" "sg" {
  name        = var.name
  description = "Kinesis analytics application security group."
  vpc_id      = data.aws_subnet.selected.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

################################################################################
# AWS Kinesis
################################################################################
resource "aws_kinesisanalyticsv2_application" "app" {
  name                   = var.name
  runtime_environment    = var.runtime_environment
  service_execution_role = try(aws_iam_role.role[0].arn, var.iam_role_arn)
  start_application      = var.start_application

  application_configuration {
    application_code_configuration {
      code_content {
        s3_content_location {
          bucket_arn = try(aws_s3_bucket.bucket[0].arn, var.s3_bucket_arn)
          file_key   = aws_s3_object.jar.id
        }
      }

      code_content_type = "ZIPFILE"
    }

    vpc_configuration {
      security_group_ids = [aws_security_group.sg.id]
      subnet_ids         = var.subnet_ids
    }
  }

  cloudwatch_logging_options {
    log_stream_arn = aws_cloudwatch_log_stream.stream.arn
  }
}
