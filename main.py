import sqlite3
from config import settings

def main():
    # Create db if not exists
    sqlite3.connect(settings.db_name)

if __name__ == "__main__":
    main()