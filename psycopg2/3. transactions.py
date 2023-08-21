
import psycopg2.extras
from psycopg2 import sql
import sys


def get_balance(cursor, table, account_id):
    try:
        sql_command = sql.SQL(
            """
            SELECT * FROM {table}
            ORDER BY {account_id}
            """
        ).format(
            table=sql.Identifier(table),
            account_id=sql.Identifier(account_id)
        )
        cursor.execute(sql_command)
        output = cursor.fetchall()
        print(output)
    except Exception as e:
        print(f"Nastala chyba pri získavaní balancu. Robim ROLLBACK.\nChyba: {e}")
        connection.rollback()
        sys.exit(1)


def pridaj_balance(connection, cursor, table_name, account_id_col, balance_col, account_id1, account_id2, pocet):
    try:
        sql_command = sql.SQL(
            """
            UPDATE {table_name}
            SET {balance_col} = {balance_col} + {pocet}
            WHERE {account_id_col} = {account_id1};

            UPDATE {table_name}
            SET {balance_col} = {balance_col} - {pocet}
            WHERE {account_id_col} = {account_id2};
            """
        ).format(
            table_name=sql.Identifier(table_name),
            balance_col=sql.Identifier(balance_col),
            account_id_col=sql.Identifier(account_id_col),
            account_id1=sql.Literal(account_id1),
            account_id2=sql.Literal(account_id2),
            pocet=sql.Literal(pocet)
        )
        cursor.execute(sql_command)
        connection.commit()
        print(f"Bolo úspešne pridaných {pocet} euri z účtu s ID {account_id1} a odobratých z účtu s ID {account_id2}")
    except Exception as e:
        print(f"Nastala chyba pri transakcii. Robim ROLLBACK.\nChyba: {e}")
        connection.rollback()
        sys.exit(0)


if __name__ == "__main__":
    vysl = input("Zadaj heslo: ")

    connection = psycopg2.connect(
        host="localhost",
        database="postgres",
        port=5432,
        user="postgres",
        password=vysl
    )

    cursor = connection.cursor(cursor_factory=psycopg2.extras.DictCursor)  # DICTIONARY VYSTUP

    # názvy Identifikátorov
    table = "account"
    account_id = "account_id"
    balance_col = "balance"
    # názvy Literálov
    account_id1 = 2
    account_id2 = 1
    pocet = 50

    get_balance(cursor, table, account_id)
    pridaj_balance(connection, cursor, table, account_id, balance_col, account_id1, account_id2, pocet)
    get_balance(cursor, table, account_id)

    cursor.close()
    connection.close()
