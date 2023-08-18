
-- vytvorenie, vymazanie tabulky
CREATE TABLE IF NOT EXISTS "Zamestnanci"
(
	"Zamestnanec_ID" INT NOT NULL,
	"Name" VARCHAR(20) UNIQUE NOT NULL,
	"Last_name" VARCHAR(20) NOT NULL,
	age INT NOT NULL,
	revenue INT NOT NULL,
	created TIMESTAMP NOT NULL,
	CONSTRAINT "PK_Zamestnanec" PRIMARY KEY ("Zamestnanec_ID")
)

DROP TABLE IF EXISTS "Zamestnanci"

-- pridanie do tabulky
INSERT INTO "Zamestnanci" ("Zamestnanec_ID", "Name", "Last_name",  age, revenue, created)
VALUES (1, 'Jerguš', 'Xixi', 18, 1000, '18.8.2023');
INSERT INTO "Zamestnanci" ("Zamestnanec_ID", "Name", "Last_name",  age, revenue, created)
VALUES (2, 'Miloš', 'Zoxo', 20, 1600, '18.8.2023');
INSERT INTO "Zamestnanci" ("Zamestnanec_ID", "Name", "Last_name",  age, revenue, created)
VALUES (3, 'Maroš', 'LuLu', 19, 800, '18.8.2023');
INSERT INTO "Zamestnanci" ("Zamestnanec_ID", "Name", "Last_name",  age, revenue, created)
VALUES (4, 'Ferguš', 'Fekete', 26, 3000, '18.8.2023');
INSERT INTO "Zamestnanci" ("Zamestnanec_ID", "Name", "Last_name",  age, revenue, created)
VALUES (5, 'Miňo', 'xixo', 22, 1500, '18.8.2023');

SELECT *
FROM "Zamestnanci"

-- ZORADIT PODLA MENA
SELECT "Name"
FROM "Zamestnanci"
ORDER BY "Name" ASC

-- Priklad najdi 2 najviac zarabajucich diegov pod 1550€ a vydel ich revenue o 11 a zaokruhli na 2 des čisla
SELECT "Name", revenue, round(revenue/11::decimal,2) AS new_revenue
FROM "Zamestnanci"
WHERE revenue < 1550
ORDER BY revenue DESC
LIMIT 2

-- Vypis len tie unikatne mena ktore maju najviac 5 Znakov a su zoradeny podla revenue
SELECT DISTINCT "Name", revenue
FROM "Zamestnanci"
WHERE LENGTH("Name") <= 5
ORDER BY revenue DESC

-- aktualizuj zaznam v tabulke
UPDATE "Zamestnanci"
SET "Name" = 'Patrik', "Last_name" = 'Lampáš'
WHERE "Zamestnanec_ID" = 4

-- pridaj stlpec (ktory ma byt UNIQUE) , rename stlpec, rename table
SELECT *
FROM "Zamestnanci"

ALTER TABLE "Zamestnanci"	--pridaj stlpec
ADD COLUMN new_column FLOAT

UPDATE "Zamestnanci"
SET new_column = 2.3
RETURNING *

ALTER TABLE "Zamestnanci"
ALTER COLUMN new_column SET NOT NULL



ALTER TABLE "Zamestnanci"	-- rename column
RENAME COLUMN new_column TO "New_column" 

ALTER TABLE zamestnanci	-- rename table
RENAME TO "Zamestnanci"

-- Zahod riadok, tabulku a returni to, čo sa vymazalo
SELECT *
FROM "Zamestnanci"

DELETE FROM "Zamestnanci"	--vymaz riadok
WHERE "Zamestnanec_ID" = 5
RETURNING *


UPDATE "Zamestnanci"		-- vymaz stlpec (mozno zle)
SET new_column = NULL

ALTER TABLE "Zamestnanci"	
DROP COLUMN new_column 


DELETE FROM "Zamestnanci"	-- vymaz tabulku
RETURNING *











