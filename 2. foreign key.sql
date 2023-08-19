
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

CREATE TABLE faktury
(
	"Faktura_ID" INT NOT NULL,
	"Zamestnanec_ID" INT NOT NULL,
	nazov VARCHAR(20) NOT NULL,
	CONSTRAINT "PK_Faktura" PRIMARY KEY ("Faktura_ID")
	--CONSTRAINT "FK_Faktura"
	--	FOREIGN KEY ("Zamestnanec_ID") REFERENCES "Zamestnanci"("Zamestnanec_ID") ON DELETE CASCADE ON UPDATE CASCADE
)

DROP TABLE faktury 

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

INSERT INTO faktury ("Faktura_ID","Zamestnanec_ID", nazov)
VALUES (1,1,'F1')

SELECT *
FROM "Zamestnanci"

SELECT *
FROM faktury

DELETE FROM "Zamestnanci"
WHERE "Zamestnanec_ID" = 1
RETURNING *

-- Ak sme nešpecifikovali pri vytvoreni tabulky Foreign Key
ALTER TABLE faktury ADD CONSTRAINT "FK_Faktury"
	FOREIGN KEY ("Zamestnanec_ID") REFERENCES "Zamestnanci"("Zamestnanec_ID") ON DELETE CASCADE ON UPDATE CASCADE
















