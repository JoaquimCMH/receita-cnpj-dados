\copy cnpj_dados_cadastrais_pj FROM '/data/cnpj_dados_cadastrais_pj.csv' WITH NULL AS 'NA' DELIMITER '#' CSV HEADER;
\copy cnpj_dados_cnae_secundario_pj FROM '/data/cnpj_dados_cnae_secundario.csv' WITH NULL AS 'NA' DELIMITER '#' CSV HEADER;
\copy cnpj_dados_socios_pj FROM '/data/cnpj_dados_socios_pj.csv' WITH NULL AS 'NA' DELIMITER '#' CSV HEADER;
\copy tab_cnae FROM '/data/tab_cnae.csv' WITH NULL AS 'NA' DELIMITER '#' CSV HEADER;
\copy tab_cnpj_entes_publicos FROM '/data/tab_cnpj_entes_publicos.csv' WITH NULL AS 'NA' DELIMITER '#' CSV HEADER;
\copy tab_codigo_municipios_siafi FROM '/data/tab_codigo_municipios_siafi.csv' WITH NULL AS 'NA' DELIMITER '#' CSV HEADER;
\copy tab_natureza_juridica FROM '/data/tab_natureza_juridica.csv' WITH NULL AS 'NA' DELIMITER '#' CSV HEADER;
\copy tab_qualificacao_responsavel_socio FROM '/data/tab_qualificacao_responsavel_socio.csv' WITH NULL AS 'NA' DELIMITER '#' CSV HEADER;
\copy tab_situacao_cadastral FROM '/data/tab_situacao_cadastral.csv' WITH NULL AS 'NA' DELIMITER '#' CSV HEADER;

