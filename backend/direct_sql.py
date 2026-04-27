import os
from pathlib import Path
from dotenv import load_dotenv
from google import genai

load_dotenv()

client = genai.Client(api_key=os.getenv("GEMINI_API_KEY"))
MODEL_NAME = "models/gemini-2.5-flash-lite"

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

def load_full_schema(database: str) -> str:
    if database == "northwind":
        return Path("./all_tables.txt").read_text(encoding="utf-8")
    elif database == "ardine":
        return Path("./all_table_ardine.txt").read_text(encoding="utf-8")
    else:
        raise ValueError(f"Unknown database: {database}")

def generate_sql_direct(question: str, database: str):
    schema_context = load_full_schema(database)
    prompt = PROMPT_TEMPLATE.format(schema_context=schema_context, question=question)

    response = client.models.generate_content(
        model=MODEL_NAME,
        contents=prompt
    )

    sql = clean_sql(response.text)
    usage = response.usage_metadata
    input_tokens = usage.prompt_token_count if usage else 0
    output_tokens = usage.candidates_token_count if usage else 0

    return sql, input_tokens, output_tokens