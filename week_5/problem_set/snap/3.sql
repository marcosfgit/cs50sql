SELECT "to_user_id"
FROM (
    SELECT "to_user_id", COUNT("messages"."to_user_id") AS "number_of_messages"
    FROM "messages"
    WHERE "from_user_id" = (
        SELECT "id"
        FROM "users"
        WHERE "username" = 'creativewisdom377'
    )
    GROUP BY "to_user_id"
    ORDER BY "number_of_messages" DESC
    LIMIT 3
);
