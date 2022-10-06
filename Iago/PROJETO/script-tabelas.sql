CREATE TABLE usuario (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    em_atividade ENUM('S', 'N') NOT NULL DEFAULT 'S',
    nome VARCHAR(45) NOT NULL,
    senha VARCHAR(30) NOT NULL,
	biografia VARCHAR(200) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE mestre (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    em_atividade ENUM('S', 'N') NOT NULL DEFAULT 'S',
    usuario_id INT NOT NULL, FOREIGN KEY (usuario_id) REFERENCES usuario (id)
);

CREATE TABLE campanha (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    em_atividade ENUM('S', 'N') NOT NULL DEFAULT 'S',
    nome VARCHAR(30) NOT NULL,
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mestre_id INT NOT NULL, FOREIGN KEY (mestre_id) REFERENCES mestre (id)
);

CREATE TABLE campanha_usuario (
	campanha_id INT NOT NULL, FOREIGN KEY (campanha_id) REFERENCES campanha (id),
    usuario INT NOT NULL, FOREIGN KEY (usuario_id) REFERENCES usuario (id),
    apelido VARCHAR(45) NOT NULL
);

CREATE TABLE chat (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    em_atividade ENUM('S', 'N') NOT NULL DEFAULT 'S',
    nome VARCHAR(30) NOT NULL,
    campanha_id INT NOT NULL, FOREIGN KEY (campanha_id) REFERENCES campanha (id)
);

CREATE TABLE mensagem (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    conteudo TEXT NOT NULL,
    data_envio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    campanha_usuario_campanha_id INT NOT NULL, FOREIGN KEY (campanha_usuario_campanha_id) REFERENCES campanha_usuario (campanha_id),
    campanha_usuario_usuario_id INT NOT NULL, FOREIGN KEY (campanha_usuario_usuario_id) REFERENCES campanha_usuario (usuario_id),
    chat_id INT NOT NULL, FOREIGN KEY (chat_id) REFERENCES chat (id)
);

CREATE TABLE personagem (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    em_atividade ENUM('S', 'N') NOT NULL DEFAULT 'S',
    nome VARCHAR(45) NOT NULL,
    genero ENUM ('H', 'M', 'O') NOT NULL,
    historia TEXT,
    nivel_exp INT NOT NULL DEFAULT 1,
    exp INT NOT NULL DEFAULT 0,
    sonho VARCHAR(200) NOT NULL,
    pesadelo VARCHAR(200) NOT NULL,
    hp INT NOT NULL DEFAULT 20,
    hp_total INT NOT NULL DEFAULT 20,
    ap INT NOT NULL DEFAULT 20,
    ap_total INT NOT NULL DEFAULT 20,
    campanha_usuario_campanha_id INT NOT NULL, FOREIGN KEY (campanha_usuario_campanha_id) REFERENCES campanha_usuario (campanha_id),
    campanha_usuario_usuario_id INT NOT NULL, FOREIGN KEY (campanha_usuario_usuario_id) REFERENCES campanha_usuario (usuario_id)
);

CREATE TABLE atributo (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    descricao VARCHAR(200) NOT NULL
);

CREATE TABLE personagem_atributo (
	personagem_id INT NOT NULL, FOREIGN KEY (personagem_id) REFERENCES personagem (id),
    atributo_id INT NOT NULL, FOREIGN KEY (atributo_id) REFERENCES atributo (id),
    nivel_sxp INT NOT NULL DEFAULT 1,
    sxp INT NOT NULL DEFAULT 0,
    pontos INT NOT NULL DEFAULT 0
);

CREATE TABLE categoria_item (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    descricao VARCHAR(200) NOT NULL
);

CREATE TABLE item (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    peso INT NOT NULL DEFAULT 1,
    descricao VARCHAR(200) NOT NULL,
    categoria_item_id INT NOT NULL, FOREIGN KEY (categoria_item_id) REFERENCES categoria_item (id)
);

CREATE TABLE personagem_item (
	personagem_id INT NOT NULL, FOREIGN KEY (personagem_id) REFERENCES personagem (id),
	item_id INT NOT NULL, FOREIGN KEY (item_id) REFERENCES item (id),
    quantidade INT NOT NULL DEFAULT 1
);

CREATE TABLE arma (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    em_atividade ENUM('S', 'N') NOT NULL DEFAULT 'S',
    durabilidade INT NOT NULL,
    item_id INT NOT NULL, FOREIGN KEY (item_id) REFERENCES item (id)
);

CREATE TABLE ataque (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    arma_id INT NOT NULL, FOREIGN KEY (arma_id) REFERENCES arma (id)
);

CREATE TABLE armadura (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    em_atividade ENUM('S', 'N') NOT NULL DEFAULT 'S',
    hp_total INT NOT NULL,
    item_id INT NOT NULL, FOREIGN KEY (item_id) REFERENCES item (id)
);

CREATE TABLE inventario (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    em_atividade ENUM('S', 'N') NOT NULL DEFAULT 'S',
    espaco INT NOT NULL,
    item_id INT NOT NULL, FOREIGN KEY (item_id) REFERENCES item (id)
);

CREATE TABLE equipamento (
	personagem_id INT NOT NULL, FOREIGN KEY (personagem_id) REFERENCES personagem (id),
	inventario_id INT NOT NULL, FOREIGN KEY (inventario_id) REFERENCES inventario (id),
	armadura_id INT NOT NULL, FOREIGN KEY (armadura_id) REFERENCES armadura (id),
    arma_id INT NOT NULL, FOREIGN KEY (arma_id) REFERENCES arma (id),
    espaco_ocupado INT NOT NULL DEFAULT 0,
    hp_armadura INT NOT NULL DEFAULT 0,
    durabilidade_arma INT NOT NULL DEFAULT 0
);