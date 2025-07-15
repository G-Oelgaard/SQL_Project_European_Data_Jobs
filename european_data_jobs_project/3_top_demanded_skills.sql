/*
Question: What are the most in demand skills for non-senior data jobs in Europe.

- Using a similar query to the one used for identify skills for high paying jobs (see "2_top_paying_jobs_skills.sql"), we will examine what
the most in demand skills are in Europe.
- We will further break this down to show only the top-10 most sought after skills.

NOTE: non-senior jobs that do not have a listed salary *ARE* included in the following,
*/

SELECT
    skills AS skill_name,
    type AS skill_type,
    COUNT(*) AS total_jobs
FROM
    euro_jobs
INNER JOIN
    skills_job_dim ON skills_job_dim.job_id = euro_jobs.job_id
INNER JOIN 
    skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short NOT LIKE '%Senior%'
GROUP BY
    skill_name,
    skill_type
ORDER BY
    total_jobs DESC
LIMIT 10;

/*
From the results of this query we can conclude that both python (116,032 mentions) and SQL (109,497) appear to be "must have"
data industry. Furthermore we can also see that excel is still valued in the industry, and that BI tools such as Power BI and Tableau
are also in demand.

Interestingly skills such as Oracle or Kafka that were mentioned as some of the skills needed for some of the highest paying jobs
are not on this top-10 list. Perhaps these tools are only used by specialized job roles, and as such command a premium salary.

If we wanted to only check the demand in a single country, we would only need to insert the following under the WHERE condition:
"job_country = '[NAME OF COUNTRY]'". Using this we could also conclude that the most in-demand skills in europe, were also the most
in-demand in Denmark.

The top 10 most sought after skills were:
[
  {
    "skill_name": "python",
    "total_jobs": "116032"
  },
  {
    "skill_name": "sql",
    "total_jobs": "109497"
  },
  {
    "skill_name": "azure",
    "total_jobs": "45846"
  },
  {
    "skill_name": "aws",
    "total_jobs": "39583"
  },
  {
    "skill_name": "excel",
    "total_jobs": "33638"
  },
  {
    "skill_name": "power bi",
    "total_jobs": "32663"
  },
  {
    "skill_name": "r",
    "total_jobs": "32562"
  },
  {
    "skill_name": "spark",
    "total_jobs": "30386"
  },
  {
    "skill_name": "tableau",
    "total_jobs": "28929"
  },
  {
    "skill_name": "java",
    "total_jobs": "23404"
  }
]
*/