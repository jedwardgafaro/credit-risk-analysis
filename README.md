# 🏦 Analisi del Rischio di Credito — Python + SQL + Power BI

![Python](https://img.shields.io/badge/Python-3.10-blue?logo=python)
![SQL](https://img.shields.io/badge/SQL-SQLite-lightblue?logo=sqlite)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow?logo=powerbi)
![Scikit-learn](https://img.shields.io/badge/Scikit--learn-ML-orange?logo=scikit-learn)
![Status](https://img.shields.io/badge/Status-Completato-brightgreen)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

## 📌 Descrizione del Progetto

Progetto completo di analisi del rischio creditizio che integra **SQL**, **Python** e **Power BI** in un unico pipeline analitico professionale.

A partire dal dataset **German Credit Dataset**, il progetto costruisce un sistema end-to-end: dalla pulizia e interrogazione dei dati con SQL, all'analisi esplorativa e modellazione predittiva in Python, fino a una dashboard esecutiva interattiva in Power BI.

---

## 🎯 Obiettivi

- Costruire un database SQLite e interrogarlo con query analitiche professionali
- Identificare i fattori di rischio creditizio tramite analisi esplorativa
- Confrontare 3 modelli di Machine Learning per la classificazione del rischio
- Comunicare i risultati tramite una dashboard Power BI interattiva a 3 pagine

---

## 📊 Dataset

| Attributo | Dettaglio |
|-----------|-----------|
| Fonte | [Kaggle – German Credit Data with Risk](https://www.kaggle.com/datasets/kabure/german-credit-data-with-risk) |
| Clienti | 1.000 |
| Colonne | 10 variabili |
| Target | Risk: good / bad |
| Distribuzione | 70% buono / 30% cattivo |

**Variabili principali:**

| Colonna | Descrizione |
|---------|-------------|
| Age | Età del cliente |
| Sex | Genere |
| Job | Livello occupazionale (0-3) |
| Housing | Tipo di alloggio (own/free/rent) |
| Saving accounts | Livello di risparmi |
| Checking account | Livello conto corrente |
| Credit amount | Importo del credito (€) |
| Duration | Durata del prestito (mesi) |
| Purpose | Scopo del prestito |
| Risk | Target — good / bad |

---

## 🛠️ Tecnologie e Librerie

```
Pipeline completo:

SQL (SQLite)
├── sqlalchemy          → connessione Python-database
├── sqlite3             → gestione database locale
└── 6 query analitiche  → rischio per età, scopo, alloggio, segmentazione

Python 3.10
├── pandas              → manipolazione dati
├── numpy               → operazioni numeriche
├── matplotlib          → visualizzazioni
├── seaborn             → grafici statistici
└── scikit-learn
    ├── LogisticRegression
    ├── RandomForestClassifier
    ├── GradientBoostingClassifier
    ├── StandardScaler
    ├── LabelEncoder
    └── metrics

Power BI
├── Power Query         → trasformazione dati
├── DAX                 → misure calcolate
├── Data Modeling       → relazioni tra tabelle
└── Visual Design       → 3 pagine interattive
```

---

## 🔍 Fasi del Progetto

### 1. SQL — Creazione Database e Analisi
- Creazione database SQLite con sqlalchemy
- 6 query analitiche: distribuzione rischio, analisi per età, scopo, alloggio, profilo clienti ad alto rischio, segmentazione per importo

### 2. Python — EDA e Feature Engineering
- Gestione valori nulli con categoria unknown
- Analisi distribuzione rischio per variabili categoriche e numeriche
- Feature Engineering: creazione credit_duration_ratio = importo / durata
- Heatmap correlazione variabili finanziarie

### 3. Machine Learning — 3 Modelli a Confronto
- Divisione 80% training / 20% test con stratificazione
- StandardScaler per normalizzazione features
- Confronto Accuracy e ROC-AUC

### 4. Power BI — Dashboard Esecutiva
- 3 pagine interattive con slicer collegati
- Misure DAX contestuali
- Colonne calcolate: Risk_italiano, Fascia Età

---

## 📈 Risultati

### Performance dei Modelli

| Modello | Accuracy | ROC-AUC |
|---------|----------|---------|
| Logistic Regression | 73.0% | 0.766 |
| Random Forest | 75.5% | 0.775 |
| **Gradient Boosting** | **76.5%** | **0.780** |

### Top 5 Variabili più Predittive

| # | Variabile | Importanza | Significato |
|---|-----------|------------|-------------|
| 1 | credit_duration_ratio | 19.7% | Creata con Feature Engineering |
| 2 | Credit amount | 18.5% | Importo più alto = rischio maggiore |
| 3 | Age | 14.4% | Clienti giovani più rischiosi |
| 4 | Checking account | 12.0% | Liquidità disponibile |
| 5 | Duration | 11.2% | Prestiti lunghi più rischiosi |

### Insight SQL Principali

| Analisi | Risultato |
|---------|-----------|
| Fascia più rischiosa | 18-24 anni (40.9%) |
| Scopo più rischioso | Vacation/others (41.7%) |
| Alloggio più rischioso | Free (40.7%) |
| Scopo più sicuro | Radio/TV (22.1%) |
| Alloggio più sicuro | Own (26.1%) |

### Predizione Nuovi Clienti

| Cliente | Profilo | Rischio | Probabilità |
|---------|---------|---------|-------------|
| Cliente 1 | 23a, affitto, pochi risparmi, €8.000 x 48m | Alto | 83.3% |
| Cliente 2 | 45a, proprietario, risparmi alti, €3.000 x 12m | Basso | 20.0% |
| Cliente 3 | 35a, casa libera, risparmi medi, €5.000 x 24m | Moderato | 36.3% |

---

## 📊 Dashboard Power BI — 3 Pagine

### Pagina 1 — Overview del Rischio
- 4 KPI Cards: Totale Clienti, Clienti a Rischio, Tasso Rischio %, Importo Medio
- Grafico a torta: distribuzione Buono/Cattivo
- Barre: tasso rischio per scopo del prestito
- Barre: tasso rischio per tipo di alloggio
- Slicer: filtro per Risk_italiano

### Pagina 2 — Analisi Clienti
- Scatter: Età vs Importo vs Durata (dimensione bolle = durata)
- Barre: tasso rischio per fascia d'età
- Barre: rischio per livello di risparmio
- Slicer: Age (cursore), Sex (lista)
- Tabella: Top 20 clienti a rischio per importo

### Pagina 3 — Risultati Modello
- Tabella: confronto 3 modelli con formattazione condizionale
- Barre: feature importance Gradient Boosting
- Barre: confronto accuracy tutti i modelli
- 3 Card conclusioni: miglior modello, ROC-AUC, feature principale

---

## 💼 Valore per il Business

| Beneficio | Descrizione |
|-----------|-------------|
| Valutazione automatica | Stima il rischio di ogni richiesta in tempo reale |
| Riduzione perdite | Identifica clienti ad alto rischio prima dell'erogazione |
| Segmentazione | Profila i clienti per strategie commerciali mirate |
| Spiegabilità | Feature importance per giustificare le decisioni |
| Dashboard esecutiva | Visione immediata del portafoglio crediti |

---

## 📁 Struttura del Repository

```
credit-risk-analysis/
│
├── data/
│   ├── credit_data.csv              # Dataset originale
│   ├── credit_clean.csv             # Dataset pulito
│   ├── credit_powerbi.csv           # Dataset per Power BI
│   ├── model_results.csv            # Performance modelli
│   └── feature_importance.csv       # Importanza variabili
│
├── sql/
│   └── queries.sql                  # 6 query analitiche
│
├── notebooks/
│   └── analysis.ipynb               # Notebook Python completo
│
├── report/
│   └── Credit_Risk_Dashboard.pbix   # Dashboard Power BI
│
├── screenshots/
│   ├── 01_distribuzione_rischio.png     # Python — distribuzione target
│   ├── 02_eta_importo_rischio.png       # Python — boxplot età e importo
│   ├── 03_rischio_categoriche.png       # Python — rischio per variabili categoriche
│   ├── 04_correlazione.png              # Python — heatmap correlazione
│   ├── 05_roc_curve.png                 # Python — curva ROC 3 modelli
│   ├── 06_feature_importance.png        # Python — importanza variabili
│   ├── 07_predizioni_clienti.png        # Python — predizione nuovi clienti
│   ├── 08_overview.png                  # Power BI — pagina 1 overview
│   ├── 09_analisi_clienti.png           # Power BI — pagina 2 analisi clienti
│   └── 10_risultati_modello.png         # Power BI — pagina 3 risultati modello
│
├── requirements.txt
└── README.md
```

> ⚠️ **Nota:** Se il file .pbix supera i 25MB, aprire Power BI Desktop,
> caricare credit_powerbi.csv e ricreare il report seguendo la struttura descritta.

---

## ⚙️ Come Eseguire il Progetto

```bash
# 1. Clona il repository
git clone https://github.com/edwardgafaro/credit-risk-analysis.git
cd credit-risk-analysis

# 2. Installa le dipendenze
pip install -r requirements.txt

# 3. Apri il notebook
jupyter notebook notebooks/analysis.ipynb
```

---

## 📦 requirements.txt

```
pandas
numpy
matplotlib
seaborn
scikit-learn
sqlalchemy
plotly
jupyter
```

---

## 🚀 Possibili Sviluppi Futuri

- Ottimizzazione iperparametri con RandomizedSearchCV
- Test con XGBoost e LightGBM
- Analisi SHAP per interpretabilità avanzata
- API REST per predizione in tempo reale
- Integrazione con database PostgreSQL
- Score card regolamentare (Basilea III)

---

## 👤 Autore

**Jhon Edward Gafaro Nieto**
📍 Modena, Italia
🔗 [LinkedIn](https://www.linkedin.com/in/edwardgafaro)
🐙 [GitHub](https://github.com/edwardgafaro)

---

## 📄 Licenza

Questo progetto è distribuito sotto licenza MIT.
