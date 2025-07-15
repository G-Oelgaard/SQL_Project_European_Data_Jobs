/*
Question: As we saw in the first query of this project ("1_top_paying_jobs.sql"), a large part of the ten highest paid data job openings
could be found in Eastern Europe. Are these outliers and were can most high paid data jobs be found?

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

/*
While Eastern Europe dominates the top 10 highest-paid positions, the vast majority of well paid data jobs are found in
central and Western europe - especially in Germany. With the notable exception to this being Poland, who comes into a 
4th place for job openings with an above average salary. While Russia and Belarus had the top paying jobs, the are also
among the nations with the fewest job openings overall.

The results are as follows:
[
  {
    "country": "Germany",
    "jobs_above_mean": "92"
  },
  {
    "country": "United Kingdom",
    "jobs_above_mean": "90"
  },
  {
    "country": "France",
    "jobs_above_mean": "80"
  },
  {
    "country": "Poland",
    "jobs_above_mean": "76"
  },
  {
    "country": "Portugal",
    "jobs_above_mean": "62"
  },
  {
    "country": "Spain",
    "jobs_above_mean": "44"
  },
  {
    "country": "Netherlands",
    "jobs_above_mean": "35"
  },
  {
    "country": "Greece",
    "jobs_above_mean": "23"
  },
  {
    "country": "Hungary",
    "jobs_above_mean": "22"
  },
  {
    "country": "Switzerland",
    "jobs_above_mean": "20"
  },
  {
    "country": "Ireland",
    "jobs_above_mean": "19"
  },
  {
    "country": "Sweden",
    "jobs_above_mean": "19"
  },
  {
    "country": "Belgium",
    "jobs_above_mean": "17"
  },
  {
    "country": "Romania",
    "jobs_above_mean": "11"
  },
  {
    "country": "Norway",
    "jobs_above_mean": "11"
  },
  {
    "country": "Bulgaria",
    "jobs_above_mean": "10"
  },
  {
    "country": "Italy",
    "jobs_above_mean": "10"
  },
  {
    "country": "Finland",
    "jobs_above_mean": "9"
  },
  {
    "country": "Denmark",
    "jobs_above_mean": "8"
  },
  {
    "country": "Ukraine",
    "jobs_above_mean": "8"
  },
  {
    "country": "Luxembourg",
    "jobs_above_mean": "6"
  },
  {
    "country": "Estonia",
    "jobs_above_mean": "6"
  },
  {
    "country": "Croatia",
    "jobs_above_mean": "5"
  },
  {
    "country": "Slovakia",
    "jobs_above_mean": "5"
  },
  {
    "country": "Lithuania",
    "jobs_above_mean": "4"
  },
  {
    "country": "Russia",
    "jobs_above_mean": "4"
  },
  {
    "country": "Serbia",
    "jobs_above_mean": "3"
  },
  {
    "country": "Turkey",
    "jobs_above_mean": "3"
  },
  {
    "country": "Cyprus",
    "jobs_above_mean": "3"
  },
  {
    "country": "Slovenia",
    "jobs_above_mean": "3"
  },
  {
    "country": "Austria",
    "jobs_above_mean": "3"
  },
  {
    "country": "Malta",
    "jobs_above_mean": "2"
  },
  {
    "country": "Latvia",
    "jobs_above_mean": "2"
  },
  {
    "country": "Kazakhstan",
    "jobs_above_mean": "1"
  },
  {
    "country": "Armenia",
    "jobs_above_mean": "1"
  },
  {
    "country": "Belarus",
    "jobs_above_mean": "1"
  }
]
*/