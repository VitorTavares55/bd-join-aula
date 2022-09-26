-- 1.	Escreva o comando que liste os nomes de todas as cidades e as respectivas siglas do estado.

SELECT cidade.nome, estado.sigla FROM estado, cidade WHERE estado.id = cidade.estado_id;

-- 2.	Escreva o comando que liste os nomes das cidades ativas e as respectivas siglas do estado. 

SELECT cidade.nome, estado.sigla FROM estado, cidade WHERE estado.id = cidade.estado_id AND cidade.ativo = 'S';

-- 3.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. 

SELECT cliente.nome, cidade.nome FROM cliente, cidade WHERE cidade.id = cliente.cidade_id;

4.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. Liste somente os clientes que moram na cidade de Paranavaí.

SELECT cliente.nome, cidade.nome FROM cliente, cidade WHERE cidade.id = cliente.cidade_id AND cidade.nome = 'PARANAVAÍ';

-- 5.	Escreva o comando que liste os nomes das cidades e as respectivas siglas do estado. Liste somente as cidades ativas.

SELECT cliente.nome, cidade.nome FROM cliente, cidade WHERE cidade.id = cliente.cidade_id;

-- 6.	Escreva o comando que liste os nomes dos funcionários e os nomes das respectivas cidades. 

SELECT funcionario.nome, cidade.nome FROM funcionario, cidade WHERE cidade.id = funcionario.cidade_id;

-- 7.	Escreva o comando que liste os nomes dos funcionários e a sigla do respectivo estado. 

SELECT funcionario.nome, estado.sigla FROM funcionario, cidade, estado WHERE cidade.id = funcionario.cidade_id AND estado.id = cidade.estado_id;

-- 8.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. Liste somente os clientes que moram na região sul.

SELECT cliente.nome, cidade.nome FROM cliente, cidade, estado WHERE cidade.id = cliente.cidade_id AND estado.id = cidade.estado_id AND (estado.sigla = 'PR' OR estado.sigla = 'SC' OR estado.sigla = 'RS');

-- 9.	Escreva o comando que liste os nomes dos estados com cadastros ativos que possuem algum cliente cadastrado.

SELECT estado.nome FROM estado, cidade, cliente WHERE cidade.id = cliente.cidade_id AND estado.id = cidade.estado_id AND estado.ativo = 'S';

-- 10.	Escreva o comando que liste todas as vendas e o nome do respectivo funcionário que a realizou.

SELECT venda.id, funcionario.nome FROM funcionario, venda WHERE funcionario.id = venda.funcionario_id;
