import os
from pathlib import Path
from dotenv import load_dotenv
import psycopg

ENV_PATH = Path(__file__).resolve().parent / ".env"
load_dotenv(dotenv_path=ENV_PATH)

def get_database_url(database: str) -> str:
    db = database.lower().strip()
    if db == "northwind":
        return os.getenv("LOCAL_NORTHWIND_URL")
    elif db == "ardine":
        return os.getenv("LOCAL_ARDINE_URL")
    else:
        raise ValueError(f"Unknown database: {database}")

def run_sql(database: str, sql: str):
    db_url = get_database_url(database)
    with psycopg.connect(db_url) as conn:
        with conn.cursor() as cur:
            cur.execute(sql)
            if cur.description is None:
                return [], []
            columns = [desc.name for desc in cur.description]
            rows = cur.fetchall()
            return columns, rows

def validate_read_only_sql(sql: str):
    cleaned = sql.strip().lower()

    if not (cleaned.startswith("select") or cleaned.startswith("with")):
        raise ValueError("Only SELECT queries are allowed")

    blocked = ["insert ", "update ", "delete ", "drop ", "alter ", "truncate ", "create "]
    for word in blocked:
        if word in cleaned:
            raise ValueError("Unsafe SQL detected")