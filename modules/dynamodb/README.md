## DynamoDB

Módulo que prove a criação de uma tabela DynamoDB.

## Examples

[DynamoDB](../../examples/dynamodb)


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| hash\_key | Nome da hash key da tabela, é necessário que seja definido como um atributo do recurso | string | - | yes |
| table\_name | Nome da tabela, deve ser única dentro de uma região | string | - | yes |
| tags | Tags a serem adicionadas aos recursos do dynamodb | map | - | yes |
| dynamodb\_attributes | Atributos adicionais no formulário da lista de valores | list | `<list>` | no |
| enable\_encryption | Habilita a criptografia do tabela KMS padrão da conta da AWS | string | `true` | no |
| global\_secondary\_index\_map | Indice secundário adicionar no formulário da lista de valores mapeados | list | `<list>` | no |
| hash\_key\_type | Referente ao tipo da Hash Key, no qual deve ser um dos valores: `S`, `N` ou `B` ara dados (S)tring, (N)umber ou (B)inary | string | `S` | no |
| local\_secondary\_index\_map | Descreve os indices locais secundários para a tabela. Eles somente podem ser configurados na criação da tabela, a alteração desse recurso em uma tabela existente forçará criação de um novo recurso | list | `<list>` | no |
| point\_in\_time\_recovery\_enabled | Ativar DynamoDB point in time recovery, para prover backup automático | string | `true` | no |
| range\_key | Parâmetro para definir a chave de intervalo da tabela DynamoDB | string | `` | no |
| range\_key\_type | Tipo da chave de intervalo, no qual deve ser um dos valores: `S`, `N` ou `B` para dados (S)tring, (N)umber ou (B)inary | string | `S` | no |
| read\_capacity | Número de unidades de leituras para esta tabela | string | `5` | no |
| stream\_enabled | Ativar DynamoDB streams | string | `false` | no |
| stream\_view\_type | Quando um item na tabela for alterado, qual informação vai ser gravada no fluxo. Valores válidos são KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES | string | `` | no |
| write\_capacity | Número de unidades de escritas para esta tabela | string | `5` | no |

## Outputs

| Name | Description |
|------|-------------|
| table\_arn | DynamoDB table ARN |
| table\_id | Nome da tabela do DynamoDB |
| table\_stream\_arn | DynamoDB table stream ARN |
| table\_stream\_label | Um timestamp, no formato ISO 8601, para essa stream |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->