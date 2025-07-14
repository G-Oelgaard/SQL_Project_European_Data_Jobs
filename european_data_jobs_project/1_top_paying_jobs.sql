/*
Question: What are the best paying non-senior jobs in Europe in the data industry?

- Identify the top 10 highest paying non-senior data jobs in Europe.
- Remove any jobs without a specified salary.

As we already created a table with only european jobs in a previous script (see "0_create_table.sql") we do not need to do this part.
We simply have to call the new table "euro_jobs".
*/

SELECT
    job_title_short,
    company_dim.name AS company,
    job_country AS country,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    euro_jobs
LEFT JOIN
    company_dim ON company_dim.company_id = euro_jobs.company_id
WHERE
    job_title_short NOT LIKE '%Senior%' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;

/*
-- The non-limited data is 1,765 rows long. Meaning that only 1,765 out of the 288,420 jobs in the table match our search requirements - ca. 0.6 %.
Using a "EXPLAIN ANALYZE" at the start of the query, we can also see the time to run the query (if not limited) would be ca. 39 ms.

From the query, we can conclude that the most best paid jobs are found in Eastern Europe, followed by central and western europe.
However, while it is true that the best paid jobs are in Eastern Europe, if we look beyond the top 10 best paid jobs, the vast
majority of well paid data jobs are found in central europe - especially in Germany. We can confirm this using the query below.

The query above also tells us that a a not inconsequential part of the best paid jobs are actually as Data Engineers.
*/

-- Checking how many jobs that pay above the average salary exist pr. country using a CTE.
WITH jobs_by_country AS (
    SELECT
        job_title_short,
        job_country AS country,
        salary_year_avg
    FROM
        euro_jobs
    WHERE
        job_title_short NOT LIKE '%Senior%' AND
        salary_year_avg IS NOT NULL 
)

SELECT
    country,
    COUNT(*) AS jobs_above_mean
FROM
    jobs_by_country
WHERE
    salary_year_avg > (SELECT AVG(salary_year_avg) FROM jobs_by_country)
GROUP BY
    country
ORDER BY
    jobs_above_mean DESC;

