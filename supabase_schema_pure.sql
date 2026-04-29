-- Pure SQL for Supabase Editor
CREATE TABLE IF NOT EXISTS public.customer_demands (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    company_name TEXT NOT NULL,
    customer_name TEXT NOT NULL,
    phone_number TEXT NOT NULL,
    interests TEXT[] DEFAULT '{}',
    demo_date DATE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE public.customer_demands ENABLE ROW LEVEL SECURITY;

-- Create Policy to allow public inserts
CREATE POLICY "Enable insert for all users" ON public.customer_demands
FOR INSERT WITH CHECK (true);
