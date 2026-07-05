ALTER TABLE enrolments
CHANGE `Enrolment ID` enrolment_id VARCHAR(50),

CHANGE `Enrolment Owner` enrolment_owner VARCHAR(100),

CHANGE `Enrolment Name` enrolment_name VARCHAR(100),

CHANGE `First Name` first_name VARCHAR(50),

CHANGE `Last Name` last_name VARCHAR(50),

CHANGE `Email` email VARCHAR(100),

CHANGE `Batch Name` batch_name VARCHAR(100),

CHANGE `Stage` stage VARCHAR(50),

CHANGE `CandidateId` candidate_id BIGINT,

CHANGE `Created Time` created_time DATETIME,

CHANGE `Job Role Preference 1` job_role_preference_1 VARCHAR(100),

CHANGE `Job Role Preference 2` job_role_preference_2 VARCHAR(100),

CHANGE `Knocked Off Reason` knocked_off_reason TEXT,

CHANGE `On Hold Reason` on_hold_reason TEXT,

CHANGE `Course Name` course_name VARCHAR(100),

CHANGE `Preferred Job Type` preferred_job_type VARCHAR(100),

CHANGE `Expected Salary` expected_salary VARCHAR(50),

CHANGE `College Name` college_name VARCHAR(200),

CHANGE `Degree` degree VARCHAR(100),

CHANGE `Graduation Year` graduation_year INT;


----------------------------------------------------------------------------------------------------------------------------

ALTER TABLE candidates
CHANGE `Candidate Id` candidate_id BIGINT,

CHANGE `First Name` first_name VARCHAR(50),

CHANGE `Last Name` last_name VARCHAR(50),

CHANGE `Phone Number` phone_number VARCHAR(20),

CHANGE `Email` email VARCHAR(100),

CHANGE `City` city VARCHAR(50),

CHANGE `Province` province VARCHAR(50),

CHANGE `Country` country VARCHAR(50),

CHANGE `Skill Set` skill_set TEXT,

CHANGE `Candidate Stage` candidate_stage VARCHAR(50),

CHANGE `Batch Name` batch_name VARCHAR(50),

CHANGE `Age` age INT,

CHANGE `Preferred Job Location` preferred_job_location VARCHAR(100),

CHANGE `Gender` gender VARCHAR(20),

CHANGE `Personal Strength Area 1` strength_area_1 VARCHAR(100),

CHANGE `Personal Strength Area 2` strength_area_2 VARCHAR(100);

------------------------------------------------------------------------------------------------------------

ALTER TABLE applications
CHANGE `Application Id` application_id VARCHAR(50),

CHANGE `Candidate Id` candidate_id BIGINT,

CHANGE `Job Opening Id` job_opening_id VARCHAR(50),

CHANGE `First Name` first_name VARCHAR(50),

CHANGE `Last Name` last_name VARCHAR(50),

CHANGE `Email` email VARCHAR(100),

CHANGE `Phone` phone VARCHAR(20),

CHANGE `Posting Title` posting_title VARCHAR(200),

CHANGE `Application Stage` application_stage VARCHAR(50),

CHANGE `Application Status` application_status VARCHAR(50),

CHANGE `Created Time` created_time DATETIME,

CHANGE `Batch Name` batch_name VARCHAR(50);

-------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE interviews
CHANGE `Interview Id` interview_id VARCHAR(50),

CHANGE `Interview Name` interview_name VARCHAR(100),

CHANGE `Interview Owner Id` interview_owner_id VARCHAR(50),

CHANGE `Client Id` client_id VARCHAR(50),

CHANGE `Candidate Id` candidate_id BIGINT,

CHANGE `Job Opening Id` job_opening_id VARCHAR(50),

CHANGE `Application ID` application_id VARCHAR(50),

CHANGE `From` interview_from DATETIME,

CHANGE `To` interview_to DATETIME,

CHANGE `Interview Type` interview_type VARCHAR(50),

CHANGE `Interview Status` interview_status VARCHAR(50),

CHANGE `Batch Name` batch_name VARCHAR(50),

CHANGE `Cancellation Reason` cancellation_reason TEXT,

CHANGE `Feedback` feedback TEXT,

CHANGE `Created Time` created_time DATETIME;


------------------------------------------------------------------------------------------------------------------------------------


ALTER TABLE job_openings
CHANGE `Job Opening Id` job_opening_id VARCHAR(50),

CHANGE `Account Manager` account_manager VARCHAR(100),

CHANGE `Job Type` job_type VARCHAR(50),

CHANGE `Posting Title` posting_title VARCHAR(200),

CHANGE `Job Opening Status` job_opening_status VARCHAR(50),

CHANGE `Date Opened` date_opened DATE,

CHANGE `City` city VARCHAR(50),

CHANGE `Province` province VARCHAR(50),

CHANGE `Country` country VARCHAR(50),

CHANGE `Created Time` created_time DATETIME,

CHANGE `Salary` salary DECIMAL(12,2),

CHANGE `Profile` profile TEXT;

---------------------------------------------------------------------------------------------------------------------------------------------
/* To finding the duplicates in datasets */

SELECT enrolment_id,
COUNT(*)
FROM enrolments
GROUP BY enrolment_id
HAVING COUNT(*)>1; 


SELECT candidate_id,
COUNT(*)
FROM candidates
GROUP BY candidate_id
HAVING COUNT(*)>1;


SELECT job_opening_id,
COUNT(*)
FROM job_openings
GROUP BY job_opening_id
HAVING COUNT(*)>1;

SELECT application_id,
COUNT(*)
FROM applications
GROUP BY application_id
HAVING COUNT(*)>1;

SELECT interview_id,
COUNT(*)
FROM interviews
GROUP BY interview_id
HAVING COUNT(*)>1;

/* Check missing values */

SELECT *
FROM candidates
WHERE candidate_id IS NULL;


SELECT *
FROM applications
WHERE candidate_id IS NULL;


SELECT *
FROM applications
WHERE job_opening_id IS NULL;


SELECT *
FROM interviews
WHERE application_id IS NULL;
