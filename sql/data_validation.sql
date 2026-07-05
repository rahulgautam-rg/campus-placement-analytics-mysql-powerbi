SELECT COUNT(*),
COUNT(DISTINCT enrolment_id)
FROM enrolments;

SELECT COUNT(*),
COUNT(DISTINCT candidate_id)
FROM candidates;

SELECT COUNT(*)
FROM applications a
LEFT JOIN candidates c
ON a.candidate_id=c.candidate_id
WHERE c.candidate_id IS NULL;
