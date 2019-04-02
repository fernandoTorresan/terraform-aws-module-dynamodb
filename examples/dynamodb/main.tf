module "dynamodb" {
  source = "../../modules/dynamodb"

  table_name     = "user"
  hash_key       = "userId"
  range_key      = "userLastName"
  read_capacity  = "1"
  write_capacity = "1"

  dynamodb_attributes = [
    {
      name = "userId"
      type = "S"
    },
    {
      name = "userLastName"
      type = "S"
    },
  ]

  tags = {
    Owner       = "Fernando"
    Environment = "DEV"
  }
}
