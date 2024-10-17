
-- lego_organizer_queries.sql

-- 1. Find sets that have a word or phrase in their description
SELECT *
FROM LEGO_Sets
WHERE description LIKE '%castle%';  -- Replace 'castle' with the desired word/phrase

-- 2. Sort by sets with the highest piece count
-- Note: Assuming there is a piece_count column; if not, add one to the LEGO_Sets table.
SELECT *
FROM LEGO_Sets
ORDER BY piece_count DESC;  -- Replace piece_count with the actual column name if it exists

-- 3. Show only sets that belong to a specific theme
SELECT *
FROM LEGO_Sets
WHERE theme = 'Disney';  -- Replace 'Disney' with the desired theme

-- 4. Pagination query to show sets, 4 at a time
SELECT *
FROM LEGO_Sets
LIMIT 4 OFFSET 0;  -- Replace 0 with the appropriate offset for pagination (0 for the first 4, 4 for the next 4, etc.)
