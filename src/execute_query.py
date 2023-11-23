import sqlite3
from sqlite3 import Error
from config import settings
import sys
from pathlib import Path


def main(sql_file):
    # Get file path
    file_path = Path.cwd().parent.joinpath(settings.sql_folder, sql_file)

    # Connect to db
    conn = create_connection(settings.db_name)

    # Execute the query
    execute_query(conn, file_path)


def create_connection(path):
    connection = None
    try:
        connection = sqlite3.connect(path)
        print(f"Connection to {path} was successful")
    except Error as e:
        print(f"The error {e} as occurred")

    return connection


def execute_query(connection, sql_file):
    cursor = connection.cursor()
    with open(sql_file, "r") as file:
        query = file.read()
    try:
        cursor.execute(query)
        connection.commit()
        print(f"{sql_file} executed successfully")
    except Error as e:
        print(f"The error {e} as occurred")


if __name__ == "__main__":
    main(sys.argv[0])
