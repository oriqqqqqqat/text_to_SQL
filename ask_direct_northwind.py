import os
from pathlib import Path
from datetime import datetime
from google import genai
import psycopg2
from dotenv import load_dotenv

load_dotenv()

MODEL_NAME = "models/gemini-2.5-flash"
SCHEMA_FILE = "./all_tables.txt"

PROMPT_TEMPLATE = """You are a PostgreSQL expert for the Northwind database.

Use ONLY the database schema provided below.
Write exactly ONE PostgreSQL query that answers the question.
Return SQL only.
Do not include explanations.
Do not include markdown fences.
Do not invent tables or columns that are not in the schema.

Schema:
{schema_context}

Question: {question}
"""

QUESTIONS = [
"พนักงานที่ดูแลพื้นที่ในภูมิภาคฝั่งตะวันออกมีใครบ้าง",
"ลูกค้าที่อยู่ในประเทศเดียวกับผู้จัดจำหน่ายมีใครบ้าง",
"สินค้าแต่ละชิ้นอยู่ในหมวดหมู่สินค้าใด",
"คำสั่งซื้อแต่ละรายการใช้บริษัทขนส่งใด",
"คำสั่งซื้อแต่ละรายการจัดส่งไปยังประเทศใด และเป็นของลูกค้าคนใด",
"ในแต่ละภูมิภาคมีพนักงานคนใดรับผิดชอบอยู่บ้าง",
"ลูกค้าแต่ละรายมีพนักงานคนใดเป็นผู้ดูแล",
"สินค้าแต่ละชิ้นมาจากผู้จัดจำหน่ายรายใด",
"สินค้าแต่ละชิ้นถูกสั่งซื้อทั้งหมดกี่ครั้ง",
"บริษัทขนส่งใดมีค่าเฉลี่ยการจัดส่งล่าช้ามากที่สุด",
"ลูกค้าคนใดสั่งซื้อสินค้าชนิดเดิมซ้ำมากกว่า 3 ครั้ง",
"คำสั่งซื้อใดบ้างที่ยังไม่ได้จัดส่ง และเป็นของลูกค้าคนใด",
"พนักงานแต่ละคนได้รับมอบหมายคำสั่งซื้อล่าสุดเมื่อใด",
"สินค้าที่ยังมีจำหน่ายอยู่มีอะไรบ้าง พร้อมชื่อหมวดหมู่และคำอธิบายสินค้า",
"บริษัทขนส่งใดถูกใช้จัดส่งสินค้าให้ลูกค้ามากที่สุด",
"คำสั่งซื้อใดบ้างที่ใช้บริษัทขนส่งที่มีค่าขนส่งสูงที่สุดและยังจัดส่งล่าช้า",
"สินค้าใดบ้างที่ถูกสั่งซื้อเกิน 100 หน่วยภายในคำสั่งซื้อเดียว",
"คำสั่งซื้อใดบ้างที่จัดส่งช้ากว่าวันที่กำหนดเกิน 7 วัน",
"บริษัทขนส่งใดบ้างที่จัดส่งตรงเวลาทุกครั้งและไม่เคยล่าช้า",
"ลูกค้าคนใดกลับมาซื้อสินค้าชนิดเดิมซ้ำอีก",
"ประเทศใดเป็นตลาดที่สร้างมูลค่ารวมให้บริษัทสูงที่สุด",
"ลูกค้าคนใดซื้อกับบริษัทอย่างต่อเนื่องมากที่สุด",
"ผู้จัดจำหน่ายรายใดสร้างรายได้รวมให้บริษัทมากที่สุด",
"พนักงานคนใดดูแลลูกค้าจากหลายประเทศมากที่สุด",
"สินค้าใดเป็นสินค้าที่ลูกค้าจากประเทศเยอรมนีนิยมซื้อมากที่สุด",
"บริษัทขนส่งใดขนส่งสินค้ากลุ่มผลิตภัณฑ์นมมากที่สุด",
"ลูกค้าคนใดได้รับสินค้าล่าช้ากว่ากำหนดมากที่สุด และใช้บริษัทขนส่งใด",
"ลูกค้าคนใดสร้างรายได้รวมสูงที่สุด และสินค้าที่ลูกค้าคนนั้นซื้อบ่อยที่สุดคืออะไร",
"หมวดหมู่สินค้าใดสร้างรายได้รวมสูงที่สุด แต่มีจำนวนสินค้าน้อยกว่าค่าเฉลี่ยของทุกหมวดหมู่",
"ผู้จัดจำหน่ายรายใดมีจำนวนสินค้าที่ขายได้มากที่สุด และขายให้ลูกค้ากี่ประเทศ"
]

client = genai.Client(api_key=os.getenv("GEMINI_API_KEY"))


def get_db_connection():
    return psycopg2.connect(
        host=os.getenv("DB_HOST"),
        port=os.getenv("DB_PORT"),
        dbname=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
    )


def load_schema_text():
    return Path(SCHEMA_FILE).read_text(encoding="utf-8")


def build_prompt(question: str, schema_context: str) -> str:
    return PROMPT_TEMPLATE.format(schema_context=schema_context, question=question)


def clean_sql(text: str) -> str:
    return text.strip().replace("```sql", "").replace("```", "").strip()


def ask(question: str):
    schema_text = load_schema_text()
    prompt = build_prompt(question, schema_text)

    response = client.models.generate_content(
        model=MODEL_NAME,
        contents=prompt,
    )

    sql = clean_sql(response.text)

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
        "total_tokens": input_tokens + output_tokens,
    }


def save_results(results, output_file):
    lines = []
    lines.append("Text-to-SQL Results (Direct)")
    lines.append(f"Schema: {SCHEMA_FILE}")
    lines.append(f"Model : {MODEL_NAME}")
    lines.append(f"Date  : {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("=" * 60)

    total_tokens_all = 0

    for i, r in enumerate(results, 1):
        lines.append(f"\n[{i}] Q: {r['question']}")
        lines.append(f"    SQL:\n{r['sql']}")
        lines.append(f"    Result: {r['result']}")
        lines.append(f"    Status: {r['status']}")
        lines.append(
            f"    Tokens: total={r['total_tokens']}  input={r['input_tokens']}  output={r['output_tokens']}"
        )
        lines.append("-" * 60)
        total_tokens_all += r["total_tokens"]

    success = sum(1 for r in results if "✅" in r["status"])
    fail = len(results) - success

    lines.append("\nSummary")
    lines.append(f"  Total questions : {len(results)}")
    lines.append(f"  Success         : {success}")
    lines.append(f"  Failed          : {fail}")
    lines.append(f"  Accuracy        : {success / len(results) * 100:.1f}%")
    lines.append(f"  Total tokens    : {total_tokens_all}")
    lines.append(f"  Avg tokens/Q    : {total_tokens_all // len(results)}")

    with open(output_file, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(f"\n📁 บันทึกแล้ว → {output_file}")


if __name__ == "__main__":
    all_results = []

    for q in QUESTIONS:
        result = ask(q)
        all_results.append(result)

        print(f"\nQ: {result['question']}")
        print(f"SQL: {result['sql']}")
        print(f"Result: {result['result']}")
        print(f"Status: {result['status']}")
        print(f"Tokens: {result['total_tokens']} (in: {result['input_tokens']}, out: {result['output_tokens']})")
        print("-" * 60)

    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    save_results(all_results, f"results_northwind_direct_{timestamp}.txt")
