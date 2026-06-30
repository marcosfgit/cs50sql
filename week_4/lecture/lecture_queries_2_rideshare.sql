SELECT * FROM "rides";

SELECT "id", "origin", "destination" FROM "rides";

-- This way I can omit PII about the riders
SELECT "id", "origin", "destination", 'Anonymous' AS "rider"
FROM "rides";

-- Now I can turn it into a view and share it without sharing PII about riders (Securing)
CREATE VIEW "analysis" AS
SELECT "id", "origin", "destination", 'Anonymous' AS "rider"
FROM "rides";

-- Now to see the view
SELECT * FROM "analysis";

-- But other people can still query and see the PII (it's a downside of SQLite; other DBMS have access controls to counter this)
SELECT * FROM "rides";

