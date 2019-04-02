# ------------------------------------------------------------------------------------------------------------------
# DynamoDB Table Outputs
# ------------------------------------------------------------------------------------------------------------------

output "table_id" {
  value       = "${module.dynamodb.table_id}"
  description = "Nome da tabela do DynamoDB"
}

output "table_arn" {
  value       = "${module.dynamodb.table_arn}"
  description = "DynamoDB table ARN"
}

output "table_stream_arn" {
  value       = "${module.dynamodb.table_stream_arn}"
  description = "DynamoDB table stream ARN"
}

output "table_stream_label" {
  value       = "${module.dynamodb.table_stream_label}"
  description = "Um timestamp, no formato ISO 8601, para essa stream"
}
