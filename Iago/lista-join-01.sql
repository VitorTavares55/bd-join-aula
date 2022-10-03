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

Sintaxe
1.	Escreva o comando que liste os nomes de todas as cidades e as respectivas siglas do estado.
2.	Escreva o comando que liste os nomes das cidades ativas e as respectivas siglas do estado. 
3.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. 
4.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. Liste somente os clientes que moram na cidade de Paranavaí.
5.	Escreva o comando que liste os nomes das cidades e as respectivas siglas do estado. Liste somente as cidades ativas.
6.	Escreva o comando que liste os nomes dos funcionários e os nomes das respectivas cidades. 
7.	Escreva o comando que liste os nomes dos funcionários e a sigla do respectivo estado. 
8.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. Liste somente os clientes que moram na região sul.
9.	Escreva o comando que liste os nomes dos estados com cadastros ativos que possuem algum cliente cadastrado.
10.	Escreva o comando que liste todas as vendas e o nome do respectivo funcionário que a realizou.
11.	Liste o nome dos produtos, o preço de venda e o nome da unidade de medida.
12.	Liste o nome dos produtos da marca "Coca-cola".
13. DESAFIO!!! Liste os nomes dos clientes do estado de São Paulo que já compraram o produto 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L'.

Semântica
1.	Em que caso devemos utilizar o JOIN? Quais tabelas podem ser utilizando em um comando JOIN?
2.	No caso do JOIN, o que é condição de junção. Qual cuidado devemos ter. 
3.	Em relação a sintaxe, em um JOIN não é necessário utilizarmos condições (WHERE) - o comando irá executar normalmente. Porém, em questão de semântica, a cada junção é necessário ter ao menos 1 condição. Explique.
4.	O que é produto cartesiano? Como funciona? Qual a relação com o JOIN.
5.	Na elaboração de um consulta que envolve 1587 tabelas, serão necessários, quantas condições de junção?

 */

USE banco;


/* Sintaxe #1 */
SELECT cidade.NOME CIDADE, estado.SIGLA UF FROM CIDADE, ESTADO WHERE ESTADO.ID = CIDADE.ESTADO_ID;

/* Sintaxe #2 */
SELECT cidade.NOME CIDADE, estado.SIGLA UF, cidade.STATUS ATIVIDADE FROM CIDADE, ESTADO WHERE ESTADO.ID = cidade.ESTADO_ID AND cidade.STATUS = 'A';

/* Sintaxe #3 */
SELECT cliente.NOME CLIENTE, cidade.NOME CIDADE FROM CLIENTE, CIDADE WHERE cidade.ID = cliente.CIDADE_ID;

/* Sintaxe #4 */
SELECT cliente.NOME CLIENTE, cidade.NOME CIDADE FROM CLIENTE, CIDADE WHERE cidade.ID = cliente.CIDADE_ID AND cidade.NOME = "PARANAVAÍ";

/* Sintaxe #5 */
SELECT cidade.NOME CIDADE, ESTADO.SIGLA UF, cidade.STATUS ATIVIDADE FROM CIDADE, ESTADO WHERE ESTADO.ID = cidade.ESTADO_ID AND cidade.STATUS = 'A';

/* Sintaxe #6 */
SELECT funcionario.NOME FUNCIONÁRIO, cidade.NOME CIDADE FROM FUNCIONARIO, CIDADE WHERE cidade.ID = funcionario.CIDADE_ID;

/* Sintaxe #7 */
SELECT f.NOME FUNCIONÁRIO, e.SIGLA UF FROM FUNCIONARIO f, ESTADO e, CIDADE c WHERE c.ID = f.CIDADE_ID AND e.ID = c.ESTADO_ID;

/* Sintaxe #8 */
SELECT cli.NOME CLIENTE, cid.NOME CIDADE FROM CLIENTE cli, CIDADE cid, ESTADO e WHERE cid.ID = cli.CIDADE_ID
AND (e.sigla = 'PR' OR e.sigla = 'SC' OR e.sigla = 'RS');

/* Sintaxe #9 */
SELECT e.NOME ESTADO FROM ESTADO e, CIDADE cid, CLIENTE cli
WHERE e.ID = cid.ESTADO_ID AND cid.ID = cli.CIDADE_ID
AND e.STATUS = 'A'
GROUP BY e.NOME;     /* Peguei essa parte do Sanches. Valeu, Sanches! */

/* Sintaxe #10 */
SELECT v.ID 'ID DA VENDA', v.DATA_CADASTRO 'DATA DA VENDA', f.NOME 'VENDEDOR' FROM venda v, funcionario f WHERE f.ID = v.FUNCIONARIO_ID;

/* Sintaxe #11 */
SELECT pro.nome PRODUTO, iven.PRECO_UNIDADE 'PREÇO UNITÁRIO', umed.nome 'UNIDADE DE MEDIDA' FROM PRODUTO pro, IVENDA iven, UMEDIDA umed
WHERE umed.ID = pro.UMEDIDA_ID AND pro.ID = iven.PRODUTO_ID;

/* Sintaxe #12 */
SELECT pro.NOME PRODUTO FROM PRODUTO pro, MARCA mar WHERE mar.id = pro.MARCA_ID AND mar.NOME = "Coca-cola"

/* Sintaxe #13 */
SELECT cli.NOME CLIENTE FROM ESTADO est, CIDADE cid, CLIENTE cli, VENDA ven, IVENDA iven, PRODUTO pro
WHERE est.ID = cid.ESTADO_ID AND cid.ID = cli.CIDADE_ID AND cli.ID = ven.CLIENTE_ID AND (ven.ID = iven.VENDA_ID AND iven.PRODUTO_ID = pro.ID)
AND est.sigla = "SP" AND pro.nome = "REFRIGERANTE COCA-COLA GARRAFA PET 3 L";




/* Semântica #1 */
-- Devemos usar o JOIN caso tenhamos que usar dados de tabelas diferentes em uma mesma consulta. Exemplo: consulta de nome da cidade e da sigla de seu
-- respectivo estado.

/* Semântica #2 */
-- Condição de junção é o que se usa para definir quais conjuntos de dados serão selecionados, evitando dessa forma a seleção de dados incorrespondentes.

/* Semântica #3 */
-- Sintaticamente falando, é possível fazer uma seleção de informação entre duas tabelas sem condições definidas. O problema é que isso vai gerar pesquisas
-- que juntam tabelas sem relações definidas, o que é inútil para quem realiza a pesquisa.

/* Semântica #4 */
-- Produto cartesiano é a relação entre múltiplas tabelas sem que haja uma condição definida, como dito na questão anterior. É uma pesquisa que vai relacionar todas
-- as linhas de uma tabela com todas as linhas da tabela com a qual está associdada, gerando uma junção com o número de linhas equivalente ao produto das linhas de
-- cada tabela que a compõe. Exemplo: CIDADE tem m linhas e ESTADO, n linhas; o produto cartesiano de CIDADE e ESTADO, portanto, terá m X n linhas.

/* Semântica #5 */
-- São necessárias 1586 condições de junção para unir 1587 tabelas. Sempre será necessário o número t de tabelas relacionadas menos 1, ou seja, sempre serão necessá-
-- rios t-1 JOINs.

