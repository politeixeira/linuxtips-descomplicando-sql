-- Databricks notebook source
SELECT 
    descUF, 
    COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM silver_olist.cliente
GROUP BY descUF
ORDER BY descUF -- ordenando por estado

-- COMMAND ----------

-- Primeira forma de ordenar por quantidade de cliente
SELECT 
    descUF, 
    COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM silver_olist.cliente
GROUP BY descUF
ORDER BY 2 -- ordenar pela coluna 2

-- COMMAND ----------

-- Segunda forma de ordenar por quantidade de cliente
SELECT 
    descUF, 
    COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM silver_olist.cliente
GROUP BY descUF
ORDER BY qtClienteEstado

-- COMMAND ----------

-- Terceira forma de ordenar por quantidade de cliente
SELECT 
    descUF, 
    COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM silver_olist.cliente
GROUP BY descUF
ORDER BY COUNT(DISTINCT idClienteUnico)

-- COMMAND ----------

-- Estado com maior quantidade de clientes
SELECT 
    descUF, 
    COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM silver_olist.cliente
GROUP BY descUF
ORDER BY qtClienteEstado DESC

-- COMMAND ----------

-- Estado com maior quantidade de clientes, mostrar só uma linha
SELECT 
    descUF, 
    COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM silver_olist.cliente
GROUP BY descUF
ORDER BY qtClienteEstado DESC
LIMIT 1
