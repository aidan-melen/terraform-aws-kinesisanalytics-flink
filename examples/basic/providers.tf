provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Example    = local.name
      GithubRepo = "terraform-aws-kinesisanalytics-flink"
      GithubOrg  = "aidan-melen"
    }
  }
}
