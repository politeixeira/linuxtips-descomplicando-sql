-- Databricks notebook source
-- WHERE - Condição
-- leia-se: selecione todas as colunas da tabela silver_olist.pedido onde a situação do pedido seja entregue 'delivered'
SELECT * 
FROM silver_olist.pedido
WHERE descSituacao = 'delivered'
--LIMIT 100

-- COMMAND ----------

-- leia-se: selecione todas as colunas da tabela silver_olist.pedido onde a situação do pedido seja cancelado 'canceled'
SELECT * 
FROM silver_olist.pedido
WHERE descSituacao = 'canceled'
--LIMIT 100

-- COMMAND ----------

-- leia-se: selecione todas as colunas da tabela silver_olist.pedido onde a situação do pedido seja enviado 'shipped'
SELECT * 
FROM silver_olist.pedido
WHERE descSituacao = 'shipped'
--LIMIT 100

-- COMMAND ----------

-- AND e OR - Operadores lógicos
-- leia-se: selecione todas as colunas da tabela silver_olist.pedido filtrando pedidiso enviados de 2018
SELECT * 
FROM silver_olist.pedido
WHERE descSituacao = 'shipped'
AND year(dtPedido) = '2018'
--LIMIT 100

-- COMMAND ----------

-- AND e OR - Operadores lógicos
-- leia-se: selecione todas as colunas da tabela silver_olist.pedido filtrando pedidiso (enviados OU cancelados) de 2018
SELECT * 
FROM silver_olist.pedido
WHERE (descSituacao = 'shipped' OR descSituacao = 'canceled')
AND year(dtPedido) = '2018'
--LIMIT 100

-- COMMAND ----------

-- leia-se: selecione todas as colunas da tabela silver_olist.pedido filtrando pedididos enviados ou cancelados de 2018
SELECT * 
FROM silver_olist.pedido
WHERE descSituacao IN ('shipped','canceled')
AND year(dtPedido) = '2018'
--LIMIT 100

-- COMMAND ----------

-- leia-se: selecione todas as colunas da tabela silver_olist.pedido filtrando pedididos enviados ou cancelados de 2018 
-- onde a data de estimativa em relação a data de aprovação excede os 30 dias 
SELECT *,
      datediff(dtEstimativaEntrega, dtAprovado) AS diffDatasAprovadoPrevisao -- cria uma coluna nova com a quantidade de dias no total
FROM silver_olist.pedido
WHERE descSituacao IN ('shipped','canceled')
AND year(dtPedido) = '2018'
AND datediff(dtEstimativaEntrega, dtAprovado) > 30
--LIMIT 100
