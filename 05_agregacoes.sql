-- Databricks notebook source
SELECT COUNT(*) -- linhas não nulas
FROM silver_olist.cliente

-- COMMAND ----------

SELECT COUNT(*) AS nrLinhasNaoNulas -- linhas não nulas
FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
       COUNT(*) AS nrLinhasNaoNulas, -- linhas não nulas
       COUNT(idCliente) AS nrIdClienteNaoNulo -- id de clientes não nulos
FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
       COUNT(*) AS nrLinhasNaoNulas, -- linhas não nulas
       COUNT(idCliente) AS nrIdClienteNaoNulo, -- id de clientes não nulos
       COUNT(distinct idCliente) AS nrIdClienteDistintos -- id de clientes distintos
FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
       COUNT(*) AS nrLinhasNaoNulas, -- linhas não nulas
       COUNT(idCliente) AS nrIdClienteNaoNulo, -- id de clientes não nulos
       COUNT(distinct idCliente) AS nrIdClienteDistintos, -- id de clientes distintos
       COUNT(DISTINCT idClienteUnico) AS nrIdClienteUnicoDistintos
FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
       COUNT(*) AS nrLinhasNaoNulas, -- conta linhas não nulas
       COUNT(idCliente) AS nrIdClienteNaoNulo, -- conta id de clientes não nulos
       COUNT(distinct idCliente) AS nrIdClienteDistintos, -- conta id de clientes distintos
       
       COUNT(idClienteUnico) AS nrIdClienteUnico,
       COUNT(DISTINCT idClienteUnico) AS nrIdClienteUnicoDistintos -- conta id de clientes únicos
FROM silver_olist.cliente

-- COMMAND ----------

-- Quantos clientes são da cidade de Presidente Prudente
-- Ao rodar a query o WHERE será executado primeiro e depois é executado o COUNT
SELECT 
  COUNT(*) 
FROM silver_olist.cliente
WHERE descCidade = 'presidente prudente'

-- COMMAND ----------

SELECT 
  COUNT(*) 
FROM silver_olist.cliente
WHERE descCidade IN ('presidente prudente', 'curitiba')

-- COMMAND ----------

SELECT 
  COUNT(*) AS qtLinhas,
  COUNT(distinct idCliente) AS qtClientes,
  COUNT(distinct idClienteUnico) as qtClientesUnicos  
FROM silver_olist.cliente
WHERE descCidade IN ('presidente prudente', 'curitiba')

-- COMMAND ----------

SELECT 
      AVG(vlPreco) AS avgPreco, -- media da coluna vlPreco (preço médio dos produtos)
      PERCENTILE(VLpRECO, 0.5) AS medianPreco, -- preço mediano dos produtos
      
      MAX(vlPreco) AS maxPreco,
      AVG(vlFrete) AS avgFrete,
      MAX(vlFrete) AS maxFrete,
      MIN(vlFrete) AS minFrete
      
FROM silver_olist.item_pedido

-- COMMAND ----------

SELECT 
      ROUND(AVG(vlPreco), 2) AS avgPreco, -- media da coluna vlPreco (preço médio dos produtos)
      
      INT(PERCENTILE(vlPreco, 0.5)) AS medianPreco, -- preço mediano dos produtos INT ou CAST
      
      MAX(vlPreco) AS maxPreco,
      AVG(vlFrete) AS avgFrete,
      MAX(vlFrete) AS maxFrete,
      MIN(vlFrete) AS minFrete
      
FROM silver_olist.item_pedido

-- COMMAND ----------

-- Quantos clientes ativos no estado de São Paulo?
SELECT COUNT(*)
FROM silver_olist.cliente
WHERE descUF = 'SP'

-- COMMAND ----------

-- Quantos clientes ativos no estado de Santa Catarina?
SELECT COUNT(*)
FROM silver_olist.cliente
WHERE descUF = 'SC'
