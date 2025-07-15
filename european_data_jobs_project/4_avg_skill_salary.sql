/*
Question: What is the average salary for each skill?

- Using a similar query to the one used for identify in-demand (see "3_top_demanded_jobs_skills.sql"), we will examine what
the average wage is for different skills are in Europe.
- The purpose of this is to identify what skills might command high salary.
*/

SELECT
    skills AS skill_name,
    type AS skill_type,
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
    skill_name,
    skill_type
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
    "skill_type": "other",
    "avg_year_salary": "207200"
  },
  {
    "skill_name": "debian",
    "skill_type": "os",
    "avg_year_salary": "196500"
  },
  {
    "skill_name": "aurora",
    "skill_type": "cloud",
    "avg_year_salary": "165000"
  },
  {
    "skill_name": "ggplot2",
    "skill_type": "libraries",
    "avg_year_salary": "157500"
  },
  {
    "skill_name": "rshiny",
    "skill_type": "libraries",
    "avg_year_salary": "157500"
  },
  {
    "skill_name": "dplyr",
    "skill_type": "libraries",
    "avg_year_salary": "157500"
  },
  {
    "skill_name": "macos",
    "skill_type": "os",
    "avg_year_salary": "157500"
  },
  {
    "skill_name": "smartsheet",
    "skill_type": "async",
    "avg_year_salary": "151250"
  },
  {
    "skill_name": "redhat",
    "skill_type": "os",
    "avg_year_salary": "147500"
  },
  {
    "skill_name": "couchdb",
    "skill_type": "databases",
    "avg_year_salary": "147500"
  },
  {
    "skill_name": "theano",
    "skill_type": "libraries",
    "avg_year_salary": "140282"
  },
  {
    "skill_name": "twilio",
    "skill_type": "sync",
    "avg_year_salary": "140000"
  },
  {
    "skill_name": "clojure",
    "skill_type": "programming",
    "avg_year_salary": "139540"
  },
  {
    "skill_name": "ibm cloud",
    "skill_type": "cloud",
    "avg_year_salary": "134241"
  },
  {
    "skill_name": "jquery",
    "skill_type": "webframeworks",
    "avg_year_salary": "130000"
  },
  {
    "skill_name": "npm",
    "skill_type": "other",
    "avg_year_salary": "129338"
  },
  {
    "skill_name": "hugging face",
    "skill_type": "libraries",
    "avg_year_salary": "129200"
  },
  {
    "skill_name": "fastapi",
    "skill_type": "webframeworks",
    "avg_year_salary": "127525"
  },
  {
    "skill_name": "golang",
    "skill_type": "programming",
    "avg_year_salary": "127456"
  },
  {
    "skill_name": "django",
    "skill_type": "webframeworks",
    "avg_year_salary": "127141"
  },
  {
    "skill_name": "splunk",
    "skill_type": "analyst_tools",
    "avg_year_salary": "124140"
  },
  {
    "skill_name": "vue",
    "skill_type": "webframeworks",
    "avg_year_salary": "124020"
  },
  {
    "skill_name": "flask",
    "skill_type": "webframeworks",
    "avg_year_salary": "122133"
  },
  {
    "skill_name": "snowflake",
    "skill_type": "cloud",
    "avg_year_salary": "122132"
  },
  {
    "skill_name": "redshift",
    "skill_type": "cloud",
    "avg_year_salary": "121165"
  },
  {
    "skill_name": "dynamodb",
    "skill_type": "databases",
    "avg_year_salary": "120565"
  },
  {
    "skill_name": "numpy",
    "skill_type": "libraries",
    "avg_year_salary": "118567"
  },
  {
    "skill_name": "phoenix",
    "skill_type": "webframeworks",
    "avg_year_salary": "118156"
  },
  {
    "skill_name": "airflow",
    "skill_type": "libraries",
    "avg_year_salary": "117971"
  },
  {
    "skill_name": "matplotlib",
    "skill_type": "libraries",
    "avg_year_salary": "117684"
  },
  {
    "skill_name": "pandas",
    "skill_type": "libraries",
    "avg_year_salary": "117483"
  },
  {
    "skill_name": "plotly",
    "skill_type": "libraries",
    "avg_year_salary": "117470"
  },
  {
    "skill_name": "kafka",
    "skill_type": "libraries",
    "avg_year_salary": "116982"
  },
  {
    "skill_name": "t-sql",
    "skill_type": "programming",
    "avg_year_salary": "116934"
  },
  {
    "skill_name": "github",
    "skill_type": "other",
    "avg_year_salary": "116769"
  },
  {
    "skill_name": "postgresql",
    "skill_type": "databases",
    "avg_year_salary": "116761"
  },
  {
    "skill_name": "firebase",
    "skill_type": "databases",
    "avg_year_salary": "116750"
  },
  {
    "skill_name": "firebase",
    "skill_type": "cloud",
    "avg_year_salary": "116750"
  },
  {
    "skill_name": "pyspark",
    "skill_type": "libraries",
    "avg_year_salary": "116388"
  },
  {
    "skill_name": "keras",
    "skill_type": "libraries",
    "avg_year_salary": "116112"
  },
  {
    "skill_name": "bigquery",
    "skill_type": "cloud",
    "avg_year_salary": "116094"
  },
  {
    "skill_name": "aws",
    "skill_type": "cloud",
    "avg_year_salary": "115790"
  },
  {
    "skill_name": "spark",
    "skill_type": "libraries",
    "avg_year_salary": "115676"
  },
  {
    "skill_name": "pytorch",
    "skill_type": "libraries",
    "avg_year_salary": "115105"
  },
  {
    "skill_name": "scikit-learn",
    "skill_type": "libraries",
    "avg_year_salary": "114807"
  },
  {
    "skill_name": "tensorflow",
    "skill_type": "libraries",
    "avg_year_salary": "114785"
  },
  {
    "skill_name": "react",
    "skill_type": "libraries",
    "avg_year_salary": "114435"
  },
  {
    "skill_name": "mariadb",
    "skill_type": "databases",
    "avg_year_salary": "114175"
  },
  {
    "skill_name": "hadoop",
    "skill_type": "libraries",
    "avg_year_salary": "113005"
  },
  {
    "skill_name": "terraform",
    "skill_type": "other",
    "avg_year_salary": "112835"
  },
  {
    "skill_name": "scala",
    "skill_type": "programming",
    "avg_year_salary": "112682"
  },
  {
    "skill_name": "mysql",
    "skill_type": "databases",
    "avg_year_salary": "112648"
  },
  {
    "skill_name": "databricks",
    "skill_type": "cloud",
    "avg_year_salary": "112544"
  },
  {
    "skill_name": "opencv",
    "skill_type": "libraries",
    "avg_year_salary": "111825"
  },
  {
    "skill_name": "nosql",
    "skill_type": "programming",
    "avg_year_salary": "111799"
  },
  {
    "skill_name": "flow",
    "skill_type": "other",
    "avg_year_salary": "111504"
  },
  {
    "skill_name": "slack",
    "skill_type": "sync",
    "avg_year_salary": "111360"
  },
  {
    "skill_name": "swift",
    "skill_type": "programming",
    "avg_year_salary": "111117"
  },
  {
    "skill_name": "mongo",
    "skill_type": "programming",
    "avg_year_salary": "111015"
  },
  {
    "skill_name": "git",
    "skill_type": "other",
    "avg_year_salary": "110997"
  },
  {
    "skill_name": "oracle",
    "skill_type": "cloud",
    "avg_year_salary": "110890"
  },
  {
    "skill_name": "azure",
    "skill_type": "cloud",
    "avg_year_salary": "110758"
  },
  {
    "skill_name": "python",
    "skill_type": "programming",
    "avg_year_salary": "110558"
  },
  {
    "skill_name": "looker",
    "skill_type": "analyst_tools",
    "avg_year_salary": "110388"
  },
  {
    "skill_name": "bitbucket",
    "skill_type": "other",
    "avg_year_salary": "110259"
  },
  {
    "skill_name": "mongodb",
    "skill_type": "programming",
    "avg_year_salary": "110189"
  },
  {
    "skill_name": "mongodb",
    "skill_type": "databases",
    "avg_year_salary": "110189"
  },
  {
    "skill_name": "ansible",
    "skill_type": "other",
    "avg_year_salary": "109848"
  },
  {
    "skill_name": "sql server",
    "skill_type": "databases",
    "avg_year_salary": "109707"
  },
  {
    "skill_name": "java",
    "skill_type": "programming",
    "avg_year_salary": "109560"
  },
  {
    "skill_name": "ssrs",
    "skill_type": "analyst_tools",
    "avg_year_salary": "109555"
  },
  {
    "skill_name": "c",
    "skill_type": "programming",
    "avg_year_salary": "108959"
  },
  {
    "skill_name": "confluence",
    "skill_type": "async",
    "avg_year_salary": "108820"
  },
  {
    "skill_name": "gcp",
    "skill_type": "cloud",
    "avg_year_salary": "108675"
  },
  {
    "skill_name": "docker",
    "skill_type": "other",
    "avg_year_salary": "108565"
  },
  {
    "skill_name": "ssis",
    "skill_type": "analyst_tools",
    "avg_year_salary": "108200"
  },
  {
    "skill_name": "kubernetes",
    "skill_type": "other",
    "avg_year_salary": "108147"
  },
  {
    "skill_name": "atlassian",
    "skill_type": "other",
    "avg_year_salary": "107825"
  },
  {
    "skill_name": "sql",
    "skill_type": "programming",
    "avg_year_salary": "107818"
  },
  {
    "skill_name": "jenkins",
    "skill_type": "other",
    "avg_year_salary": "107740"
  },
  {
    "skill_name": "notion",
    "skill_type": "async",
    "avg_year_salary": "107683"
  },
  {
    "skill_name": "shell",
    "skill_type": "programming",
    "avg_year_salary": "107637"
  },
  {
    "skill_name": "dax",
    "skill_type": "analyst_tools",
    "avg_year_salary": "107469"
  },
  {
    "skill_name": "typescript",
    "skill_type": "programming",
    "avg_year_salary": "107313"
  },
  {
    "skill_name": "jira",
    "skill_type": "async",
    "avg_year_salary": "107048"
  },
  {
    "skill_name": "c++",
    "skill_type": "programming",
    "avg_year_salary": "106964"
  },
  {
    "skill_name": "gdpr",
    "skill_type": "libraries",
    "avg_year_salary": "106904"
  },
  {
    "skill_name": "go",
    "skill_type": "programming",
    "avg_year_salary": "106902"
  },
  {
    "skill_name": "linux",
    "skill_type": "os",
    "avg_year_salary": "106523"
  },
  {
    "skill_name": "elasticsearch",
    "skill_type": "databases",
    "avg_year_salary": "105423"
  },
  {
    "skill_name": "ruby",
    "skill_type": "webframeworks",
    "avg_year_salary": "105023"
  },
  {
    "skill_name": "ruby",
    "skill_type": "programming",
    "avg_year_salary": "105023"
  },
  {
    "skill_name": "ms access",
    "skill_type": "analyst_tools",
    "avg_year_salary": "105000"
  },
  {
    "skill_name": "node",
    "skill_type": "webframeworks",
    "avg_year_salary": "104990"
  },
  {
    "skill_name": "redis",
    "skill_type": "databases",
    "avg_year_salary": "104465"
  },
  {
    "skill_name": "chef",
    "skill_type": "other",
    "avg_year_salary": "104460"
  },
  {
    "skill_name": "unix",
    "skill_type": "os",
    "avg_year_salary": "104312"
  },
  {
    "skill_name": "c#",
    "skill_type": "programming",
    "avg_year_salary": "104224"
  },
  {
    "skill_name": "unify",
    "skill_type": "sync",
    "avg_year_salary": "104136"
  },
  {
    "skill_name": "julia",
    "skill_type": "programming",
    "avg_year_salary": "104038"
  },
  {
    "skill_name": "visio",
    "skill_type": "analyst_tools",
    "avg_year_salary": "103845"
  },
  {
    "skill_name": "powershell",
    "skill_type": "programming",
    "avg_year_salary": "103748"
  },
  {
    "skill_name": "gitlab",
    "skill_type": "other",
    "avg_year_salary": "103229"
  },
  {
    "skill_name": "r",
    "skill_type": "programming",
    "avg_year_salary": "103131"
  },
  {
    "skill_name": "tableau",
    "skill_type": "analyst_tools",
    "avg_year_salary": "102971"
  },
  {
    "skill_name": "kotlin",
    "skill_type": "programming",
    "avg_year_salary": "102797"
  },
  {
    "skill_name": "php",
    "skill_type": "programming",
    "avg_year_salary": "102664"
  },
  {
    "skill_name": "solidity",
    "skill_type": "programming",
    "avg_year_salary": "102500"
  },
  {
    "skill_name": "windows",
    "skill_type": "os",
    "avg_year_salary": "102260"
  },
  {
    "skill_name": "sap",
    "skill_type": "analyst_tools",
    "avg_year_salary": "101874"
  },
  {
    "skill_name": "jupyter",
    "skill_type": "libraries",
    "avg_year_salary": "101721"
  },
  {
    "skill_name": "nltk",
    "skill_type": "libraries",
    "avg_year_salary": "100547"
  },
  {
    "skill_name": "microstrategy",
    "skill_type": "analyst_tools",
    "avg_year_salary": "100450"
  },
  {
    "skill_name": "qlik",
    "skill_type": "analyst_tools",
    "avg_year_salary": "100225"
  },
  {
    "skill_name": "rust",
    "skill_type": "programming",
    "avg_year_salary": "99483"
  },
  {
    "skill_name": "angular",
    "skill_type": "webframeworks",
    "avg_year_salary": "99059"
  },
  {
    "skill_name": "sharepoint",
    "skill_type": "analyst_tools",
    "avg_year_salary": "98971"
  },
  {
    "skill_name": "crystal",
    "skill_type": "programming",
    "avg_year_salary": "98637"
  },
  {
    "skill_name": "javascript",
    "skill_type": "programming",
    "avg_year_salary": "97989"
  },
  {
    "skill_name": "perl",
    "skill_type": "programming",
    "avg_year_salary": "97361"
  },
  {
    "skill_name": "asana",
    "skill_type": "async",
    "avg_year_salary": "97200"
  },
  {
    "skill_name": "power bi",
    "skill_type": "analyst_tools",
    "avg_year_salary": "97012"
  },
  {
    "skill_name": "neo4j",
    "skill_type": "databases",
    "avg_year_salary": "96246"
  },
  {
    "skill_name": "spring",
    "skill_type": "libraries",
    "avg_year_salary": "95707"
  },
  {
    "skill_name": "bash",
    "skill_type": "programming",
    "avg_year_salary": "95317"
  },
  {
    "skill_name": "cassandra",
    "skill_type": "databases",
    "avg_year_salary": "94935"
  },
  {
    "skill_name": "seaborn",
    "skill_type": "libraries",
    "avg_year_salary": "93870"
  },
  {
    "skill_name": "express",
    "skill_type": "webframeworks",
    "avg_year_salary": "93701"
  },
  {
    "skill_name": "node.js",
    "skill_type": "webframeworks",
    "avg_year_salary": "92911"
  },
  {
    "skill_name": "graphql",
    "skill_type": "libraries",
    "avg_year_salary": "92723"
  },
  {
    "skill_name": "selenium",
    "skill_type": "libraries",
    "avg_year_salary": "92451"
  },
  {
    "skill_name": "html",
    "skill_type": "programming",
    "avg_year_salary": "92171"
  },
  {
    "skill_name": "pascal",
    "skill_type": "programming",
    "avg_year_salary": "92000"
  },
  {
    "skill_name": "mxnet",
    "skill_type": "libraries",
    "avg_year_salary": "91532"
  },
  {
    "skill_name": "css",
    "skill_type": "programming",
    "avg_year_salary": "91526"
  },
  {
    "skill_name": "sas",
    "skill_type": "programming",
    "avg_year_salary": "90990"
  },
  {
    "skill_name": "sas",
    "skill_type": "analyst_tools",
    "avg_year_salary": "90990"
  },
  {
    "skill_name": "puppet",
    "skill_type": "other",
    "avg_year_salary": "90351"
  },
  {
    "skill_name": "vba",
    "skill_type": "programming",
    "avg_year_salary": "90342"
  },
  {
    "skill_name": "alteryx",
    "skill_type": "analyst_tools",
    "avg_year_salary": "90149"
  },
  {
    "skill_name": "assembly",
    "skill_type": "programming",
    "avg_year_salary": "89464"
  },
  {
    "skill_name": "symphony",
    "skill_type": "sync",
    "avg_year_salary": "89100"
  },
  {
    "skill_name": "db2",
    "skill_type": "databases",
    "avg_year_salary": "89100"
  },
  {
    "skill_name": "asp.net",
    "skill_type": "webframeworks",
    "avg_year_salary": "89100"
  },
  {
    "skill_name": "trello",
    "skill_type": "async",
    "avg_year_salary": "89100"
  },
  {
    "skill_name": "unreal",
    "skill_type": "other",
    "avg_year_salary": "87675"
  },
  {
    "skill_name": "vmware",
    "skill_type": "cloud",
    "avg_year_salary": "87500"
  },
  {
    "skill_name": "outlook",
    "skill_type": "analyst_tools",
    "avg_year_salary": "86925"
  },
  {
    "skill_name": "word",
    "skill_type": "analyst_tools",
    "avg_year_salary": "86811"
  },
  {
    "skill_name": "matlab",
    "skill_type": "programming",
    "avg_year_salary": "85610"
  },
  {
    "skill_name": "no-sql",
    "skill_type": "programming",
    "avg_year_salary": "85559"
  },
  {
    "skill_name": "datarobot",
    "skill_type": "analyst_tools",
    "avg_year_salary": "85000"
  },
  {
    "skill_name": "excel",
    "skill_type": "analyst_tools",
    "avg_year_salary": "84610"
  },
  {
    "skill_name": "spreadsheet",
    "skill_type": "analyst_tools",
    "avg_year_salary": "84341"
  },
  {
    "skill_name": "terminal",
    "skill_type": "other",
    "avg_year_salary": "82095"
  },
  {
    "skill_name": "sheets",
    "skill_type": "analyst_tools",
    "avg_year_salary": "81321"
  },
  {
    "skill_name": "unity",
    "skill_type": "other",
    "avg_year_salary": "81013"
  },
  {
    "skill_name": "vue.js",
    "skill_type": "webframeworks",
    "avg_year_salary": "81000"
  },
  {
    "skill_name": "zoom",
    "skill_type": "sync",
    "avg_year_salary": "78300"
  },
  {
    "skill_name": "pulumi",
    "skill_type": "other",
    "avg_year_salary": "78300"
  },
  {
    "skill_name": "powerpoint",
    "skill_type": "analyst_tools",
    "avg_year_salary": "77968"
  },
  {
    "skill_name": "cognos",
    "skill_type": "analyst_tools",
    "avg_year_salary": "77693"
  },
  {
    "skill_name": "groovy",
    "skill_type": "programming",
    "avg_year_salary": "75502"
  },
  {
    "skill_name": "ruby on rails",
    "skill_type": "webframeworks",
    "avg_year_salary": "75000"
  },
  {
    "skill_name": "react.js",
    "skill_type": "webframeworks",
    "avg_year_salary": "75000"
  },
  {
    "skill_name": "planner",
    "skill_type": "async",
    "avg_year_salary": "72900"
  },
  {
    "skill_name": "ubuntu",
    "skill_type": "os",
    "avg_year_salary": "72050"
  },
  {
    "skill_name": "yarn",
    "skill_type": "other",
    "avg_year_salary": "68975"
  },
  {
    "skill_name": "spss",
    "skill_type": "analyst_tools",
    "avg_year_salary": "65465"
  },
  {
    "skill_name": "watson",
    "skill_type": "cloud",
    "avg_year_salary": "64800"
  },
  {
    "skill_name": "elixir",
    "skill_type": "programming",
    "avg_year_salary": "56700"
  },
  {
    "skill_name": "blazor",
    "skill_type": "webframeworks",
    "avg_year_salary": "56700"
  },
  {
    "skill_name": "tidyverse",
    "skill_type": "libraries",
    "avg_year_salary": "56700"
  },
  {
    "skill_name": "laravel",
    "skill_type": "webframeworks",
    "avg_year_salary": "55000"
  },
  {
    "skill_name": "couchbase",
    "skill_type": "databases",
    "avg_year_salary": "55000"
  },
  {
    "skill_name": "digitalocean",
    "skill_type": "cloud",
    "avg_year_salary": "55000"
  },
  {
    "skill_name": "flutter",
    "skill_type": "libraries",
    "avg_year_salary": "43200"
  },
  {
    "skill_name": "centos",
    "skill_type": "os",
    "avg_year_salary": "30000"
  }
]
*/