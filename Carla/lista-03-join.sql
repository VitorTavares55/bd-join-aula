-- Consultas simples

SELECT cliente.nome, cliente.cpf, cliente.telefone, cliente.email FROM cliente;

SELECT instrumento.nome, instrumento.tipo_aplicacao FROM instrumento;

SELECT procedimento.nome, procedimento.instrumentos_necessarios FROM procedimento;

-- Consultas com junção

SELECT cliente.nome, locacao.data_locacao, pagamento.data_pagamento 
FROM cliente 
JOIN solicitacao_locacao ON cliente.id_cliente = solicitacao_locacao.id_cliente 
JOIN locacao ON solicitacao_locacao.id_solicitacao_locacao = locacao.id_solicitacao_locacao
JOIN pagamento ON pagamento.id_solicitacao_locacao = solicitacao_locacao.id_solicitacao_locacao;

SELECT funcionario.nome, prestacao_servico.data_servico
FROM funcionario 
JOIN prestacao_servico ON funcionario.id_funcionario = prestacao_servico.id_funcionario;

SELECT instrumento.nome, locacao.data_locacao, locacao.prazo_devolucao
FROM locacao
JOIN instrumento ON instrumento.id_instrumento = locacao.id_instrumento;
