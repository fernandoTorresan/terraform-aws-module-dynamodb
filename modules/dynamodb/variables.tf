# ----------------------------------------------------------------------------------------------------------------------
# VARIÁVEIS OBRIGATÓRIAS
# ----------------------------------------------------------------------------------------------------------------------

# DynamoDB Table

variable "table_name" {
  type        = "string"
  description = "Nome da tabela, deve ser única dentro de uma região"
}

variable "hash_key" {
  type        = "string"
  description = "Nome da hash key da tabela, é necessário que seja definido como um atributo do recurso"
}

# Tags

variable "tags" {
  type        = "map"
  description = "Tags a serem adicionadas aos recursos do dynamodb"
}

# ----------------------------------------------------------------------------------------------------------------------
# VARIÁVEIS OPCIONAIS
# ----------------------------------------------------------------------------------------------------------------------

# DynamoDB Table

variable "read_capacity" {
  default     = 5
  description = "Número de unidades de leituras para esta tabela"
}

variable "write_capacity" {
  default     = 5
  description = "Número de unidades de escritas para esta tabela"
}

variable "enable_encryption" {
  type        = "string"
  default     = "true"
  description = "Habilita a criptografia do tabela KMS padrão da conta da AWS"
}

variable "range_key" {
  type        = "string"
  default     = ""
  description = "Parâmetro para definir a chave de intervalo da tabela DynamoDB"
}

variable "range_key_type" {
  type        = "string"
  default     = "S"
  description = "Tipo da chave de intervalo, no qual deve ser um dos valores: `S`, `N` ou `B` para dados (S)tring, (N)umber ou (B)inary"
}

variable "hash_key_type" {
  type        = "string"
  default     = "S"
  description = "Referente ao tipo da Hash Key, no qual deve ser um dos valores: `S`, `N` ou `B` ara dados (S)tring, (N)umber ou (B)inary"
}

variable "stream_enabled" {
  type        = "string"
  default     = "false"
  description = "Ativar DynamoDB streams"
}

variable "stream_view_type" {
  type        = "string"
  default     = ""
  description = "Quando um item na tabela for alterado, qual informação vai ser gravada no fluxo. Valores válidos são KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES"
}

variable "dynamodb_attributes" {
  type        = "list"
  default     = []
  description = "Atributos adicionais no formulário da lista de valores"
}

variable "global_secondary_index_map" {
  type        = "list"
  default     = []
  description = "Indice secundário adicionar no formulário da lista de valores mapeados"
}

variable "local_secondary_index_map" {
  type        = "list"
  default     = []
  description = "Descreve os indices locais secundários para a tabela. Eles somente podem ser configurados na criação da tabela, a alteração desse recurso em uma tabela existente forçará criação de um novo recurso"
}

variable "point_in_time_recovery_enabled" {
  type        = "string"
  default     = "true"
  description = "Ativar DynamoDB point in time recovery, para prover backup automático"
}
