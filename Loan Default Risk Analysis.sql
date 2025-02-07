-- How many loans are Fully Paid, Charged Off, or Defaulted?
SELECT loan_status, COUNT(*) AS count,  
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM lendingclub_data), 2) AS percentage  
FROM lendingclub_data  
GROUP BY loan_status  
ORDER BY count DESC;

-- Do high DTI borrowers default more often?
SELECT dti, 
       COUNT(*) AS total_loans, 
       SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) AS defaulted_loans, 
       ROUND(100.0 * SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate
FROM lendingclub_data
GROUP BY dti
ORDER BY dti;

-- Do longer-term loans (60 months) have higher default rates than shorter-term (36 months) loans?
SELECT term, 
       COUNT(*) AS total_loans, 
       SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) AS defaulted_loans, 
       ROUND(100.0 * SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate
FROM lendingclub_data
GROUP BY term
ORDER BY term;

-- Are borrowers with shorter employment history more likely to default?
SELECT emp_length, 
       COUNT(*) AS total_loans, 
       SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) AS defaulted_loans, 
       ROUND(100.0 * SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate
FROM lendingclub_data
GROUP BY emp_length
ORDER BY emp_length;

-- Which grades have the highest default rates?
SELECT grade, 
       COUNT(*) AS total_loans, 
       SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) AS defaulted_loans, 
       ROUND(100.0 * SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate
FROM lendingclub_data
GROUP BY grade
ORDER BY grade;

-- What is the most common loan purpose?
SELECT purpose, COUNT(*) AS loan_count
FROM lendingclub_data
GROUP BY purpose
ORDER BY loan_count DESC;

-- Which states have the highest default rates?
SELECT addr_State, 
       COUNT(*) AS total_loans, 
       SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) AS defaulted_loans, 
       ROUND(100.0 * SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate
FROM lendingclub_data
GROUP BY addr_State
ORDER BY default_rate DESC
LIMIT 10;

-- What percentage of borrowers have bankruptcies and do they have higher default rates?
SELECT pub_rec_bankruptcies, 
       COUNT(*) AS count,  
       SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) AS defaulted_loans,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM lendingclub_data), 2) AS percentage,
       ROUND(100.0 * SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate
FROM lendingclub_data  
GROUP BY pub_rec_bankruptcies  
ORDER BY pub_rec_bankruptcies;

-- Do higher loan amounts lead to more defaults?
SELECT loan_amnt, 
       COUNT(*) AS total_loans, 
       SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) AS defaulted_loans, 
       ROUND(100.0 * SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate
FROM lendingclub_data
GROUP BY loan_amnt
ORDER BY loan_amnt;

-- Which home ownership status has the highest default rate?
SELECT home_ownership, 
       COUNT(*) AS total_loans, 
       SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) AS defaulted_loans, 
       ROUND(100.0 * SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate
FROM lendingclub_data
GROUP BY home_ownership
ORDER BY default_rate DESC;

-- Does a higher interest rate correlate with more defaults?
SELECT int_rate, 
       COUNT(*) AS total_loans, 
       SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) AS defaulted_loans, 
       ROUND(100.0 * SUM(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate
FROM lendingclub_data
GROUP BY int_rate
ORDER BY int_rate;