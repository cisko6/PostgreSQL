
import psycopg2

vysl = input("Zadaj heslo: ")

connection = psycopg2.connect(
    host="localhost",
    database="postgres",
    port=5432,
    user="postgres",
    password=vysl
)

cursor = connection.cursor()

cursor.execute(
    "SELECT * FROM test1;"
)

output = cursor.fetchall()
print(output)

cursor.close()
connection.close()
