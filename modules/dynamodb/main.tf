locals {
  attributes_with_range_key = [
    {
      name = "${var.range_key}"
      type = "${var.range_key_type}"
    },
    {
      name = "${var.hash_key}"
      type = "${var.hash_key_type}"
    },
    "${var.dynamodb_attributes}",
  ]
}

resource "aws_dynamodb_table" "default" {
  name             = "${var.table_name}"
  read_capacity    = "${var.read_capacity}"
  write_capacity   = "${var.write_capacity}"
  hash_key         = "${var.hash_key}"
  range_key        = "${var.range_key}"
  stream_enabled   = "${var.stream_enabled}"
  stream_view_type = "${var.stream_view_type}"

  attribute = [
    "${local.attributes_with_range_key}",
  ]

  global_secondary_index = [
    "${var.global_secondary_index_map}",
  ]

  local_secondary_index = [
    "${var.local_secondary_index_map}",
  ]

  server_side_encryption {
    enabled = "${var.enable_encryption}"
  }

  point_in_time_recovery {
    enabled = "${var.point_in_time_recovery_enabled}"
  }

  lifecycle {
    ignore_changes = [
      "read_capacity",
      "write_capacity",
    ]
  }

  tags = "${var.tags}"
}
