/* 
Link videoaula JOIN → https://www.youtube.com/watch?v=wm3e7rICW2I&list=PLg5-aZqPjMmC69aUbYfCHiXIPbb5MwMmw&index=10
caso queira treinar na prática link script ddl e dml: https://github.com/heliokamakawa/curso_bd/blob/master/00-estudo%20de%20caso-loja_bebida-script.sql
*** JOIN - LISTA 02 ***
Sintaxe de uma consulta com JOIN:
SELECT 
    {nome_coluna1}
    ,{nome_coluna2}
    , [... outras colunas]
FROM {nome_tabela1}, {nome_tabela2}
WHERE pk = fk;
*/

-- Nível 1 (aquecimento)
-- 1.	Liste os nomes de todas as cidades ATIVAS do estado PARANÁ.
SELECT cidade.nome
FROM cidade, estado
WHERE cidade.id_estado = estado.id_estado
AND estado.nome = "PARANÁ"
AND cidade.ativo = 'S';

-- 2.	Liste o nome e o telefone dos fornecedores que estão ativos e moram em PARANAVAÍ.
-- Não há a tabela 'fornecedores' nessa Base de Dados.

-- 3.	Escreva o comando que liste os nomes dos clientes que moram nas seguintes cidades: MARINGÁ, PARANAVAÍ e CIARNORTE.
SELECT cliente.nome
FROM cidade, cliente, estado
WHERE cidade.id_cidade = cliente.id_cidade
AND estado.id_estado = cidade.id_estado
AND (cidade.nome = 'MARINGÁ' OR cidade.nome = 'PARANAVAÍ' OR cidade.nome = 'CIARNORTE');

-- 4.	Liste o nome e o telefone dos funcionarios ATIVOS que moram na região SUL.
-- Não há o campo 'telefone' na tabela 'fornecedores' nessa Base de Dados.

-- Nível 2
-- 5. Informe o nome dos produtos e a respectiva unidade de medida da venda com o código 3.
SELECT produto.nome, unidade_medida.nome
FROM produto, unidade_medida, venda, item_venda
WHERE unidade_medida.id_unidade_medida = produto.id_unidade_medida
AND produto.id_produto = item_venda.id_produto
AND venda.id_venda = item_venda.id_venda
AND venda.id_venda = 3;

-- 6. Liste os nomes dos funcionários que já venderam o produto 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L'.
SELECT funcionario.nome
FROM funcionario, venda, item_venda, produto
WHERE funcionario.id_funcionario = venda.id_funcionario
AND venda.id_venda = item_venda.id_venda
AND produto.id_produto = item_venda.id_produto
AND produto.nome = "REFRIGERANTE COCA-COLA GARRAFA PET 3 L";

-- 7. Liste os nomes dos fornecedores dos estados PARANÁ, MATO GROSSO e RIO GRANDE DO NORTE.
-- Não há a tabela 'fornecedores' nessa Base de Dados.

-- 8. Liste os nomes dos produtos vendidos no dia XXX (pode escolher um dia existente).
SELECT produto.nome
FROM produto, item_venda, venda
WHERE produto.id_produto = item_venda.id_produto
AND venda.id_venda = item_venda.id_venda
AND venda.data = '1975-05-22 19:05:03';

-- 9. Feliz com um bom atendimento, um determinado cliente entra em contato com o gerente para enviar uma lembrança ao funcionário.
-- O problema é que, além de não informar a sua identidade, ele não lembra do nome do funcionário. Sabe apenas que, na conversa, moraram 
-- na mesma cidade e possuem o mesmo nome. Neste contexto, faça as consultas necesárias para identificar o funcionário.
SELECT funcionario.nome
FROM funcionario, cliente, venda, cidade
WHERE cliente.id_cliente = venda.id_cliente
AND funcionario.id_funcionario = venda.id_funcionario
AND cliente.nome = funcionario.nome
AND cliente.id_cidade = funcionario.id_cidade;

-- 10. Um cliente entra em contato com o gerente solicitando um possível erro de troco. O cliente não lembra o nome do funcionário, 
-- mas possui as seguintes informações:
--  (1) nome completo do cliente: Sophia Lima
--  (2) CPF do cliente: 321.109.923-95
--  (3) cidade onde cliente nasceu: BAURU/SÃO PAULO
--  (4) a cliente alega estar faltando 30 reais
-- Neste contexto, faça as consultas necessárias para descobrir o possível nome do funcionário. Justifique!
SELECT funcionario.nome
FROM funcionario, cliente, venda
WHERE cliente.cpf_cnpj = "321.109.923-95"
AND cliente.id_cliente = venda.id_cliente
AND funcionario.id_funcionario = venda.id_funcionario;

-- 11. De acordo com o projeto do SEU COLEGA, elabore uma consulta RELEVANTE que ajude de alguma forma a empresa. 
-- A consulta deve envolver mais de 4 tabelas.
SELECT leitor.nome, categoria.classificacao, COUNT(*) AS qntd_categoria
FROM categoria, livro, retirada_devolucao, leitor
WHERE leitor.id_leitor = retirada_devolucao.id_leitor
AND livro.id_livro = retirada_devolucao.id_livro
AND categoria.id_categoria = livro.id_categoria
AND retirada_devolucao.data_retirada BETWEEN "2022-08-01" AND "2022-08-31"
GROUP BY leitor.nome, categoria.classificacao;

-- A Consulta foi feita em meu próprio projeto, BLIBLIOTECA SNEK.
-- O objetivo desse SELECT era consultar a quantia de livros que cada cliente retirou de cada classificação no mês de agosto.
/*
O resultado é exibido de forma:
Cliente_1 retirou v livros de Categoria_1.
Cliente_1 retirou w livros de Categoria_2.
Cliente_2 retirou x livros de Categoria_1.
Cliente_2 retirou y livros de Categoria_2.
Cliente_2 retirou z livros de Categoria_3.
*/
