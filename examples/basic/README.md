<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


# Basic Example

Create a Flink Application using AWS Kinesis Analytics.

```hcl
locals {
  name   = "ex-${replace(basename(path.cwd), "_", "-")}"
  region = "us-west-2"

  tags = {
    Example    = local.name
    GithubRepo = "terraform-aws-kinesisanalytics-flink"
    GithubOrg  = "aidan-melen"
  }
}

module "flink" {
  source = "../../"

  name       = local.name
  jar        = "${path.module}/WordCount.jar"
  subnet_ids = module.vpc.private_subnets

  s3_bucket_force_destroy = true
}
```

## Running this module manually

1. Install [Terraform](https://www.terraform.io/) and make sure it's on your `PATH`.
1. Run `terraform init`.
1. Run `terraform apply`.
1. When you're done, run `terraform destroy`.

## Running automated tests against this module

1. Install [Terraform](https://www.terraform.io/) and make sure it's on your `PATH`.
1. Install [Golang](https://golang.org/) and make sure this code is checked out into your `GOPATH`.
1. `cd test`
1. `go test terraform_basic_test.go -v`

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_flink"></a> [flink](#module\_flink) | ../../ | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 3.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS Region | `string` | `"us-west-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kinesisanalyticsv2_application_name"></a> [kinesisanalyticsv2\_application\_name](#output\_kinesisanalyticsv2\_application\_name) | The Kinesis Analytics application name. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
