-- Databricks notebook source
-- Criar uma coluna nova que dê uma nacionalidade para as pessoas, usamos a cláusula CASE
SELECT *,
       CASE WHEN descUF = 'SP' THEN 'paulista' END AS descNacionalidade
FROM silver_olist.cliente


-- COMMAND ----------

-- Criar uma coluna nova que dê uma nacionalidade para as pessoas, usamos a cláusula CASE
SELECT *,
       CASE WHEN descUF = 'SP' THEN 'paulista' 
       ELSE 'outros'
       END AS descNacionalidade
FROM silver_olist.cliente

-- COMMAND ----------

-- Criar uma coluna nova que dê uma nacionalidade para as pessoas, usamos a cláusula CASE
SELECT *,
       CASE WHEN descUF = 'SP' THEN 'paulista' 
       WHEN descUF = 'RJ' THEN 'fluminense'
       ELSE 'outros'
       END AS descNacionalidade
FROM silver_olist.cliente

-- COMMAND ----------

-- Criar uma coluna nova que dê uma nacionalidade para as pessoas, usamos a cláusula CASE
-- SQL é case sensitive quando se trata dos valores dos campos, por exemplo 'pr' é diferente de 'PR'
SELECT *,
       CASE 
         WHEN descUF = 'SP' THEN 'paulista' 
         WHEN descUF = 'RJ' THEN 'fluminense'
         WHEN descUF = 'PR' THEN 'paranaense'
         ELSE 'outros'
       END AS descNacionalidade
FROM silver_olist.cliente

-- COMMAND ----------

-- Quais são as cidades que possuem o 'São' no nome?
SELECT *,
       -- esta é uma coluna nova
       CASE 
         WHEN descUF = 'SP' THEN 'paulista' 
         WHEN descUF = 'RJ' THEN 'fluminense'
         WHEN descUF = 'PR' THEN 'paranaense'
         ELSE 'outros'
       END AS descNacionalidade,       
        
       -- esta é uma outra coluna nova
       CASE 
         WHEN descCidade LIKE '%sao%' THEN 'Tem sao no nome'
         ELSE 'Não tem sao no nome'
       END AS descCidadeSao
FROM silver_olist.cliente

-- COMMAND ----------

SELECT *,
        CASE 
          WHEN descUF IN ('SP', 'MG', 'RJ', 'ES') THEN 'sudeste'
        END AS descRegiao
FROM silver_olist.vendedor
      
