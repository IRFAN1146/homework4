-- Query 1: Find sets that have a word or phrase in their description
SELECT * 
FROM LEGO_Sets
WHERE name LIKE '%word_or_phrase%';

-- Query 2: Sort by sets with the highest piece count
SELECT s.set_id, s.name, SUM(sp.quantity) AS piece_count
FROM LEGO_Sets s
JOIN Set_Parts sp ON s.set_id = sp.set_id
GROUP BY s.set_id, s.name
ORDER BY piece_count DESC;

-- Query 3: Show only sets that belong to a specific theme
SELECT * 
FROM LEGO_Sets
WHERE theme = 'specific_theme';

-- Query 4: Paginate the list of sets, 4 sets at a time
SELECT * 
FROM LEGO_Sets
LIMIT 4 OFFSET (page_number - 1) * 4;
