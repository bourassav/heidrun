import sqlite3
from config import settings

def main():
    # Create db if not exists
    sqlite3.connect(settings.db_name)

    # Create tables if not exits
    

if __name__ == "__main__":
    main()