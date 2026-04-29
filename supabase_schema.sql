-- 建立 public schema 中的 customer_demands 表
-- Supabase 預設使用 public schema，無需 CREATE DATABASE 語句

CREATE TABLE IF NOT EXISTS public.customer_demands (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    company_name VARCHAR(255) NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    interests TEXT[], -- 使用 TEXT 陣列儲存多選興趣
    demo_date DATE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 為 interests 欄位添加註釋
COMMENT ON COLUMN public.customer_demands.interests IS '興趣項目 (多選，以陣列形式儲存)';
COMMENT ON COLUMN public.customer_demands.company_name IS '客戶公司';
COMMENT ON COLUMN public.customer_demands.customer_name IS '客戶名稱';
COMMENT ON COLUMN public.customer_demands.phone_number IS '聯絡電話';
COMMENT ON COLUMN public.customer_demands.demo_date IS '預約 DEMO 日期';
COMMENT ON COLUMN public.customer_demands.created_at IS '記錄建立時間';

-- 啟用 Row Level Security (RLS) 以便後續設定存取策略
ALTER TABLE public.customer_demands ENABLE ROW LEVEL SECURITY;

-- 創建一個策略，允許匿名用戶插入數據 (僅為範例，實際應用中應更嚴格)
-- CREATE POLICY "Allow public insert" ON public.customer_demands
--   FOR INSERT WITH CHECK (true);

-- 範例插入語句
-- INSERT INTO public.customer_demands (company_name, customer_name, phone_number, interests, demo_date)
-- VALUES (
--     '範例科技公司',
--     '陳小明',
--     '0912345678',
--     ARRAY['AI prompt 指令', 'AI AGENT']::TEXT[],
--     '2026-05-15'
-- );
