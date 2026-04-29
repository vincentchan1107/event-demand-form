-- 建立資料庫 (如果尚未建立)
CREATE DATABASE IF NOT EXISTS event_management;
USE event_management;

-- 建立客戶需求表
CREATE TABLE IF NOT EXISTS customer_demands (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL COMMENT '客戶公司',
    customer_name VARCHAR(100) NOT NULL COMMENT '客戶名稱',
    phone_number VARCHAR(20) NOT NULL COMMENT '聯絡電話',
    interests TEXT COMMENT '興趣項目 (JSON 或逗號分隔字串)',
    demo_date DATE NOT NULL COMMENT '預約 DEMO 日期',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '記錄建立時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 範例插入語句
-- INSERT INTO customer_demands (company_name, customer_name, phone_number, interests, demo_date) 
-- VALUES ('範例科技公司', '陳小明', '0912345678', 'AI prompt 指令, AI AGENT', '2026-05-15');
