/* Placement Rate*/

SELECT
COUNT(DISTINCT candidate_id),
COUNT(DISTINCT CASE
WHEN application_status='Approved by client'
THEN candidate_id
END)
FROM applications;

/* Top Jobs */

SELECT
posting_title,
COUNT(*)
FROM applications
GROUP BY posting_title;

/* Interview Status*/

SELECT
interview_status,
COUNT(*)
FROM interviews
GROUP BY interview_status;

