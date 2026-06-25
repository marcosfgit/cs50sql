SELECT * FROM "longlist";

SELECT "title" FROM "longlist";     

SELECT "title", "author" FROM "longlist";

SELECT "title" FROM "longlist" LIMIT 5;

SELECT "title", "author" FROM "longlist" WHERE "year" = 2023;

SELECT "title", "format" FROM "longlist" WHERE "format" != 'hardcover';

SELECT "title", "format" FROM "longlist" WHERE "format" <> 'hardcover';

SELECT "title", "format" FROM "longlist" WHERE NOT "format" = 'hardcover';

SELECT "title", "author" FROM "longlist" WHERE "year" = 2022
OR "year" = 2023;

SELECT "title", "format" FROM "longlist"
WHERE ("year" = 2022 OR "year" = 2023)
AND "format" != 'hardcover';

SELECT "title", "translator" FROM "longlist"
WHERE "translator" IS NULL;

SELECT "title", "translator" FROM "longlist"
WHERE "translator" IS NOT NULL;

SELECT "title" FROM "longlist"
WHERE "title" LIKE '%love%';

SELECT "title" FROM "longlist"
WHERE "title" LIKE 'The %';

SELECT "title" FROM "longlist"
WHERE "title" LIKE 'The%party%';

SELECT "title" FROM "longlist"
WHERE "title" LIKE 'P_re';

SELECT "title" FROM "longlist"
WHERE "title" LIKE 'T___';

SELECT "title", "year" FROM "longlist"
WHERE "year" >= 2019 AND "year" <= 2022;

SELECT "title", "year" FROM "longlist"
WHERE "year" BETWEEN 2019 AND 2022;

SELECT "title", "rating" FROM "longlist"
WHERE "rating" > 4.0;

SELECT "title", "rating", "votes" FROM "longlist"
WHERE "rating" > 4.0 AND "votes" > 10000;

SELECT "title", "pages" FROM "longlist"
WHERE "pages" < 300;

SELECT "title", "pages" FROM "longlist"
WHERE "title" LIKE 'pyre';

SELECT "title", "pages" FROM "longlist"
WHERE "title" = 'pyre';

SELECT "title", "rating" FROM "longlist"
ORDER BY "rating" DESC LIMIT 10;

SELECT "title", "rating", "votes" FROM "longlist"
ORDER BY "rating" DESC, "votes" DESC
LIMIT 10;

SELECT "title" FROM "longlist"
ORDER BY "title";

SELECT "title" FROM "longlist"
ORDER BY "title" DESC;

SELECT AVG("rating") FROM "longlist";

SELECT ROUND(AVG("rating"), 2) FROM "longlist";

SELECT ROUND(AVG("rating"), 2) AS "Average Rating"
FROM "longlist";

SELECT MAX("rating") FROM "longlist";

SELECT MIN("rating") FROM "longlist";

SELECT SUM("votes") FROM "longlist";

SELECT COUNT(*) FROM "longlist";

SELECT COUNT("translator") FROM "longlist";

SELECT DISTINCT "publisher" FROM "longlist"
GROUP BY "publisher";

SELECT COUNT(DISTINCT "publisher") AS "Total Publishers" FROM "longlist";