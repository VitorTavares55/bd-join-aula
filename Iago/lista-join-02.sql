/*  Aquecimento
1.	Liste os nomes de todas as cidades ATIVAS do estado PARANÁ.
2.	Liste o nome e o telefone dos fornecedores que estão ativos e moram em PARANAVAÍ.
3.	Escreva o comando que liste os nomes dos clientes que moram nas seguintes cidades: MARINGÁ, PARANAVAÍ e CIARNORTE. 
4.	Liste o nome e o telefone dos funcionarios ATIVOS que moram na região SUL.


   Nível 2
5. Informe o nome dos produtos e a respectiva unidade de medida da venda com o código 3.
6. Liste os nomes dos funcionários que já venderam o produto 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L'.
7. Liste os nomes dos fornecedores dos estados PARANÁ, MATO GROSSO e RIO GRANDE DO NORTE.
8. Liste os nomes dos produtos vendidos no dia XXX (pode escolher um dia existente).
9. Feliz com um bom atendimento, um determinado cliente entra em contato com o gerente para enviar uma lembrança ao funcionário.
O problema é que, além de não informar a sua identidade, ele não lembra do nome do funcionário. Sabe apenas que,na conversa, moraram 
na mesma cidade e possuem o mesmo nome. Neste contexto, faça as consultas necesárias para identificar o funcionário. 
10. Um cliente entra em contato com o gerente solicitando um possível erro de troco. O cliente não lembra o nome do funcionário, 
mas possui as seguintes informações:
 (1) nome completo do cliente: Sophia Lima
 (2) CPF do cliente: 321.109.923-95
 (3) cidade onde cliente nasceu: BAURU/SÃO PAULO
 (4) a cliente alega estar faltando 30 reais
Neste contexto, faça as consultas necessárias para descobrir o possível nome do funcionário. Justifique!
11. De acordo com o projeto do SEU COLEGA, elabore uma consulta RELEVANTE que ajude de alguma forma a empresa. A consulta deve envolver mais de 4 tabelas.    */


/* Exercício #1 */
SELECT cid.nome FROM cidade cid, estado est WHERE est.id = cid.estado_id AND (est.nome = "PARANÁ" OR est.sigla = "PR");

/* Exercício #2 */
SELECT forn.nome, forn.fone FROM fornecedor forn, cidade cid WHERE cid.id = forn.cidade_id
AND forn.status = 'A' AND cid.nome = "PARANAVAÍ";

/* Exercício #3 */
SELECT cli.nome FROM cliente cli, cidade cid WHERE cid.id = cli.cidade_id
AND (cid.nome = "MARINGÁ" OR cid.nome = "PARANAVAÍ" OR cid.nome = "CIANORTE");

/* Exercício #4 */
SELECT func.nome, func.fone FROM funcionario func, cidade cid, estado est
WHERE func.cidade_id = cid.id AND cid.estado_id = est.id
AND func.status = 'A' AND (est.sigla = "PR" OR est.sigla = "SC" OR est.sigla = "RS");

/* Exercício #5 */
SELECT pro.nome, umed.nome FROM unidade_medida umed, produto pro, item_venda iven, venda ven
WHERE umed.id = pro.unidade_medida_id AND pro.id = iven.produto_id AND iven.venda_id = venda.id
AND venda.id = 3;

/* Exercício #6 */
SELECT func.nome FROM funcionario func, venda ven, item_venda iven, produto pro
WHERE func.id = ven.funcionario_id AND ven.id = iven.venda_id AND iven.produto_id = produto.id
AND produto.nome = "REFRIGERANTE COCA-COLA GARRAFA PET 3 L";

/* Exercício #7 */
SELECT forc.nome FROM fornecedor forc, cidade cid, estado est
WHERE forc.cidade_id = cidade.id AND cidade.estado_id = estado.id
AND (est.sigla = "PR" OR est.sigla = "RN" OR est.sigla = "MT");

/* Exercício #8 */
SELECT pro.nome FROM produto pro, item_venda iven, venda ven
WHERE produto.id = iven.produto_id AND iven.venda_id = venda.id
AND DATE(ven.data) = "2022/10/03";

/* Exercício #9 */
SELECT cli.nome, func.nome FROM venda ven, funcionario fun, cliente cli, cidade cid, estado est
WHERE (ven.cliente_id = cliente.id AND ven.funcionario_id = func.id)
AND (cid.id = func.cidade_id AND cid.id = cli.cidade_id) AND cidade.estado_id = estado id
AND cli.nome = func.nome AND cli.cidade_id = func.cidade_id;

/* Exercício #10 */
SELECT DATE(ven.data) "DATA DA VENDA", cid.nome "CIDADE", est.sigla "UF", fun.nome FUNCIONÁRIO, fun.cpf "CPF DO FUNCIONÁRIO", cli.nome CLIENTE, cli.cpf_cnpj "CPF DO CLIENTE"
FROM venda ven, funcionario fun, cliente cli, cidade cid, estado est
WHERE (ven.cliente_id = cliente.id AND ven.funcionario_id = func.id)
AND (cid.id = func.cidade_id AND cid.id = cli.cidade_id) AND cidade.estado_id = estado.id
AND cli.cpf_cnpj = 32110992395 AND ven.total > 30 AND func.cidade_id = cli.cidade_id ORDER BY ven.data DESC;

-- Para realizar a pesquisa e determinar quem é o funcionário responsável por essa venda, é preciso determinar
-- Quais dessas informações fornecidas pela Sophia são relevantes para a pesquisa. Tendo isso dito, tanto
-- o nome de Sophia quanto sua cidade natal são informações que eu considerei irrelevantes; o nome por não ser
-- necessariamente único e a cidade natal por não necessariamente ser a mesma onde a venda foi realizada.
-- Já o CPF de Sophia foi usado por mim como chave candidata por ser um documento único e válido em todo o
-- território nacional, solucionando os problemas mencionados nas duas alternativas anteriores. Ao mesmo
-- tempo, eu determinei que os resultados fossem ordenados de acordo com a data da venda, da mais recente à
-- mais antiga, seguindo a hipótese de que Sophia relatou seu problema pouco após o ocorrido, o que permitiria
-- ao gerente determinar qual funcionário foi o responsável pelo equívoco ou ao menos uma lista de suspeitos.
-- Para evitar informações desnecessárias, também determinei que o resultado deve desconsiderar vendas com o
-- total pago inferior ou equivalente a 30 reais, o pior cenário possível. Por fim, eu determinei que a cidade
-- de referência da Sophia deve ser a mesma que a do funcionário que será buscado, desconsiderando a informação
-- da cidade natal, mas sim da cidade em que ela, enquanto cliente, realizou a compra.

/* Exercício #11 */
