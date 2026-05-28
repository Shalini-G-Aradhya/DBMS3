# Before and After Repair Evidence

## Negative Score Repair

Before:

* submission_id 2031 had score -10.

After:

* score updated to 0.

---

## Invalid Difficulty Repair

Before:

* problem_id 88 had difficulty='Very Hard'.

After:

* difficulty updated to 'Hard'.

---

## Duplicate Enrollment Repair

Before:

* duplicate enrollment rows existed.

After:

* duplicate rows removed from staging table.

---

## Invalid Status Repair

Before:

* submission status='Done'.

After:

* status corrected to 'Successful'.

---

## Blank Email Repair

Before:

* student email was NULL.

After:

* placeholder email inserted.
