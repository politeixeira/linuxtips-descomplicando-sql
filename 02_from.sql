-- Databricks notebook source
-- Select a partir de uma tabela
-- leia-se: selecione TUDO (*) da tabela silver_olist.pedido:
SELECT * FROM silver_olist.pedido

-- COMMAND ----------

SELECT idPedido
FROM silver_olist.pedido

-- COMMAND ----------

-- CTRL + SHIF + F >> formata a identação
-- leia-se: selecione as colunas idPedido e descSituacao da tabela silver_olist.pedido
SELECT idPedido,
       descSituacao
FROM silver_olist.pedido 


-- COMMAND ----------

-- leia-se: selecione as 5 primeiras linhas (registros) das colunas idPedido e descSituacao da tabela silver_olist.pedido
SELECT idPedido,
       descSituacao
FROM silver_olist.pedido
LIMIT 5

-- COMMAND ----------

-- SQL SPARK FUNCTIONS: https://spark.apache.org/docs/latest/api/sql/index.html
-- Aqui no Apache Spark estamos utilizando SQL ANCI, ele é mais genérico.
SELECT *,
      DATEDIFF(dtEstimativaEntrega, dtEntregue) AS qtDiasPromessaEntrega
FROM silver_olist.pedido
LIMIT 5

-- COMMAND ----------


