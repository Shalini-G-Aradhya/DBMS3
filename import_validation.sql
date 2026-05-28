-- =====================================
-- ROW COUNT VALIDATION
-- =====================================

SELECT 'students' AS table_name, COUNT(*) AS row_count
FROM students;

SELECT 'courses' AS table_name, COUNT(*) AS row_count
FROM courses;

SELECT 'problems' AS table_name, COUNT(*) AS row_count
FROM problems;

SELECT 'submissions' AS table_name, COUNT(*) AS row_count
FROM submissions;

SELECT 'enrollments' AS table_name, COUNT(*) AS row_count
FROM enrollments;

SELECT 'attendance' AS table_name, COUNT(*) AS row_count
FROM attendance;


-- =====================================
-- DISTINCT PRIMARY KEY CHECKS
-- =====================================

SELECT COUNT(DISTINCT student_id) AS distinct_students
FROM students;

SELECT COUNT(DISTINCT course_id) AS distinct_courses
FROM courses;

SELECT COUNT(DISTINCT problem_id) AS distinct_problems
FROM problems;


-- =====================================
-- NULL / BLANK CHECKS
-- =====================================

SELECT COUNT(*) AS null_emails
FROM students
WHERE email IS NULL
   OR email = '';

SELECT COUNT(*) AS null_problem_titles
FROM problems
WHERE title IS NULL
   OR title = '';

SELECT COUNT(*) AS null_submission_status
FROM submissions
WHERE status IS NULL
   OR status = '';


-- =====================================
-- EMPTY TABLE CHECKS
-- =====================================

SELECT 'students' AS table_name
WHERE NOT EXISTS (SELECT 1 FROM students);

SELECT 'submissions' AS table_name
WHERE NOT EXISTS (SELECT 1 FROM submissions);