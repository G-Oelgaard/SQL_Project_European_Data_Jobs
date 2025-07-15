#  SQL Project: European Data Jobs
## --- About the project--- 
This project examines job openings in the Data industry, to uncover what skills are sought after and what the salary for different positions are.

As i am just starting out in the industry, i will focus this project on only non-senior job openings in Europe. 

**Goal**
- To identify what non-senior data jobs are available.
- Identify what skills would be useful for someone looking to get into the industry.
- Estimate the average salary for different positions and skills.

The queries used in this project can be found in this folder: [european_data_jobs_project](/european_data_jobs_project/)

This project and the skills needed to complete it were in large part from the video tutorial [*SQL for Data Analytics*](https://www.youtube.com/watch?v=7mz73uXD9DA)

## --- Tools and Data ---
### Data
The data used for this project is from the [*SQL for Data Analytics*](https://www.lukebarousse.com/sql) course by Luke Barousse and Kelly Adams. It includes information on worldwide job openings in the data industry in 2023 spread across 4 different tables (see image below). The original table including information about job postings is ca. 785,000 rows long, while the filtered table showing only European job openings is ca. 290,000 rows.

The data can be found here: [SQL_tutorial_CSVs](https://drive.google.com/drive/folders/1moeWYoUtUklJO6NJdWo9OV8zWjRn0rjN)

![](/images/jobpostings_database_schema.PNG)

### Tools
To complete this project i used several tools:
- **SQL**: The backbone of this analysis, allowing me to query the data presented above.
- **PostgreSQL** (17): The chosen database management system. 
- **VScode** (1.102): For executing queries.
- **Git** (2.50.1) & **Github**: Version control tools that i am also using to share this project.
- **R** (4.4.2): R (running in RStudio v. 2024.12.0) was used for creating the visualizations seen in this README using ggplot2 from the tidyverse package.

## --- Analysis ---
To answer the questions posed in the *About the project* section, 6 queries are used (7 if you include create a new table - but that is an optional step):
1. Query to identify top 10 best paying non-senior data jobs in Europe.
2. Query to identify what skills these top 10 jobs require.
3. Query to identify what skills are the most sought after.
4. Query to identify what the average yearly salary is by skill.
5. Query to identify what job roles are the most sought after.
6. Query to identify what european countries had the most job openings with an above average salary.

Each query aims to investigate a specific aspect of the European data job market. Each of the following segments will have a question, the query used to examine the question posed, followed by the insights gained from this query.

### 10 Best Paid Jobs
**Question**: What are the best paying non-senior jobs in Europe in the data industry?

- Identify the top 10 highest paying non-senior data jobs in Europe.
- Remove any jobs without a specified salary.

As we already created a table with only european jobs in a previous script (see *0_create_table.sql*) we do not need to do this part. We simply have to reference the new table *euro_jobs*.

```sql
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

-- The non-limited data is 1,765 rows long. Meaning that only 1,765 out of the 288,420 jobs in the table match our search requirements - ca. 0.6 %. Using a "EXPLAIN ANALYZE" at the start of the query, we can also see the time to run the query (if not limited) would be ca. 39 ms.
```
**Insights**: 
From the query, we can conclude that the best paid jobs are found in Eastern Europe, followed by central and western europe. To test whether this is representative for the european market as a whole, see query 6 (*Job openings with above-average salaries - by country*).

The query above also tells us that a a not inconsequential part of the best paid jobs are actually as Data Engineers.

| job_title_short | company | country | job_location | job_schedule_type | salary_year_avg | job_posted_date |
|-----------------|---------|---------|--------------|-------------------|-----------------|-----------------|
| Data Analyst | ЛАНИТ | Belarus | Belarus | Full-time | 400000.0 | 2023-10-03 11:22:20 |
| Software Engineer | SmartBrain | Russia | Russia | Full-time | 320000.0 | 2023-12-06 14:18:56 |
| Data Scientist | SWS | Russia | Russia | Part-time, Contractor, and Temp work | 320000.0 | 2023-11-10 11:36:48 |
| Cloud Engineer | Технологическая компания | Russia | Russia | Full-time | 280000.0 | 2023-11-24 07:19:48 |
| Data Scientist | DevHunt | Russia | Russia | Full-time | 260000.0 | 2023-06-27 11:43:05 |
| Data Engineer | Etsy | United Kingdom | London, UK | Full-time | 249000.0 | 2023-03-25 23:20:58 |
| Data Engineer | H&M Group | Sweden | Stockholm, Sweden | Full-time | 249000.0 | 2023-02-21 21:29:03 |
| Data Engineer | TripAdvisor | France | Paris, France | Full-time | 249000.0 | 2023-05-16 12:29:42 |
| Data Engineer | LTK | France | Anywhere | Full-time | 235000.0 | 2023-01-09 18:22:32 |
| Machine Learning Engineer | Radix Trading, LLC | Netherlands | Schiphol, Netherlands | Full-time | 225000.0 | 2023-02-07 17:25:38 |

### Skills required by top paid jobs
**Question**: What skills are required for the top-paying data analyst jobs?
- Using the top 10 highest paying european non-senior jobs from the first query (see *10 Best Paid Jobs*), we will examine what skills are required for these roles.

```sql
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
```

**Insights**: Using this query we can now conclude that the most in demand skills for top paying jobs are:
- Python(x5): confirming its importance in data roles.
- SQL (x5): showing database skills are in high demand (yay!).
- Spark (x4) and AWS (x3): highlights the importance of big data processing and cloud platforms

Occurrences of other skills like Git also showcase that version control tools are relevant in the industry.

![](/images/top_paying_jobs_skills.jpg)

### What skills are in-demand?
**Question**: What are the most in demand skills for non-senior data jobs in Europe.

- Using a similar query to the one used for identify skills for high paying jobs (see "2_top_paying_jobs_skills.sql"), we will examine what
the most in demand skills are in Europe.
- We will further break this down to show only the top-10 most sought after skills.

NOTE: non-senior jobs that do not have a listed salary *ARE* included in the following,

```sql
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
```

**Insights**: From the results of this query we can conclude that both python (116,032 mentions) and SQL (109,497) appear to be "must have" data industry. Furthermore we can also see that excel is still valued in the industry, and that BI tools such as Power BI and Tableau are also in demand.

Interestingly skills such as Oracle or Kafka that were mentioned as some of the skills needed for some of the highest paying jobs are not on this top-10 list. Perhaps these tools are only used by specialized job roles, and as such command a premium salary.

If we wanted to only check the demand in a single country, we would only need to insert the following under the WHERE condition: "job_country = '[NAME OF COUNTRY]'". Using this we could also conclude that the most in-demand skills in europe, were also the most in-demand in Denmark.

![](/images/top_demanded_skills.jpg)

### Average salary for each skill

**Question**: What is the average salary for each skill?

- Using a similar query to the one used for identify in-demand (see *What skills are in-demand?*), we will examine what the average wage is for different skills are in Europe.
- The purpose of this is to identify what skills might command high salary.

```sql
SELECT
    skills AS skill_name,
    ROUND(AVG(salary_year_avg), 0) AS avg_year_salary
FROM
    euro_jobs
INNER JOIN
    skills_job_dim ON skills_job_dim.job_id = euro_jobs.job_id
INNER JOIN 
    skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short NOT LIKE '%Senior%' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skill_name
ORDER BY
    avg_year_salary DESC;
```
**Insights**: Using this query we an see that the most sought after skills (as determined by the previous query) are not always the best paid. In fact most of our in-demand skills fall somewhere on the midpoint between the average salaries of the most and least paid skills. As hinted towards in a previous query, this could also indicate that more specialized skills carry higher wages. This is supported by the fact that specialized packages for coding languages are often among some of the best paid.

**Highest and Lowest Paying Skills:**

| Rank | Skill Name | Skill Type | Average Annual Salary |
|------|------------|------------|----------------------|
| 1    | svn              | other          | 207200            |
| 2    | debian           | os             | 196500            |
| 3    | aurora           | cloud          | 165000            |
| 4    | ggplot2          | libraries      | 157500            |
| 4    | rshiny           | libraries      | 157500            |
| 4    | dplyr            | libraries      | 157500            |
| 4    | macos            | os             | 157500            |
| 5    | smartsheet       | async          | 151250            |
| 6    | redhat           | os             | 147500            |
| 6    | couchdb          | databases      | 147500            |
| 7    | theano           | libraries      | 140282            |
| 8    | twilio           | sync           | 140000            |
| 9    | clojure          | programming    | 139540            |
| 10   | ibm cloud        | cloud          | 134241            |

*... 149 skills in between ...*

| Rank | Skill Name | Skill Type | Average Annual Salary |
|------|------------|------------|----------------------|
| 152  | ruby on rails   | webframeworks  | 75000            |
| 152  | react.js        | webframeworks  | 75000            |
| 153  | planner         | async          | 72900            |
| 154  | ubuntu          | os             | 72050            |
| 155  | yarn            | other          | 68975            |
| 156  | spss            | analyst_tools  | 65465            |
| 157  | watson          | cloud          | 64800            |
| 158  | elixir          | programming    | 56700            |
| 158  | blazor          | webframeworks  | 56700            |
| 158  | tidyverse       | libraries      | 56700            |
| 159  | laravel         | webframeworks  | 55000            |
| 159  | couchbase       | databases      | 55000            |
| 159  | digitalocean    | cloud          | 55000            |
| 160  | flutter         | libraries      | 43200            |
| 161  | centos          | os             | 30000            |

For at interactive graph showing all skills and their average yearly salaries, see the HTML widget here: [/images/salary_chart.html](/images/salary_chart.html)

### What jobs are in-demand?

**Question**: what jobs are most in-demand in Europe?

- Using a simple query, we will examine what jobs are the most sought after. We can do this by using the *job_title_short* column from our *euro_jobs* table.
- To further build on this, let us also check what roles have the best average pay.

```sql
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

```

Using this query we an see that the most sought after roles are by far Data Engineers, Data Analysts and Data Scientists. Furthermore, Data Engineers have the highest average salaries while Data Scientists have the third highest. As such it would seem the best opportunity for somebody looking for a job in the industry, would be to specialize themselves  as a Data Engineer, as these have both a high salary and abundant job opportunities.

| job_title | available_jobs | avg_salary_year |
|-----------|----------------|-----------------|
| Data Engineer | 74807 | 116526 |
| Data Analyst | 71931 | 90845 |
| Data Scientist | 56520 | 111873 |
| Software Engineer | 18098 | 98634 |
| Business Analyst | 16526 | 77997 |
| Machine Learning Engineer | 6207 | 113468 |
| Cloud Engineer | 5299 | 106811 |

### Job openings with above-average salaries - by country

**Question**: As we saw in the first query of this project ("1_top_paying_jobs.sql"), a large part of the ten highest paid data job openings could be found in Eastern Europe. Are these outliers and were can most high paid data jobs be found?

```sql
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
```

**Insights:** While Eastern Europe dominates the top 10 highest-paid positions, the vast majority of well paid data jobs are found in central and Western europe - especially in Germany. With the notable exception to this being Poland, who comes into a  4th place for job openings with an above average salary. While Russia and Belarus had the top paying jobs, the are also among the nations with the fewest job openings overall.

![Bar plot showing the countries with the most job above average salaried job openings (by height and color)](/images/top_paying_jobs_country.jpg)

## --- Conclusion ---
### Key insights
The goal of this project was to explore non-senior data job openings in Europe to better understand the types of roles available, the most in-demand skills, and the expected salary ranges. Through a series of SQL queries and analyses, several key insights emerged:

**Job Opportunities**: The most common roles for non-senior professionals are Data Engineer, Data Analyst, and Data Scientist. These roles represent the majority of the job market, with Data Engineers offering both the highest salaries and most opportunities, making it a strong entry point for new professionals.

**In-Demand Skills**: Python and SQL consistently appear at the top of both the most in-demand and highest-paid job skill lists. Other important tools include Excel, Power BI, Tableau, and cloud or big data technologies like AWS and Spark.

**Salary Insights**: The most in-demand skills aren't always the highest paid. Widely used tools like Python and SQL offer solid mid-range salaries, while more specialized skills often command a higher pay. Data Engineers have both the highest number of openings and the top average salary, followed by Data Scientists and Machine Learning Engineers. Roles like Business Analyst offer lower average pay, likely reflecting how technical skill leads to a higher salary.

**Geographical Trends**: Although the very top-paying jobs are found in Eastern Europe, particularly Russia and Belarus, these are few and far between. The majority of high-paying job opportunities are located in Central and Western Europe — especially in Germany, the UK, and France.