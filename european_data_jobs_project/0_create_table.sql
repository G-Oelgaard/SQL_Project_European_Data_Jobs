/*
In the following queries we want to examine data jobs in europe.

To do this we would naturally need to filter the data, and to avoid having to do this for every query we need in the future, we will
first create a whole new table. We do this to avoid to many CTEs and subqueries and to increase performance.
*/

CREATE TABLE euro_jobs AS
    SELECT
        *
    FROM (
        SELECT
            *,
            CASE
                WHEN job_country IN (
                    'Albania', 'Andorra', 'Armenia', 'Austria', 'Azerbaijan',
                    'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
                    'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
                    'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland',
                    'Ireland', 'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein',
                    'Lithuania', 'Luxembourg', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
                    'Netherlands', 'North Macedonia', 'Norway', 'Poland', 'Portugal',
                    'Romania', 'Russia', 'San Marino', 'Serbia', 'Slovakia', 'Slovenia',
                    'Spain', 'Sweden', 'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom',
                    'Vatican City'
                    ) THEN 'European'
                ELSE 'Non-European'
            END AS continent
        FROM
            job_postings_fact
        ) AS jobs_in_europe
    WHERE
        continent = 'European'

/*
Doing this we have reduced our original table of all jobs from 787,686 to just 288,420 rows.

If we for one reason or another want to delete the table after our queries, we would use: DROP TABLE euro_jobs;

Alternatively, if we did not want to create a new table to increase performance, we could also probably use the following in the queries
we are about to create:

SELECT
    *
FROM 
    Job_postings_fact
WHERE
    job_country IN (
                'Albania', 'Andorra', 'Armenia', 'Austria', 'Azerbaijan',
                'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
                'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
                'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland',
                'Ireland', 'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein',
                'Lithuania', 'Luxembourg', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
                'Netherlands', 'North Macedonia', 'Norway', 'Poland', 'Portugal',
                'Romania', 'Russia', 'San Marino', 'Serbia', 'Slovakia', 'Slovenia',
                'Spain', 'Sweden', 'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom',
                'Vatican City'
                )
*/