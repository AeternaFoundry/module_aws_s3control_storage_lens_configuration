resource "aws_s3control_storage_lens_configuration" "s3control_storage_lens_configurations" {
  for_each = var.s3control_storage_lens_configurations

  config_id  = each.value.config_id
  account_id = each.value.account_id
  region     = each.value.region
  tags       = each.value.tags
  tags_all   = each.value.tags_all

  storage_lens_configuration {
    account_level {
      dynamic "activity_metrics" {
        for_each = each.value.storage_lens_configuration.account_level.activity_metrics != null ? [each.value.storage_lens_configuration.account_level.activity_metrics] : []
        content {
          enabled = activity_metrics.value.enabled
        }
      }
      dynamic "advanced_cost_optimization_metrics" {
        for_each = each.value.storage_lens_configuration.account_level.advanced_cost_optimization_metrics != null ? [each.value.storage_lens_configuration.account_level.advanced_cost_optimization_metrics] : []
        content {
          enabled = advanced_cost_optimization_metrics.value.enabled
        }
      }
      dynamic "advanced_data_protection_metrics" {
        for_each = each.value.storage_lens_configuration.account_level.advanced_data_protection_metrics != null ? [each.value.storage_lens_configuration.account_level.advanced_data_protection_metrics] : []
        content {
          enabled = advanced_data_protection_metrics.value.enabled
        }
      }
      dynamic "advanced_performance_metrics" {
        for_each = each.value.storage_lens_configuration.account_level.advanced_performance_metrics != null ? [each.value.storage_lens_configuration.account_level.advanced_performance_metrics] : []
        content {
          enabled = advanced_performance_metrics.value.enabled
        }
      }
      bucket_level {
        dynamic "activity_metrics" {
          for_each = each.value.storage_lens_configuration.account_level.bucket_level.activity_metrics != null ? [each.value.storage_lens_configuration.account_level.bucket_level.activity_metrics] : []
          content {
            enabled = activity_metrics.value.enabled
          }
        }
        dynamic "advanced_cost_optimization_metrics" {
          for_each = each.value.storage_lens_configuration.account_level.bucket_level.advanced_cost_optimization_metrics != null ? [each.value.storage_lens_configuration.account_level.bucket_level.advanced_cost_optimization_metrics] : []
          content {
            enabled = advanced_cost_optimization_metrics.value.enabled
          }
        }
        dynamic "advanced_data_protection_metrics" {
          for_each = each.value.storage_lens_configuration.account_level.bucket_level.advanced_data_protection_metrics != null ? [each.value.storage_lens_configuration.account_level.bucket_level.advanced_data_protection_metrics] : []
          content {
            enabled = advanced_data_protection_metrics.value.enabled
          }
        }
        dynamic "advanced_performance_metrics" {
          for_each = each.value.storage_lens_configuration.account_level.bucket_level.advanced_performance_metrics != null ? [each.value.storage_lens_configuration.account_level.bucket_level.advanced_performance_metrics] : []
          content {
            enabled = advanced_performance_metrics.value.enabled
          }
        }
        dynamic "detailed_status_code_metrics" {
          for_each = each.value.storage_lens_configuration.account_level.bucket_level.detailed_status_code_metrics != null ? [each.value.storage_lens_configuration.account_level.bucket_level.detailed_status_code_metrics] : []
          content {
            enabled = detailed_status_code_metrics.value.enabled
          }
        }
        dynamic "prefix_level" {
          for_each = each.value.storage_lens_configuration.account_level.bucket_level.prefix_level != null ? [each.value.storage_lens_configuration.account_level.bucket_level.prefix_level] : []
          content {
            storage_metrics {
              enabled = prefix_level.value.storage_metrics.enabled
              dynamic "selection_criteria" {
                for_each = prefix_level.value.storage_metrics.selection_criteria != null ? [prefix_level.value.storage_metrics.selection_criteria] : []
                content {
                  delimiter                    = selection_criteria.value.delimiter
                  max_depth                    = selection_criteria.value.max_depth
                  min_storage_bytes_percentage = selection_criteria.value.min_storage_bytes_percentage
                }
              }
            }
          }
        }
      }
      dynamic "detailed_status_code_metrics" {
        for_each = each.value.storage_lens_configuration.account_level.detailed_status_code_metrics != null ? [each.value.storage_lens_configuration.account_level.detailed_status_code_metrics] : []
        content {
          enabled = detailed_status_code_metrics.value.enabled
        }
      }
    }
    dynamic "aws_org" {
      for_each = each.value.storage_lens_configuration.aws_org != null ? [each.value.storage_lens_configuration.aws_org] : []
      content {
        arn = aws_org.value.arn
      }
    }
    dynamic "data_export" {
      for_each = each.value.storage_lens_configuration.data_export != null ? [each.value.storage_lens_configuration.data_export] : []
      content {
        dynamic "cloud_watch_metrics" {
          for_each = data_export.value.cloud_watch_metrics != null ? [data_export.value.cloud_watch_metrics] : []
          content {
            enabled = cloud_watch_metrics.value.enabled
          }
        }
        dynamic "s3_bucket_destination" {
          for_each = data_export.value.s3_bucket_destination != null ? [data_export.value.s3_bucket_destination] : []
          content {
            account_id = s3_bucket_destination.value.account_id
            arn        = s3_bucket_destination.value.arn
            dynamic "encryption" {
              for_each = s3_bucket_destination.value.encryption != null ? [s3_bucket_destination.value.encryption] : []
              content {
                dynamic "sse_kms" {
                  for_each = encryption.value.sse_kms != null ? [encryption.value.sse_kms] : []
                  content {
                    key_id = sse_kms.value.key_id
                  }
                }
                dynamic "sse_s3" {
                  for_each = encryption.value.sse_s3 != null ? encryption.value.sse_s3 : []
                  content {
                  }
                }
              }
            }
            format                = s3_bucket_destination.value.format
            output_schema_version = s3_bucket_destination.value.output_schema_version
            prefix                = s3_bucket_destination.value.prefix
          }
        }
        dynamic "storage_lens_table_destination" {
          for_each = data_export.value.storage_lens_table_destination != null ? [data_export.value.storage_lens_table_destination] : []
          content {
            enabled = storage_lens_table_destination.value.enabled
            dynamic "encryption" {
              for_each = storage_lens_table_destination.value.encryption != null ? [storage_lens_table_destination.value.encryption] : []
              content {
                dynamic "sse_kms" {
                  for_each = encryption.value.sse_kms != null ? [encryption.value.sse_kms] : []
                  content {
                    key_id = sse_kms.value.key_id
                  }
                }
                dynamic "sse_s3" {
                  for_each = encryption.value.sse_s3 != null ? encryption.value.sse_s3 : []
                  content {
                  }
                }
              }
            }
          }
        }
      }
    }
    enabled = each.value.storage_lens_configuration.enabled
    dynamic "exclude" {
      for_each = each.value.storage_lens_configuration.exclude != null ? [each.value.storage_lens_configuration.exclude] : []
      content {
        buckets = exclude.value.buckets
        regions = exclude.value.regions
      }
    }
    dynamic "expanded_prefixes_data_export" {
      for_each = each.value.storage_lens_configuration.expanded_prefixes_data_export != null ? [each.value.storage_lens_configuration.expanded_prefixes_data_export] : []
      content {
        dynamic "s3_bucket_destination" {
          for_each = expanded_prefixes_data_export.value.s3_bucket_destination != null ? [expanded_prefixes_data_export.value.s3_bucket_destination] : []
          content {
            account_id = s3_bucket_destination.value.account_id
            arn        = s3_bucket_destination.value.arn
            dynamic "encryption" {
              for_each = s3_bucket_destination.value.encryption != null ? [s3_bucket_destination.value.encryption] : []
              content {
                dynamic "sse_kms" {
                  for_each = encryption.value.sse_kms != null ? [encryption.value.sse_kms] : []
                  content {
                    key_id = sse_kms.value.key_id
                  }
                }
                dynamic "sse_s3" {
                  for_each = encryption.value.sse_s3 != null ? encryption.value.sse_s3 : []
                  content {
                  }
                }
              }
            }
            format                = s3_bucket_destination.value.format
            output_schema_version = s3_bucket_destination.value.output_schema_version
            prefix                = s3_bucket_destination.value.prefix
          }
        }
        dynamic "storage_lens_table_destination" {
          for_each = expanded_prefixes_data_export.value.storage_lens_table_destination != null ? [expanded_prefixes_data_export.value.storage_lens_table_destination] : []
          content {
            enabled = storage_lens_table_destination.value.enabled
            dynamic "encryption" {
              for_each = storage_lens_table_destination.value.encryption != null ? [storage_lens_table_destination.value.encryption] : []
              content {
                dynamic "sse_kms" {
                  for_each = encryption.value.sse_kms != null ? [encryption.value.sse_kms] : []
                  content {
                    key_id = sse_kms.value.key_id
                  }
                }
                dynamic "sse_s3" {
                  for_each = encryption.value.sse_s3 != null ? encryption.value.sse_s3 : []
                  content {
                  }
                }
              }
            }
          }
        }
      }
    }
    dynamic "include" {
      for_each = each.value.storage_lens_configuration.include != null ? [each.value.storage_lens_configuration.include] : []
      content {
        buckets = include.value.buckets
        regions = include.value.regions
      }
    }
    prefix_delimiter = each.value.storage_lens_configuration.prefix_delimiter
  }
}

