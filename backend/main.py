from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel

from db import run_sql, validate_read_only_sql
from direct_sql import generate_sql_direct
from rag_sql import generate_sql_rag

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3001"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class QueryRequest(BaseModel):
    question: str
    mode: str = "direct"
    database: str = "northwind"

@app.get("/health")
def health():
    return {"status": "ok"}

@app.post("/query")
def query(req: QueryRequest):
    try:
        if req.mode == "direct":
            sql, input_tokens, output_tokens = generate_sql_direct(req.question, req.database)
            retrieved_tables = []
        elif req.mode == "rag":
            sql, input_tokens, output_tokens, retrieved_tables = generate_sql_rag(req.question, req.database)
        else:
            raise HTTPException(status_code=400, detail="Invalid mode")

        validate_read_only_sql(sql)
        columns, rows = run_sql(req.database, sql)

        return {
            "question": req.question,
            "mode": req.mode,
            "database": req.database,
            "sql": sql,
            "columns": columns,
            "rows": rows,
            "retrieved_tables": retrieved_tables,
            "input_tokens": input_tokens,
            "output_tokens": output_tokens,
            "status": "success"
        }

    except Exception as e:
        return {
            "question": req.question,
            "mode": req.mode,
            "database": req.database,
            "sql": "",
            "columns": [],
            "rows": [],
            "retrieved_tables": [],
            "input_tokens": 0,
            "output_tokens": 0,
            "status": f"error: {str(e)}"
        }