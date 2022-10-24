DROP DATABASE IF EXISTS assistencia_estudantil;
CREATE DATABASE assistencia_estudantil;
USE assistencia_estudantil;

CREATE TABLE assistente(
id_assistente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
siape CHAR(7) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
senha VARCHAR(255) NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT '1'
);

INSERT INTO assistente  (nome, siape, email, senha) VALUES ('Edmar', '1234567', 'edmar@gmail.com', '123'), ('Rodrigo', '1234568', 'rodrigo@gmail.com', '123'), ('Elaine', '1234569', 'elaine@gmail.com', '123');

SELECT nome, siape, email FROM assistente;

CREATE TABLE professor (
id_professor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
siape CHAR(7) NOT NULL UNIQUE,
materia VARCHAR(255) NOT NULL
);

INSERT INTO professor (nome, cpf, siape, materia) VALUES ('Angela', '12345678910', '1234567', 'Matemática'), ('Dani', '12345678911', '1234568', 'Algoritmos'), ('Camila', '12345678912', '1234569', 'Biologia');

SELECT nome, cpf, siape, materia FROM professor;

CREATE TABLE aluno(
id_aluno INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
ra CHAR(11) NOT NULL UNIQUE,
turma VARCHAR(255) NOT NULL
);

INSERT INTO aluno (nome, cpf, ra, turma) VALUES ('Tavares', '12345678910', '12345678910', 'Turma1'), ('Rafa', '12345678911', '12345678911', 'Turma2'), ('Carla', '12345678912', '12345678912', 'Turma3');

SELECT nome, cpf, ra, turma FROM aluno;

CREATE TABLE tecnico(
id_tecnico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
siape CHAR(7) NOT NULL UNIQUE,
area VARCHAR(255) NOT NULL
);

INSERT INTO tecnico (nome, cpf, siape, area) VALUES ('Angélica', '12345678913', '1234510', 'Informática'), ('Flávio', '12345678915', '1234685', 'Informática'), ('Bruno', '12345678919', '1234257', 'Química');

SELECT cpf, siape, area FROM tecnico WHERE nome = 'Flávio';

CREATE TABLE emprestimo(
id_emprestimo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
data_emprestimo DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
id_assistente INT NOT NULL,
id_professor INT,
id_aluno INT,
id_tecnico INT,
data_devolucao DATETIME,
id_assistente_recebimento INT,
CONSTRAINT id_assistente_fk FOREIGN KEY (id_assistente) REFERENCES assistente(id_assistente),
CONSTRAINT id_assistente_recebimento_fk FOREIGN KEY (id_assistente) REFERENCES assistente(id_assistente),
CONSTRAINT id_professor_fk FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
CONSTRAINT id_aluno_fk FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
CONSTRAINT id_tecnico_fk FOREIGN KEY (id_tecnico) REFERENCES tecnico(id_tecnico),
CONSTRAINT oa CHECK(id_professor IS NOT NULL OR id_aluno IS NOT NULL OR id_tecnico IS NOT NULL)
);

INSERT INTO emprestimo (id_assistente, id_professor) VALUES (1, 1);
INSERT INTO emprestimo (id_assistente, id_aluno) VALUES (2, 2);
INSERT INTO emprestimo (id_assistente, id_tecnico) VALUES (3, 3);


CREATE TABLE penalidade(
id_penalidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(255) NOT NULL,
tempo INT NOT NULL,
valor DOUBLE NOT NULL,
id_emprestimo INT NOT NULL,
CONSTRAINT id_emprestimo_fk FOREIGN KEY (id_emprestimo) REFERENCES emprestimo(id_emprestimo)
);

INSERT INTO penalidade (tipo, tempo, valor, id_emprestimo) VALUES ('Retenção', 7, 0.0, 1), ('Retenção', 14, 0.0, 2), ('Resarcimento', 7, 150.0, 3);

SELECT tempo, valor FROM penalidade WHERE tipo = 'Retenção';

CREATE TABLE guarda_volume(
id_guarda_volume INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
codigo VARCHAR(20) NOT NULL UNIQUE,
bloco VARCHAR(20) NOT NULL
);

SELECT codigo FROM guarda_volume WHERE bloco = 02;

INSERT INTO guarda_volume (codigo, bloco) VALUES('D01', 02), ('D02', 02), ('01', 01);

CREATE TABLE instrumento(
id_instrumento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL UNIQUE,
quantidade INT NOT NULL,
codigo INT NOT NULL UNIQUE
);

INSERT INTO instrumento (nome, quantidade, codigo) VALUES('Violão', 11, 1), ('Teclado', 4, 2), ('Bateria', 1, 3);

SELECT nome, codigo, quantidade FROM instrumento WHERE quantidade > 03;

CREATE TABLE item(
id_item INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(250) NOT NULL UNIQUE,
quantidade INT NOT NULL,
codigo INT NOT NULL
);

INSERT INTO item (nome, quantidade, codigo) VALUES('Calculadora', 7, 1), ('Calculadora Científica', 5, 2), ('Adaptador VGA-HDMI', 2, 3);

SELECT nome, codigo, quantidade FROM item WHERE quantidade >= 02;

CREATE TABLE itens_de_emprestimo(
id_emprestimo INT NOT NULL PRIMARY KEY,
id_guarda_volume INT,
id_instrumento INT,
id_item INT,
CONSTRAINT id_emprestimo_pfk FOREIGN KEY (id_emprestimo) REFERENCES emprestimo(id_emprestimo),
CONSTRAINT id_guarda_volume_fk FOREIGN KEY (id_guarda_volume) REFERENCES guarda_volume(id_guarda_volume),
CONSTRAINT id_instrumento_fk FOREIGN KEY (id_instrumento) REFERENCES instrumento(id_instrumento),
CONSTRAINT id_item_fk FOREIGN KEY (id_item) REFERENCES item(id_item),
CONSTRAINT information_check CHECK(id_guarda_volume IS NOT NULL OR id_instrumento IS NOT NULL OR id_item IS NOT NULL)
);

INSERT INTO itens_de_emprestimo (id_emprestimo, id_guarda_volume) VALUES(1, 1);
INSERT INTO itens_de_emprestimo (id_emprestimo, id_instrumento) VALUES(2, 1);
INSERT INTO itens_de_emprestimo (id_emprestimo, id_item) VALUES(3, 1);

SELECT * FROM itens_de_emprestimo;

SELECT item.nome
FROM emprestimo JOIN itens_de_emprestimo ON emprestimo.id_emprestimo = itens_de_emprestimo.id_emprestimo
JOIN item ON item.id_item = itens_de_emprestimo.id_item;

SELECT emprestimo.data_emprestimo, professor.nome, guarda_volume.codigo, guarda_volume.bloco
FROM emprestimo JOIN professor ON emprestimo.id_professor = professor.id_professor
JOIN itens_de_emprestimo ON emprestimo.id_emprestimo = itens_de_emprestimo.id_emprestimo
JOIN guarda_volume ON itens_de_emprestimo.id_guarda_volume = guarda_volume.id_guarda_volume;
 
SELECT emprestimo.id_emprestimo, aluno.nome
FROM emprestimo JOIN aluno ON aluno.id_aluno = emprestimo.id_aluno;

SELECT emprestimo.id_emprestimo, aluno.nome, itens_de_emprestimo.id_instrumento
FROM emprestimo JOIN aluno ON aluno.id_aluno = emprestimo.id_aluno
JOIN itens_de_emprestimo ON emprestimo.id_emprestimo = itens_de_emprestimo.id_emprestimo
JOIN instrumento ON instrumento.id_instrumento = itens_de_emprestimo.id_instrumento;

SELECT assistente.nome
FROM assistente JOIN emprestimo ON assistente.id_assistente = emprestimo.id_assistente
JOIN itens_de_emprestimo ON itens_de_emprestimo.id_emprestimo = emprestimo.id_emprestimo
JOIN guarda_volume ON guarda_volume.id_guarda_volume = itens_de_emprestimo.id_guarda_volume;
 



