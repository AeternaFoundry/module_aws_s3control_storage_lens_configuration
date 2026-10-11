output "s3control_storage_lens_configurations_id" {
  description = "Map of id values across all s3control_storage_lens_configurations, keyed the same as var.s3control_storage_lens_configurations"
  value       = { for k, v in aws_s3control_storage_lens_configuration.s3control_storage_lens_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "s3control_storage_lens_configurations_account_id" {
  description = "Map of account_id values across all s3control_storage_lens_configurations, keyed the same as var.s3control_storage_lens_configurations"
  value       = { for k, v in aws_s3control_storage_lens_configuration.s3control_storage_lens_configurations : k => v.account_id if v.account_id != null && length(v.account_id) > 0 }
}
output "s3control_storage_lens_configurations_arn" {
  description = "Map of arn values across all s3control_storage_lens_configurations, keyed the same as var.s3control_storage_lens_configurations"
  value       = { for k, v in aws_s3control_storage_lens_configuration.s3control_storage_lens_configurations : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "s3control_storage_lens_configurations_config_id" {
  description = "Map of config_id values across all s3control_storage_lens_configurations, keyed the same as var.s3control_storage_lens_configurations"
  value       = { for k, v in aws_s3control_storage_lens_configuration.s3control_storage_lens_configurations : k => v.config_id if v.config_id != null && length(v.config_id) > 0 }
}
output "s3control_storage_lens_configurations_region" {
  description = "Map of region values across all s3control_storage_lens_configurations, keyed the same as var.s3control_storage_lens_configurations"
  value       = { for k, v in aws_s3control_storage_lens_configuration.s3control_storage_lens_configurations : k => v.region if v.region != null && length(v.region) > 0 }
}
output "s3control_storage_lens_configurations_storage_lens_configuration" {
  description = "Map of storage_lens_configuration values across all s3control_storage_lens_configurations, keyed the same as var.s3control_storage_lens_configurations"
  value       = { for k, v in aws_s3control_storage_lens_configuration.s3control_storage_lens_configurations : k => one(v.storage_lens_configuration) if v.storage_lens_configuration != null && length(v.storage_lens_configuration) > 0 }
}
output "s3control_storage_lens_configurations_tags" {
  description = "Map of tags values across all s3control_storage_lens_configurations, keyed the same as var.s3control_storage_lens_configurations"
  value       = { for k, v in aws_s3control_storage_lens_configuration.s3control_storage_lens_configurations : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "s3control_storage_lens_configurations_tags_all" {
  description = "Map of tags_all values across all s3control_storage_lens_configurations, keyed the same as var.s3control_storage_lens_configurations"
  value       = { for k, v in aws_s3control_storage_lens_configuration.s3control_storage_lens_configurations : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

