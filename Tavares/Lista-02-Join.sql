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
objetivo de hoje:
→ não errar na sintaxe/semântica no >>FROM<< → quais tabelas podem e devem ser colocadas
→ não errar na sintaxe/semântica no >>WHERE<< → condição de JUNÇÃO (PK e sua REFERÊNCIA)
→ entender o JOIN (que só há registros relacionados)
→ conseguir realizar JOIN de mais de 2 tabelas (perceber que é tudo igual)
*/

-- Aquecimento
-- 1.	Liste os nomes de todas as cidades ATIVAS do estado PARANÁ.
SELECT cidade.nome cidade
FROM estado, cidade
WHERE estado.id = cidade.estado_id
AND estado.nome = "PARANÁ"
AND cidade.ativo = 'S';

-- 2.	Liste o nome e o telefone dos fornecedores que estão ativos e moram em PARANAVAÍ.
-- A TABELA FORNECEDOR NÃO EXISTE

-- 3.	Escreva o comando que liste os nomes dos clientes que moram nas seguintes cidades: MARINGÁ, PARANAVAÍ e CIARNORTE. 
SELECT cliente.nome
FROM cliente, cidade
WHERE cidade.id = cliente.cidade_id
AND (cidade.nome = "MARINGÁ" OR cidade.nome = "PARANAVAÍ" OR cidade.nome = "CIANORTE");

-- 4.	Liste o nome e o telefone dos funcionarios ATIVOS que moram na região SUL.
-- AS COLUNAS NECESSÁRIAS NÃO EXISTEM

-- Nível 2

-- 5. Informe o nome dos produtos e a respectiva unidade de medida da venda com o código 3.
SELECT produto.nome, unidade_medida.nome
FROM produto, venda, item_venda, unidade_medida
WHERE produto.unidade_medida_id = unidade_medida.id
AND produto.id = item_venda.produto_id
AND item_venda.venda_id = venda.id
AND venda.id = 3;

-- 6. Liste os nomes dos funcionários que já venderam o produto 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L'.
SELECT funcionario.nome
FROM funcionario, venda, item_venda, produto
WHERE funcionario.id = venda.funcionario_id
AND venda.id = item_venda.venda_id
AND item_venda.produto_id = produto.id
AND produto.nome = "REFRIGERANTE COCA-COLA GARRAFA PET 3 L";

-- 7. Liste os nomes dos fornecedores dos estados PARANÁ, MATO GROSSO e RIO GRANDE DO NORTE.
-- A TABELA FORNECEDOR NÃO EXISTE

-- 8. Liste os nomes dos produtos vendidos no dia XXX (pode escolher um dia existente).
SELECT produto.nome
FROM produto, item_venda, venda
WHERE produto.id = item_venda.produto_id
AND item_venda.venda_id = venda.id
AND venda.`data` = "2022-09-26 19:51:27";

-- 9. Feliz com um bom atendimento, um determinado cliente entra em contato com o gerente para enviar uma lembrança ao funcionário.
-- O problema é que, além de não informar a sua identidade, ele não lembra do nome do funcionário. Sabe apenas que,na conversa, moraram 
-- na mesma cidade e possuem o mesmo nome. Neste contexto, faça as consultas necesárias para identificar o funcionário. 

SELECT cliente.nome, funcionario.nome
FROM venda, funcionario, cliente
WHERE venda.funcionario_id = funcionario.id
AND venda.cliente_id = cliente.id
AND cliente.nome = funcionario.nome;


-- 10. Um cliente entra em contato com o gerente solicitando um possível erro de troco. O cliente não lembra o nome do funcionário, 
-- mas possui as seguintes informações:
 -- (1) nome completo do cliente: Sophia Lima
 -- (2) CPF do cliente: 321.109.923-95
 -- (3) cidade onde cliente nasceu: BAURU/SÃO PAULO
 -- (4) a cliente alega estar faltando 30 reais
-- Neste contexto, faça as consultas necessárias para descobrir o possível nome do funcionário. Justifique!
SELECT funcionario.nome
FROM funcionario, cliente, venda
WHERE venda.funcionario_id = funcionario.id
AND venda.cliente_id = cliente.id
AND cliente.cpf_cnpj = "321.109.923-95";

-- Com as tabelas disponibilizadas, a consulta mais aproximada que pode ser feita é a dos nomes de Otávio Correia e Marcos Goncalves.


-- 11. De acordo com o projeto do SEU COLEGA, elabore uma consulta RELEVANTE que ajude de alguma forma a empresa. 
-- A consulta deve envolver mais de 4 tabelas.
SELECT cliente.nome, procedimento.nome
FROM procedimento, pestacao_servico, solicitacao_servico, cliente
WHERE prestacao_servico.id_procedimento = procedimento.id_procedimento
AND prestacao_servico.id_solicitacao_servico = solicitacao_servico.id_solicitacao_servico
AND solicitacao_servico.id_cliente = cliente.id_cliente;
