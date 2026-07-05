CREATE TABLE enrollments (
    enrolment_id VARCHAR(30) PRIMARY KEY,

    enrolment_owner VARCHAR(100),

    first_name VARCHAR(50),
    last_name VARCHAR(50),
    full_name VARCHAR(100),

    email VARCHAR(150) UNIQUE,

    batch_name VARCHAR(50),

    stage VARCHAR(50),

    course_name VARCHAR(100),

    college_name VARCHAR(200),

    degree VARCHAR(100),

    graduation_year INT,

    preferred_job_type VARCHAR(50),

    expected_salary DECIMAL(12,2),

    job_role_preference_1 VARCHAR(100),

    job_role_preference_2 VARCHAR(100),

    knocked_off_reason TEXT,

    on_hold_reason TEXT,

    created_time DATETIME
);

-----------------------------------------------------------------------------------------------------
CREATE TABLE candidates (

    candidate_id BIGINT PRIMARY KEY,

    enrolment_id VARCHAR(30) UNIQUE,

    first_name VARCHAR(50),

    last_name VARCHAR(50),

    phone_number VARCHAR(20),

    email VARCHAR(150),

    city VARCHAR(50),

    province VARCHAR(50),

    country VARCHAR(50),

    skill_set TEXT,

    candidate_stage VARCHAR(50),

    batch_name VARCHAR(50),

    age INT,

    preferred_job_location VARCHAR(100),

    gender VARCHAR(20),

    strength_area_1 VARCHAR(100),

    strength_area_2 VARCHAR(100),

    FOREIGN KEY (enrolment_id)
        REFERENCES enrollments(enrolment_id)
);
----------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------

CREATE TABLE job_openings (

    job_opening_id VARCHAR(30) PRIMARY KEY,

    account_manager VARCHAR(100),

    job_type VARCHAR(50),

    posting_title VARCHAR(200),

    job_opening_status VARCHAR(50),

    date_opened DATE,

    city VARCHAR(50),

    province VARCHAR(50),

    country VARCHAR(50),

    salary DECIMAL(12,2),

    profile TEXT,

    created_time DATETIME
);
-------------------------------------------------------------------------

CREATE TABLE applications (

    application_id VARCHAR(30) PRIMARY KEY,

    candidate_id BIGINT NOT NULL,

    job_opening_id VARCHAR(30) NOT NULL,

    application_stage VARCHAR(50),

    application_status VARCHAR(50),

    created_time DATETIME,

    FOREIGN KEY(candidate_id)
        REFERENCES candidates(candidate_id),

    FOREIGN KEY(job_opening_id)
        REFERENCES job_openings(job_opening_id)
);

----------------------------------------------------------------------------------------------------------

CREATE TABLE interviews (

    interview_id VARCHAR(30) PRIMARY KEY,

    application_id VARCHAR(30) NOT NULL,

    candidate_id BIGINT,

    job_opening_id VARCHAR(30),

    interview_name VARCHAR(100),

    interview_owner_id VARCHAR(50),

    client_id VARCHAR(50),

    interview_from DATETIME,

    interview_to DATETIME,

    interview_type VARCHAR(50),

    interview_status VARCHAR(50),

    cancellation_reason TEXT,

    feedback TEXT,

    created_time DATETIME,

    FOREIGN KEY(application_id)
        REFERENCES applications(application_id),

    FOREIGN KEY(candidate_id)
        REFERENCES candidates(candidate_id),

    FOREIGN KEY(job_opening_id)
        REFERENCES job_openings(job_opening_id)
);
--------------------------------------------------------------------------------------------------------
