/*
Question: what jobs are most in-demand?

- Using a simple query, we will examine what jobs are the most sought after. We can do this by using the "job_title_short" column.
- To further build on this, let us also check what roles have the best average pay.
*/

SELECT
    job_title_short AS job_title,
    COUNT(*) AS available_jobs,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary_year
FROM
    euro_jobs
WHERE
    job_title_short NOT LIKE '%Senior%'
GROUP BY
    job_title_short
ORDER BY
    available_jobs DESC


/*
Using this query we an see that the most sought after roles are by far Data Engineers, Data Analysts and Data Scientists.
Furthermore, Data Engineers have the highest average salaries while Data Scientists have the third highest.
As such it would seem the best opportunity for somebody looking for a job in the industry, would be to specialize themselves 
as a Data Engineer, as these have both a high salary and abundant job opportunities.

The job demand and salaries for different roles in europe were:
[
  {
    "job_title": "Data Engineer",
    "available_jobs": "74807",
    "avg_salary_year": "116526"
  },
  {
    "job_title": "Data Analyst",
    "available_jobs": "71931",
    "avg_salary_year": "90846"
  },
  {
    "job_title": "Data Scientist",
    "available_jobs": "58520",
    "avg_salary_year": "111873"
  },
  {
    "job_title": "Software Engineer",
    "available_jobs": "18093",
    "avg_salary_year": "98634"
  },
  {
    "job_title": "Business Analyst",
    "available_jobs": "16526",
    "avg_salary_year": "77997"
  },
  {
    "job_title": "Machine Learning Engineer",
    "available_jobs": "6207",
    "avg_salary_year": "113468"
  },
  {
    "job_title": "Cloud Engineer",
    "available_jobs": "5299",
    "avg_salary_year": "106811"
  }
]

*/
