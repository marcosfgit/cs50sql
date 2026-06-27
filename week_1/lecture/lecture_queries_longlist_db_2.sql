SELECT "name" FROM "authors";

SELECT "name" FROM "translators";

SELECT "name" FROM "authors"
UNION
SELECT "name" FROM "translators";


SELECT 'author' AS "profession", "name" FROM "authors";

SELECT 'translator' AS "profession", "name" FROM "translators";

SELECT 'author' AS "profession", "name" FROM "authors"
UNION
SELECT 'translator' AS "profession", "name" FROM "translators";


SELECT "name" FROM "authors"
INTERSECT
SELECT "name" FROM "translators";


SELECT "name" FROM "authors"
EXCEPT
SELECT "name" FROM "translators";

SELECT "name" FROM "translators"
EXCEPT
SELECT "name" FROM "authors";


SELECT "title" FROM "books"
WHERE "id" = (
    SELECT "book_id" FROM "translated"
    WHERE "translator_id" = (
        SELECT "id" FROM "translators"
        WHERE "name" = 'Sophie Hughes'
    )
    INTERSECT
    SELECT "book_id" FROM "translated"
    WHERE "translator_id" = (
        SELECT "id" FROM "translators"
        WHERE "name" = 'Margaret Jull Costa'
    )
);


SELECT "book_id", ROUND(AVG("rating"), 2) AS "Average Rating"
FROM "ratings"
GROUP BY "book_id";

SELECT "book_id", ROUND(AVG("rating"), 2) AS "Average Rating"
FROM "ratings"
GROUP BY "book_id"
HAVING "Average Rating" > 4.0;

SELECT "book_id", COUNT("rating") AS "Rating Count"
FROM "ratings"
GROUP BY "book_id"
HAVING "Rating Count" > 10000;

SELECT "book_id", ROUND(AVG("rating"), 2) AS "Average Rating"
FROM "ratings"
GROUP BY "book_id"
HAVING "Average Rating" > 4.0
ORDER BY "Average Rating" DESC;
