-- Databricks notebook source
-- Subquery 
-- Lista de vendedores que estão no estado com mais clientes
SELECT idVendedor, descUF
FROM silver_olist.vendedor
WHERE descUF = (

    SELECT descUF
    FROM silver_olist.cliente
    GROUP BY descUF
    ORDER BY COUNT(DISTINCT idClienteUnico) DESC
    LIMIT 1
)

-- COMMAND ----------

-- Lista de vendedores que estão nos 2 estados com mais clientes
-- Não é a melhor maneira de escrever a query:
SELECT idVendedor, descUF
FROM silver_olist.vendedor
WHERE descUF IN (

    SELECT descUF
    FROM silver_olist.cliente
    GROUP BY descUF
    ORDER BY COUNT(DISTINCT idClienteUnico) DESC
    LIMIT 2
)

-- COMMAND ----------

-- Há uma maneira melhor para escrever a query, usando WITH
WITH tb_estados AS (
    
    SELECT descUF
    FROM silver_olist.cliente
    GROUP BY descUF
    ORDER BY COUNT(DISTINCT idClienteUnico) DESC
    LIMIT 2
)
SELECT idVendedor, 
       descUF
FROM silver_olist.vendedor
WHERE descUF IN (SELECT descUF FROM tb_estados)

-- COMMAND ----------

-- Há uma maneira melhor para escrever a query, usando WITH
WITH tb_estados AS (
    
    SELECT descUF
    FROM silver_olist.cliente
    GROUP BY descUF
    ORDER BY COUNT(DISTINCT idClienteUnico) DESC
    LIMIT 2
), 
tb_vendedores AS (
SELECT idVendedor, descUF
FROM silver_olist.vendedor
WHERE descUF IN (SELECT descUF FROM tb_estados)
)
SELECT * FROM tb_vendedores

-- COMMAND ----------

-- REVISAR ******
-- Nota média dos pedidos dos vendedores de cada estado
WITH tb_pedido_nota AS (

  SELECT *
  FROM silver_olist.item_pedido AS T1 
  
  LEFT JOIN silver_olist.avaliacao_pedido AS T2
  ON T1.idPedido = T2.idPedido
),

tb_avg_vendedor AS(

SELECT idVendedor,
       AVG(vlNota) AS avgNota
FROM tb_pedido_nota
GROUP BY idVendedor
)
SELECT * FROM tb_avg_vendedor


-- COMMAND ----------


