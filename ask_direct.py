import os
from pathlib import Path
from datetime import datetime
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
    input_tokens  = usage.prompt_token_count     if usage else 0
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
        "question"     : question,
        "sql"          : sql,
        "result"       : result,
        "status"       : status,
        "input_tokens" : input_tokens,
        "output_tokens": output_tokens,
        "total_tokens" : input_tokens + output_tokens
    }


def save_results(results, output_file):
    lines = []
    lines.append(f"Text-to-SQL Results")
    lines.append(f"Schema: all_tables.txt")
    lines.append(f"Model : {MODEL_NAME}")
    lines.append(f"Date  : {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("=" * 60)

    total_tokens_all = 0

    for i, r in enumerate(results, 1):
        lines.append(f"\n[{i}] Q: {r['question']}")
        lines.append(f"    SQL:\n{r['sql']}")
        lines.append(f"    Result: {r['result']}")
        lines.append(f"    Status: {r['status']}")
        lines.append(f"    Tokens: total={r['total_tokens']}  input={r['input_tokens']}  output={r['output_tokens']}")
        lines.append("-" * 60)
        total_tokens_all += r["total_tokens"]

    success = sum(1 for r in results if "✅" in r["status"])
    fail    = len(results) - success

    lines.append(f"\nSummary")
    lines.append(f"  Total questions : {len(results)}")
    lines.append(f"  Success         : {success}")
    lines.append(f"  Failed          : {fail}")
    lines.append(f"  Accuracy        : {success/len(results)*100:.1f}%")
    lines.append(f"  Total tokens    : {total_tokens_all}")
    lines.append(f"  Avg tokens/Q    : {total_tokens_all//len(results)}")

    with open(output_file, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(f"\n📁 บันทึกแล้ว → {output_file}")


if __name__ == "__main__":
    questions = [
        "พนักงานที่ทำงานใน region Eastern มีใครบ้าง",
        "ลูกค้าที่อยู่ใน country เดียวกับ supplier มีใครบ้าง",
        "สินค้าแต่ละชิ้นอยู่ใน category อะไร",
        "order แต่ละอันใช้บริษัทขนส่งไหน",
        "supplier รายไหนทำรายได้ให้บริษัทมากที่สุด",
        "สินค้าแต่ละชิ้นถูกสั่งซื้อกี่ครั้ง",
        "order ที่ส่งไปยังประเทศไหนบ้าง และลูกค้าคือใคร",
        "พนักงานคนไหนที่ดูแลลูกค้าจากหลายประเทศมากที่สุด",
        "บริษัทขนส่งไหนที่ส่งของช้าเฉลี่ยมากที่สุด",
        "ลูกค้าที่สั่งซื้อสินค้าชิ้นเดิมซ้ำมากกว่า 3 ครั้งมีใครบ้าง",
        "order ที่ยังไม่ได้ส่ง ลูกค้าคือใคร",
        "แต่ละ region มีพนักงานคนไหนรับผิดชอบ",
        "พนักงานแต่ละคนรับ order ล่าสุดเมื่อไหร่",
        "สินค้าที่ยังจำหน่ายอยู่มีอะไรบ้าง พร้อมชื่อ category และคำอธิบาย",
        "สินค้าที่ลูกค้าจาก Germany นิยมซื้อมากที่สุด",
        "บริษัทขนส่งที่ใช้ส่งของไปให้ลูกค้ามากที่สุด",
        "order ที่ถูกจัดส่งโดยใช้ shipper ที่แพงที่สุดแต่ยังส่งช้า",
        "บริษัทขนส่งที่ขนสินค้า category Dairy Products มากที่สุด",
        "ลูกค้าที่ได้รับสินค้าช้ากว่ากำหนดมากที่สุด และใช้ shipper ไหน",
        "สินค้าที่ถูกสั่งซื้อมากกว่า 100 หน่วยใน order เดียว",
        "หา work region ของพนักงาน"
    ]

    all_results = []

    for q in questions:
        result = ask(q)
        all_results.append(result)

        print(f"\nQ: {result['question']}")
        print(f"SQL: {result['sql']}")
        print(f"Result: {result['result']}")
        print(f"Status: {result['status']}")
        print(f"Tokens: {result['total_tokens']} (in: {result['input_tokens']}, out: {result['output_tokens']})")
        print("-" * 60)

    # บันทึกผลลัพธ์ทั้งหมดลงไฟล์
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    save_results(all_results, f"results_all_tables_{timestamp}.txt")