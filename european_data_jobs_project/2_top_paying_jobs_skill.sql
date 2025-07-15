/*
Question: What skills are required for the top-paying data analyst jobs.
- Using the top 10 highest paying european non-senior jobs from the first query (see "1_top_paying_jobs.sql") examine what skills are
required for these roles.

*/

WITH top_jobs AS (
    SELECT
        *
    FROM
        euro_jobs
    LEFT JOIN
        company_dim ON company_dim.company_id = euro_jobs.company_id
    WHERE
        job_title_short NOT LIKE '%Senior%' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC,
        job_id -- added for consistent tie breaking
    LIMIT 10
)

SELECT
    top_jobs.job_id,
    job_title_short,
    name AS company_name,
    job_country AS country,
    salary_year_avg,
    skills AS skill_name,
    type AS skill_type
FROM
    top_jobs
INNER JOIN
    skills_job_dim ON skills_job_dim.job_id = top_jobs.job_id
INNER JOIN 
    skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

/*
Using this query we can now conclude that the most in demand skills are:
- Python(x5): confirming its importance in data roles.
- SQL (x5): showing database skills are in high demand (yay!).
- Spark (x4) and AWS (x3): highlights the importance of big data processing and cloud platforms

Occurrences of other skills like Git also showcase that version control tools are relevant in the industry.

The results of the query were as follows:
[
  {
    "job_id": 209315,
    "job_title_short": "Data Analyst",
    "company_name": "ЛАНИТ",
    "country": "Belarus",
    "salary_year_avg": "400000.0",
    "skill_name": "oracle",
    "skill_type": "cloud"
  },
  {
    "job_id": 209315,
    "job_title_short": "Data Analyst",
    "company_name": "ЛАНИТ",
    "country": "Belarus",
    "salary_year_avg": "400000.0",
    "skill_name": "kafka",
    "skill_type": "libraries"
  },
  {
    "job_id": 209315,
    "job_title_short": "Data Analyst",
    "company_name": "ЛАНИТ",
    "country": "Belarus",
    "salary_year_avg": "400000.0",
    "skill_name": "linux",
    "skill_type": "os"
  },
  {
    "job_id": 209315,
    "job_title_short": "Data Analyst",
    "company_name": "ЛАНИТ",
    "country": "Belarus",
    "salary_year_avg": "400000.0",
    "skill_name": "git",
    "skill_type": "other"
  },
  {
    "job_id": 209315,
    "job_title_short": "Data Analyst",
    "company_name": "ЛАНИТ",
    "country": "Belarus",
    "salary_year_avg": "400000.0",
    "skill_name": "svn",
    "skill_type": "other"
  },
  {
    "job_id": 656277,
    "job_title_short": "Data Scientist",
    "company_name": "SWS",
    "country": "Russia",
    "salary_year_avg": "320000.0",
    "skill_name": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 656277,
    "job_title_short": "Data Scientist",
    "company_name": "SWS",
    "country": "Russia",
    "salary_year_avg": "320000.0",
    "skill_name": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 656277,
    "job_title_short": "Data Scientist",
    "company_name": "SWS",
    "country": "Russia",
    "salary_year_avg": "320000.0",
    "skill_name": "pytorch",
    "skill_type": "libraries"
  },
  {
    "job_id": 656277,
    "job_title_short": "Data Scientist",
    "company_name": "SWS",
    "country": "Russia",
    "salary_year_avg": "320000.0",
    "skill_name": "opencv",
    "skill_type": "libraries"
  },
  {
    "job_id": 28572,
    "job_title_short": "Cloud Engineer",
    "company_name": "Технологическая компания",
    "country": "Russia",
    "salary_year_avg": "280000.0",
    "skill_name": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 172709,
    "job_title_short": "Data Scientist",
    "company_name": "DevHunt",
    "country": "Russia",
    "salary_year_avg": "250000.0",
    "skill_name": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 172709,
    "job_title_short": "Data Scientist",
    "company_name": "DevHunt",
    "country": "Russia",
    "salary_year_avg": "250000.0",
    "skill_name": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 172709,
    "job_title_short": "Data Scientist",
    "company_name": "DevHunt",
    "country": "Russia",
    "salary_year_avg": "250000.0",
    "skill_name": "postgresql",
    "skill_type": "databases"
  },
  {
    "job_id": 172709,
    "job_title_short": "Data Scientist",
    "company_name": "DevHunt",
    "country": "Russia",
    "salary_year_avg": "250000.0",
    "skill_name": "oracle",
    "skill_type": "cloud"
  },
  {
    "job_id": 172709,
    "job_title_short": "Data Scientist",
    "company_name": "DevHunt",
    "country": "Russia",
    "salary_year_avg": "250000.0",
    "skill_name": "pandas",
    "skill_type": "libraries"
  },
  {
    "job_id": 172709,
    "job_title_short": "Data Scientist",
    "company_name": "DevHunt",
    "country": "Russia",
    "salary_year_avg": "250000.0",
    "skill_name": "numpy",
    "skill_type": "libraries"
  },
  {
    "job_id": 172709,
    "job_title_short": "Data Scientist",
    "company_name": "DevHunt",
    "country": "Russia",
    "salary_year_avg": "250000.0",
    "skill_name": "scikit-learn",
    "skill_type": "libraries"
  },
  {
    "job_id": 172709,
    "job_title_short": "Data Scientist",
    "company_name": "DevHunt",
    "country": "Russia",
    "salary_year_avg": "250000.0",
    "skill_name": "git",
    "skill_type": "other"
  },
  {
    "job_id": 371551,
    "job_title_short": "Data Engineer",
    "company_name": "H&M Group",
    "country": "Sweden",
    "salary_year_avg": "249000.0",
    "skill_name": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 371551,
    "job_title_short": "Data Engineer",
    "company_name": "H&M Group",
    "country": "Sweden",
    "salary_year_avg": "249000.0",
    "skill_name": "bash",
    "skill_type": "programming"
  },
  {
    "job_id": 371551,
    "job_title_short": "Data Engineer",
    "company_name": "H&M Group",
    "country": "Sweden",
    "salary_year_avg": "249000.0",
    "skill_name": "azure",
    "skill_type": "cloud"
  },
  {
    "job_id": 371551,
    "job_title_short": "Data Engineer",
    "company_name": "H&M Group",
    "country": "Sweden",
    "salary_year_avg": "249000.0",
    "skill_name": "spark",
    "skill_type": "libraries"
  },
  {
    "job_id": 1540095,
    "job_title_short": "Data Engineer",
    "company_name": "Etsy",
    "country": "United Kingdom",
    "salary_year_avg": "249000.0",
    "skill_name": "go",
    "skill_type": "programming"
  },
  {
    "job_id": 1717028,
    "job_title_short": "Data Engineer",
    "company_name": "TripAdvisor",
    "country": "France",
    "salary_year_avg": "249000.0",
    "skill_name": "nosql",
    "skill_type": "programming"
  },
  {
    "job_id": 1717028,
    "job_title_short": "Data Engineer",
    "company_name": "TripAdvisor",
    "country": "France",
    "salary_year_avg": "249000.0",
    "skill_name": "go",
    "skill_type": "programming"
  },
  {
    "job_id": 1717028,
    "job_title_short": "Data Engineer",
    "company_name": "TripAdvisor",
    "country": "France",
    "salary_year_avg": "249000.0",
    "skill_name": "aws",
    "skill_type": "cloud"
  },
  {
    "job_id": 1717028,
    "job_title_short": "Data Engineer",
    "company_name": "TripAdvisor",
    "country": "France",
    "salary_year_avg": "249000.0",
    "skill_name": "snowflake",
    "skill_type": "cloud"
  },
  {
    "job_id": 1717028,
    "job_title_short": "Data Engineer",
    "company_name": "TripAdvisor",
    "country": "France",
    "salary_year_avg": "249000.0",
    "skill_name": "spark",
    "skill_type": "libraries"
  },
  {
    "job_id": 1717028,
    "job_title_short": "Data Engineer",
    "company_name": "TripAdvisor",
    "country": "France",
    "salary_year_avg": "249000.0",
    "skill_name": "airflow",
    "skill_type": "libraries"
  },
  {
    "job_id": 1717028,
    "job_title_short": "Data Engineer",
    "company_name": "TripAdvisor",
    "country": "France",
    "salary_year_avg": "249000.0",
    "skill_name": "hadoop",
    "skill_type": "libraries"
  },
  {
    "job_id": 1717028,
    "job_title_short": "Data Engineer",
    "company_name": "TripAdvisor",
    "country": "France",
    "salary_year_avg": "249000.0",
    "skill_name": "kubernetes",
    "skill_type": "other"
  },
  {
    "job_id": 456144,
    "job_title_short": "Data Engineer",
    "company_name": "LTK",
    "country": "France",
    "salary_year_avg": "235000.0",
    "skill_name": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 456144,
    "job_title_short": "Data Engineer",
    "company_name": "LTK",
    "country": "France",
    "salary_year_avg": "235000.0",
    "skill_name": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 456144,
    "job_title_short": "Data Engineer",
    "company_name": "LTK",
    "country": "France",
    "salary_year_avg": "235000.0",
    "skill_name": "scala",
    "skill_type": "programming"
  },
  {
    "job_id": 456144,
    "job_title_short": "Data Engineer",
    "company_name": "LTK",
    "country": "France",
    "salary_year_avg": "235000.0",
    "skill_name": "r",
    "skill_type": "programming"
  },
  {
    "job_id": 456144,
    "job_title_short": "Data Engineer",
    "company_name": "LTK",
    "country": "France",
    "salary_year_avg": "235000.0",
    "skill_name": "golang",
    "skill_type": "programming"
  },
  {
    "job_id": 456144,
    "job_title_short": "Data Engineer",
    "company_name": "LTK",
    "country": "France",
    "salary_year_avg": "235000.0",
    "skill_name": "aws",
    "skill_type": "cloud"
  },
  {
    "job_id": 456144,
    "job_title_short": "Data Engineer",
    "company_name": "LTK",
    "country": "France",
    "salary_year_avg": "235000.0",
    "skill_name": "redshift",
    "skill_type": "cloud"
  },
  {
    "job_id": 456144,
    "job_title_short": "Data Engineer",
    "company_name": "LTK",
    "country": "France",
    "salary_year_avg": "235000.0",
    "skill_name": "spark",
    "skill_type": "libraries"
  },
  {
    "job_id": 456144,
    "job_title_short": "Data Engineer",
    "company_name": "LTK",
    "country": "France",
    "salary_year_avg": "235000.0",
    "skill_name": "kafka",
    "skill_type": "libraries"
  },
  {
    "job_id": 205802,
    "job_title_short": "Machine Learning Engineer",
    "company_name": "Beam Suntory",
    "country": "Spain",
    "salary_year_avg": "225000.0",
    "skill_name": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 205802,
    "job_title_short": "Machine Learning Engineer",
    "company_name": "Beam Suntory",
    "country": "Spain",
    "salary_year_avg": "225000.0",
    "skill_name": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 205802,
    "job_title_short": "Machine Learning Engineer",
    "company_name": "Beam Suntory",
    "country": "Spain",
    "salary_year_avg": "225000.0",
    "skill_name": "nosql",
    "skill_type": "programming"
  },
  {
    "job_id": 205802,
    "job_title_short": "Machine Learning Engineer",
    "company_name": "Beam Suntory",
    "country": "Spain",
    "salary_year_avg": "225000.0",
    "skill_name": "scala",
    "skill_type": "programming"
  },
  {
    "job_id": 205802,
    "job_title_short": "Machine Learning Engineer",
    "company_name": "Beam Suntory",
    "country": "Spain",
    "salary_year_avg": "225000.0",
    "skill_name": "java",
    "skill_type": "programming"
  },
  {
    "job_id": 205802,
    "job_title_short": "Machine Learning Engineer",
    "company_name": "Beam Suntory",
    "country": "Spain",
    "salary_year_avg": "225000.0",
    "skill_name": "mysql",
    "skill_type": "databases"
  },
  {
    "job_id": 205802,
    "job_title_short": "Machine Learning Engineer",
    "company_name": "Beam Suntory",
    "country": "Spain",
    "salary_year_avg": "225000.0",
    "skill_name": "postgresql",
    "skill_type": "databases"
  },
  {
    "job_id": 205802,
    "job_title_short": "Machine Learning Engineer",
    "company_name": "Beam Suntory",
    "country": "Spain",
    "salary_year_avg": "225000.0",
    "skill_name": "azure",
    "skill_type": "cloud"
  },
  {
    "job_id": 205802,
    "job_title_short": "Machine Learning Engineer",
    "company_name": "Beam Suntory",
    "country": "Spain",
    "salary_year_avg": "225000.0",
    "skill_name": "aws",
    "skill_type": "cloud"
  },
  {
    "job_id": 205802,
    "job_title_short": "Machine Learning Engineer",
    "company_name": "Beam Suntory",
    "country": "Spain",
    "salary_year_avg": "225000.0",
    "skill_name": "spark",
    "skill_type": "libraries"
  },
  {
    "job_id": 205802,
    "job_title_short": "Machine Learning Engineer",
    "company_name": "Beam Suntory",
    "country": "Spain",
    "salary_year_avg": "225000.0",
    "skill_name": "airflow",
    "skill_type": "libraries"
  },
  {
    "job_id": 205802,
    "job_title_short": "Machine Learning Engineer",
    "company_name": "Beam Suntory",
    "country": "Spain",
    "salary_year_avg": "225000.0",
    "skill_name": "sap",
    "skill_type": "analyst_tools"
  }
]
*/