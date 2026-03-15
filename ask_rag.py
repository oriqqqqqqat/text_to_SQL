from sentence_transformers import SentenceTransformer
import psycopg2
from google import genai
from dotenv import load_dotenv
import os

load_dotenv()

model = SentenceTransformer('intfloat/multilingual-e5-base')

conn = psycopg2.connect(
    host=os.getenv("DB_HOST"),
    dbname=os.getenv("DB_NAME"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    port=os.getenv("DB_PORT")
)
cur = conn.cursor()

client = genai.Client(api_key=os.getenv("GEMINI_API_KEY_RAG"))
MODEL_NAME = "models/gemini-2.5-flash"

def retrieve(question, top_k=3):
    query_embedding = model.encode(f"query: {question}").tolist()

    cur.execute("""
        SELECT table_name, content
        FROM schema_embeddings
        ORDER BY embedding <=> %s::vector
        LIMIT %s
    """, (query_embedding, top_k))

    return cur.fetchall()

def generate_sql(question):
    relevant_schemas = retrieve(question)

    print("📋 Retrieved tables:")
    for table_name, _ in relevant_schemas:
        print(f"   - {table_name}")

    context = "\n\n---\n\n".join([content for _, content in relevant_schemas])

    prompt = f"""You are a Text-to-SQL assistant for a PostgreSQL database.
Use only the schema provided to generate SQL.
Return only the SQL query, no explanation.

Schema:
{context}

Question: {question}"""

    response = client.models.generate_content(
        model=MODEL_NAME,
        contents=prompt
    )

    sql = response.text.strip()
    sql = sql.replace("```sql", "").replace("```", "").strip()

    usage = response.usage_metadata
    input_tokens  = usage.prompt_token_count     if usage else 0
    output_tokens = usage.candidates_token_count if usage else 0

    return sql, input_tokens, output_tokens

# ทดสอบ
if __name__ == "__main__":
    questions = [
        "ยอดขายรวมแต่ละ category เป็นเท่าไหร่"
    ]

    for question in questions:
        print("=" * 60)
        print(f"❓ Question : {question}\n")

        sql, input_tokens, output_tokens = generate_sql(question)
        total_tokens = input_tokens + output_tokens

        print(f"\n📄 SQL      :\n{sql}\n")

        try:
            cur.execute(sql)
            result = cur.fetchall()
            print(f"📊 Result   : {result}")
            print(f"🔖 Status   : ✅ Success")
        except Exception as e:
            print(f"📊 Result   : []")
            print(f"🔖 Status   : ❌ Error: {e}")

        print(f"🔢 Tokens   : total={total_tokens}  "
              f"input={input_tokens}  "
              f"output={output_tokens}")
        print("=" * 60)

    cur.close()
    conn.close()