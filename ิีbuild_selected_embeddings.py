from __future__ import annotations

import json
from pathlib import Path
from typing import List, Dict, Any, Optional

from sentence_transformers import SentenceTransformer

# -----------------------------
# CONFIG
# -----------------------------
MODEL_NAME = "intfloat/multilingual-e5-base"
SCHEMA_DOCS_DIR = Path("schema_docs")
OUTPUT_FILE = Path("schema_docs/embedded_schema_docs.json")

# ถ้าเป็น None = embed ทุกไฟล์ .txt ยกเว้น all_tables.txt
# ถ้าต้องการเลือกบางไฟล์ ให้ใส่ชื่อ table ตามนี้ เช่น:
# SELECTED_TABLES = ["customers", "orders", "order_details"]
SELECTED_TABLES: Optional[List[str]] = None


def load_schema_docs(
    schema_dir: Path,
    selected_tables: Optional[List[str]] = None
) -> List[Dict[str, str]]:
    """
    โหลดไฟล์ .txt รายตารางจาก schema_docs/
    - ข้าม all_tables.txt
    - ถ้า selected_tables ไม่เป็น None จะโหลดเฉพาะไฟล์ที่ระบุ
    """
    if not schema_dir.exists():
        raise FileNotFoundError(f"ไม่พบโฟลเดอร์: {schema_dir}")

    docs: List[Dict[str, str]] = []

    # normalize ชื่อ table ที่เลือก
    selected_set = set(selected_tables) if selected_tables else None

    for path in sorted(schema_dir.glob("*.txt")):
        if path.name == "all_tables.txt":
            continue

        table_name = path.stem

        if selected_set is not None and table_name not in selected_set:
            continue

        content = path.read_text(encoding="utf-8").strip()
        if not content:
            continue

        docs.append({
            "table_name": table_name,
            "content": content
        })

    if not docs:
        if selected_tables:
            raise RuntimeError(
                f"ไม่พบไฟล์ table docs ตามที่เลือก: {selected_tables}"
            )
        raise RuntimeError("ไม่พบไฟล์ table docs สำหรับทำ embedding")

    return docs


def build_model(model_name: str) -> SentenceTransformer:
    """
    โหลด embedding model
    """
    return SentenceTransformer(model_name)


def embed_documents(
    model: SentenceTransformer,
    docs: List[Dict[str, str]]
) -> List[Dict[str, Any]]:
    """
    ทำ embedding สำหรับเอกสาร schema
    E5 ควรใช้ prefix 'passage:'
    """
    texts = [f"passage: {doc['content']}" for doc in docs]

    vectors = model.encode(
        texts,
        normalize_embeddings=True,
        convert_to_numpy=True,
        show_progress_bar=True
    )

    embedded_docs: List[Dict[str, Any]] = []
    for doc, vec in zip(docs, vectors):
        embedded_docs.append({
            "table_name": doc["table_name"],
            "content": doc["content"],
            "embedding": vec.tolist()
        })

    return embedded_docs


def save_embeddings(data: List[Dict[str, Any]], output_file: Path) -> None:
    """
    บันทึก embeddings เป็น JSON
    """
    output_file.parent.mkdir(parents=True, exist_ok=True)
    output_file.write_text(
        json.dumps(data, ensure_ascii=False, indent=2),
        encoding="utf-8"
    )


def main() -> None:
    print(f"Loading model: {MODEL_NAME}")
    model = build_model(MODEL_NAME)

    print("Loading selected schema docs...")
    docs = load_schema_docs(SCHEMA_DOCS_DIR, SELECTED_TABLES)

    print(f"Found {len(docs)} docs:")
    for doc in docs:
        print(f"- {doc['table_name']}")

    print("Building embeddings...")
    embedded_docs = embed_documents(model, docs)

    print(f"Saving to: {OUTPUT_FILE}")
    save_embeddings(embedded_docs, OUTPUT_FILE)

    print("Done.")


if __name__ == "__main__":
    main()