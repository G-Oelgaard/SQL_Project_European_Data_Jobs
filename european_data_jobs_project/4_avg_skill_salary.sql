/*
Question: What is the average salary for each skill?

- Using a similar query to the one used for identify in-demand (see "3_top_demanded_jobs_skills.sql"), we will examine what
the average wage is for different skills are in Europe.
- The purpose of this is to identify what skills might command high salary.
*/

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

/*
Using this query we an see that the most sought after skills are not always the best paid. In fact most of our in-demand skills fall
somewhere on the midpoint between the average salaries of the most and least paid skills. As hinted towards in a previous query, this
could also indicate that more specialized skills carry higher wages. This is supported by the fact that specialized packages for coding
languages are often among some of the best paid.

The average yearly salary for different skills in europe were as such:
[
  {
    "skill_name": "svn",
    "avg_year_salary": "207200"
  },
  {
    "skill_name": "debian",
    "avg_year_salary": "196500"
  },
  {
    "skill_name": "aurora",
    "avg_year_salary": "165000"
  },
  {
    "skill_name": "ggplot2",
    "avg_year_salary": "157500"
  },
  {
    "skill_name": "dplyr",
    "avg_year_salary": "157500"
  },
  {
    "skill_name": "rshiny",
    "avg_year_salary": "157500"
  },
  {
    "skill_name": "macos",
    "avg_year_salary": "157500"
  },
  {
    "skill_name": "smartsheet",
    "avg_year_salary": "151250"
  },
  {
    "skill_name": "redhat",
    "avg_year_salary": "147500"
  },
  {
    "skill_name": "couchdb",
    "avg_year_salary": "147500"
  },
  {
    "skill_name": "theano",
    "avg_year_salary": "140282"
  },
  {
    "skill_name": "twilio",
    "avg_year_salary": "140000"
  },
  {
    "skill_name": "clojure",
    "avg_year_salary": "139540"
  },
  {
    "skill_name": "ibm cloud",
    "avg_year_salary": "134241"
  },
  {
    "skill_name": "jquery",
    "avg_year_salary": "130000"
  },
  {
    "skill_name": "npm",
    "avg_year_salary": "129338"
  },
  {
    "skill_name": "hugging face",
    "avg_year_salary": "129200"
  },
  {
    "skill_name": "fastapi",
    "avg_year_salary": "127525"
  },
  {
    "skill_name": "golang",
    "avg_year_salary": "127456"
  },
  {
    "skill_name": "django",
    "avg_year_salary": "127141"
  },
  {
    "skill_name": "splunk",
    "avg_year_salary": "124140"
  },
  {
    "skill_name": "vue",
    "avg_year_salary": "124020"
  },
  {
    "skill_name": "flask",
    "avg_year_salary": "122133"
  },
  {
    "skill_name": "snowflake",
    "avg_year_salary": "122132"
  },
  {
    "skill_name": "redshift",
    "avg_year_salary": "121165"
  },
  {
    "skill_name": "dynamodb",
    "avg_year_salary": "120565"
  },
  {
    "skill_name": "numpy",
    "avg_year_salary": "118567"
  },
  {
    "skill_name": "phoenix",
    "avg_year_salary": "118156"
  },
  {
    "skill_name": "airflow",
    "avg_year_salary": "117971"
  },
  {
    "skill_name": "matplotlib",
    "avg_year_salary": "117684"
  },
  {
    "skill_name": "pandas",
    "avg_year_salary": "117483"
  },
  {
    "skill_name": "plotly",
    "avg_year_salary": "117470"
  },
  {
    "skill_name": "kafka",
    "avg_year_salary": "116982"
  },
  {
    "skill_name": "t-sql",
    "avg_year_salary": "116934"
  },
  {
    "skill_name": "github",
    "avg_year_salary": "116769"
  },
  {
    "skill_name": "postgresql",
    "avg_year_salary": "116761"
  },
  {
    "skill_name": "firebase",
    "avg_year_salary": "116750"
  },
  {
    "skill_name": "pyspark",
    "avg_year_salary": "116388"
  },
  {
    "skill_name": "keras",
    "avg_year_salary": "116112"
  },
  {
    "skill_name": "bigquery",
    "avg_year_salary": "116094"
  },
  {
    "skill_name": "aws",
    "avg_year_salary": "115790"
  },
  {
    "skill_name": "spark",
    "avg_year_salary": "115676"
  },
  {
    "skill_name": "pytorch",
    "avg_year_salary": "115105"
  },
  {
    "skill_name": "scikit-learn",
    "avg_year_salary": "114807"
  },
  {
    "skill_name": "tensorflow",
    "avg_year_salary": "114785"
  },
  {
    "skill_name": "react",
    "avg_year_salary": "114435"
  },
  {
    "skill_name": "mariadb",
    "avg_year_salary": "114175"
  },
  {
    "skill_name": "hadoop",
    "avg_year_salary": "113005"
  },
  {
    "skill_name": "terraform",
    "avg_year_salary": "112835"
  },
  {
    "skill_name": "scala",
    "avg_year_salary": "112682"
  },
  {
    "skill_name": "mysql",
    "avg_year_salary": "112648"
  },
  {
    "skill_name": "databricks",
    "avg_year_salary": "112544"
  },
  {
    "skill_name": "opencv",
    "avg_year_salary": "111825"
  },
  {
    "skill_name": "nosql",
    "avg_year_salary": "111799"
  },
  {
    "skill_name": "flow",
    "avg_year_salary": "111504"
  },
  {
    "skill_name": "slack",
    "avg_year_salary": "111360"
  },
  {
    "skill_name": "swift",
    "avg_year_salary": "111117"
  },
  {
    "skill_name": "mongo",
    "avg_year_salary": "111015"
  },
  {
    "skill_name": "git",
    "avg_year_salary": "110997"
  },
  {
    "skill_name": "oracle",
    "avg_year_salary": "110890"
  },
  {
    "skill_name": "azure",
    "avg_year_salary": "110758"
  },
  {
    "skill_name": "python",
    "avg_year_salary": "110558"
  },
  {
    "skill_name": "looker",
    "avg_year_salary": "110388"
  },
  {
    "skill_name": "bitbucket",
    "avg_year_salary": "110259"
  },
  {
    "skill_name": "mongodb",
    "avg_year_salary": "110189"
  },
  {
    "skill_name": "ansible",
    "avg_year_salary": "109848"
  },
  {
    "skill_name": "sql server",
    "avg_year_salary": "109707"
  },
  {
    "skill_name": "java",
    "avg_year_salary": "109560"
  },
  {
    "skill_name": "ssrs",
    "avg_year_salary": "109555"
  },
  {
    "skill_name": "c",
    "avg_year_salary": "108959"
  },
  {
    "skill_name": "confluence",
    "avg_year_salary": "108820"
  },
  {
    "skill_name": "gcp",
    "avg_year_salary": "108675"
  },
  {
    "skill_name": "docker",
    "avg_year_salary": "108565"
  },
  {
    "skill_name": "ssis",
    "avg_year_salary": "108200"
  },
  {
    "skill_name": "kubernetes",
    "avg_year_salary": "108147"
  },
  {
    "skill_name": "atlassian",
    "avg_year_salary": "107825"
  },
  {
    "skill_name": "sql",
    "avg_year_salary": "107818"
  },
  {
    "skill_name": "jenkins",
    "avg_year_salary": "107740"
  },
  {
    "skill_name": "notion",
    "avg_year_salary": "107683"
  },
  {
    "skill_name": "shell",
    "avg_year_salary": "107637"
  },
  {
    "skill_name": "dax",
    "avg_year_salary": "107469"
  },
  {
    "skill_name": "typescript",
    "avg_year_salary": "107313"
  },
  {
    "skill_name": "jira",
    "avg_year_salary": "107048"
  },
  {
    "skill_name": "c++",
    "avg_year_salary": "106964"
  },
  {
    "skill_name": "gdpr",
    "avg_year_salary": "106904"
  },
  {
    "skill_name": "go",
    "avg_year_salary": "106902"
  },
  {
    "skill_name": "linux",
    "avg_year_salary": "106523"
  },
  {
    "skill_name": "elasticsearch",
    "avg_year_salary": "105423"
  },
  {
    "skill_name": "ruby",
    "avg_year_salary": "105023"
  },
  {
    "skill_name": "ms access",
    "avg_year_salary": "105000"
  },
  {
    "skill_name": "node",
    "avg_year_salary": "104990"
  },
  {
    "skill_name": "redis",
    "avg_year_salary": "104465"
  },
  {
    "skill_name": "chef",
    "avg_year_salary": "104460"
  },
  {
    "skill_name": "unix",
    "avg_year_salary": "104312"
  },
  {
    "skill_name": "c#",
    "avg_year_salary": "104224"
  },
  {
    "skill_name": "unify",
    "avg_year_salary": "104136"
  },
  {
    "skill_name": "julia",
    "avg_year_salary": "104038"
  },
  {
    "skill_name": "visio",
    "avg_year_salary": "103845"
  },
  {
    "skill_name": "powershell",
    "avg_year_salary": "103748"
  },
  {
    "skill_name": "gitlab",
    "avg_year_salary": "103229"
  },
  {
    "skill_name": "r",
    "avg_year_salary": "103131"
  },
  {
    "skill_name": "tableau",
    "avg_year_salary": "102971"
  },
  {
    "skill_name": "kotlin",
    "avg_year_salary": "102797"
  },
  {
    "skill_name": "php",
    "avg_year_salary": "102664"
  },
  {
    "skill_name": "solidity",
    "avg_year_salary": "102500"
  },
  {
    "skill_name": "windows",
    "avg_year_salary": "102260"
  },
  {
    "skill_name": "sap",
    "avg_year_salary": "101874"
  },
  {
    "skill_name": "jupyter",
    "avg_year_salary": "101721"
  },
  {
    "skill_name": "nltk",
    "avg_year_salary": "100547"
  },
  {
    "skill_name": "microstrategy",
    "avg_year_salary": "100450"
  },
  {
    "skill_name": "qlik",
    "avg_year_salary": "100225"
  },
  {
    "skill_name": "rust",
    "avg_year_salary": "99483"
  },
  {
    "skill_name": "angular",
    "avg_year_salary": "99059"
  },
  {
    "skill_name": "sharepoint",
    "avg_year_salary": "98971"
  },
  {
    "skill_name": "crystal",
    "avg_year_salary": "98637"
  },
  {
    "skill_name": "javascript",
    "avg_year_salary": "97989"
  },
  {
    "skill_name": "perl",
    "avg_year_salary": "97361"
  },
  {
    "skill_name": "asana",
    "avg_year_salary": "97200"
  },
  {
    "skill_name": "power bi",
    "avg_year_salary": "97012"
  },
  {
    "skill_name": "neo4j",
    "avg_year_salary": "96246"
  },
  {
    "skill_name": "spring",
    "avg_year_salary": "95707"
  },
  {
    "skill_name": "bash",
    "avg_year_salary": "95317"
  },
  {
    "skill_name": "cassandra",
    "avg_year_salary": "94935"
  },
  {
    "skill_name": "seaborn",
    "avg_year_salary": "93870"
  },
  {
    "skill_name": "express",
    "avg_year_salary": "93701"
  },
  {
    "skill_name": "node.js",
    "avg_year_salary": "92911"
  },
  {
    "skill_name": "graphql",
    "avg_year_salary": "92723"
  },
  {
    "skill_name": "selenium",
    "avg_year_salary": "92451"
  },
  {
    "skill_name": "html",
    "avg_year_salary": "92171"
  },
  {
    "skill_name": "pascal",
    "avg_year_salary": "92000"
  },
  {
    "skill_name": "mxnet",
    "avg_year_salary": "91532"
  },
  {
    "skill_name": "css",
    "avg_year_salary": "91526"
  },
  {
    "skill_name": "sas",
    "avg_year_salary": "90990"
  },
  {
    "skill_name": "puppet",
    "avg_year_salary": "90351"
  },
  {
    "skill_name": "vba",
    "avg_year_salary": "90342"
  },
  {
    "skill_name": "alteryx",
    "avg_year_salary": "90149"
  },
  {
    "skill_name": "assembly",
    "avg_year_salary": "89464"
  },
  {
    "skill_name": "asp.net",
    "avg_year_salary": "89100"
  },
  {
    "skill_name": "symphony",
    "avg_year_salary": "89100"
  },
  {
    "skill_name": "trello",
    "avg_year_salary": "89100"
  },
  {
    "skill_name": "db2",
    "avg_year_salary": "89100"
  },
  {
    "skill_name": "unreal",
    "avg_year_salary": "87675"
  },
  {
    "skill_name": "vmware",
    "avg_year_salary": "87500"
  },
  {
    "skill_name": "outlook",
    "avg_year_salary": "86925"
  },
  {
    "skill_name": "word",
    "avg_year_salary": "86811"
  },
  {
    "skill_name": "matlab",
    "avg_year_salary": "85610"
  },
  {
    "skill_name": "no-sql",
    "avg_year_salary": "85559"
  },
  {
    "skill_name": "datarobot",
    "avg_year_salary": "85000"
  },
  {
    "skill_name": "excel",
    "avg_year_salary": "84610"
  },
  {
    "skill_name": "spreadsheet",
    "avg_year_salary": "84341"
  },
  {
    "skill_name": "terminal",
    "avg_year_salary": "82095"
  },
  {
    "skill_name": "sheets",
    "avg_year_salary": "81321"
  },
  {
    "skill_name": "unity",
    "avg_year_salary": "81013"
  },
  {
    "skill_name": "vue.js",
    "avg_year_salary": "81000"
  },
  {
    "skill_name": "zoom",
    "avg_year_salary": "78300"
  },
  {
    "skill_name": "pulumi",
    "avg_year_salary": "78300"
  },
  {
    "skill_name": "powerpoint",
    "avg_year_salary": "77968"
  },
  {
    "skill_name": "cognos",
    "avg_year_salary": "77693"
  },
  {
    "skill_name": "groovy",
    "avg_year_salary": "75502"
  },
  {
    "skill_name": "react.js",
    "avg_year_salary": "75000"
  },
  {
    "skill_name": "ruby on rails",
    "avg_year_salary": "75000"
  },
  {
    "skill_name": "planner",
    "avg_year_salary": "72900"
  },
  {
    "skill_name": "ubuntu",
    "avg_year_salary": "72050"
  },
  {
    "skill_name": "yarn",
    "avg_year_salary": "68975"
  },
  {
    "skill_name": "spss",
    "avg_year_salary": "65465"
  },
  {
    "skill_name": "watson",
    "avg_year_salary": "64800"
  },
  {
    "skill_name": "elixir",
    "avg_year_salary": "56700"
  },
  {
    "skill_name": "tidyverse",
    "avg_year_salary": "56700"
  },
  {
    "skill_name": "blazor",
    "avg_year_salary": "56700"
  },
  {
    "skill_name": "couchbase",
    "avg_year_salary": "55000"
  },
  {
    "skill_name": "digitalocean",
    "avg_year_salary": "55000"
  },
  {
    "skill_name": "laravel",
    "avg_year_salary": "55000"
  },
  {
    "skill_name": "flutter",
    "avg_year_salary": "43200"
  },
  {
    "skill_name": "centos",
    "avg_year_salary": "30000"
  }
]
*/