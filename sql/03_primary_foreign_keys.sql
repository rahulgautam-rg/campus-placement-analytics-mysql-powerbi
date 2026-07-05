/* Create Primary keys */

ALTER TABLE enrolments
ADD PRIMARY KEY (enrolment_id);

ALTER TABLE candidates
ADD PRIMARY KEY (candidate_id);

ALTER TABLE job_openings
ADD PRIMARY KEY (job_opening_id);

ALTER TABLE applications
ADD PRIMARY KEY (application_id);

ALTER TABLE interviews
ADD PRIMARY KEY (interview_id);



/*Create Foreign Keys*/

SELECT
e.enrolment_id,
c.candidate_id
FROM enrolments e
JOIN candidates c
ON e.candidate_id=c.candidate_id;

Add enrollment_id to candidate table:

ALTER TABLE candidates
ADD COLUMN enrolment_id VARCHAR(50);

Populate it:

UPDATE candidates c
JOIN enrolments e
ON c.candidate_id=e.candidate_id
SET c.enrolment_id=e.enrolment_id;

Create FK:

ALTER TABLE candidates
ADD CONSTRAINT fk_candidate_enrollment
FOREIGN KEY(enrolment_id)
REFERENCES enrolments(enrolment_id);


Applications → Candidates
ALTER TABLE applications
ADD CONSTRAINT fk_application_candidate
FOREIGN KEY(candidate_id)
REFERENCES candidates(candidate_id);


Applications → Job Openings
ALTER TABLE applications
ADD CONSTRAINT fk_application_job
FOREIGN KEY(job_opening_id)
REFERENCES job_openings(job_opening_id);


Interviews → Applications
ALTER TABLE interviews
ADD CONSTRAINT fk_interview_application
FOREIGN KEY(application_id)
REFERENCES applications(application_id);
