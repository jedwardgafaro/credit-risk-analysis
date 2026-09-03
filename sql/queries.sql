-- ============================================
-- ANALISI DEL RISCHIO DI CREDITO
-- Dataset: German Credit Dataset
-- Autore: Jhon Edward Gafaro Nieto
-- GitHub: github.com/edwardgafaro
-- ============================================


-- ============================================
-- 1. DISTRIBUZIONE GENERALE DEL RISCHIO
-- ============================================
SELECT 
    Risk AS rischio,
    COUNT(*) AS totale_clienti,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM credito), 1) AS percentuale
FROM credito
GROUP BY Risk
ORDER BY totale_clienti DESC;


-- ============================================
-- 2. RISCHIO PER FASCIA D'ETÀ
-- ============================================
SELECT 
    CASE 
        WHEN Age < 25 THEN '18-24'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS fascia_eta,
    COUNT(*) AS totale,
    SUM(CASE WHEN Risk = 'bad' THEN 1 ELSE 0 END) AS rischio_alto,
    ROUND(
        SUM(CASE WHEN Risk = 'bad' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1
    ) AS tasso_rischio_pct
FROM credito
GROUP BY fascia_eta
ORDER BY fascia_eta;


-- ============================================
-- 3. RISCHIO PER SCOPO DEL PRESTITO
-- ============================================
SELECT 
    Purpose AS scopo,
    COUNT(*) AS totale_prestiti,
    ROUND(AVG("Credit amount"), 0) AS importo_medio_eur,
    ROUND(AVG(Duration), 1) AS durata_media_mesi,
    ROUND(
        SUM(CASE WHEN Risk = 'bad' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1
    ) AS tasso_rischio_pct
FROM credito
GROUP BY Purpose
ORDER BY tasso_rischio_pct DESC;


-- ============================================
-- 4. RISCHIO PER TIPO DI ALLOGGIO
-- ============================================
SELECT 
    Housing AS alloggio,
    COUNT(*) AS totale_clienti,
    ROUND(AVG("Credit amount"), 0) AS importo_medio_eur,
    ROUND(
        SUM(CASE WHEN Risk = 'bad' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1
    ) AS tasso_rischio_pct
FROM credito
GROUP BY Housing
ORDER BY tasso_rischio_pct DESC;


-- ============================================
-- 5. CLIENTI AD ALTO RISCHIO — PROFILO TIPO
-- ============================================
SELECT 
    CASE 
        WHEN Age < 25 THEN '18-24'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS fascia_eta,
    Housing AS alloggio,
    Purpose AS scopo,
    COUNT(*) AS totale,
    ROUND(AVG("Credit amount"), 0) AS importo_medio_eur,
    ROUND(AVG(Duration), 1) AS durata_media_mesi
FROM credito
WHERE Risk = 'bad'
GROUP BY fascia_eta, Housing, Purpose
HAVING COUNT(*) >= 5
ORDER BY totale DESC
LIMIT 10;


-- ============================================
-- 6. SEGMENTAZIONE CLIENTI PER RISCHIO E IMPORTO
-- ============================================
SELECT 
    Risk AS rischio,
    CASE 
        WHEN "Credit amount" < 2000 THEN 'Basso (<2.000€)'
        WHEN "Credit amount" BETWEEN 2000 AND 5000 THEN 'Medio (2.000-5.000€)'
        WHEN "Credit amount" BETWEEN 5001 AND 10000 THEN 'Alto (5.001-10.000€)'
        ELSE 'Molto Alto (>10.000€)'
    END AS segmento_importo,
    COUNT(*) AS totale_clienti,
    ROUND(AVG(Duration), 1) AS durata_media_mesi,
    ROUND(AVG(Age), 1) AS eta_media
FROM credito
GROUP BY Risk, segmento_importo
ORDER BY Risk, totale_clienti DESC;