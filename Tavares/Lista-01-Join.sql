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

-- Sintaxe
-- 1.	Escreva o comando que liste os nomes de todas as cidades e as respectivas siglas do estado.
SELECT cidade.nome cidade, estado.sigla uf
FROM estado, cidade
WHERE estado.id = cidade.estado_id;

-- 2.	Escreva o comando que liste os nomes das cidades ativas e as respectivas siglas do estado. 
SELECT cidade.nome cidade, estado.sigla uf
FROM estado, cidade
WHERE estado.id = cidade.estado_id AND cidade.ativo = 'S';

-- 3.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. 
SELECT cliente.nome nome_cliente, cidade.nome cidade
FROM cidade, cliente
WHERE cidade.id = cliente.cidade_id;

-- 4.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. Liste somente os clientes que moram na cidade de Paranavaí.
SELECT cliente.nome nome_cliente, cidade.nome cidade
FROM cidade, cliente
WHERE cidade.id = cliente.cidade_id
AND cidade.nome = 'PARANAVAÍ';

-- 5.	Escreva o comando que liste os nomes das cidades e as respectivas siglas do estado. Liste somente as cidades ativas.
SELECT cidade.nome cidade, estado.sigla uf
FROM estado, cidade
WHERE estado.id = cidade.estado_id AND cidade.ativo = 'S';

-- 6.	Escreva o comando que liste os nomes dos funcionários e os nomes das respectivas cidades. 
SELECT funcionario.nome nome, cidade.nome cidade
FROM cidade, funcionario
WHERE cidade.id = funcionario.cidade_id;

-- 7.	Escreva o comando que liste os nomes dos funcionários e a sigla do respectivo estado. 
SELECT funcionario.nome nome, estado.sigla uf
FROM cidade, funcionario, estado
WHERE cidade.id = funcionario.cidade_id AND estado.id = cidade.estado_id;

-- 8.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. Liste somente os clientes que moram na região sul.
SELECT funcionario.nome nome, cidade.nome cidade
FROM cidade, funcionario, estado
WHERE cidade.id = funcionario.cidade_id AND estado.id = cidade.estado_id
AND (estado.sigla = 'PR' OR estado.sigla = 'SC' OR estado.sigla = 'RS');

-- 9.	Escreva o comando que liste os nomes dos estados com cadastros ativos que possuem algum cliente cadastrado.
SELECT estado.nome
FROM estado, cliente, cidade
WHERE cidade.id = cliente.cidade_id
AND estado.id = cidade.estado_id
AND estado.ativo = 'S';

-- 10.	Escreva o comando que liste todas as vendas e o nome do respectivo funcionário que a realizou.
SELECT venda.id venda, funcionario.nome funcionario
FROM venda, funcionario
WHERE venda.funcionario_id = funcionario.id;

-- 11.	Liste o nome dos produtos, o preço de venda e o nome da unidade de medida.
SELECT produto.nome produto, item_venda.preco_unidade preco, unidade_medida.nome medida
FROM produto, item_venda, unidade_medida
WHERE produto.id = item_venda.produto_id
AND produto.unidade_medida_id = unidade_medida.id;

-- 12.	Liste o nome dos produtos da marca "Coca-cola".
SELECT produto.nome
FROM produto, marca
WHERE produto.marca_id = marca.id AND marca.nome = "Coca-cola";

-- 13. DESAFIO!!! Liste os nomes dos clientes do estado de São Paulo que já compraram o produto 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L'.
SELECT cliente.nome, estado.sigla, produto.nome
FROM cliente, cidade, estado, venda, item_venda, produto
WHERE cliente.cidade_id = cidade.id
AND cidade.estado_id = estado.id
AND estado.nome = "SÃO PAULO"
AND cliente.id = venda.cliente_id
AND venda.id = item_venda.venda_id
AND produto.id = item_venda.produto_id
AND produto.nome = "REFRIGERANTE COCA-COLA GARRAFA PET 3 L";

-- Semântica
-- 1.	Em que caso devemos utilizar o JOIN? Quais tabelas podem ser utilizando em um comando JOIN?
-- Devemos utilizaro JOIN quanto temos interesse de buscar dados que estão contidos em diferentes tabelas, porém exibilos e tratar eles em uma nova tabela provisória. O JOIN só pode ser utilizado em tabelas que possuam relacionamento entre elas, caso contrário, não estara correto.


-- 2.	No caso do JOIN, o que é condição de junção. Qual cuidado devemos ter. 
-- A condição de junção define o modo como duas tabelas se relacionam em uma consulta. Assim podemos especificar a coluna de cada tabela que devem ser agrupadas, especificando a chave estrangeira e a chave associada na outra tabela. Ou comparando valores de colunas, usando operadores de igualdade e diferença.


-- 3.	Em relação a sintaxe, em um JOIN não é necessário utilizarmos condições (WHERE) - o comando irá executar normalmente. Porém, em questão de semântica, a cada junção é necessário ter ao menos 1 condição. Explique.
-- Apesar de não ser necessário a utilização do WHERE no JOIN, a utilização de condições a cada junção servem para delimitar quais dados devem ser buscados e agrupados, sem suas condições teriamos apenas dados de semelçhança buscado em ambas tabelas.


-- 4.	O que é produto cartesiano? Como funciona? Qual a relação com o JOIN.
-- O Produto cartesiano se trata da junção dos dados contidos em duas tabelas, que somados geram uma teceira tabela que contem todos os dados das duas anteriores. A relação do produto cartesiano com o JOIN é da fusão de valores contidos entre tabelas, usando para isso os valores da interseção entre os conjuntos para especificar seus dados.


-- 5.	Na elaboração de um consulta que envolve 1587 tabelas, serão necessários, quantas condições de junção?
-- Para a elaboração desta consulta serão necessárias 1586 junções, pois para a junções de JOIN é necessário percorrer as tabelas por meio de suas relações, tabelas não relacionadas não podem ser associadas no JOIN.


