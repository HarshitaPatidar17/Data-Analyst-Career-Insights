/*question: whta skills are required for top-paying data analyst jobs?
 -Use the top 10 highest-paying Data Analyst jobs from first query.
 - Add the specific skills required for these roles
 -Why? It provides a detailed look at which high-paying jobs demand certain skills,
 helping job seekers understand whch skills to develop that align with top salries.
 */
WITH top_paying_jobs AS(
    SELECT job_id,
        job_title,
        salary_year_avg,
        NAME AS company_name
    FROM job_posting_fact
        LEFT JOIN company_dim ON job_posting_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skill_job_dim ON top_paying_jobs.job_id = skill_job_dim.job_id
INNER JOIN skills_dim ON skill_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC

    