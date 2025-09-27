# 📑 Insights — Bank Marketing (SQL)

Este documento apresenta os principais insights extraídos com SQL a partir do dataset **Bank Marketing**.  
Cada insight inclui: a query utilizada, o resultado (screenshot) e a interpretação.

---

## Insight 1 — Taxa geral de adesão

**Query:**
```sql
SELECT y, COUNT(*) AS total,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM dados_marketing), 2) AS percentage
FROM dados_marketing
GROUP BY y;

Resultado:


Interpretação:
Apenas ~11% dos clientes aceitaram o produto. Isso mostra que a campanha tem baixa conversão, exigindo segmentação melhor.

Insight 2 — Idade influencia no resultado

Query:

SELECT age_range, y, COUNT(*) AS total,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY age_range), 2) AS percentage
FROM dados_marketing
GROUP BY age_range, y
ORDER BY age_range, y;


Resultado:


Interpretação:
Clientes jovens (<25) e aposentados (65+) apresentam taxas de adesão mais altas que a média.

Insight 3 — Duração da chamada é decisiva

Query:

SELECT CASE WHEN duration < 300 THEN 'short_call' ELSE 'long_call' END AS call_length_group,
       y, COUNT(*) AS total,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY CASE WHEN duration < 300 THEN 'short_call' ELSE 'long_call' END), 2) AS percentage
FROM dados_marketing
GROUP BY call_length_group, y
ORDER BY call_length_group, y;


Resultado:


Interpretação:
Chamadas curtas (<300s) têm taxas baixíssimas (~5%). Já chamadas longas (>300s) superam 40% de adesão.

Insight 4 — Contato repetido reduz adesão

Query:

SELECT previously_contacted,
       ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM dados_marketing
GROUP BY previously_contacted
ORDER BY previously_contacted;


Resultado:


Interpretação:
Clientes já contatados antes convertem menos. Isso sugere que insistência em excesso pode desgastar o cliente.

Insight 5 — Profissão e educação importam

Query:

SELECT job,
       ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM dados_marketing
GROUP BY job
ORDER BY subscription_rate DESC
LIMIT 5;


Resultado:


Interpretação:
Estudantes e aposentados apresentam as maiores taxas de adesão.
Níveis educacionais mais altos também têm maior propensão a aceitar o produto.
