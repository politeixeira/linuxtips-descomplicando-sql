-- Databricks notebook source
SELECT descUF,
       COUNT(idVendedor)
FROM silver_olist.vendedor
GROUP BY descUF

-- COMMAND ----------

-- Filtrando as agregações. Estados que tem mais de 100 vendedores por estado
SELECT descUF,
       COUNT(idVendedor)
FROM silver_olist.vendedor
GROUP BY descUF
HAVING COUNT(idVendedor) >= 100
 
-- ou
    --SELECT descUF,
    --       COUNT(idVendedor) AS qtVendedorUF
    -- FROM silver_olist.vendedor
    -- GROUP BY descUF
    -- HAVING qtVendedorUF >= 100

-- COMMAND ----------

SELECT descUF,
       COUNT(idVendedor) AS qtVendedorUF
FROM silver_olist.vendedor
GROUP BY descUF
HAVING qtVendedorUF >= 100
ORDER BY qtVendedorUF DESC

-- COMMAND ----------

SELECT descUF,
       COUNT(idVendedor) AS qtVendedorUF
FROM silver_olist.vendedor
WHERE descUF IN ('SP', 'MG', 'RJ', 'ES')
GROUP BY descUF
HAVING qtVendedorUF >= 100
ORDER BY qtVendedorUF DESC
