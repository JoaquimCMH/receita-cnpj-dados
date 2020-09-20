CREATE INDEX uf_index on cnpj_dados_cadastrais_pj(uf);
CREATE UNIQUE INDEX index_cnpj ON cnpj_dados_cadastrais_pj(cnpj);
CREATE INDEX index_cnpj_cnae ON cnpj_dados_cnae_secundario_pj(cnpj);
CREATE INDEX index_cnpj_socios ON cnpj_dados_socios_pj(cnpj);
