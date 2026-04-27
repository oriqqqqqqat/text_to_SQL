import os
from pathlib import Path
from dotenv import load_dotenv
from sentence_transformers import SentenceTransformer
from google import genai
import psycopg

load_dotenv()

embed_model = SentenceTransformer("intfloat/multilingual-e5-base")
client = genai.Client(api_key=os.getenv("GEMINI_API_KEY"))
MODEL_NAME = "models/gemini-2.5-flash"

PROMPT_TEMPLATE = """You are a PostgreSQL expert.
Use ONLY the database schema provided below.
Write exactly ONE PostgreSQL query that answers the question.
Return SQL only.
Do not include explanations.
Do not include markdown fences.
Do not include comments.
Do not invent tables or columns that are not in the schema.
Use explicit JOIN syntax when appropriate.

Schema:
{schema_context}

Question: {question}
"""

def clean_sql(text: str) -> str:
    return text.strip().replace("```sql", "").replace("```", "").strip()

def get_database_url(database: str) -> str:
    if database == "northwind":
        return os.getenv("LOCAL_NORTHWIND_URL")
    elif database == "ardine":
        return os.getenv("LOCAL_ARDINE_URL")
    else:
        raise ValueError(f"Unknown database: {database}")

def get_vector_table(database: str) -> str:
    if database == "northwind":
        return "schema_embeddings"
    elif database == "ardine":
        return "schema_ardine_short"
    else:
        raise ValueError(f"Unknown database: {database}")

def retrieve_schema(question: str, database: str, top_k: int = 5):
    embedding = embed_model.encode(f"query: {question}").tolist()
    db_url = get_database_url(database)
    vector_table = get_vector_table(database)

    with psycopg.connect(db_url) as conn:
        with conn.cursor() as cur:
            cur.execute(
                f"""
                SELECT table_name, content
                FROM {vector_table}
                ORDER BY embedding <=> %s::vector
                LIMIT %s
                """,
                (embedding, top_k)
            )
            rows = cur.fetchall()

    retrieved_tables = [row[0] for row in rows]
    schema_context = "\n\n---\n\n".join([row[1] for row in rows])

    return schema_context, retrieved_tables

def generate_sql_rag(question: str, database: str):
    schema_context, retrieved_tables = retrieve_schema(question, database, top_k=5)
    prompt = PROMPT_TEMPLATE.format(schema_context=schema_context, question=question)

    response = client.models.generate_content(
        model=MODEL_NAME,
        contents=prompt
    )

    sql = clean_sql(response.text)
    usage = response.usage_metadata
    input_tokens = usage.prompt_token_count if usage else 0
    output_tokens = usage.candidates_token_count if usage else 0

    return sql, input_tokens, output_tokens, retrieved_tables