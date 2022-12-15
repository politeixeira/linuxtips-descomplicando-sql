-- Databricks notebook source
-- Quantos clientes ativos em todos os estados?
SELECT 
    descUF, 
    COUNT(*)
FROM silver_olist.cliente
GROUP BY descUF

-- COMMAND ----------

-- Quantos clientes ativos, distintos em todos os estados?
SELECT 
    descUF, 
    COUNT(DISTINCT idClienteUnico)
FROM silver_olist.cliente
GROUP BY descUF
