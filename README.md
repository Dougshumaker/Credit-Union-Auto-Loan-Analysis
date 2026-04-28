Credit Union Auto Loan Delinquency Analysis (2024–2025)

Analysis of auto loan delinquency trends across U.S. credit unions using NCUA 
5300 Call Report data spanning 8 quarters from 2024-Q1 to 2025-Q4.

Tools: PostgreSQL, pgAdmin  
Data Source: NCUA 5300 Call Report (publicly available quarterly data)  
Institutions Analyzed: 4,300+ U.S. credit unions

---

What I found

Navy Federal leads in raw delinquency dollars at $413M — nearly 3x the next 
closest institution — but their delinquency rate relative to portfolio size is 
only ~1.25%, which is well controlled at their scale. Raw dollars and rate tell 
very different stories.

Delinquency follows a consistent seasonal pattern across both years. It rises 
slowly from Q1 through Q3, spikes sharply in Q4, then resets in Q1. This repeated 
almost identically in 2024 and 2025, suggesting structural seasonal behavior rather 
than a deteriorating credit environment. Overall industry delinquency has remained 
relatively flat across the two-year period.

Used vehicle delinquency is the primary driver of credit stress — running 3x higher 
than new vehicle delinquency across every quarter. Some institutions show extreme 
concentration, with Community First carrying a 19,141:1 used-to-new ratio.

Smaller institutions carry the highest delinquency rates when normalized by loan 
balance. POLAM leads at 14.64%, followed by Metropolitan Church at 12.59% and 
Friona Texas at 12.03%. Size masks rate risk rather than reducing it.

---

Queries

01_top_delinquency_by_cu.sql — which credit unions have the highest total delinquency  
02_industry_delinquency_trend.sql — how delinquency has trended by quarter  
03_biggest_delinquency_increase.sql — which institutions grew delinquency the most  
04_used_vs_new_ratio.sql — ratio of used vs new vehicle delinquency by institution  
05_delinquency_rate_by_size.sql — whether institution size correlates with delinquency rate  

---

Data source: ncua.gov/analysis/credit-union-corporate-call-report-data/quarterly-data
