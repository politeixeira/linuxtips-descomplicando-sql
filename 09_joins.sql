-- Databricks notebook source
-- No LEFT JOIN a tabela de referência é a da esquerda, então os dados são trazidos da tabela da direita, pode sobrar dados
---- LEFT JOIN -- Tabela de referência é a da esquerda
-- No RIGHT JOIN a tabela de referência é a da direita, então os dados são trazidos da tabela da esquerda, pode sobrar dados
---- RIGHT JOIN -- Tabela de referência é a da direita
-- No INNER JOIN os dados são trazidos para o centro, sempre teremos dados combinados, dados não podem ficar sozinhos, os que sobram são descartados
---- INNER JOIN 

-- COMMAND ----------

-- Tabela fatos, no caso é a tebela de pedidos
SELECT * -- traz tudo das duas tabelas
FROM silver_olist.pedido AS T1
LEFT JOIN silver_olist.cliente AS T2
ON T1.idCliente = T2.idCliente


-- COMMAND ----------

-- Tabela fatos, no caso é a tebela de pedidos
SELECT T1.*, -- traz tudo da T1
       T2.descUF -- traz só a coluna descUF da T2
FROM silver_olist.pedido AS T1
LEFT JOIN silver_olist.cliente AS T2
ON T1.idCliente = T2.idCliente
