import re
import json
from sentence_transformers import SentenceTransformer

model = SentenceTransformer('intfloat/multilingual-e5-base')

sql_file    = "./northwind_ddl.sql"
output_file = "./embeddings_ddl.json"

# อ่านไฟล์ UTF-16
with open(sql_file, "r", encoding="utf-16") as f:
    sql_text = f.read()

# แยก CREATE TABLE แต่ละอัน
blocks = re.findall(r"CREATE TABLE.*?;", sql_text, re.DOTALL | re.IGNORECASE)

results = []

for block in blocks:
    # ดึงชื่อตาราง (ข้าม public. ออก)
    match = re.search(r"CREATE TABLE\s+(?:ONLY\s+)?(?:public\.)?(\w+)", block, re.IGNORECASE)
    if not match:
        continue

    table_name = match.group(1)
    content    = block.strip()

    embedding = model.encode(f"passage: {content}").tolist()

    results.append({
        "table_name"          : table_name,
        "content"             : content,
        "embedding_dimensions": len(embedding),
        "embedding_preview"   : embedding[:5],
        "embedding"           : embedding
    })

    print(f"✓ {table_name:30s} | dims: {len(embedding)} | preview: {[round(v, 4) for v in embedding[:3]]}")

with open(output_file, "w", encoding="utf-8") as f:
    json.dump(results, f, ensure_ascii=False, indent=2)

print(f"\nบันทึกแล้ว → {output_file}")
print(f"จำนวนตาราง: {len(results)}")