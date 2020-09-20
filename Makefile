.DEFAULT_GOAL : help
help:
	@echo "\nRECEITA-CNPJ - Serviço de dados"
	@echo "Esta serviço fornece dados do Cadastro Nacional da Pessoa Jurídica (CNPJ) oriundos da Receita"
	@echo "Federal (RF). Em resumo, o conjunto de dados disponibilizados contém quase 44 milhões de linhas com"
	@echo "informações sobre todas as empresas do Brasil  como sócios, endereço, situação cadastral, etc. "
	@echo "COMO USAR:\n\t'make <comando>'\n"
	@echo "COMANDOS:"
	@echo "\thelp \t\t\t\tMostra esta mensagem de ajuda"
	@echo "\tbuild \t\t\t\tRealiza o build das imagens com as \n\t\t\t\t\tdependências necessária para a obtenção e \n\t\t\t\t\tprocessamento dos dados."
	@echo "\tup \t\t\t\tCria e inicia os containers."
	@echo "\tstop \t\t\t\tPara todos os serviços."
	@echo "\tclean-volumes \t\t\tPara e remove todos os volumes."
	@echo "\tenter-fetcher-container \ttAbre cli do container fetcher"
	@echo ""
	@echo "\tfeed-create\t\t\tCria as tabelas do banco"
	@echo "\tfeed-import\t\t\tImporta dados para as tabelas do banco"
	@echo "\tfeed-index\t\t\Cria index nas tabelas do banco"
	@echo "\tfeed-clean\t\t\tDropa as tabelas do banco"
	@echo "\tfeed-shell\t\t\tAcessa terminal do banco"
	@echo ""
	@echo ""

.PHONY: help
build:
	docker-compose build
.PHONY: build
up:
	docker-compose up -d
.PHONY: up
stop:
	docker-compose stop
.PHONY: stop
enter-container:
	sudo docker exec -it receita-cnpj-dados sh
.PHONY: enter-container
feed-create:
	docker exec -it receita-cnpj-dados sh -c "Rscript receita-cnpj-dados/DAO.R -f create"
.PHONY: feed-create
feed-import:
	docker exec -it receita-cnpj-dados sh -c "Rscript receita-cnpj-dados/DAO.R -f import"
.PHONY: feed-import
feed-index:
	docker exec -it receita-cnpj-dados sh -c "Rscript receita-cnpj-dados/DAO.R -f index"
.PHONY: feed-index
feed-clean:
	docker exec -it receita-cnpj-dados sh -c "Rscript receita-cnpj-dados/DAO.R -f clean"
.PHONY: feed-clean
feed-shell:
	docker exec -it receita-cnpj-dados sh -c "Rscript receita-cnpj-dados/DAO.R -f shell"
.PHONY: feed-shell
