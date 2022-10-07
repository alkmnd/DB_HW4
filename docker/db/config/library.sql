CREATE TABLE "reader" (
  "id" int PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL,
  "surname" varchar NOT NULL,
  "birthdate" date NOT NULL
);

CREATE TABLE "lending" (
  "id" int PRIMARY KEY NOT NULL,
  "reader_id" int NOT NULL,
  "book_id" int NOT NULL,
  "lend_date" date NOT NULL,
  "return_date" date NOT NULL
);

CREATE TABLE "bookcopy" (
  "id" int PRIMARY KEY NOT NULL,
  "position" varchar NOT NULL,
  "original_book_id" varchar NOT NULL,
  "status" int NOT NULL
);

CREATE TABLE "book" (
  "isbn" varchar PRIMARY KEY NOT NULL,
  "year" date NOT NULL,
  "name" varchar NOT NULL,
  "author" varchar NOT NULL,
  "pablisher_id" int NOT NULL
);

CREATE TABLE "bookcategory" (
  "category_id" int,
  "isbn" varchar
);

CREATE TABLE "category" (
  "id" int PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "publisher" (
  "id" int PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL,
  "address" varchar NOT NULL
);

CREATE TABLE "subcategory" (
  "category_id" int,
  "parent_id" int
);

ALTER TABLE "subcategory" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("id");

ALTER TABLE "subcategory" ADD FOREIGN KEY ("parent_id") REFERENCES "category" ("id");

ALTER TABLE "lending" ADD FOREIGN KEY ("reader_id") REFERENCES "reader" ("id");

ALTER TABLE "lending" ADD FOREIGN KEY ("book_id") REFERENCES "bookcopy" ("id");

ALTER TABLE "bookcopy" ADD FOREIGN KEY ("original_book_id") REFERENCES "book" ("isbn");

ALTER TABLE "book" ADD FOREIGN KEY ("pablisher_id") REFERENCES "publisher" ("id");

ALTER TABLE "bookcategory" ADD FOREIGN KEY ("isbn") REFERENCES "book" ("isbn");

ALTER TABLE "bookcategory" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("id");
