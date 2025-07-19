# Makefile para gerenciar atualizações de serviços do Docker Compose

# Permite que você passe o nome do serviço pela linha de comando.
# Exemplo: make update service=meu-servico-api
# Se nenhum serviço for especificado, ele pedirá para você informar.
service ?= ""

# Adiciona um alvo .PHONY para garantir que o 'make' execute o comando
# em vez de procurar por um arquivo com o mesmo nome do alvo.
.PHONY: update help

all: help

## -----------------------------------------------------------------------------
## Comandos do Docker Compose
## -----------------------------------------------------------------------------

# Atualiza a imagem de um serviço específico e o reinicia.
update:
	@if [ -z "$(service)" ]; then \
		echo "ERRO: Por favor, especifique o nome do serviço."; \
		echo "Uso: make update service=<nome-do-servico>"; \
		exit 1; \
	fi
	@echo "-> Fazendo pull da imagem mais recente para o serviço: [$(service)]..."
	docker compose pull $(service)
	@echo "-> Recriando o contêiner do serviço: [$(service)]..."
	docker compose up -d --no-deps $(service)
	@echo "✅ Atualização do serviço [$(service)] concluída!"

## -----------------------------------------------------------------------------
## Ajuda
## -----------------------------------------------------------------------------

help:
	@echo "Comandos disponíveis:"
	@echo "--------------------"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Uso para atualização:"
	@echo "  make update service=<nome-do-servico>"


# Adicione descrições para os alvos que você quer que apareçam na ajuda.
update: ## Atualiza a imagem de um serviço Docker Compose específico.
help:   ## Mostra esta mensagem de ajuda.