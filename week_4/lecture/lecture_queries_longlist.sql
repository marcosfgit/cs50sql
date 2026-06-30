SELECT "title" FROM "books"
WHERE "id" IN (
    SELECT "book_id" FROM "authored"
    WHERE "author_id" = (
        SELECT "id" FROM "authors"
        WHERE "name" = 'Fernanda Melchor'
    )
);

SELECT "name", "title" FROM "authors"
JOIN "authored" ON "authors"."id" = "authored"."author_id"
JOIN "books" ON "books"."id" = "authored"."book_id";


-- Create a View with the last query
CREATE VIEW "longlist" AS
SELECT "name", "title" FROM "authors"
JOIN "authored" ON "authors"."id" = "authored"."author_id"
JOIN "books" ON "books"."id" = "authored"."book_id";

-- Open that same View
SELECT * FROM "longlist";

-- Find the books written by Fernanda Melchor
SELECT "title" FROM "longlist"
WHERE "name" = 'Fernanda Melchor';

-- Sorting the View by title
SELECT * FROM "longlist"
ORDER BY "title";


SELECT "book_id", "title", "year", ROUND(AVG("rating"), 2) AS "rating" FROM "ratings"
JOIN "books" ON "ratings"."book_id" = "books"."id"
GROUP BY "book_id";

-- Create a View with the last query
CREATE VIEW "average_book_ratings" AS
SELECT "book_id", "title", "year", ROUND(AVG("rating"), 2) AS "rating" FROM "ratings"
JOIN "books" ON "ratings"."book_id" = "books"."id"
GROUP BY "book_id";

-- Open that same View
SELECT * FROM "average_book_rating";


-- Create a temporary view that only persists during my connection to the DB (till the .quit)
-- At the same time create a view with a view we already created before
CREATE TEMPORARY VIEW "average_ratings_by_year" AS
SELECT "year", ROUND(AVG("rating"), 2) AS "rating" FROM "average_book_ratings"
GROUP BY "year";

-- Open that same View
SELECT * FROM "average_ratings_by_year";


-- Drop the View "average_book_ratings"
DROP VIEW "average_book_ratings";

-- Now use a CTE (Common Table Expressions)
-- It will be same as the last two queries, but with CTE
-- It only has the duration of the query, it isn't persisted into the DB storage
WITH "average_book_ratings" AS (
    SELECT "book_id", "title", "year", ROUND(AVG("rating"), 2) AS "rating" FROM "ratings"
    JOIN "books" ON "ratings"."book_id" = "books"."id"
    GROUP BY "book_id"
)
SELECT "year", ROUND(AVG("rating"), 2) AS "rating" FROM "average_book_ratings"
GROUP BY "year";


-- Create a View only for the books nominated in 2022 (Partitioning)
CREATE VIEW "2022" AS
SELECT "id", "title" FROM "books"
WHERE "year" = 2022;

-- Open that same View
SELECT * FROM "2022";

-- Create a View only for the books nominated in 2021 (Partitioning)
CREATE VIEW "2021" AS
SELECT "id", "title" FROM "books"
WHERE "year" = 2021;

-- Open that same View
SELECT * FROM "2021";
