variable "s3control_storage_lens_configurations" {
  description = <<EOT
Map of s3control_storage_lens_configurations, attributes below
Required:
    - config_id
    - storage_lens_configuration (block):
        - account_level (required, block):
            - activity_metrics (optional, block):
                - enabled (optional)
            - advanced_cost_optimization_metrics (optional, block):
                - enabled (optional)
            - advanced_data_protection_metrics (optional, block):
                - enabled (optional)
            - advanced_performance_metrics (optional, block):
                - enabled (optional)
            - bucket_level (required, block):
                - activity_metrics (optional, block):
                    - enabled (optional)
                - advanced_cost_optimization_metrics (optional, block):
                    - enabled (optional)
                - advanced_data_protection_metrics (optional, block):
                    - enabled (optional)
                - advanced_performance_metrics (optional, block):
                    - enabled (optional)
                - detailed_status_code_metrics (optional, block):
                    - enabled (optional)
                - prefix_level (optional, block):
                    - storage_metrics (required, block):
                        - enabled (optional)
                        - selection_criteria (optional, block):
                            - delimiter (optional)
                            - max_depth (optional)
                            - min_storage_bytes_percentage (optional)
            - detailed_status_code_metrics (optional, block):
                - enabled (optional)
        - aws_org (optional, block):
            - arn (required)
        - data_export (optional, block):
            - cloud_watch_metrics (optional, block):
                - enabled (required)
            - s3_bucket_destination (optional, block):
                - account_id (required)
                - arn (required)
                - encryption (optional, block):
                    - sse_kms (optional, block):
                        - key_id (required)
                    - sse_s3 (optional, block):
                - format (required)
                - output_schema_version (required)
                - prefix (optional)
            - storage_lens_table_destination (optional, block):
                - enabled (required)
                - encryption (optional, block):
                    - sse_kms (optional, block):
                        - key_id (required)
                    - sse_s3 (optional, block):
        - enabled (required)
        - exclude (optional, block):
            - buckets (optional)
            - regions (optional)
        - expanded_prefixes_data_export (optional, block):
            - s3_bucket_destination (optional, block):
                - account_id (required)
                - arn (required)
                - encryption (optional, block):
                    - sse_kms (optional, block):
                        - key_id (required)
                    - sse_s3 (optional, block):
                - format (required)
                - output_schema_version (required)
                - prefix (optional)
            - storage_lens_table_destination (optional, block):
                - enabled (required)
                - encryption (optional, block):
                    - sse_kms (optional, block):
                        - key_id (required)
                    - sse_s3 (optional, block):
        - include (optional, block):
            - buckets (optional)
            - regions (optional)
        - prefix_delimiter (optional)
Optional:
    - account_id
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    config_id  = string
    account_id = optional(string)
    region     = optional(string)
    tags       = optional(map(string))
    tags_all   = optional(map(string))
    storage_lens_configuration = object({
      account_level = object({
        activity_metrics = optional(object({
          enabled = optional(bool)
        }))
        advanced_cost_optimization_metrics = optional(object({
          enabled = optional(bool)
        }))
        advanced_data_protection_metrics = optional(object({
          enabled = optional(bool)
        }))
        advanced_performance_metrics = optional(object({
          enabled = optional(bool)
        }))
        bucket_level = object({
          activity_metrics = optional(object({
            enabled = optional(bool)
          }))
          advanced_cost_optimization_metrics = optional(object({
            enabled = optional(bool)
          }))
          advanced_data_protection_metrics = optional(object({
            enabled = optional(bool)
          }))
          advanced_performance_metrics = optional(object({
            enabled = optional(bool)
          }))
          detailed_status_code_metrics = optional(object({
            enabled = optional(bool)
          }))
          prefix_level = optional(object({
            storage_metrics = object({
              enabled = optional(bool)
              selection_criteria = optional(object({
                delimiter                    = optional(string)
                max_depth                    = optional(number)
                min_storage_bytes_percentage = optional(number)
              }))
            })
          }))
        })
        detailed_status_code_metrics = optional(object({
          enabled = optional(bool)
        }))
      })
      aws_org = optional(object({
        arn = string
      }))
      data_export = optional(object({
        cloud_watch_metrics = optional(object({
          enabled = bool
        }))
        s3_bucket_destination = optional(object({
          account_id = string
          arn        = string
          encryption = optional(object({
            sse_kms = optional(object({
              key_id = string
            }))
            sse_s3 = optional(list(object({
            })))
          }))
          format                = string
          output_schema_version = string
          prefix                = optional(string)
        }))
        storage_lens_table_destination = optional(object({
          enabled = bool
          encryption = optional(object({
            sse_kms = optional(object({
              key_id = string
            }))
            sse_s3 = optional(list(object({
            })))
          }))
        }))
      }))
      enabled = bool
      exclude = optional(object({
        buckets = optional(set(string))
        regions = optional(set(string))
      }))
      expanded_prefixes_data_export = optional(object({
        s3_bucket_destination = optional(object({
          account_id = string
          arn        = string
          encryption = optional(object({
            sse_kms = optional(object({
              key_id = string
            }))
            sse_s3 = optional(list(object({
            })))
          }))
          format                = string
          output_schema_version = string
          prefix                = optional(string)
        }))
        storage_lens_table_destination = optional(object({
          enabled = bool
          encryption = optional(object({
            sse_kms = optional(object({
              key_id = string
            }))
            sse_s3 = optional(list(object({
            })))
          }))
        }))
      }))
      include = optional(object({
        buckets = optional(set(string))
        regions = optional(set(string))
      }))
      prefix_delimiter = optional(string)
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.s3control_storage_lens_configurations : (
        v.storage_lens_configuration.account_level.bucket_level.prefix_level == null || (v.storage_lens_configuration.account_level.bucket_level.prefix_level.storage_metrics.selection_criteria == null || (v.storage_lens_configuration.account_level.bucket_level.prefix_level.storage_metrics.selection_criteria.min_storage_bytes_percentage == null || (v.storage_lens_configuration.account_level.bucket_level.prefix_level.storage_metrics.selection_criteria.min_storage_bytes_percentage >= 1.0 && v.storage_lens_configuration.account_level.bucket_level.prefix_level.storage_metrics.selection_criteria.min_storage_bytes_percentage <= 100)))
      )
    ])
    error_message = "must be between 1.0 and 100"
  }
  # Note: 12 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

