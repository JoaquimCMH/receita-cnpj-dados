
.HELP <- "
Rscript DAO.R -f <funct>
"

.FUNCT_HELP <- "
\t   funct = create -> Cria as tabelas do Banco de dados
\t   funct = import -> Importa dados para as tabelas do Banco de dados
\t   funct = shell -> Acessa terminal do banco de dados
"

#-----------------------------------FUNÇÕES-----------------------------------#

#' @title Obtém argumentos passados por linha de comando
get_args <- function() {
  args = commandArgs(trailingOnly=TRUE)
  
  option_list = list(
    optparse::make_option(c("-f", "--funct"),
                          type="character",
                          default="shell",
                          help=.FUNCT_HELP,
                          metavar="character")
  );
  
  opt_parser <- optparse::OptionParser(option_list = option_list, usage = .HELP)
  
  opt <- optparse::parse_args(opt_parser)
  return(opt);
}

#' @title Cria as tabelas do Banco de dados
create <- function() {
  system(paste0("psql -h ", host, " -U ", user, " -d ", db, " -f ", " /receita-cnpj-dados/scripts/create/create_cnpj_dados_cadastrais_pj.sql"))
  system(paste0("psql -h ", host, " -U ", user, " -d ", db, " -f ", " /receita-cnpj-dados/scripts/create/create_cnpj_dados_cnae_secundario_pj.sql"))
  system(paste0("psql -h ", host, " -U ", user, " -d ", db, " -f ", " /receita-cnpj-dados/scripts/create/create_cnpj_dados_socios_pj.sql"))
  system(paste0("psql -h ", host, " -U ", user, " -d ", db, " -f ", " /receita-cnpj-dados/scripts/create/create_tab_cnae.sql"))
  system(paste0("psql -h ", host, " -U ", user, " -d ", db, " -f ", " /receita-cnpj-dados/scripts/create/create_tab_cnpj_entes_publicos.sql"))
  system(paste0("psql -h ", host, " -U ", user, " -d ", db, " -f ", " /receita-cnpj-dados/scripts/create/create_tab_codigo_municipios_siafi.sql"))
  system(paste0("psql -h ", host, " -U ", user, " -d ", db, " -f ", " /receita-cnpj-dados/scripts/create/create_tab_natureza_juridica.sql"))	
  system(paste0("psql -h ", host, " -U ", user, " -d ", db, " -f ", " /receita-cnpj-dados/scripts/create/create_tab_qualificacao_responsavel_socio.sql"))	
  system(paste0("psql -h ", host, " -U ", user, " -d ", db, " -f ", " /receita-cnpj-dados/scripts/create/create_tab_situacao_cadastral.sql"))	
}



#' @title Importa dados para as tabelas do Banco de dados
import <- function() {
  system(paste0("psql -h ", host, " -U ", user, " -d ", db, " -f ", " /receita-cnpj-dados/scripts/import/import_data.sql"))
}

#' @title "Dropa as tabelas do Banco de Dados"
clean <- function() {
  system(paste0("psql -h ", host, " -U ", user, " -d ", db, " -f ", " /receita-cnpj-dados/scripts/drop/drop_tables.sql"))
}

#' @title "Cria index nas tabelas do Banco de Dados"
index <- function() {
  system(paste0("psql -h ", host, " -U ", user, " -d ", db, " -f ", " /receita-cnpj-dados/scripts/index/index_tables.sql"))
}


#' @title Acessa terminal do banco de dados
shell <- function() {
  system(paste0("psql -h ", host, " -U ", user, " -d ", db))
}


#-----------------------------------EXECUÇÃO-----------------------------------#

args <- get_args()

funct <- args$funct

host <- Sys.getenv("POSTGRES_HOST")
user <- Sys.getenv("POSTGRES_USER")
db <- Sys.getenv("POSTGRES_DB")
password <- Sys.getenv("POSTGRES_PASSWORD")
Sys.setenv(PGPASSWORD = password)

if (funct == "create") {
  create()
} else if (funct == "import") {
  import()
} else if ( funct == "shell") {
  shell()
} else if ( funct == "clean"){
  clean()
} else if ( funct == "index"){
  index()
}else {
  shell()
}




