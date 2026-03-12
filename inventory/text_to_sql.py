import os
from google import genai
import psycopg2
from dotenv import load_dotenv
load_dotenv()

# -------------------------
# ตั้งค่า Gemini (SDK ใหม่)
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
# Schema Northwind (ครบทุก column + constraints)
# -------------------------
SCHEMA = """

Table:categories
Description: ข้อมูลหมวดหมู่สินค้า
Columns:
  category_id   INTEGER PRIMARY KEY,  -- รหัส category
  category_name VARCHAR(15) NOT NULL, -- ชื่อ category เช่น Beverages, Seafood
  description   TEXT,                 -- คำอธิบาย category
  picture       BYTEA                 -- รูปภาพ category


Table:region
Description:
  ภูมิภาคการทำงาน (work region) เช่น Eastern, Western, Northern, Southern
Columns:
  region_id          SMALLINT PRIMARY KEY, -- รหัส work region
  region_description VARCHAR(60) NOT NULL  -- ชื่อ work region เช่น Eastern, Western, Northern, Southern


Table:us_states
Description: ข้อมูลรัฐในสหรัฐอเมริกา
Columns:
  state_id     SMALLINT PRIMARY KEY, -- รหัสรัฐ (ใช้ standalone ไม่ได้ FK กับตารางอื่น)
  state_name   VARCHAR(100),         -- ชื่อรัฐ เช่น California
  state_abbr   VARCHAR(2),           -- ตัวย่อรัฐ เช่น CA
  state_region VARCHAR(50)           -- ภูมิภาคของรัฐ เช่น West


Table:customer_demographics
Description:
  ประเภทลูกค้า (customer demographic type)
Columns:
  customer_type_id VARCHAR(5) PRIMARY KEY, -- รหัสประเภทลูกค้า
  customer_desc    TEXT                    -- คำอธิบายประเภทลูกค้า


Table:suppliers
Description: ข้อมูล supplier ที่จัดหาสินค้าให้กับบริษัท
Columns:
  supplier_id   SMALLINT PRIMARY KEY,  -- รหัส supplier
  company_name  VARCHAR(40) NOT NULL,  -- ชื่อบริษัท supplier
  contact_name  VARCHAR(30),           -- ชื่อผู้ติดต่อ
  contact_title VARCHAR(30),           -- ตำแหน่งผู้ติดต่อ
  address       VARCHAR(60),           -- ที่อยู่บริษัท supplier
  city          VARCHAR(15),           -- เมืองที่ตั้งบริษัท supplier
  region        VARCHAR(15),           -- ภูมิภาคที่ตั้งบริษัท supplier (ที่อยู่จริง ไม่ใช่ work region)
  postal_code   VARCHAR(10),           -- รหัสไปรษณีย์ supplier
  country       VARCHAR(15),           -- ประเทศที่ตั้งบริษัท supplier
  phone         VARCHAR(24),           -- เบอร์โทรศัพท์ supplier
  fax           VARCHAR(24),           -- เบอร์แฟกซ์ supplier
  homepage      TEXT                   -- เว็บไซต์ supplier


Table:shippers
Description:
  ข้อมูลบริษัทขนส่งที่ใช้จัดส่งสินค้าให้ลูกค้า (ใช้เป็น FK ใน orders.ship_via)
Columns:
  shipper_id   SMALLINT PRIMARY KEY, -- รหัส shipper (ใช้เป็น FK ใน orders.ship_via)
  company_name VARCHAR(40) NOT NULL, -- ชื่อบริษัทขนส่ง
  phone        VARCHAR(24)           -- เบอร์โทรศัพท์บริษัทขนส่ง


Table:products
Description: ข้อมูลสินค้าที่จำหน่าย
Columns:
  product_id        SMALLINT PRIMARY KEY,                        -- รหัสสินค้า
  product_name      VARCHAR(40) NOT NULL,                        -- ชื่อสินค้า
  supplier_id       SMALLINT REFERENCES suppliers(supplier_id),  -- FK → suppliers: บริษัทที่จัดหาสินค้า
  category_id       SMALLINT REFERENCES categories(category_id), -- FK → categories: หมวดหมู่สินค้า
  quantity_per_unit VARCHAR(20),                                  -- หน่วยบรรจุ เช่น "10 boxes x 20 bags"
  unit_price        REAL,                                        -- ราคาต่อหน่วย
  units_in_stock    SMALLINT,                                    -- จำนวนสินค้าคงคลัง
  units_on_order    SMALLINT,                                    -- จำนวนที่กำลังสั่งซื้อเพิ่ม
  reorder_level     SMALLINT,                                    -- จำนวนขั้นต่ำที่ต้องสั่งซื้อเพิ่ม
  discontinued      INTEGER NOT NULL                             -- 1 = หยุดจำหน่ายแล้ว, 0 = ยังจำหน่ายอยู่


Table:customers
Description:
  ข้อมูลลูกค้า (customer) ที่สั่งซื้อสินค้า
cloumn:
  customer_id   VARCHAR(5) PRIMARY KEY, -- รหัสลูกค้า (5 ตัวอักษร เช่น ALFKI)
  company_name  VARCHAR(40) NOT NULL,   -- ชื่อบริษัทลูกค้า
  contact_name  VARCHAR(30),            -- ชื่อผู้ติดต่อ
  contact_title VARCHAR(30),            -- ตำแหน่งผู้ติดต่อ
  address       VARCHAR(60),            -- ที่อยู่ลูกค้า
  city          VARCHAR(15),            -- เมืองที่ตั้ง
  region        VARCHAR(15),            -- ภูมิภาคที่ตั้ง (ที่อยู่จริง ไม่ใช่ work region)
  postal_code   VARCHAR(10),            -- รหัสไปรษณีย์
  country       VARCHAR(15),            -- ประเทศของลูกค้า
  phone         VARCHAR(24),            -- เบอร์โทรศัพท์
  fax           VARCHAR(24)             -- เบอร์แฟกซ์

Table:customer_customer_demo
Description:
  เป็น junction table เชื่อมลูกค้ากับประเภทลูกค้า (demographic type)
Columns:
  customer_id      VARCHAR(5) REFERENCES customers(customer_id),                        -- FK → customers
  customer_type_id VARCHAR(5) REFERENCES customer_demographics(customer_type_id),       -- FK → customer_demographics
  PRIMARY KEY (customer_id, customer_type_id) -- junction table: ลูกค้า 1 คนมีได้หลาย demographic type

Table:employees
Description:
  ข้อมูลพนักงานขาย (sales employee) ที่ติดต่อกับลูกค้าโดยตรง
Columns:
  employee_id       SMALLINT PRIMARY KEY,                           -- รหัสพนักงาน
  last_name         VARCHAR(20) NOT NULL,                           -- นามสกุล
  first_name        VARCHAR(10) NOT NULL,                           -- ชื่อ
  title             VARCHAR(30),                                    -- ตำแหน่งงาน เช่น Sales Representative
  title_of_courtesy VARCHAR(25),                                    -- คำนำหน้า เช่น Mr., Ms., Dr.
  birth_date        DATE,                                           -- วันเกิด
  hire_date         DATE,                                           -- วันที่เริ่มงาน
  address           VARCHAR(60),                                    -- ที่อยู่บ้านพนักงาน
  city              VARCHAR(15),                                    -- เมืองที่พักอาศัย
  region            VARCHAR(15),                                    -- ภูมิภาคที่พักอาศัย (บ้านเกิด) ไม่ใช่ work region
  postal_code       VARCHAR(10),                                    -- รหัสไปรษณีย์บ้านพนักงาน
  country           VARCHAR(15),                                    -- ประเทศที่พักอาศัย
  home_phone        VARCHAR(24),                                    -- เบอร์โทรศัพท์บ้าน
  extension         VARCHAR(4),                                     -- เบอร์ต่อภายใน
  photo             BYTEA,                                          -- รูปถ่ายพนักงาน
  notes             TEXT,                                           -- ประวัติย่อพนักงาน
  reports_to        SMALLINT REFERENCES employees(employee_id),    -- FK → employees (self-ref): รหัส manager โดยตรง
  photo_path        VARCHAR(255)                                    -- path รูปภาพ


Table:territories
Description:
  พื้นที่รับผิดชอบการขาย (sales territory) เช่น Boston, Atlanta
columns:
  territory_id          VARCHAR(20) PRIMARY KEY,                       -- รหัส territory(พื้นที่รับผิดชอบการขาย)
  territory_description VARCHAR(60) NOT NULL,                          -- ชื่อ territory เช่น Boston, Atlanta
  region_id             SMALLINT NOT NULL REFERENCES region(region_id) -- FK → region: work region ที่ territory นี้สังกัด


Table:employee_territories
Description: เป็น junction table เชื่อม work region ที่พนักงานรับผิดชอบ
  ใช้ตารางนี้เมื่อถามเกี่ยวกับ region ที่พนักงานทำงาน/รับผิดชอบ
Columns:
  employee_id  SMALLINT    REFERENCES employees(employee_id),    -- FK → employees
  territory_id VARCHAR(20) REFERENCES territories(territory_id), -- FK → territories → region
  PRIMARY KEY (employee_id, territory_id)


Table:orders
Description:
  ข้อมูลการสั่งซื้อของลูกค้า 1 order อาจมีหลาย order_details
Columns:
  order_id         SMALLINT PRIMARY KEY,                          -- รหัส order
  customer_id      VARCHAR(5) REFERENCES customers(customer_id), -- FK → customers: ลูกค้าที่สั่ง
  employee_id      SMALLINT   REFERENCES employees(employee_id), -- FK → employees: พนักงานที่รับ order
  order_date       DATE,                                          -- วันที่สั่งซื้อ
  required_date    DATE,                                         -- วันที่ต้องการรับสินค้า
  shipped_date     DATE,                                          -- วันที่ส่งสินค้าจริง (NULL = ยังไม่ได้ส่ง)
  ship_via         SMALLINT   REFERENCES shippers(shipper_id),   -- FK → shippers: บริษัทขนส่งที่ใช้
  freight          REAL,                                          -- ค่าขนส่ง
  ship_name        VARCHAR(40),                                   -- ชื่อผู้รับปลายทาง
  ship_address     VARCHAR(60),                                   -- ที่อยู่จัดส่ง
  ship_city        VARCHAR(15),                                   -- เมืองปลายทาง
  ship_region      VARCHAR(15),                                   -- ภูมิภาคปลายทาง (ที่อยู่จัดส่ง ไม่ใช่ work region)
  ship_postal_code VARCHAR(10),                                   -- รหัสไปรษณีย์ปลายทาง
  ship_country     VARCHAR(15)                                    -- ประเทศปลายทาง


Table:order_details
Description:
  รายละเอียดของ order แต่ละรายการ
Columns:
  -- revenue ที่แท้จริง = unit_price * quantity * (1 - discount)
  order_id   SMALLINT REFERENCES orders(order_id),   -- FK → orders
  product_id SMALLINT REFERENCES products(product_id), -- FK → products
  unit_price REAL     NOT NULL,                        -- ราคาต่อหน่วย ณ วันที่สั่ง (อาจต่างจาก products.unit_price)
  quantity   SMALLINT NOT NULL,                        -- จำนวนที่สั่ง
  discount   REAL     NOT NULL,                        -- ส่วนลด (0.0 - 1.0 เช่น 0.1 = 10%)
  PRIMARY KEY (order_id, product_id)

"""

def ask(question):
    prompt = f"""
You are a PostgreSQL expert. Given this Northwind database schema:

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
        status = f" Error: {e}"

    return {
        "question": question,
        "sql": sql,
        "result": result,
        "status": status,
        "input_tokens": input_tokens,
        "output_tokens": output_tokens,
        "total_tokens": input_tokens + output_tokens
    }

# -------------------------
# ทดสอบ
# -------------------------
if __name__ == "__main__":
    questions = [
        "ลูกค้าที่หายไปคือใคร เคยซื้อปี 1996 แต่ปี 1997 ไม่ซื้อเลย"
    ]
    for q in questions:
        result = ask(q)
        print(f"\nQ: {result['question']}")
        print(f"SQL: {result['sql']}")
        print(f"Result: {result['result']}")
        print(f"Status: {result['status']}")
        print(f"Tokens: {result['total_tokens']} "
              f"(in: {result['input_tokens']}, out: {result['output_tokens']})")
        print("-" * 60)