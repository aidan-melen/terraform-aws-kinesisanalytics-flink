# terraform-aws-kinesisanalytics-flink

A Terraform module that manages a Amazon Kinesis Flink Data Stream.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.10.0 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_stream.stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream) | resource |
| [aws_iam_policy.kinesis_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.kinesis_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_kinesisanalyticsv2_application.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesisanalyticsv2_application) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_object.jar](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [template_file.kinesis_policy](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_iam_role"></a> [create\_iam\_role](#input\_create\_iam\_role) | Determines whether a an IAM role is created or to use an existing IAM role | `string` | `true` | no |
| <a name="input_create_s3_bucket"></a> [create\_s3\_bucket](#input\_create\_s3\_bucket) | Determines whether a an S3 bucket is created or to use an existing S3 bucket. | `string` | `true` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | Existing IAM role ARN for the cluster. Required if create\_iam\_role is set to false | `string` | `null` | no |
| <a name="input_jar"></a> [jar](#input\_jar) | A relative path to the jar file. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Kinesis Analytics application. | `string` | n/a | yes |
| <a name="input_runtime_environment"></a> [runtime\_environment](#input\_runtime\_environment) | The runtime environment for the application. Valid values: FLINK-1\_6, FLINK-1\_8, FLINK-1\_11, FLINK-1\_13. | `string` | `"FLINK-1_13"` | no |
| <a name="input_s3_bucket_arn"></a> [s3\_bucket\_arn](#input\_s3\_bucket\_arn) | Existing S3 Bucket ARN for the Flink application jars. Required if create\_s3\_bucket is set to false | `string` | `null` | no |
| <a name="input_s3_bucket_force_destroy"></a> [s3\_bucket\_force\_destroy](#input\_s3\_bucket\_force\_destroy) | A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | `string` | `false` | no |
| <a name="input_start_application"></a> [start\_application](#input\_start\_application) | Whether to start or stop the application. | `bool` | `true` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The Subnet IDs used by the VPC configuration. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_log_group_arn"></a> [cloudwatch\_log\_group\_arn](#output\_cloudwatch\_log\_group\_arn) | The Cloudwatch Log Group ARN. |
| <a name="output_cloudwatch_log_stream_arn"></a> [cloudwatch\_log\_stream\_arn](#output\_cloudwatch\_log\_stream\_arn) | The Cloudwatch Log Stream ARN. |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | The IAM Role ARN. |
| <a name="output_kinesisanalyticsv2_application"></a> [kinesisanalyticsv2\_application](#output\_kinesisanalyticsv2\_application) | All attributes for the Kinesis Analytics application. |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | The S3 Bucket ARN. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
