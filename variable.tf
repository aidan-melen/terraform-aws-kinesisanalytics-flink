variable "name" {
  type        = string
  description = "Name of the Kinesis Analytics application."
}

variable "jar" {
  type        = string
  description = "A relative path to the jar file."
}

variable "runtime_environment" {
  type        = string
  description = "The runtime environment for the application. Valid values: FLINK-1_6, FLINK-1_8, FLINK-1_11, FLINK-1_13."
  default     = "FLINK-1_13"
}

variable "start_application" {
  type        = bool
  description = "Whether to start or stop the application."
  default     = true
}

variable "create_s3_bucket" {
  type        = string
  description = "Determines whether a an S3 bucket is created or to use an existing S3 bucket."
  default     = true
}

variable "s3_bucket_arn" {
  type        = string
  description = "Existing S3 Bucket ARN for the Flink application jars. Required if create_s3_bucket is set to false"
  default     = null
}

variable "s3_bucket_force_destroy" {
  type        = string
  description = "A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  default     = false
}

variable "create_iam_role" {
  type        = string
  description = "Determines whether a an IAM role is created or to use an existing IAM role"
  default     = true
}

variable "iam_role_arn" {
  type        = string
  description = "Existing IAM role ARN for the cluster. Required if create_iam_role is set to false"
  default     = null
}

variable "subnet_ids" {
  type        = list(string)
  description = "The Subnet IDs used by the VPC configuration."
}
