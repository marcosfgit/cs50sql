SELECT DISTINCT "players"."first_name", "players"."last_name"
FROM "players"
JOIN "salaries"
    ON "salaries"."player_id" = "players"."id"
WHERE "players"."id" = (
    SELECT "player_id"
    FROM "salaries"
    WHERE "salary" = (
        SELECT MAX("salary")
        FROM "salaries"
    )
);
