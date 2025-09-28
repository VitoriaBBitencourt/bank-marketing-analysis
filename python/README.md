## Notebooks

### 1. `01_data_cleaning.ipynb`
- Carregamento do dataset original (`bank-additional-full.csv`).  
- Tratamento de valores ausentes.  
- Criação de variáveis derivadas.

---

### 2. `02_exploratory_analysis.ipynb`
- Análise exploratória em Python (EDA).  
- Estatísticas descritivas iniciais.  
- Distribuições de variáveis (`job`, `marital`, `education`, etc.).  
- Relações gráficas entre variáveis e a resposta (`y`).
- Exportação do dataset tratado para `updated_data.csv` (usado na análise em SQL).
- Apoio para definir hipóteses a serem testadas no SQL.

---

## Integração com SQL
- O arquivo `updated_data.csv`, gerado no notebook, é carregado no PostgreSQL.  
- A partir dele, foram construídas as queries SQL organizadas em blocos (ver pasta `../sql/`).  

---

 Em resumo:  
- **Notebook 1** → prepara os dados.  
- **Notebook 2** → analisa e explora os dados em Python.  
- **SQL** → aprofunda a análise e gera insights. 
