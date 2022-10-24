DROP DATABASE IF EXISTS skate_or_die;
CREATE DATABASE skate_or_die;

USE skate_or_die;

DROP TABLE IF EXISTS 
cliente
,endereco
,cidade
,estado
,montador
,peca1
,peca2
,peca3
,peca4
,peca5
,peca6
,pecas
,montagem
,frete
,entrega;

CREATE TABLE estado ( -- Criar Tabela estado
id INT NOT NULL  AUTO_INCREMENT
,nome VARCHAR (200) NOT NULL UNIQUE
,sigla CHAR (2) NOT NULL UNIQUE
,CONSTRAINT pk_estado PRIMARY KEY (id)
);
CREATE TABLE cidade ( -- Criar Tabela cidade
id INT NOT NULL  AUTO_INCREMENT
,nome VARCHAR (200) NOT NULL
,estado_id INT NOT NULL 
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id) 
);
CREATE TABLE endereco( -- Criar Tabela endereço

id INT NOT NULL AUTO_INCREMENT
,rua VARCHAR (200) NOT NULL
,numero VARCHAR (4) NOT NULL
,cidade_id INT NOT NULL
,CONSTRAINT pk_endereco PRIMARY KEY (id)
,CONSTRAINT fk_cidade FOREIGN KEY (cidade_id) REFERENCES cidade (id)
);
CREATE TABLE cliente(	-- Criar Tabela do Cliente
	
id INT NOT NULL  AUTO_INCREMENT
,nome VARCHAR (200) NOT NULL
,telefone VARCHAR (11) NOT NULL UNIQUE
,email VARCHAR(200) NOT NULL UNIQUE
,endereco_id INT NOT NULL
,CONSTRAINT pk_cliente PRIMARY KEY (id)
,CONSTRAINT fk_endereco FOREIGN KEY (endereco_id) REFERENCES endereco (id)
); 
CREATE TABLE montador(	-- Criar Tabela do Montador
	
id INT NOT NULL  AUTO_INCREMENT
,nome VARCHAR (200) NOT NULL
,telefone VARCHAR (11) NOT NULL UNIQUE
,email VARCHAR(200) NOT NULL UNIQUE
,endereco_id INT NOT NULL
,CONSTRAINT pk_montador PRIMARY KEY (id)
,CONSTRAINT fk_endereco1 FOREIGN KEY (endereco_id) REFERENCES endereco (id)
); 
CREATE TABLE peca1 ( -- Criar Tabela da primeira peça
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR (200) NOT NULL
,material VARCHAR (200) NOT NULL
,tamanho_cm VARCHAR (200) NOT NULL
,cor VARCHAR (200) NOT NULL
,CONSTRAINT fk_peca_1 PRIMARY KEY (id)
);
CREATE TABLE peca2 ( -- Criar Tabela da segunda peça
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR (200) NOT NULL
,material VARCHAR (200) NOT NULL
,tamanho_cm VARCHAR (200) NOT NULL
,cor VARCHAR (200) NOT NULL
,CONSTRAINT fk_peca_2 PRIMARY KEY (id)
);
CREATE TABLE peca3 ( -- Criar Tabela da terceira peça
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR (200) NOT NULL
,material VARCHAR (200) NOT NULL
,tamanho_cm VARCHAR (200) NOT NULL
,cor VARCHAR (200) NOT NULL
,CONSTRAINT fk_peca_3 PRIMARY KEY (id)
);
CREATE TABLE peca4 ( -- Criar Tabela da quarta peça
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR (200) NOT NULL
,material VARCHAR (200) NOT NULL
,tamanho_cm VARCHAR (200) NOT NULL
,cor VARCHAR (200) NOT NULL
,CONSTRAINT fk_peca_4 PRIMARY KEY (id)
);
CREATE TABLE peca5 ( -- Criar Tabela da quinta peça
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR (200) NOT NULL
,material VARCHAR (200) NOT NULL
,tamanho_cm VARCHAR (200) NOT NULL
,cor VARCHAR (200) NOT NULL
,CONSTRAINT fk_peca_5 PRIMARY KEY (id)
);
CREATE TABLE peca6 ( -- Criar Tabela da sexta peça
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR (200) NOT NULL
,material VARCHAR (200) NOT NULL
,tamanho_cm VARCHAR (200) NOT NULL
,cor VARCHAR (200) NOT NULL
,CONSTRAINT fk_peca_6 PRIMARY KEY (id)
);
CREATE TABLE pecas ( -- Criar Tabela Peças
id INT NOT NULL AUTO_INCREMENT
,id_peca_1 INT NOT NULL
,id_peca_2 INT NOT NULL
,id_peca_3 INT NOT NULL
,id_peca_4 INT NOT NULL
,id_peca_5 INT NOT NULL
,id_peca_6 INT NOT NULL
,CONSTRAINT pk_pecas PRIMARY KEY (id)
,CONSTRAINT fk_peca_1 FOREIGN KEY (id_peca_1) REFERENCES peca1 (id)
,CONSTRAINT fk_peca_2 FOREIGN KEY (id_peca_2) REFERENCES peca2 (id)
,CONSTRAINT fk_peca_3 FOREIGN KEY (id_peca_3) REFERENCES peca3 (id)
,CONSTRAINT fk_peca_4 FOREIGN KEY (id_peca_4) REFERENCES peca4 (id)
,CONSTRAINT fk_peca_5 FOREIGN KEY (id_peca_5) REFERENCES peca5 (id)
,CONSTRAINT fk_peca_6 FOREIGN KEY (id_peca_6) REFERENCES peca6 (id)
);
CREATE TABLE montagem ( -- Criar Tabela montagem
id INT NOT NULL  AUTO_INCREMENT
,montador_id INT NOT NULL
,pecas_id INT NOT NULL
,tempo_de_montagem VARCHAR (100) NOT NULL
,custo_montagem VARCHAR (100) NOT NULL
,CONSTRAINT pk_montagem PRIMARY KEY (id)
,CONSTRAINT fk_montador FOREIGN KEY (montador_id) REFERENCES montador (id)
,CONSTRAINT fk_pecas FOREIGN KEY (pecas_id) REFERENCES pecas (id)
);
CREATE TABLE frete( -- Criar tabela de frete
id INT NOT NULL AUTO_INCREMENT
,valor VARCHAR (100) NOT NULL
,endereco_id INT NOT NULL
,CONSTRAINT pk_frete PRIMARY KEY (id)
,CONSTRAINT fk_endereco2 FOREIGN KEY (endereco_id) REFERENCES endereco (id)
);
CREATE TABLE entrega( -- Criar tabela de entrega
tempo_para_entrega VARCHAR (100)NOT NULL
,entrega_conluida CHAR(1) NOT NULL
,frete_id INT NOT NULL
,CONSTRAINT fk_frete FOREIGN KEY (frete_id) REFERENCES frete (id)

);

INSERT INTO estado (nome, sigla) VALUES ('RONDONIA', 'RO');
INSERT INTO estado (nome, sigla) VALUES ('PARANA', 'PR');
INSERT INTO estado (nome, sigla) VALUES ('RIO DE JANEIRO', 'SP');
INSERT INTO cidade (nome, estado_id) VALUES ('PORTO VELHO', 1);
INSERT INTO cidade (nome, estado_id) VALUES ('ALTO PARANA', 2);
INSERT INTO cidade (nome, estado_id) VALUES ('PETROPOLIS', 3);
INSERT INTO endereco (rua, numero, cidade_id) VALUES ('ANTONIO VIVALDI', '6783', 1);
INSERT INTO endereco (rua, numero, cidade_id) VALUES ('ITAQUERA', '666', 2);
INSERT INTO endereco (rua, numero, cidade_id) VALUES ('JACARÉPAGUA', '69', 3);
INSERT INTO cliente (nome, telefone, email, endereco_id) VALUES ('RENATO AUGUSTO', '6992426969', 'renatoplatz11@example.com', 1);
INSERT INTO cliente (nome, telefone, email, endereco_id) VALUES ('RAFAEL SANCHES', '2345678696', 'rafasanches@example.com', 1);
INSERT INTO cliente (nome, telefone, email, endereco_id) VALUES ('JULIUS CARACA', '40028922699', 'JULIUS@example.com', 1);
INSERT INTO montador (nome, telefone, email, endereco_id) VALUES ('VITOR TAVARES', '40028922694', 'tavares@example.com', 2);
INSERT INTO peca1 (nome, material, tamanho_cm, cor) VALUES ('EIXO', 'ALUMINIO', '15.9', 'PRATA');
INSERT INTO peca2 (nome, material, tamanho_cm, cor) VALUES ('PRANCHA', 'MARFIM', '80.0', 'BEGE');
INSERT INTO peca3 (nome, material, tamanho_cm, cor) VALUES ('LIXA', 'AREIA', '90.0', 'BRANCO');
INSERT INTO peca4 (nome, material, tamanho_cm, cor) VALUES ('KIT_PARAFUSO', 'ACO', '1.4', 'PRETO');
INSERT INTO peca5 (nome, material, tamanho_cm, cor) VALUES ('ROLAMENTOS', 'ACO', '3.0', 'PRETO');
INSERT INTO peca6 (nome, material, tamanho_cm, cor) VALUES ('RODAS', 'SILICONE', '5.2', 'BRANCO');
INSERT INTO pecas (id_peca_1, id_peca_2, id_peca_3, id_peca_4, id_peca_5, id_peca_6) VALUES (1, 2, 3, 4, 5, 6);
INSERT INTO montagem (montador_id, pecas_id, tempo_de_montagem, custo_montagem) VALUES (1, 1, '4 HORAS', '100');
INSERT INTO frete (valor, endereco_id) VALUES ('2.65');
INSERT INTO entrega (tempo_para_entrega, frete_id) VALUES ('72 HORAS', 1);

SELECT * FROM estado;
SELECT * FROM cidade;
SELECT * FROM endereco;

SELECT e.sigla
FROM estado e, cidade c
WHERE e.id = c.estado_id
AND c.nome = "PORTO VELHO";

SELECT c.nome
FROM cidade c, endereco en
WHERE c.id = en.cidade_id
AND en.rua = "ANTONIO VIVALDI";

SELECT cli.nome
FROM cliente cli, endereco en
WHERE en.numero = "6783"
AND en.id = cli.endereco_id;

SELECT e.sigla
FROM estado e JOIN cidade c
ON e.id = c.estado_id 
WHERE c.nome = "PORTO VELHO";

SELECT c.nome
FROM cidade c JOIN endereco en
ON c.id = en.cidade_id
WHERE en.rua = "ANTONIO VIVALDI";




