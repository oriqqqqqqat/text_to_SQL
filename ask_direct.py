import os
from pathlib import Path
from google import genai
import psycopg2
from dotenv import load_dotenv

load_dotenv()

client = genai.Client(api_key=os.getenv("GEMINI_API_KEY"))
MODEL_NAME = "models/gemini-2.5-flash"


def get_db_connection():
    return psycopg2.connect(
        host=os.getenv("DB_HOST"),
        port=os.getenv("DB_PORT"),
        dbname=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD")
    )


def load_schema_text():
    return Path("./all_tables.txt").read_text(encoding="utf-8")


def ask(question):
    schema_text = load_schema_text()

    prompt = f"""
You are a PostgreSQL expert. Given this Northwind database schema:

{schema_text}

Write a PostgreSQL query ONLY.
No explanation.
No markdown.
Question: {question}
"""

    response = client.models.generate_content(
        model=MODEL_NAME,
        contents=prompt
    )

    sql = response.text.strip().replace("```sql", "").replace("```", "").strip()

    usage = response.usage_metadata
    input_tokens = usage.prompt_token_count if usage else 0
    output_tokens = usage.candidates_token_count if usage else 0

    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute(sql)
        result = cur.fetchall()
        cur.close()
        conn.close()
        status = "✅ Success"
    except Exception as e:
        result = []
        status = f"❌ Error: {e}"

    return {
        "question": question,
        "sql": sql,
        "result": result,
        "status": status,
        "input_tokens": input_tokens,
        "output_tokens": output_tokens,
        "total_tokens": input_tokens + output_tokens
    }


if __name__ == "__main__":
    questions = [
        "พนักงานที่ทำงานใน region Eastern มีใครบ้าง",
        "ลูกค้าที่อยู่ใน country เดียวกับ supplier มีใครบ้าง",
        "สินค้าที่ราคาแพงที่สุดคืออะไร",
        "มี order กี่รายการที่ยังไม่ได้จัดส่ง",
        "supplier รายไหนทำรายได้ให้บริษัทมากที่สุด",
        "สินค้าชิ้นไหนที่ใกล้หมด stock แล้ว",
        "order ที่ใช้เวลาจัดส่งนานที่สุดคือ order ไหน และใช้เวลากี่วัน",
        "พนักงานคนไหนที่ดูแลลูกค้าจากหลายประเทศมากที่สุด",
        "บริษัทขนส่งไหนที่ส่งของช้าเฉลี่ยมากที่สุด",
        "ลูกค้าที่สั่งซื้อสินค้าชิ้นเดิมซ้ำมากกว่า 3 ครั้งมีใครบ้าง",
        "order ไหนบ้างที่มีสินค้ามากกว่า 5 รายการใน order",
        "แต่ละ region มีพนักงานคนไหนรับผิดชอบ"
    ]

    for q in questions:
        result = ask(q)
        print(f"\nQ: {result['question']}")
        print(f"SQL: {result['sql']}")
        print(f"Result: {result['result']}")
        print(f"Status: {result['status']}")
        print(f"Tokens: {result['total_tokens']} (in: {result['input_tokens']}, out: {result['output_tokens']})")
        print("-" * 60)