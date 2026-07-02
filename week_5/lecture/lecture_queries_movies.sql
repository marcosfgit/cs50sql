SELECT * FROM "movies"
LIMIT 5;

SELECT * FROM "movies"
WHERE "title" = 'Cars';

-- Use '.timer on' the command line of sqlite3 to see how much time queries use to run
-- .timer on

-- Let's create an index to fasten things up
CREATE INDEX "title_index" ON "movies" ("title");

-- Now the same query is 8-9x times faster
SELECT * FROM "movies"
WHERE "title" = 'Cars';

-- To see how index sqlite now searches this query (--SEARCH movies USING INDEX title_index (title=?))
EXPLAIN QUERY PLAN
SELECT * FROM "movies"
WHERE "title" = 'Cars';

-- If the index is not there or removed (--SCAN movies)
EXPLAIN QUERY PLAN
SELECT * FROM "movies"
WHERE "title" = 'Cars';


SELECT "title" FROM "movies"
WHERE "id" IN (
    SELECT "movie_id" FROM "stars"
    WHERE "person_id" = (
        SELECT "id" FROM "people"
        WHERE "name" = 'Tom Hanks'
    )
);

-- Explain the last query
EXPLAIN QUERY PLAN
SELECT "title" FROM "movies"
WHERE "id" IN (
    SELECT "movie_id" FROM "stars"
    WHERE "person_id" = (
        SELECT "id" FROM "people"
        WHERE "name" = 'Tom Hanks'
    )
);

-- With this EXPLAIN:
|--SEARCH movies USING INTEGER PRIMARY KEY (rowid=?)
`--LIST SUBQUERY 2
   |--SCAN stars
   `--SCALAR SUBQUERY 1
      `--SCAN people
-- I can optimize it by creating an index for "people" and an index for "stars"
-- "movies" already has an implicit index because it's in the PRIMARY KEY column

-- Creating the indexes
CREATE INDEX "person_index" ON "stars" ("person_id");
CREATE INDEX "name_index" ON "people" ("name");

-- Explaining again the last query
EXPLAIN QUERY PLAN
SELECT "title" FROM "movies"
WHERE "id" IN (
    SELECT "movie_id" FROM "stars"
    WHERE "person_id" = (
        SELECT "id" FROM "people"
        WHERE "name" = 'Tom Hanks'
    )
);

-- With this EXPLAIN:
|--SEARCH movies USING INTEGER PRIMARY KEY (rowid=?)
`--LIST SUBQUERY 2
   |--SEARCH stars USING INDEX person_index (person_id=?)
   `--SCALAR SUBQUERY 1
      `--SEARCH people USING COVERING INDEX name_index (name=?)
-- We see than SCAN is now SEARCH USING INDEX
-- COVERING INDEX -> type on Index in which queried data can be retrieved from the index itself, no need to go to the table


-- We want to create also a COVERING INDEX for "stars"
DROP INDEX "person_index";

CREATE INDEX "person_index" ON "stars" ("person_id", "movie_id");

-- Explaining again the last query
EXPLAIN QUERY PLAN
SELECT "title" FROM "movies"
WHERE "id" IN (
    SELECT "movie_id" FROM "stars"
    WHERE "person_id" = (
        SELECT "id" FROM "people"
        WHERE "name" = 'Tom Hanks'
    )
);

-- With this EXPLAIN:
|--SEARCH movies USING INTEGER PRIMARY KEY (rowid=?)
`--LIST SUBQUERY 2
   |--SEARCH stars USING COVERING INDEX person_index (person_id=?)
   `--SCALAR SUBQUERY 1
      `--SEARCH people USING COVERING INDEX name_index (name=?)
-- Now I have two COVERING INDEXES and I can find all the information I need just by looking at these indexes

-- Running the query to see the time it takes (it is 3x times faster)
SELECT "title" FROM "movies"
WHERE "id" IN (
    SELECT "movie_id" FROM "stars"
    WHERE "person_id" = (
        SELECT "id" FROM "people"
        WHERE "name" = 'Tom Hanks'
    )
);


-- Create a PARTIAL INDEX
-- Example of use: only index movies from this year (that will be more queried than older movies)
-- Advantages: takes less space
CREATE INDEX "recents" ON "movies" ("title")
WHERE "year" = 2023;

-- Normal query
SELECT "title" FROM "movies"
WHERE "year" = 2023;

-- Explain query (--SCAN movies USING COVERING INDEX recents)
EXPLAIN QUERY PLAN
SELECT "title" FROM "movies" WHERE "year" = 2023;

-- Explain query with movies not from 2023 (we see it's only a SCAN)
EXPLAIN QUERY PLAN
SELECT "title" FROM "movies" WHERE "year" = 1998;


-- The DB size right now is 151460KB
-- Let's DROP an index
DROP INDEX "person_index";
-- Still the same size
DROP INDEX "name_index";
DROP INDEX "recents";