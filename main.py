import sqlite3
from config import settings

def main():
    # Create db if not exists
    conn = sqlite3.connect(settings.db_name)

    # Get cursor
    cur = conn.cursor()




if __name__ == "__main__":
    main()