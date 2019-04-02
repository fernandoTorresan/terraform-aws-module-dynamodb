## DynamoDB

Módulo que prove a criação de uma tabela DynamoDB.

## Modules:

- [DynamoDB](modules/dynamodb)

## Review Pre Commit

Para manter a documentação das variáveis no README atualizada e revisar a formatação dos arquivos do 
terraform  antes do commit devem ser instalados o pre-commit e o terraform-docs conforme abaixo:

```bash
sudo pip install pre-commit
sudo wget https://github.com/segmentio/terraform-docs/releases/download/v0.6.0/terraform-docs-v0.6.0-linux-amd64 \
     -O /usr/local/bin/terraform-docs
sudo chmod +x /usr/local/bin/terraform-docs
```

Uma vez instalados execute a configuração do pre-commit no repositório corrente:

```bash
pre-commit install
```
