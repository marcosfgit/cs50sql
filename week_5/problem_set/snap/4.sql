SELECT "username"
FROM (
    SELECT "username", COUNT("to_user_id") AS "number_of_messages"
    FROM "users"
    JOIN "messages" ON "messages"."to_user_id" = "users"."id"
    GROUP BY "to_user_id"
    ORDER BY "number_of_messages" DESC
    LIMIT 1
);
