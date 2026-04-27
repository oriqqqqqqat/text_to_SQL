"use client";

import { useState } from "react";

type QueryResponse = {
  question: string;
  mode: string;
  database: string;
  sql: string;
  columns: string[];
  rows: string[][];
  retrieved_tables: string[];
  input_tokens: number;
  output_tokens: number;
  status: string;
};

export default function Home() {
  const [question, setQuestion] = useState("");
  const [mode, setMode] = useState<"direct" | "rag">("direct");
  const [database, setDatabase] = useState<"northwind" | "ardine">("northwind");
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState<QueryResponse | null>(null);
  const [error, setError] = useState("");

  const handleSubmit = async () => {
    if (!question.trim()) return;
    setLoading(true);
    setError("");
    setResult(null);

    try {
      const res = await fetch("http://127.0.0.1:8000/query", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ question, mode, database }),
      });
      const data = await res.json();
      setResult(data);
    } catch {
      setError("เชื่อมต่อ backend ไม่ได้");
    } finally {
      setLoading(false);
    }
  };

  const handleKeyDown = (e: React.KeyboardEvent<HTMLTextAreaElement>) => {
    if ((e.ctrlKey || e.metaKey) && e.key === "Enter") {
      handleSubmit();
    }
  };

  const isOk = result?.status === "ok" || result?.status === "success";

  return (
    <>
      <style>{`
        @import url('https://fonts.googleapis.com/css2?family=DM+Mono:ital,wght@0,300;0,400;0,500;1,400&family=DM+Sans:opsz,wght@9..40,300;9..40,400;9..40,500&display=swap');

        * { box-sizing: border-box; }

        .tsql-root {
          font-family: 'DM Sans', sans-serif;
          display: grid;
          grid-template-columns: 1fr 1fr;
          grid-template-rows: 100vh;
          max-width: 1360px;
          margin: 0 auto;
          color: #111;
        }

        .tsql-left {
          display: flex;
          flex-direction: column;
          padding: 3rem;
          border-right: 0.5px solid #e8e8e8;
          height: 100vh;
          overflow: hidden;
        }

        .tsql-right {
          display: flex;
          flex-direction: column;
          padding: 3rem;
          height: 100vh;
          overflow: hidden;
        }

        .tsql-header {
          display: flex;
          align-items: baseline;
          gap: 14px;
          margin-bottom: 2rem;
          flex-shrink: 0;
        }
        .tsql-header h1 {
          font-size: 22px;
          font-weight: 500;
          letter-spacing: 0.08em;
          text-transform: uppercase;
          margin: 0;
        }
        .tsql-dot {
          width: 7px;
          height: 7px;
          border-radius: 50%;
          background: #aaa;
          display: inline-block;
          flex-shrink: 0;
        }
        .tsql-sublabel {
          font-family: 'DM Mono', monospace;
          font-size: 17px;
          font-weight: 300;
          color: #aaa;
        }

        .tsql-controls {
          display: flex;
          gap: 12px;
          flex-wrap: wrap;
          margin-bottom: 18px;
          flex-shrink: 0;
        }
        .tsql-pill-group {
          display: flex;
          border: 0.5px solid #ddd;
          border-radius: 10px;
          overflow: hidden;
        }
        .tsql-pill-group button {
          font-family: 'DM Mono', monospace;
          font-size: 15px;
          letter-spacing: 0.04em;
          padding: 8px 22px;
          background: transparent;
          color: #888;
          border: none;
          border-right: 0.5px solid #ddd;
          cursor: pointer;
          transition: background 0.15s, color 0.15s;
        }
        .tsql-pill-group button:last-child { border-right: none; }
        .tsql-pill-group button.active { background: #111; color: #fff; }
        .tsql-pill-group button:not(.active):hover { background: #f5f5f5; color: #333; }

        .tsql-divider {
          height: 0.5px;
          background: #e8e8e8;
          margin: 18px 0;
          flex-shrink: 0;
        }

        .tsql-textarea {
          width: 100%;
          height: 160px;
          flex-shrink: 0;
          padding: 18px 22px;
          font-family: 'DM Sans', sans-serif;
          font-size: 20px;
          font-weight: 300;
          line-height: 1.7;
          border: 0.5px solid #ddd;
          border-radius: 14px;
          background: #fff;
          color: #111;
          resize: none;
          outline: none;
          overflow-y: auto;
          transition: border-color 0.15s;
        }
        .tsql-textarea:focus { border-color: #999; }
        .tsql-textarea::placeholder { color: #bbb; }

        .tsql-bottom-row {
          display: flex;
          align-items: center;
          justify-content: space-between;
          margin-top: 18px;
          flex-shrink: 0;
        }
        .tsql-hint {
          font-family: 'DM Mono', monospace;
          font-size: 15px;
          color: #bbb;
        }
        .tsql-submit-btn {
          font-family: 'DM Mono', monospace;
          font-size: 15px;
          letter-spacing: 0.06em;
          font-weight: 500;
          padding: 11px 28px;
          background: #111;
          color: #fff;
          border: none;
          border-radius: 10px;
          cursor: pointer;
          transition: opacity 0.15s;
        }
        .tsql-submit-btn:disabled { opacity: 0.3; cursor: default; }
        .tsql-submit-btn:not(:disabled):hover { opacity: 0.72; }

        .tsql-loading {
          display: flex;
          align-items: center;
          gap: 12px;
          font-family: 'DM Mono', monospace;
          font-size: 17px;
          color: #aaa;
          margin-top: 1.5rem;
          flex-shrink: 0;
        }
        @keyframes tsql-blink {
          0%, 100% { opacity: 1; }
          50% { opacity: 0.15; }
        }
        .tsql-blink { animation: tsql-blink 1.2s ease infinite; }

        .tsql-error {
          font-family: 'DM Mono', monospace;
          font-size: 15px;
          color: #a32d2d;
          padding: 13px 18px;
          border: 0.5px solid #f09595;
          border-radius: 10px;
          background: #fcebeb;
          margin-top: 1rem;
          flex-shrink: 0;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }

        .tsql-result-title {
          font-size: 22px;
          font-weight: 500;
          letter-spacing: 0.08em;
          text-transform: uppercase;
          margin: 0 0 1.5rem 0;
          flex-shrink: 0;
        }

        .tsql-meta-row {
          display: flex;
          gap: 2.5rem;
          flex-wrap: wrap;
          flex-shrink: 0;
        }
        .tsql-meta-item {
          display: flex;
          flex-direction: column;
          gap: 4px;
        }
        .tsql-meta-label {
          font-family: 'DM Mono', monospace;
          font-size: 13px;
          letter-spacing: 0.1em;
          text-transform: uppercase;
          color: #bbb;
        }
        .tsql-meta-val {
          font-family: 'DM Mono', monospace;
          font-size: 17px;
          color: #111;
        }
        .tsql-status-ok  { color: #3b6d11; }
        .tsql-status-err { color: #a32d2d; }

        .tsql-sql-block {
          height: 150px;
          flex-shrink: 0;
          background: #f7f7f5;
          border: 0.5px solid #e8e8e8;
          border-radius: 12px;
          padding: 16px 20px;
          margin-bottom: 1.2rem;
          overflow-y: auto;
          overflow-x: auto;
        }
        .tsql-sql-block pre {
          font-family: 'DM Mono', monospace;
          font-size: 16px;
          line-height: 1.7;
          color: #111;
          white-space: pre;
          margin: 0;
        }

        .tsql-tables-row {
          display: flex;
          gap: 8px;
          flex-shrink: 0;
          overflow-x: auto;
          margin-bottom: 1.2rem;
          padding-bottom: 4px;
        }
        .tsql-table-tag {
          font-family: 'DM Mono', monospace;
          font-size: 14px;
          padding: 3px 14px;
          border: 0.5px solid #ddd;
          border-radius: 100px;
          color: #888;
          white-space: nowrap;
          flex-shrink: 0;
        }

        .tsql-table-wrap {
          flex: 1;
          overflow: auto;
          border: 0.5px solid #e8e8e8;
          border-radius: 12px;
        }
        .tsql-table {
          width: 100%;
          border-collapse: collapse;
          font-size: 17px;
        }
        .tsql-table th {
          position: sticky;
          top: 0;
          background: #fff;
          text-align: left;
          padding: 10px 16px;
          font-family: 'DM Mono', monospace;
          font-size: 13px;
          letter-spacing: 0.08em;
          text-transform: uppercase;
          color: #bbb;
          font-weight: 400;
          border-bottom: 0.5px solid #e8e8e8;
          z-index: 1;
        }
        .tsql-table td {
          padding: 10px 16px;
          border-bottom: 0.5px solid #e8e8e8;
          color: #111;
          font-weight: 300;
          white-space: nowrap;
        }
        .tsql-table tr:last-child td { border-bottom: none; }

        .tsql-token-row {
          display: flex;
          gap: 1.5rem;
          margin-top: 1.2rem;
          font-family: 'DM Mono', monospace;
          font-size: 14px;
          color: #bbb;
          flex-shrink: 0;
        }

        .tsql-empty {
          flex: 1;
          display: flex;
          align-items: center;
          justify-content: center;
          font-family: 'DM Mono', monospace;
          font-size: 16px;
          color: #ddd;
          letter-spacing: 0.04em;
        }
      `}</style>

      <div className="tsql-root">

        {/* ── LEFT ── */}
        <div className="tsql-left">
          <div className="tsql-header">
            <h1>Text-to-SQL</h1>
            <span className="tsql-dot" />
            <span className="tsql-sublabel">{mode} · {database}</span>
          </div>

          <div className="tsql-controls">
            <div className="tsql-pill-group">
              {(["direct", "rag"] as const).map((m) => (
                <button key={m} className={mode === m ? "active" : ""} onClick={() => setMode(m)}>
                  {m}
                </button>
              ))}
            </div>
            <div className="tsql-pill-group">
              {(["northwind", "ardine"] as const).map((db) => (
                <button key={db} className={database === db ? "active" : ""} onClick={() => setDatabase(db)}>
                  {db}
                </button>
              ))}
            </div>
          </div>

          <div className="tsql-divider" />

          <textarea
            className="tsql-textarea"
            value={question}
            onChange={(e) => setQuestion(e.target.value)}
            onKeyDown={handleKeyDown}
            placeholder="พิมพ์คำถาม เช่น ลูกค้าคนใดสร้างรายได้รวมสูงที่สุด"
          />

          <div className="tsql-bottom-row">
            <span className="tsql-hint">Ctrl + Enter</span>
            <button
              className="tsql-submit-btn"
              onClick={handleSubmit}
              disabled={loading || !question.trim()}
            >
              {loading ? "กำลังประมวลผล..." : "ส่ง →"}
            </button>
          </div>

          {loading && (
            <div className="tsql-loading">
              <span className="tsql-blink">●</span>
              กำลังประมวลผล...
            </div>
          )}

          {error && <p className="tsql-error">{error}</p>}
        </div>

        {/* ── RIGHT ── */}
        <div className="tsql-right">
          {!result ? (
            <div className="tsql-empty">ผลลัพธ์จะแสดงที่นี่</div>
          ) : (
            <>
              <p className="tsql-result-title">ผลลัพธ์</p>

              <div className="tsql-meta-row">
                <div className="tsql-meta-item">
                  <span className="tsql-meta-label">status</span>
                  <span className={`tsql-meta-val ${isOk ? "tsql-status-ok" : "tsql-status-err"}`}>
                    {result.status}
                  </span>
                </div>
                <div className="tsql-meta-item">
                  <span className="tsql-meta-label">mode</span>
                  <span className="tsql-meta-val">{result.mode}</span>
                </div>
                <div className="tsql-meta-item">
                  <span className="tsql-meta-label">database</span>
                  <span className="tsql-meta-val">{result.database}</span>
                </div>
              </div>

              <div className="tsql-divider" />

              <div className="tsql-sql-block">
                <pre>{result.sql}</pre>
              </div>

              {result.retrieved_tables?.length > 0 && (
                <div className="tsql-tables-row">
                  {result.retrieved_tables.map((t) => (
                    <span key={t} className="tsql-table-tag">{t}</span>
                  ))}
                </div>
              )}

              {result.columns?.length > 0 && (
                <div className="tsql-table-wrap">
                  <table className="tsql-table">
                    <thead>
                      <tr>
                        {result.columns.map((col) => (
                          <th key={col}>{col}</th>
                        ))}
                      </tr>
                    </thead>
                    <tbody>
                      {result.rows.map((row, i) => (
                        <tr key={i}>
                          {row.map((cell, j) => (
                            <td key={j}>{cell}</td>
                          ))}
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}

              <div className="tsql-token-row">
                <span>in {result.input_tokens}</span>
                <span>out {result.output_tokens}</span>
              </div>
            </>
          )}
        </div>

      </div>
    </>
  );
}