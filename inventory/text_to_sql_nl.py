import os
from google import genai
import psycopg2
from dotenv import load_dotenv

load_dotenv()

# -------------------------
# ตั้งค่า Gemini
# -------------------------
client = genai.Client(api_key=os.getenv("GEMINI_API_KEY"))
MODEL_NAME = "models/gemini-2.5-flash"

# -------------------------
# ตั้งค่า PostgreSQL
# -------------------------
def get_db_connection():
    return psycopg2.connect(
        host=os.getenv("DB_HOST"),
        port=os.getenv("DB_PORT"),
        dbname=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD")
    )

# -------------------------
# Schema Northwind
# -------------------------
SCHEMA = """
customers(customer_id, company_name, contact_name, city, country)
orders(order_id, customer_id, employee_id, order_date, ship_via)
order_details(order_id, product_id, unit_price, quantity, discount)
products(product_id, product_name, supplier_id, category_id, unit_price)
categories(category_id, category_name)
employees(employee_id, first_name, last_name, title)
suppliers(supplier_id, company_name, country)
shippers(shipper_id, company_name)
"""

# -------------------------
# Step 1: แปลงคำถาม → SQL
# -------------------------
def generate_sql(question: str) -> tuple[str, int, int]:
    prompt = f"""
You are a PostgreSQL expert. Given this schema:
{SCHEMA}
Write a PostgreSQL query ONLY.
No explanation.
No markdown.
Question: {question}
"""
    response = client.models.generate_content(
        model=MODEL_NAME,
        contents=prompt
    )

    sql = response.text.strip()
    sql = sql.replace("```sql", "").replace("```", "").strip()

    usage = response.usage_metadata
    input_tokens = usage.prompt_token_count if usage else 0
    output_tokens = usage.candidates_token_count if usage else 0

    return sql, input_tokens, output_tokens


# -------------------------
# Step 2: รัน SQL → ได้ผลลัพธ์ดิบ
# -------------------------
def execute_sql(sql: str) -> tuple[list, list, str]:
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute(sql)

        # ดึง column names
        columns = [desc[0] for desc in cur.description]
        rows = cur.fetchall()

        cur.close()
        conn.close()
        return columns, rows, "✅ Success"

    except Exception as e:
        return [], [], f"❌ Error: {e}"


# -------------------------
# Step 3: แปลงผลลัพธ์ → ภาษาธรรมชาติ
# -------------------------
def generate_answer(question: str, sql: str, columns: list, rows: list) -> tuple[str, int, int]:
    if not rows:
        return "ไม่พบข้อมูลที่เกี่ยวข้อง", 0, 0

    # จัดรูปแบบข้อมูลให้ LLM เข้าใจง่าย
    formatted_rows = []
    for row in rows:
        formatted_rows.append(dict(zip(columns, row)))

    prompt = f"""
คุณคือ AI ที่ช่วยสรุปผลลัพธ์จากฐานข้อมูล

คำถามของผู้ใช้: {question}

SQL ที่ใช้ดึงข้อมูล:
{sql}

ผลลัพธ์ทั้งหมด ({len(rows)} แถว):
{formatted_rows}

กรุณาสรุปคำตอบเป็นภาษาไทยที่เข้าใจง่าย โดย:
- ตอบตรงคำถามที่ถาม
- ระบุตัวเลขหรือข้อมูลสำคัญ
- กระชับ ไม่เกิน 5 บรรทัด
"""

    response = client.models.generate_content(
        model=MODEL_NAME,
        contents=prompt
    )

    answer = response.text.strip()

    usage = response.usage_metadata
    input_tokens = usage.prompt_token_count if usage else 0
    output_tokens = usage.candidates_token_count if usage else 0

    return answer, input_tokens, output_tokens


# -------------------------
# Main Function
# -------------------------
def ask(question: str) -> dict:
    total_input_tokens = 0
    total_output_tokens = 0

    # Step 1: สร้าง SQL
    sql, in_tok, out_tok = generate_sql(question)
    total_input_tokens += in_tok
    total_output_tokens += out_tok

    # Step 2: รัน SQL
    columns, rows, status = execute_sql(sql)

    # Step 3: แปลงเป็นภาษาธรรมชาติ
    if "✅" in status:
        answer, in_tok, out_tok = generate_answer(question, sql, columns, rows)
        total_input_tokens += in_tok
        total_output_tokens += out_tok
    else:
        answer = "ไม่สามารถสรุปผลได้เนื่องจาก SQL มีข้อผิดพลาด"

    return {
        "question": question,
        "sql": sql,
        "columns": columns,
        "result_raw": rows,             # ← ผลลัพธ์ดิบจาก SQL ครบทุกแถว
        "result_count": len(rows),
        "answer": answer,               # ← คำตอบภาษาธรรมชาติ
        "status": status,
        "input_tokens": total_input_tokens,
        "output_tokens": total_output_tokens,
        "total_tokens": total_input_tokens + total_output_tokens
    }


# -------------------------
# แสดงผล
# -------------------------
def print_result(res: dict):
    print("\n" + "=" * 60)
    print(f"❓ คำถาม: {res['question']}")
    print(f"\n🔍 SQL:\n{res['sql']}")
    print(f"\nStatus: {res['status']}")

    # แสดง Raw Result จาก SQL
    print(f"\n📊 Raw Result ({res['result_count']} แถว):")
    if res['columns'] and res['result_raw']:
        col_width = 22
        # Header
        print("  " + " | ".join(str(col).ljust(col_width) for col in res['columns']))
        print("  " + "-" * ((col_width + 3) * len(res['columns'])))
        # Rows
        for row in res['result_raw']:
            print("  " + " | ".join(str(val).ljust(col_width) for val in row))
    else:
        print("  ไม่มีข้อมูล")

    # แสดง Natural Language Answer
    print(f"\n💬 คำตอบภาษาธรรมชาติ:\n{res['answer']}")

    print(f"\n🔢 Tokens: {res['total_tokens']} "
          f"(in: {res['input_tokens']}, out: {res['output_tokens']})")
    print("=" * 60)


# -------------------------
# ทดสอบ
# -------------------------
if __name__ == "__main__":
    questions = [
        "มีจำนวน product ประเภท Dairy Products กี่ชิ้น"
    ]

    for q in questions:
        result = ask(q)
        print_result(result)