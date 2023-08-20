
import psycopg2
import psycopg2.extras
from psycopg2 import sql

vysl = input("Zadaj heslo: ")

connection = psycopg2.connect(
    host="localhost",
    database="postgres",
    port=5432,
    user="postgres",
    password=vysl
)

#student_id = "1 OR 1=1" # SQL INJECTION ATTACK
student_id = "1"

# this cursor factory creates a cursor that returns query results as dictionaries, where each row of
# the result is represented as a dictionary with column names as keys and corresponding values from the row as values.
# This can be quite convenient when you want to access the data using column names instead of just numerical indices.
# for row in rows:
#     print(row[0], row[1])  # Access columns using indices
# for row in rows:
#     print(row['column1'], row['column2'])  # Access columns using column names
cursor = connection.cursor(cursor_factory=psycopg2.extras.DictCursor)  # DICTIONARY VYSTUP

# ZLE VOCI SQL INJECTION
#cursor.execute("SELECT * FROM students WHERE student_id="+student_id)
#cursor.execute(f"SELECT * FROM students WHERE student_id={student_id}")

# DOBRE VOCI SQL INJECTION - spravny zapis query
# prvý spôsob - literal
#cursor.execute("SELECT * FROM students WHERE student_id=%s", (student_id, ))
#cursor.execute("SELECT * FROM students WHERE student_id=%(student_id)s", {"student_id": student_id})

#druhý spôsob - vediet rozdiel medzi literalom a identifikatorom
table = "students"
sql_command = sql.SQL(
    """
    SELECT * FROM {table}
    WHERE student_id={student_id}
    """
).format(
    table=sql.Identifier(table),
    student_id=sql.Literal(student_id)
)
cursor.execute(sql_command)
output = cursor.fetchall()
print(output)

cursor.close()
connection.close()
