
import psycopg2

connection = psycopg2.connect(
    host="localhost",
    database="postgres",
    port=5432,
    user="postgres",
    password="cisco"
)

cursor = connection.cursor()

cursor.execute(
    "SELECT * FROM test1;"
)

output = cursor.fetchall()
print(output)

cursor.close()
connection.close()
