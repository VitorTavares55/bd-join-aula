/* 
Link videoaula JOIN → https://www.youtube.com/watch?v=wm3e7rICW2I&list=PLg5-aZqPjMmC69aUbYfCHiXIPbb5MwMmw&index=10
caso queira treinar na prática link script ddl e dml: https://github.com/heliokamakawa/curso_bd/blob/master/00-estudo%20de%20caso-loja_bebida-script.sql
*** JOIN - LISTA 01 ***
Sintaxe de uma consulta com JOIN:
SELECT 
    {nome_coluna1}
    ,{nome_coluna2}
    , [... outras colunas]
FROM {nome_tabela1}, {nome_tabela2}
WHERE pk = fk;
*/

-- Exercícios sobre Sintaxe --
-- 1.    Escreva o comando que liste os nomes de todas as cidades e as respectivas siglas do estado.
SELECT cidade.nome cidade, estado.sigla sigla
FROM estado, cidade
WHERE estado.id_estado = cidade.id_estado;

-- 2.    Escreva o comando que liste os nomes das cidades ativas e as respectivas siglas do estado.
SELECT cidade.nome cidade, estado.sigla sigla
FROM estado, cidade
WHERE estado.id_estado = cidade.id_estado
AND cidade.ativo = 'S';

-- 3.    Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. 
SELECT cliente.nome nome_cliente, cidade.nome cidade
FROM cliente, cidade
WHERE cidade.id_cidade = cliente.id_cidade;

-- 4.    Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. Liste somente os clientes que moram na cidade de Paranavaí.
SELECT cliente.nome nome_cliente, cidade.nome cidade
FROM cidade, cliente
WHERE cidade.id_cidade = cliente.id_cidade
AND cidade.nome = 'PARANAVAÍ';

-- 5.    Escreva o comando que liste os nomes das cidades e as respectivas siglas do estado. Liste somente as cidades ativas.
SELECT cidade.nome cidade, estado.sigla sigla
FROM estado, cidade
WHERE estado.id_estado = cidade.id_estado
AND cidade.ativo = 'S';

-- 6.    Escreva o comando que liste os nomes dos funcionários e os nomes das respectivas cidades.
SELECT funcionario.nome nome_funcionario, cidade.nome cidade
FROM funcionario, cidade
WHERE cidade.id_cidade = funcionario.id_cidade;

-- 7.    Escreva o comando que liste os nomes dos funcionários e a sigla do respectivo estado. 
SELECT funcionario.nome nome_funcionario, estado.sigla sigla
FROM funcionario, cidade, estado
WHERE cidade.id_cidade = funcionario.id_cidade
AND estado.id_estado = cidade.id_estado;

-- 8.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. Liste somente os clientes que moram na região sul.
SELECT cliente.nome nome_cliente, cidade.nome cidade
FROM cidade, cliente, estado
WHERE cidade.id_cidade = cliente.id_cidade
AND estado.id_estado = cidade.id_estado
AND (estado.sigla = 'PR' OR estado.sigla = 'SC' OR estado.sigla = 'RS');

-- 9.	Escreva o comando que liste os nomes dos estados com cadastros ativos que possuem algum cliente cadastrado.
SELECT estado.nome estado
FROM estado, cliente, cidade
WHERE cidade.id_cidade = cliente.id_cidade
AND estado.id_estado = cidade.id_estado
AND estado.ativo = 'S'
GROUP BY estado.nome;

-- 10.	Escreva o comando que liste todas as vendas e o nome do respectivo funcionário que a realizou.
SELECT venda.id_venda venda, funcionario.nome nome_funcionario
FROM venda, funcionario
WHERE funcionario.id_funcionario = venda.id_funcionario;

-- 11.	Liste o nome dos produtos, o preço de venda e o nome da unidade de medida.
SELECT produto.nome produto, item_venda.preco_unidade preco, unidade_medida.nome medida
FROM produto, item_venda, unidade_medida
WHERE produto.id_produto = item_venda.id_produto
AND produto.id_unidade_medida = unidade_medida.id_unidade_medida;

-- 12.	Liste o nome dos produtos da marca "Coca-cola".
SELECT produto.nome
FROM produto, marca
WHERE produto.id_marca = marca.id_marca
AND marca.nome = "Coca-cola";

-- 13. DESAFIO!!! Liste os nomes dos clientes do estado de São Paulo que já compraram o produto 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L'.
SELECT cliente.nome, estado.sigla, produto.nome
FROM cliente, cidade, estado, venda, item_venda, produto
WHERE cliente.id_cidade = cidade.id_cidade
AND cidade.id_estado = estado.id_estado
AND estado.nome = "SÃO PAULO"
AND cliente.id_cliente = venda.id_cliente
AND venda.id_venda = item_venda.id_venda
AND produto.id_produto = item_venda.id_produto
AND produto.nome = "REFRIGERANTE COCA-COLA GARRAFA PET 3 L";

-- Exercícios sobre Semântica --
-- 1.	Em que caso devemos utilizar o JOIN? Quais tabelas podem ser utilizando em um comando JOIN?
-- R: O JOIN é um comando utilizado para consultar dados de diferentes tabelas em um mesmo SELECT. Ele pode ser usado em quaisquer tabelas que possuem relacionamento entre si.

-- 2.	No caso do JOIN, o que é condição de junção. Qual cuidado devemos ter. 
-- R: No JOIN, a condição de junção molda o modo que a consulta acontecerá, ou seja, os dados que serão apresentados, as tableas, as agrupações, etc. Entretanto, devemos ter cuidado de fornecer e especificar as condições certas para obtermos apenas os resultados que desejamos.

-- 3.	Em relação a sintaxe, em um JOIN não é necessário utilizarmos condições (WHERE) - o comando irá executar normalmente. Porém, em questão de semântica, a cada junção é necessário ter ao menos 1 condição. Explique.
-- R: Apesar de não apresentar falhas ao dispensar a utilização da condição WHERE, não utilizá-la tornará a consulta de dados mais problemática, visto que poucas condições estão sendo apresentadas, trazendo uma variedade maior de dados indesejados.

-- 4.	O que é produto cartesiano? Como funciona? Qual a relação com o JOIN.
-- R: Um produto cartesiano consiste na junção de todos os dados de duas tabelas, considerando todas as combinações possíveis. Isso se assemelha grandemente ao funcionamento do JOIN - criar uma tabela contendo a multiplicação de mescla de dados de outras duas tabelas.

-- 5.	Na elaboração de um consulta que envolve 1587 tabelas, serão necessários, quantas condições de junção?
-- R: Nesse contexto, seriam necessárias 1586 condições de junção.
