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
        "พนักงานที่ทำงานอยู่ในภูมิภาคตะวันออกมีใครบ้าง",
        "มีลูกค้าคนไหนบ้างที่อยู่ประเทศเดียวกับผู้จัดจำหน่าย",
        "สินค้าแต่ละชิ้นอยู่ในหมวดหมู่อะไร",
        "คำสั่งซื้อแต่ละรายการใช้บริษัทขนส่งเจ้าไหน",
        "ผู้จัดจำหน่ายรายไหนทำรายได้ให้บริษัทมากที่สุด",
        "สินค้าแต่ละชิ้นถูกสั่งซื้อไปกี่ครั้ง",
        "คำสั่งซื้อแต่ละรายการส่งไปประเทศไหน และเป็นของลูกค้าคนใด",
        "พนักงานคนไหนดูแลลูกค้าจากหลายประเทศมากที่สุด",
        "บริษัทขนส่งเจ้าไหนมีระยะเวลาจัดส่งเฉลี่ยช้าที่สุด",
        "มีลูกค้าคนไหนบ้างที่สั่งสินค้าชิ้นเดิมซ้ำมากกว่า 3 ครั้ง",
        "คำสั่งซื้อที่ยังไม่ได้ส่งมีของลูกค้าคนไหนบ้าง",
        "ในแต่ละภูมิภาคมีพนักงานคนไหนรับผิดชอบอยู่บ้าง",
        "พนักงานแต่ละคนรับคำสั่งซื้อล่าสุดเมื่อวันที่เท่าไร",
        "สินค้าที่ยังจำหน่ายอยู่มีอะไรบ้าง พร้อมชื่อหมวดหมู่และคำอธิบาย",
        "ลูกค้าจากประเทศเยอรมนีนิยมซื้อสินค้าอะไรมากที่สุด",
        "บริษัทขนส่งเจ้าไหนถูกใช้ส่งสินค้าให้ลูกค้ามากที่สุด",
        "มีคำสั่งซื้อรายการใดบ้างที่มีค่าขนส่งสูงแต่ส่งล่าช้า",
        "บริษัทขนส่งเจ้าไหนขนส่งสินค้าหมวดผลิตภัณฑ์นมมากที่สุด",
        "ลูกค้าคนไหนได้รับสินค้าช้ากว่ากำหนดมากที่สุด และใช้บริษัทขนส่งเจ้าไหน",
        "มีสินค้าอะไรบ้างที่ถูกสั่งซื้อมากกว่า 100 หน่วยในคำสั่งซื้อครั้งเดียว",
        "พนักงานแต่ละคนรับผิดชอบพื้นที่การทำงานใดบ้าง"
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