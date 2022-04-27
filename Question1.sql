 -- Question 1.
 --   Given three database tables
 --     Students
 --       |id|name|
 --     Books
 --       |id|title|
 --     Readings
 --       |id|book_id|student_id|reading_duration|
 --
 --   write a query that returns a list of the number of distinct books read by
 --   each student. If a student has not read any books, the list should display
 --   a 0.
 --   The list should be sorted by the number of books read, then
 --   alphabetically by name.
 --
 --   Books Read
 --     |student_id|count|
 --
 -- This will be a SQL QUERY

-- Columns will be STUDENT_ID and COUNT (# distinct books)
SELECT r.student_id, COUNT(distinct r.book_id)
-- Make temp table READINGCOUNTS, pulling from READINGS
INTO #ReadingCounts c
FROM Readings r
-- Group the COUNT by STUDENT_ID
GROUP BY r.student_id
-- Return all records from temp table, and matched records from STUDENTS
LEFT JOIN Students s
  ON(c.student_id = s.id)
-- order first by count (ascending), then by name (alphabetically)
ORDER BY c.count, s.name
