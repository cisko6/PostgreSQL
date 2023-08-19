
-----------------------------TABLES------------------------------------------------------

CREATE TABLE IF NOT EXISTS "Students" 
(
	-- "Student_ID" INT NOT NULL,
	student_id SERIAL PRIMARY KEY,
	username VARCHAR(20) UNIQUE NOT NULL,
	password VARCHAR(20) NOT NULL,
	is_new BOOLEAN,
	age INTEGER,
	created TIMESTAMP NOT NULL,
	updated TIMESTAMP
	-- CONSTRAINT "PK_STUDENTI" PRIMARY KEY ("Student_ID")
);

DROP TABLE IF EXISTS "Students"

-------------------------------INSERT----------------------------------------------------

INSERT INTO "Students"(username, "password", is_new, age, created, updated) VALUES(N'Miloš', 'Heslo', TRUE, 23, '18.8.2023', '18.9.2023');
INSERT INTO "Students"(username, "password", is_new, age, created, updated) VALUES(N'Jerguš', 'Heslo', TRUE, 23, '18.8.2023', '18.9.2023');
INSERT INTO "Students"(username, "password", is_new, age, created, updated) VALUES(N'Maroš', 'Heslo', TRUE, 24, '18.8.2023', '18.9.2023');
INSERT INTO "Students"(username, "password", is_new, age, created, updated) VALUES(N'Ajo', 'Heslo', TRUE, 26, '18.8.2023', '18.9.2023');

---------------------------SELECT - DISTINCT--------------------------------------------------------

SELECT *
FROM "Students"

SELECT student_id, age, age/CAST(student_id AS DECIMAL) AS  delic
FROM "Students"

SELECT student_id, age, age/student_id::DECIMAL AS  delic
FROM "Students"

SELECT username, "password", username || ' HALO ' ||"password"
FROM "Students"

SELECT DISTINCT "username"
FROM "Students"

----------------------------ORDER BY - WHERE -------------------------------------------------------

SELECT username
FROM "Students"
ORDER BY username DESC

SELECT username, age
FROM "Students"
ORDER BY age ASC, "username" ASC

SELECT username, age
FROM "Students"
WHERE age > 23

SELECT username
FROM "Students"
WHERE LENGTH(username) < 4

SELECT username
FROM "Students"
WHERE username LIKE 'M%'
ORDER BY username DESC

-------------------------------LIMIT - OFFSET----------------------------------------------------

SELECT *
FROM "Students"
LIMIT 2
OFFSET 1

--------------------------------RENAME TABLE/COLUMN - UPRAV ZAZNAM - ADD COLUMN - VYPIS VSETKY COLUMN - pridanie noveho stlpca---------------------------------------------------

SELECT *
FROM "Students"

ALTER TABLE students	--RENAME TABLE
RENAME TO "Students"

ALTER TABLE "Students"		--RENAME COLUMN
RENAME COLUMN "Username" TO username

UPDATE "Students"		--UPRAV ZAZNAM
SET username = 'Jozko',
	"password" = 'heslo'
WHERE student_id = 7

ALTER TABLE "Students"
ADD COLUMN test_column VARCHAR(256);							-- pridanie noveho stlpca

SELECT column_name					-- nazov vsetkych stlpcov
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name='Students'			

----- Pridanie stlpcu ktory musi byt vyplneny(UNIQUE), ale su tam pouzivatelia tak ide error
ALTER TABLE "Students"
ADD COLUMN test_column_not_null VARCHAR(256);
-- ADD COLUMN test_column_not_null VARCHAR(256) NOT NULL; TAKTO TO NEFUNGUJE

UPDATE "Students"
SET test_column_not_null = 'x'

ALTER TABLE "Students"
ALTER COLUMN test_column_not_null SET NOT NULL

-------------------------------DELETE RIADOK - VECI Z TABULKY - TABULKU----------------------------------------------------
SELECT *
FROM "Students"

-- RIADOK
DELETE FROM "Students"
WHERE student_id > 2
RETURNING *

-- VECI Z TABULKY
DELETE FROM "Students"

-- CELU TABULKU
DROP TABLE IF EXISTS "Students"

-- to isté ako DELETE FROM, len rýchlejší + RESTART SERIAL
TRUNCATE TABLE "Students" RESTART IDENTITY



