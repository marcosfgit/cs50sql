-- Create DB mfa_update.db with schema_artists_update.sql
-- sqlite3 mfa_update.db
-- .read schema_artists_update.sql

-- Want to update Li Yin to have created the collection "Farmers working at dawn"
UPDATE "created" SET "artist_id" = (
    SELECT "id" FROM "artists"
    WHERE "name" = 'Li Yin'
)
WHERE "collection_id" = (
    SELECT "id" FROM "collections"
    WHERE "title" = 'Farmers working at dawn'
);


-- Now we have votes.csv. Let's use import to have this data on a DB
-- sqlite3 votes.db
-- .import --csv votes.csv votes

-- To see the votes table
SELECT * FROM "votes";

-- Counting the votes (there are a lot of typos that ruin the voting)
SELECT "title", COUNT("title") FROM "votes"
GROUP BY "title";

-- Remove white spaces before and after
UPDATE "votes" SET "title" = trim("title");

-- Capitalize all letters
UPDATE "votes" SET "title" = upper("title");

-- Correct typos with LIKE
UPDATE "votes" SET "title" = 'FARMERS WORKING AT DAWN'
WHERE "title" LIKE 'Fa%';

UPDATE "votes" SET "title" = 'IMAGINATIVE LANDSCAPE'
WHERE "title" LIKE 'Imag%';

UPDATE "votes" SET "title" = 'PROFUSION OF FLOWERS'
WHERE "title" LIKE 'Pro%';