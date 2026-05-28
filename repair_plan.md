# Repair Plan

## Issue 1: Duplicate Emails

Example:

* student_id 101 and 145 share same email.

Repair Action:

* Send for manual verification because email ownership cannot be safely assumed.

---

## Issue 2: Negative Scores

Example:

* submission_id 2031 has score -10.

Repair Action:

* Correct score to 0 using staging table.

---

## Issue 3: Invalid Difficulty

Example:

* problem_id 88 has difficulty='Very Hard'.

Repair Action:

* Convert to 'Hard'.

---

## Issue 4: Missing Batch References

Example:

* student_id 67 references missing batch_id 999.

Repair Action:

* Move record to rejected staging table until batch is verified.

---

## Issue 5: Duplicate Enrollment

Example:

* student_id 25 enrolled twice in course_id 4.

Repair Action:

* Delete duplicate row from staging table.

---

## Issue 6: Invalid Submission Status

Example:

* submission_id 552 has status='Done'.

Repair Action:

* Convert to 'Successful' after verification.

---

## Issue 7: Invalid Attendance Status

Example:

* attendance_id 88 has status='Unknown'.

Repair Action:

* Set NULL and request manual verification.

---

## Issue 8: Submission Linked to Missing Problem

Example:

* submission_id 700 references missing problem_id 555.

Repair Action:

* Move to rejected_submissions staging table.
