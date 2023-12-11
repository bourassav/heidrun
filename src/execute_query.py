import sqlite3
from sqlite3 import Error
from config import settings
import sys
from pathlib import Path
from rich import print
from sys import exit


def main(sql_file):
    # Get file path
    file_path = Path.cwd().joinpath(settings.sql_folder, sql_file)

    # Connect to db
    conn = create_connection(settings.db_name)

    # Execute the query
    execute_query(conn, file_path)

    # Close the connection
    conn.close()


def create_connection(path):
    connection = None
    try:
        connection = sqlite3.connect(path)
    except Error as e:
        print(f"[bold red]Error![/bold red] The error {e} as occurred on the query {path}")
        exit()

    return connection


def execute_query(connection, sql_file):
    cursor = connection.cursor()
    with open(sql_file, "r") as file:
        query = file.read()
    try:
        cursor.execute(query)
        connection.commit()
    except Error as e:
        print(f"[bold red]Error![/bold red] The error {e} as occurred with the {sql_file}")
        exit()


if __name__ == "__main__":
    main(sys.argv[0])
