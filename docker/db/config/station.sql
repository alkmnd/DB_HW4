CREATE TABLE "station" (
  "name" varchar PRIMARY KEY,
  "tracks" int NOT NULL,
  "city" varchar NOT NULL,
  "region" varchar NOT NULL
);

CREATE TABLE "train" (
  "train_nr" int PRIMARY KEY,
  "length" int NOT NULL
);

CREATE TABLE "city" (
  "name" varchar,
  "region" varchar,
  PRIMARY KEY ("name", "region")
);

CREATE TABLE "connection" (
  "train" int,
  "from" varchar NOT NULL,
  "to" varchar NOT NULL,
  "departure" timestamp NOT NULL,
  "arrival" timestamp NOT NULL
);

CREATE TABLE "start" (
  "station_name" varchar PRIMARY KEY,
  "train_nr" int NOT NULL
);

CREATE TABLE "end" (
  "station_name" varchar PRIMARY KEY,
  "train_nr" int NOT NULL
);

ALTER TABLE "station" ADD FOREIGN KEY ("city", "region") REFERENCES "city" ("name", "region");

ALTER TABLE "connection" ADD FOREIGN KEY ("from") REFERENCES "station" ("name");

ALTER TABLE "connection" ADD FOREIGN KEY ("to") REFERENCES "station" ("name");

ALTER TABLE "connection" ADD FOREIGN KEY ("train") REFERENCES "train" ("train_nr");

ALTER TABLE "end" ADD FOREIGN KEY ("station_name") REFERENCES "station" ("name");

ALTER TABLE "start" ADD FOREIGN KEY ("station_name") REFERENCES "station" ("name");

ALTER TABLE "end" ADD FOREIGN KEY ("train_nr") REFERENCES "train" ("train_nr");

ALTER TABLE "start" ADD FOREIGN KEY ("train_nr") REFERENCES "train" ("train_nr");
