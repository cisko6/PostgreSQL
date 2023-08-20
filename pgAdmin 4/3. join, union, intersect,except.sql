
CREATE TABLE test1
(
	user_id INT PRIMARY KEY,
	username VARCHAR(20) NOT NULL
);

CREATE TABLE test2
(
	user_id INT PRIMARY KEY,
	username VARCHAR(20) NOT NULL
);

DROP TABLE test1;
DROP TABLE test2;

SELECT * 
FROM test1

SELECT * 
FROM test2

INSERT INTO test1 (user_id, username)
VALUES	(1, 'Patrik'),
		(2, 'Matej'),
		(3, 'Diego'),
		(4, 'Fero'),
		(5, 'Miso'),
		(6, 'Milan');

INSERT INTO test2 (user_id, username)
VALUES	(1, 'Miso'),
		(2, 'Jergus'),
		(3, 'Maros'),
		(4, 'Fero'),
		(5, 'Patrik'),
		(6, 'Julo');

-------------------------TYPY JOINOV---------------------------------------------

-- PRIENIK DVOCH TABULIEK
SELECT *
FROM test1
INNER JOIN test2
	ON test1.username=test2.username

-- prva tabulka s menami -> zisti či su aj v druhej tabulke tie mena
SELECT *
FROM test1
LEFT JOIN test2
	ON test1.username=test2.username
	
-- Vsetky mena z prvej tabulky v porovnani s druhou - potom tie co neboli vypisane z druhej tabulky sa daju na koniec tabulky ako null
SELECT * 
FROM test1
FULL OUTER JOIN test2
	ON test1.username=test2.username
	
-- spraví všetky kombinacie z prvej a druhej tabulky (useless?)
SELECT *
FROM test1
CROSS JOIN test2

-------------------------UNION, INTERSELECT, EXCEPT----------------------------------------------
-- UNION - spoji 2 tabulky s tym, že riadky nahodne usporiada (zjednotenie)
SELECT *
FROM test1
UNION
SELECT *
FROM test2

-- INTERSECT - vrati iba rovnake riadky z 1 a 2 tabulky (ROVNAKE CELE RIADKY, lebo *)
SELECT *
FROM test1
INTERSECT
SELECT *
FROM test2

SELECT username
FROM test1
INTERSECT	-- vrati rovnake mena(neni *, ale username)
SELECT username
FROM test2

-- EXCEPT - (1.tabuľka-prienik) - vrati vsetko z prvej tabulky okrem prieniku
SELECT *
FROM test1
EXCEPT
SELECT *
FROM test2





