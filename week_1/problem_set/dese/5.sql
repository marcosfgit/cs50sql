SELECT "city", COUNT("id") AS "Count"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING COUNT("id") < 4
ORDER BY "Count" DESC, "city";
