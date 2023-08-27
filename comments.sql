-- SELECT *, words.word, COUNT(*) as frequency
-- FROM (
--     SELECT verbatim_text, regexp_split_to_table(verbatim_text, E'\\s+') as word
--     FROM customer_comments
-- ) AS words
-- -- WHERE word IN ('good', 'bad', 'for', 'of', 'on')
-- WHERE word ILIKE '%good%' or word ILIKE '%bad%'
-- GROUP BY verbatim_text, word
-- ORDER BY verbatim_text, frequency DESC
-- LIMIT 100; 

SELECT word, COUNT(*) as frequency
FROM (
    SELECT regexp_split_to_table(verbatim_text, E'\\s+') as word
    FROM customer_comments
) AS words
WHERE LOWER(word) IN ('good','excellent','great','wonderful','amazing',
'love','happy','satisfied','outstanding','impressed','recommend',
'thrilled','exceptional','pleased','poor','bad','terrible',
'disappointed','frustrated','unhappy','avoid','worst','horrible',
'annoyed','complaint','issue','problem')
GROUP BY word
ORDER BY frequency DESC
LIMIT 1000; 
