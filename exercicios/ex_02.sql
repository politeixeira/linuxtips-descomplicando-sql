-- Databricks notebook source
-- EXERCÍCIOS WHERE
-- 01) Lista de pedidos com mais de um item
-- 02) Lista de pedidos que o frete é mais caro que o item
-- 03) Lista de pedidos que ainda não foram enviados
-- 04) Lista de pedidos que foram entregues com atraso
-- 05) Lista de pedidos que foram entregues com 2 dias de antecedência
-- 06) Lista de pedidos feitos em dezembro de 2017 e entregues com atraso
SELECT *,
       date(dtEntregue),
       date(dtEstimativaEntrega) 
       
FROM silver_olist.pedido
WHERE YEAR(dtPedido) = 2017
AND MONTH(dtPedido) = 12
AND descSituacao = 'delivered'
AND date(dtEntregue) > date(dtEstimativaEntrega)

-- COMMAND ----------

-- 07) Lista de pedidos com avaliação maior ou igual que 4
-- 08) Lista de pedidos com 2 ou mais parcelas menores quer R$20,00
SELECT *,
        ROUND(vlPagamento / nrPacelas, 2) AS vlParcela
FROM silver_olist.pagamento_pedido
WHERE nrPacelas >= 2
AND vlPagamento / nrPacelas < 20

-- COMMAND ----------

-- EXERCÍCIOS CASE
-- 01) Selecione todos os pedidos e marque se houve atraso ou não

-- COMMAND ----------

-- 02) Selecione os itens de pedidos e defina os grupos em uma nova coluna:
---- para frete inferior à 10%: '10%'
---- para frete entre 10% e 25%: '10% a 25%'
---- para frete entre 25% e 50%: '25% a 50%'
---- para frete maior que 50%: '+50%'

SELECT *,
        vlPreco + vlFrete AS vlTotal,
        vlFrete / ( vlPreco + vlFrete) AS pctFrete,
        
        CASE 
          WHEN  vlFrete / ( vlPreco + vlFrete) <= 0.1 THEN '10%'
          WHEN  vlFrete / ( vlPreco + vlFrete) <= 0.25 THEN '10% a 25%'
          WHEN  vlFrete / ( vlPreco + vlFrete) <= 0.50 THEN '25% a 50%'
          ELSE '+50%'
        END AS descFretePct
        
FROM silver_olist.item_pedido

-- COMMAND ----------

-- Para comentar seleciona o que vc quer e dá CTRL + barra
