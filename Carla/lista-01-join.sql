-- 1.	Escreva o comando que liste os nomes de todas as cidades e as respectivas siglas do estado.

SELECT cidade.nome, estado.sigla FROM estado, cidade WHERE estado.id = cidade.estado_id;

-- 2.	Escreva o comando que liste os nomes das cidades ativas e as respectivas siglas do estado. 

SELECT cidade.nome, estado.sigla FROM estado, cidade WHERE estado.id = cidade.estado_id AND cidade.ativo = 'S';

-- 3.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. 

SELECT cliente.nome, cidade.nome FROM cliente, cidade WHERE cidade.id = cliente.cidade_id;

-- 4.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. Liste somente os clientes que moram na cidade de Paranavaí.

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

-- 11.	Liste o nome dos produtos, o preço de venda e o nome da unidade de medida.

SELECT produto.nome, item_venda.preco_unidade, unidade_medida.nome FROM produto, item_venda, unidade_medida WHERE produto.id = item_venda.produto_id AND produto.id = unidade_medida.id;

-- 12.	Liste o nome dos produtos da marca "Coca-cola".

SELECT produto.nome FROM produto, marca WHERE produto.marca_id = marca.id AND produto.nome = 'Coca-cola';

-- 13. DESAFIO!!! Liste os nomes dos clientes do estado de São Paulo que já compraram o produto 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L'.

SELECT cliente.nome, estado.sigla, produto.nome FROM cliente, produto, estado, cidade, venda, item_venda WHERE cliente.cidade_id = cidade.id AND cidade.estado_id = estado.id AND cliente.id = venda.cliente_id AND venda.id = item_venda.venda_id AND produto.id = item_venda.produto_id AND estado.nome = 'São Paulo' AND produto.nome = 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L';

-- 1.	Em que caso devemos utilizar o JOIN? Quais tabelas podem ser utilizando em um comando JOIN? 

-- O JOIN deve ser utilizado quando, em um banco de dados, há a necessidade de realizar uma consulta personalizada em mais de uma tabela. Pode-se juntar quantas tabelas forem necessárias com o JOIN; no entanto, cada comando JOIN pode juntar apenas duas tabelas.

-- 2.	No caso do JOIN, o que é condição de junção. Qual cuidado devemos ter. 

-- No contexto do comando JOIN, a condição de junção é que, para que duas tabelas sejam unidas, é necessário que haja um relacionamento entre elas. Nesse sentido, deve-se ter o cuidado na escrita dos comandos, para que cada JOIN aconteça entre tabelas que estão ligadas por relacionamento de PK/FK.

-- 3.	Em relação a sintaxe, em um JOIN não é necessário utilizarmos condições (WHERE) - o comando irá executar normalmente. Porém, em questão de semântica, a cada junção é necessário ter ao menos 1 condição. Explique.

-- Apesar do comando JOIN dispensar o uso do WHERE, cada junção deve ter a condição de relacionamento explícita no comando, na qual é indicada a igualdade entre chave primária de uma tabela com a chave estrangeira de outra que compõe o JOIN.

-- 4.	O que é produto cartesiano? Como funciona? Qual a relação com o JOIN.

-- Em matemática, o produto cartesiano refere-se a um conjunto de elementos originado da multiplicação dos elementos de outros dois conjuntos; nesse sentido, por exemplo, a multiplicação de eX por um elemento de eY resultará em um par ordenado de (eX, eY). Esse conceito se relaciona com o funcioanmento do JOIN, visto que o comando realiza a "multiplicação" dos elementos de duas tabelas e forma uma terceira tabela, que corresponde ao resultado da junção definida com o JOIN. 

-- 5.	Na elaboração de um consulta que envolve 1587 tabelas, serão necessários, quantas condições de junção?

-- Em uma consulta que envolve 1587 tabelas, serão necessárias 1586 condições de junção.
