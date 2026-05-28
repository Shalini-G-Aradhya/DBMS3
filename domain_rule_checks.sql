-- =====================================
-- NEGATIVE SCORE CHECK
-- =====================================

SELECT *
FROM submissions
WHERE score < 0;

-- =====================================
-- SCORE ABOVE MAX CHECK
-- =====================================

SELECT *
FROM submissions
WHERE score > 100;

-- =====================================
-- INVALID DIFFICULTY CHECK
-- =====================================

SELECT *
FROM problems
WHERE difficulty NOT IN ('Easy','Medium','Hard');

-- =====================================
-- INVALID SUBMISSION STATUS
-- =====================================

SELECT *
FROM submissions
WHERE status NOT IN
('Successful','Failed','Pending');

-- =====================================
-- INVALID LANGUAGE CHECK
-- =====================================

SELECT *
FROM submissions
WHERE language NOT IN
('Python','Java','C++','JavaScript');

-- =====================================
-- INVALID ATTENDANCE STATUS
-- =====================================

SELECT *
FROM attendance
WHERE status NOT IN
('Present','Absent','Late');

-- =====================================
-- END TIME BEFORE START TIME
-- =====================================

SELECT *
FROM contests
WHERE end_time < start_time;

-- =====================================
-- SUBMISSION BEFORE ENROLLMENT
-- =====================================

SELECT s.submission_id
FROM submissions s
JOIN enrollments e
ON s.student_id = e.student_id
WHERE s.submitted_at < e.enrollment_date;

-- =====================================
-- NULL CHECKS
-- =====================================

SELECT *
FROM students
WHERE student_name IS NULL
   OR student_name = '';

SELECT *
FROM problems
WHERE title IS NULL
   OR title = '';