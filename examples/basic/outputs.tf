output "kinesisanalyticsv2_application_name" {
  description = "The Kinesis Analytics application name."
  value       = module.flink.kinesisanalyticsv2_application.name
}
