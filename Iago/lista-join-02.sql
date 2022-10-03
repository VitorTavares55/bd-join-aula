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
SELECT forc.nome, forc.

/* Exercício #3 */

/* Exercício #4 */

/* Exercício #5 */

/* Exercício #6 */

/* Exercício #7 */

/* Exercício #8 */

/* Exercício #9 */

/* Exercício #10 */

/* Exercício #11 */
