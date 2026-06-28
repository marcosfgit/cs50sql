SELECT "districts"."name"
FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
WHERE "expenditures"."pupils" = (
    SELECT MAX("pupils")
    FROM "expenditures"
);
