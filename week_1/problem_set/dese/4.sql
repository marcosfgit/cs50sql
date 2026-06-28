SELECT "city", COUNT("id") AS "Count"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY "Count" DESC, "city"
LIMIT 10;
