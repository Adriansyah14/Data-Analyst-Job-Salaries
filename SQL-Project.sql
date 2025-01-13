SELECT * FROM ds_salaries WHERE work_year IS NULL OR experience_level IS NULL 
OR employment_type IS NULL OR job_title IS NULL OR salary IS NULL OR salary_currency IS NULL 
OR salary_in_usd IS NULL OR employee_residence IS NULL OR remote_ratio IS NULL OR 
company_location IS NULL OR company_size IS NULL; 

SELECT DISTINCT job_title
FROM ds_salaries
WHERE job_title LIKE '%data analyst'
ORDER BY job_title;

SELECT AVG(salary_in_usd) avg_salary_in_usd
FROM ds_salaries;

SELECT
	experience_level,
    employment_type,
    (AVG(salary_in_usd) *15000) /12 AS avg_sal_in_rp_monthly
FROM
	ds_salaries
GROUP BY
	experience_level,
    employment_type
ORDER BY
	experience_level,
    employment_type;
    
SELECT
	company_location,
    AVG(salary_in_usd) AS avg_sal_in_usd
FROM ds_salaries
WHERE
	job_title LIKE '%data analyst%'
    AND employment_type = 'FT'
    AND experience_level IN ('MI', 'EN')
GROUP BY
	company_location
HAVING
	avg_sal_in_usd >= 20000;
