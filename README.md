# N8n e Evolution

![Status](https://img.shields.io/badge/Status-Em%20Desenvolvimento-yellow)

## Descrição

Crie esse repo para facilitar a configuração desses serviços em VPS particulares. O docker compose tem as configurações necessárias para criar um container do N8N e também um container do EvolutionApi.

## Principais funcionalidades

O arquivo `docker-compose.yml` define os seguintes serviços:

- **N8n**: Ferramenta completa para criação de fluxos automatizados e com integração com AI.
- **EvolutionApi**: plataforma de código aberto que permite a integração e gerenciamento do WhatsApp através de uma API.

## Tecnologias utilizadas

![Docker](https://img.shields.io/badge/docker-257bd6?style=for-the-badge&logo=docker&logoColor=white)

## Pré-requisitos

- Docker e plugin Compose instalado.
- Criar uma network chamada `projetos-vps`.
- Banco de dados Postgresql instalado.
	- Criar um banco de dados com o nome `n8n`.
- Uma instalação do Redis (opcional).

## Configuração

1. Renomeie o arquivo `.env.sample` para `.env` e preencha as variáveis de ambiente.
2. Rode `docker-compose up -d` para subir os serviços.

## Makefile

Este projeto inclui um `Makefile` para simplificar a atualização dos serviços Docker.

- Comando `update`:  Para atualizar um serviço específico, como o `n8n` ou `evolution`, utilize o comando `make update` com o parâmetro `service`. Este comando irá baixar a imagem mais recente do serviço e recriar o contêiner.
	- Exemplo: `$ make update service=n8n`
- comando  `help`: Para ver a lista de comandos disponíveis no `Makefile`.
	- Exemplo: `$ make help`

## Licença

Distribuído sob a licença MIT. Veja `LICENSE` para mais informações.

## Contato

- Henrique Manduca - [LinkedIn](https.linkedin.com/in/henrique-manduca)
- henriquemanduca@live.com

