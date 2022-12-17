-- Databricks notebook source
-- Ordenar do melhor vendedor para o pior vendedor 
WITH tb_vendas_vendedores AS (

SELECT 
      idVendedor,
      COUNT(*) AS qtVendas
FROM silver_olist.item_pedido
GROUP BY idVendedor
ORDER BY qtVendas DESC
)

SELECT T1.*,
       T2.descUF
       
FROM tb_vendas_vendedores AS T1

LEFT JOIN silver_olist.vendedor AS T2
ON T1.idVendedor = T2.idVendedor

ORDER BY qtVendas DESC
LIMIT 10

-- COMMAND ----------

-- Ordenar do melhor vendedor para o pior vendedor 
-- Usando WINDOW FUNCTION
WITH tb_vendas_vendedores AS (

SELECT 
      idVendedor,
      COUNT(*) AS qtVendas
FROM silver_olist.item_pedido
GROUP BY idVendedor
ORDER BY qtVendas DESC
),

tb_row_number AS (

SELECT T1.*,
       T2.descUF,
       ROW_NUMBER() OVER (PARTITION BY T2.descUF ORDER BY qtVendas DESC) AS RN 
       
FROM tb_vendas_vendedores AS T1

LEFT JOIN silver_olist.vendedor AS T2
ON T1.idVendedor = T2.idVendedor

ORDER BY descUF, qtVendas DESC
)

SELECT * FROM tb_row_number WHERE RN <= 10
-- LIMIT 10

-- COMMAND ----------

-- Ordenar do melhor vendedor para o pior vendedor 
-- Usando WINDOW FUNCTION
WITH tb_vendas_vendedores AS (

SELECT 
      idVendedor,
      COUNT(*) AS qtVendas
FROM silver_olist.item_pedido
GROUP BY idVendedor
ORDER BY qtVendas DESC
),

tb_row_number AS (

SELECT T1.*,
       T2.descUF,
       ROW_NUMBER() OVER (PARTITION BY T2.descUF ORDER BY qtVendas DESC) AS RN 
       
FROM tb_vendas_vendedores AS T1

LEFT JOIN silver_olist.vendedor AS T2
ON T1.idVendedor = T2.idVendedor

QUALIFY RN <= 10

ORDER BY descUF, qtVendas DESC
)

SELECT * FROM tb_row_number
-- LIMIT 10
