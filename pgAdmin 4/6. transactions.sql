DROP TABLE IF EXISTS account;

CREATE TABLE account (
	account_id SERIAL PRIMARY KEY,
	username VARCHAR(128) NOT NULL,
	balance INT NOT NULL
);

INSERT INTO account(username, balance) VALUES ('Miso', 120);
INSERT INTO account(username, balance) VALUES ('Jano', 150);
INSERT INTO account(username, balance) VALUES ('Fero', 150);

SELECT *
FROM account

-- toto nie je transakcia - vykonali sa sekvenčne (za sebou)
UPDATE account
SET balance = balance + 20
WHERE account_id = 1

UPDATE account
SET balance = balance - 20
WHERE account_id = 2

-- TRANSAKCIA - BEGIN, COMMIT, ROLLBACK
SELECT *
FROM account

BEGIN;
UPDATE account
SET balance = balance + 20
WHERE account_id = 1;

UPDATE account
SET balance = balance - 20
WHERE account_id = 2;
COMMIT;-- ROLLBACK - nič sa nestane keď to tam dáme (pri skriptoch v pythone sa využije)

