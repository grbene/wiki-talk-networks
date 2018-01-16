'Use this code in quarry.mflabs.com in order to select all of the Talk pages that were started in 2016'

(SELECT month, page_namespace, page_id, page_title, edits, page_len
FROM (
   SELECT LEFT(rev_timestamp, 6) AS month, rev_page, COUNT(*) AS edits
   FROM revision
   WHERE rev_timestamp BETWEEN "201601" AND "201701"
   GROUP BY month, rev_page
   ORDER BY edits DESC
   LIMIT 10000
) AS top_page_edits 
INNER JOIN page ON rev_page = page_id
WHERE page_namespace = 1
ORDER BY page_namespace, edits DESC
LIMIT 1000);

'Use this code in quarry.mflabs.com in order to select all of the Talk pages that were started in 2017'

(SELECT month, page_namespace, page_id, page_title, edits, page_len
FROM (
   SELECT LEFT(rev_timestamp, 6) AS month, rev_page, COUNT(*) AS edits
   FROM revision
   WHERE rev_timestamp BETWEEN "201701" AND "201801"
   GROUP BY month, rev_page
   ORDER BY edits DESC
   LIMIT 10000
) AS top_page_edits 
INNER JOIN page ON rev_page = page_id
WHERE page_namespace = 1
ORDER BY page_namespace, edits DESC
LIMIT 1000);
