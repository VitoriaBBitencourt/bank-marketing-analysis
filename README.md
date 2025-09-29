# 📊 Bank Marketing Analysis – Python & SQL

Este projeto analisa o dataset **Bank Marketing** (UCI Machine Learning Repository), demonstrando um fluxo de análise completo com **Python (Pandas, Seaborn)** e **SQL (PostgreSQL)**, em um formato profissional e pronto para portfólio.

---

## Objetivos
- Explorar o desempenho geral da campanha de marketing
- Identificar perfis de clientes mais propensos à adesão
- Avaliar impacto da duração e quantidade de contatos
- Comparar variáveis socioeconômicas (idade, profissão, escolaridade)
- Demonstrar integração entre Python e SQL em um mesmo fluxo

---

## Dataset
- **Original:** `bank-additional-full.csv` (disponível em: [UCI Repository](https://archive.ics.uci.edu/ml/datasets/Bank+Marketing))  
- **Tratado:** `updated_data.csv` → versão limpa gerada no Python e utilizada nas análises SQL  

Principais variáveis:
- Demográficas: idade, profissão, estado civil, escolaridade  
- Financeiras: crédito em habitação, empréstimo pessoal  
- Comunicação: duração da chamada, número de contatos, tipo de contato  
- Resultado: variável **y** (cliente aceitou ou não o produto)

---

## Tecnologias
- Python 3.10+  
- PostgreSQL 17  
- Pandas, NumPy  
- Matplotlib, Seaborn  
- Jupyter Notebook  
- pgAdmin 4  

---

## 📈 Outputs
Principais análises e visualizações:
- Distribuição de clientes por perfil socioeconômico  
- Taxa de adesão por faixa etária, profissão e escolaridade  
- Impacto da duração da chamada na conversão  
- Comparação entre clientes já contatados e novos  
- Rankings dos grupos com maior e menor probabilidade de adesão  

Exemplos em [`docs/insights.md`](docs/insights.md) com prints e interpretações.

---

## Como rodar
1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/bank-marketing-analysis.git
   cd bank-marketing-analysis
Crie e ative um ambiente virtual (opcional)

Instale os requisitos:

bash
Copiar código
pip install -r requirements.txt
Abra os notebooks em python/ no Jupyter ou VSCode

(Opcional) Carregue updated_data.csv no PostgreSQL e execute as queries em sql/bank_marketing_analysis.sql

---

## Principais insights
Apenas ~11% dos clientes aceitaram o produto (baixa taxa de conversão)

Estudantes e aposentados são os grupos com maior taxa de adesão

Chamadas longas (>300s) têm conversão muito superior às curtas (<300s)

Clientes já contatados antes convertem menos (efeito de saturação)

Escolaridade mais alta está associada a maior propensão à adesão

---
👩‍💻 
Project by Vitória Bitencourt
