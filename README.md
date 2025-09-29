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
- **Tratado:** `data/updated_data.csv` → versão limpa gerada no Python e utilizada nas análises SQL  

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
01_data_cleaning(1).ipynb → limpeza e preparação dos dados

02_exploratory_analysis(1).ipynb → análise exploratória
Mais detalhes em python/README.md
.

(Opcional) Carregue data/updated_data.csv no PostgreSQL e execute as queries em sql/bank_marketing_analysis.sql

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

---

# Bank Marketing Analysis – Python & SQL (English Version)

This project analyzes the Bank Marketing dataset (UCI Machine Learning Repository), showcasing a complete workflow using Python (Pandas, Seaborn) and SQL (PostgreSQL), in a professional, portfolio-ready format.

---
## Objectives

Explore overall marketing campaign performance

Identify customer profiles more likely to subscribe

Evaluate the impact of call duration and number of contacts

Compare socioeconomic variables (age, job, education)

Demonstrate integration between Python and SQL in the same workflow

---
## Dataset

Original: bank-additional-full.csv (available at UCI Repository
)

Processed: data/updated_data.csv → cleaned version generated in Python and used in SQL analysis

Main variables:

Demographics: age, job, marital status, education

Financial: housing credit, personal loan

Communication: call duration, number of contacts, contact type

Target: variable y (whether the client subscribed or not)

---
## Technologies

Python 3.10+

PostgreSQL 17

Pandas, NumPy

Matplotlib, Seaborn

Jupyter Notebook

pgAdmin 4

---
## Outputs

Main analyses and visualizations:

Distribution of clients by socioeconomic profile

Subscription rate by age, job, and education

Impact of call duration on conversion

Comparison between previously contacted and new clients

Ranking of groups with higher and lower subscription probability

 Details and screenshots documented in docs/insights.md
.

---
## How to run

Clone this repository:

git clone https://github.com/your-username/bank-marketing-analysis.git
cd bank-marketing-analysis


Create and activate a virtual environment (optional)

Install requirements:

pip install -r requirements.txt


Open the notebooks in python/
 with Jupyter or VSCode

01_data_cleaning(1).ipynb → data cleaning and preparation

02_exploratory_analysis(1).ipynb → exploratory analysis
More details in python/README.md
.

(Optional) Load data/updated_data.csv into PostgreSQL and run the queries in sql/bank_marketing_analysis.sql
.

---
 ## Key insights

Only ~11% of customers subscribed (low conversion rate)

Students and retirees are the groups with the highest subscription rates

Long calls (>300s) perform much better than short ones (<300s)

Previously contacted customers are less likely to subscribe (saturation effect)

Higher education levels are associated with higher propensity to subscribe

---
👩‍💻 Author

Project by Vitória Bitencourt
