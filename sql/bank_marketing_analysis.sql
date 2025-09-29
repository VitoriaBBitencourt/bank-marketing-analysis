/* ===========================================================
   Bank Marketing Dataset - SQL Analysis
   Autor: Vitória de Bitencourt
   Data: 25/09/25

   Objetivo:
   Demonstrar domínio prático de SQL em um contexto real, 
   aplicando consultas para explorar, descrever e analisar 
   o dataset Bank Marketing.

   Estrutura do arquivo:
   - Block 1: Initial exploration
   - Block 2: Simple descriptive analysis
   - Block 3: Segmented analysis
   - Block 4: Cross analysis
   - Block 5: Comparative analysis and ranking

   Observação:
   - Todos os códigos estão em inglês (nomes de colunas e aliases).
   - Comentários e explicações em português para clareza didática.
=========================================================== */


-- BLOCK 1
-- 1. Count total rows
-- Conta o número total de registros da tabela
SELECT COUNT(*) FROM dados_marketing;

-- 2. Preview first 10 rows
-- Mostra uma amostra inicial dos dados
SELECT * FROM dados_marketing LIMIT 10;

-- 3. Table structure (columns and data types)
-- Consulta os nomes e tipos de dados de cada coluna da tabela
SELECT COLUMN_NAME, data_type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dados_marketing';


-- BLOCK 2
-- 1. Distribution by job
-- Conta o número de clientes por profissão
SELECT  job,
        COUNT(*) AS total
FROM dados_marketing
GROUP BY job
ORDER BY total DESC;

-- 2. Distribution by marital status
-- Conta o número de clientes por estado civil
SELECT marital,
       COUNT(*) AS total
FROM dados_marketing
GROUP BY marital
ORDER BY total DESC;

-- 3. Distribution by education level
-- Conta o número de clientes por nível educacional
SELECT education, 
       COUNT(*) AS total
FROM dados_marketing
GROUP BY education
ORDER BY total DESC;

-- 4. Distribution by age range
-- Conta o número de clientes por faixa etaria
SELECT age_range,
       COUNT (*) AS total
FROM dados_marketing
GROUP BY age_range
ORDER BY total DESC;

-- 5. Overall subscription rate (y)
-- Calcula a taxa de adesão geral (yes/no) sobre o total de clientes
SELECT y,  
       COUNT(*) AS total,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM dados_marketing), 2) AS percentage
FROM dados_marketing
GROUP BY y;



-- BLOCK 3
-- 1. Subscription rate by age_range
-- Mostra a taxa de adesão segmentada por faixa etária
SELECT age_range,
       y, 
       COUNT(*) AS total,
       ROUND(100.0 * COUNT(*)/ SUM(COUNT(*)) OVER (PARTITION BY age_range), 2) AS percentage
FROM dados_marketing
GROUP BY age_range, y
ORDER BY age_range, y;

-- 3. Subscription rate by duration_range
-- Mostra a taxa de adesão segmentada pela faixa de duração da chamada
SELECT duration_range,
       y,
       COUNT(*) AS total,
       ROUND(100.0*COUNT(*)/ SUM(COUNT(*))OVER (PARTITION BY duration_range), 2) AS percentage
FROM dados_marketing
GROUP BY duration_range, y
ORDER BY duration_range, y;

-- 4. Subscription rate by previously_contacted
-- Compara clientes já contatados anteriormente com os que não foram
SELECT previously_contacted, 
       y, 
       COUNT(*) AS total, 
       ROUND(100.0*COUNT(*)/SUM(COUNT(*)) OVER (PARTITION BY previously_contacted), 2) AS percentage
FROM dados_marketing
GROUP BY previously_contacted, y
ORDER BY previously_contacted, y;

-- 5. Binary response variable (y → 1 yes, 0 no)
-- Cria uma variável binária para facilitar análises estatísticas posteriores
SELECT
	CASE WHEN y = 'yes' THEN 1 ELSE 0 END AS response_binary,
	COUNT(*) AS total
FROM dados_marketing
GROUP BY response_binary;


-- Block 4
-- 1. Subscription rate by job (com percentual dentro de cada profissão)
-- Mostra quantos clientes por profissão disseram 'yes' ou 'no' 
-- e a taxa de adesão em cada grupo
SELECT job,
       y,
       COUNT(*) AS total,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY job), 2) AS percentage
FROM dados_marketing
GROUP BY job, y
ORDER BY job, y;


-- 2. Subscription rate by marital status (com percentual dentro de cada estado civil)
-- Avalia diferenças de adesão entre 'single', 'married', 'divorced'
SELECT marital,
       y,
       COUNT(*) AS total,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY marital), 2) AS percentage
FROM dados_marketing
GROUP BY marital, y
ORDER BY marital, y;


-- 3. Subscription rate by education level (percentual por nível educacional)
SELECT education,
       y,
       COUNT(*) AS total,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY education), 2) AS percentage
FROM dados_marketing
GROUP BY education, y
ORDER BY education, y;


-- 4. Cross analysis: subscription rate by housing loan
-- Mostra se ter empréstimo de habitação influencia na adesão
SELECT housing,
       y,
       COUNT(*) AS total,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY housing), 2) AS percentage
FROM dados_marketing
GROUP BY housing, y
ORDER BY housing, y;


-- 5. Cross analysis: subscription rate by personal loan
-- Mostra se ter empréstimo pessoal influencia na adesão
SELECT loan,
       y,
       COUNT(*) AS total,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY loan), 2) AS percentage
FROM dados_marketing
GROUP BY loan, y
ORDER BY loan, y;


-- 6. Cross analysis: subscription rate by contact type (telefone vs celular)
-- Mostra a taxa de adesão conforme o tipo de contato
SELECT contact,
       y,
       COUNT(*) AS total,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY contact), 2) AS percentage
FROM dados_marketing
GROUP BY contact, y
ORDER BY contact, y;


-- Block 5
-- 1. Cross analysis: housing loan AND personal loan
-- Mostra a taxa de adesão considerando a combinação das duas variáveis
SELECT housing,
       loan,
       y,
       COUNT(*) AS total,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY housing, loan), 2) AS percentage
FROM dados_marketing
GROUP BY housing, loan, y
ORDER BY housing, loan, y;


-- 2. Duration grouped into short vs long calls
-- Cria categorias simplificadas para comparar taxa de adesão
SELECT CASE 
           WHEN duration < 300 THEN 'short_call'
           ELSE 'long_call'
       END AS call_length_group,
       y,
       COUNT(*) AS total,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY 
           CASE WHEN duration < 300 THEN 'short_call' ELSE 'long_call' END), 2) AS percentage
FROM dados_marketing
GROUP BY call_length_group, y
ORDER BY call_length_group, y;


-- 3. Ranking: top 5 jobs with highest subscription rate
-- Mostra quais profissões têm maior taxa de adesão
SELECT job,
       ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM dados_marketing
GROUP BY job
ORDER BY subscription_rate DESC
LIMIT 5;


-- 4. Ranking: top 5 education levels with highest subscription rate
-- Mostra quais níveis de educação tem as maiores taxa de adesão
SELECT education,
       ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM dados_marketing
GROUP BY education
ORDER BY subscription_rate DESC
LIMIT 5;

-- 5. Custom indicator: contacted before AND said yes
-- Cria uma métrica binária para medir se contato anterior aumenta chance de adesão
SELECT previously_contacted,
       ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM dados_marketing
GROUP BY previously_contacted
ORDER BY previously_contacted;
	

/* ===========================================================
   Fim da análise SQL - Bank Marketing Dataset

   O que foi demonstrado:
   - Capacidade de explorar e descrever dados em SQL.
   - Uso de agregações, filtros, GROUP BY, CASE e window functions.
   - Estrutura organizada em blocos, cobrindo desde análises simples 
     até comparativas mais avançadas.
=========================================================== */
