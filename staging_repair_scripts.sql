-- =====================================
-- CREATE STAGING TABLES
-- =====================================

CREATE TABLE submissions_staging AS
SELECT * FROM submissions;

CREATE TABLE students_staging AS
SELECT * FROM students;

CREATE TABLE enrollments_staging AS
SELECT * FROM enrollments;


-- =====================================
-- REPAIR 1: NEGATIVE SCORES
-- =====================================

-- BEFORE
SELECT *
FROM submissions_staging
WHERE score < 0;

-- FIX
UPDATE submissions_staging
SET score = 0
WHERE score < 0;

-- AFTER
SELECT *
FROM submissions_staging
WHERE score < 0;


-- =====================================
-- REPAIR 2: INVALID DIFFICULTY
-- =====================================

-- BEFORE
SELECT *
FROM problems
WHERE difficulty = 'Very Hard';

-- FIX
UPDATE problems
SET difficulty = 'Hard'
WHERE difficulty = 'Very Hard';

-- AFTER
SELECT *
FROM problems
WHERE difficulty = 'Very Hard';


-- =====================================
-- REPAIR 3: DUPLICATE ENROLLMENTS
-- =====================================

-- BEFORE
SELECT student_id, course_id, COUNT(*)
FROM enrollments_staging
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;

-- FIX
DELETE FROM enrollments_staging
WHERE rowid NOT IN
(
    SELECT MIN(rowid)
    FROM enrollments_staging
    GROUP BY student_id, course_id
);

-- AFTER
SELECT student_id, course_id, COUNT(*)
FROM enrollments_staging
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;


-- =====================================
-- REPAIR 4: INVALID STATUS
-- =====================================

-- BEFORE
SELECT *
FROM submissions_staging
WHERE status = 'Done';

-- FIX
UPDATE submissions_staging
SET status = 'Successful'
WHERE status = 'Done';

-- AFTER
SELECT *
FROM submissions_staging
WHERE status = 'Done';


-- =====================================
-- REPAIR 5: BLANK EMAILS
-- =====================================

-- BEFORE
SELECT *
FROM students_staging
WHERE email IS NULL
   OR email = '';

-- FIX
UPDATE students_staging
SET email = 'unknown@example.com'
WHERE email IS NULL
   OR email = '';

-- AFTER
SELECT *
FROM students_staging
WHERE email IS NULL
   OR email = '';