SELECT "title" FROM "books"
WHERE "publisher_id" = (
    SELECT "id" FROM "publishers"
    WHERE "publisher" = 'Fitzcarraldo Editions'
);

SELECT "title" FROM "books"
WHERE "publisher_id" = (
    SELECT "id" FROM "publishers"
    WHERE "publisher" = 'MacLehose Press'
);

SELECT "rating" FROM "ratings"
WHERE "book_id" = (
    SELECT "id" FROM "books"
    WHERE "title" = 'In Memory of Memory'
);

SELECT AVG("rating") FROM "ratings"
WHERE "book_id" = (
    SELECT "id" FROM "books"
    WHERE "title" = 'In Memory of Memory'
);

SELECT "name" FROM "authors"
WHERE "id" = (
    SELECT "author_id" FROM "authored"
    WHERE "book_id" = (
        SELECT "id" FROM "books"
        WHERE "title" = 'Flights'
    )
);

SELECT "name" FROM "authors"
WHERE "id" = (
    SELECT "author_id" FROM "authored"
    WHERE "book_id" = (
        SELECT "id" FROM "books"
        WHERE "title" = 'The Birthday Party'
    )
);

SELECT "title" FROM "books"
WHERE "id" IN (
    SELECT "book_id" FROM "authored"
    WHERE "author_id" = (
        SELECT "id" FROM "authors"
        WHERE "name" = 'Fernanda Melchor'
    )
);