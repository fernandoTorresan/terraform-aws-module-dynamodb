# ------------------------------------------------------------------------------------------------------------------
# DynamoDB Table Outputs
# ------------------------------------------------------------------------------------------------------------------

output "table_id" {
  value       = "${aws_dynamodb_table.default.id}"
  description = "Nome da tabela do DynamoDB"
}

output "table_arn" {
  value       = "${aws_dynamodb_table.default.arn}"
  description = "DynamoDB table ARN"
}

output "table_stream_arn" {
  value       = "${aws_dynamodb_table.default.stream_arn}"
  description = "DynamoDB table stream ARN"
}

output "table_stream_label" {
  value       = "${aws_dynamodb_table.default.stream_label}"
  description = "Um timestamp, no formato ISO 8601, para essa stream"
}
