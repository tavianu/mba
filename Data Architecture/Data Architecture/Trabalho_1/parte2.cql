CREATE TABLE tabela_transacoes_mais_recentes(
    id_conta UUID,
    id_transacao UUID,
    modal TEXT,
    valor_transacao DECIMAL,
    id_tempo TIMEUUID,
    PRIMARY KEY ((id_conta), id_tempo, id_transacao)
) WITH CLUSTERING ORDER BY (id_tempo DESC);
CREATE TABLE tabela_transacoes_mes(
    id_conta UUID,
    id_transacao UUID,
    modal TEXT,
    valor_transacao DECIMAL,
    id_tempo TIMEUUID,
    mes_ano TEXT,
    PRIMARY KEY ((id_conta, mes_ano), id_tempo, id_transacao)
) WITH CLUSTERING ORDER BY (id_tempo DESC);
CREATE TABLE tabela_transacoes_por_modalidade(
    id_conta UUID,
    id_transacao UUID,
    modal TEXT,
    valor_transacao DECIMAL,
    id_tempo TIMEUUID,
    PRIMARY KEY ((modal), id_tempo, id_conta, id_transacao)
) WITH CLUSTERING ORDER BY (id_tempo DESC)