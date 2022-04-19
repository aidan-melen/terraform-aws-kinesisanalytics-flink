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
