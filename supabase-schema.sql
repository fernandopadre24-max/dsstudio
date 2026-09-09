-- ============================================================
-- SoundControl - Schema do banco (cole no Supabase SQL Editor)
-- ============================================================

create table if not exists public.inventory (
  "id" bigint primary key,
  "name" text,
  "category" text,
  "qty" integer,
  "value" numeric,
  "brand" text,
  "status" text,
  "notes" text,
  "photo" text,
  "available" integer,
  "created_at" timestamptz default now()
);

create table if not exists public.clients (
  "id" bigint primary key,
  "type" text,
  "name" text,
  "doc" text,
  "phone" text,
  "whatsapp" text,
  "email" text,
  "instagram" text,
  "birth" text,
  "address" text,
  "neighborhood" text,
  "city" text,
  "cep" text,
  "sourced" text,
  "notes" text,
  "lastRentDate" text,
  "created_at" timestamptz default now()
);

create table if not exists public.rentals (
  "id" bigint primary key,
  "clientId" bigint,
  "client" text,
  "phone" text,
  "eventName" text,
  "location" text,
  "date" text,
  "timeStart" text,
  "timeEnd" text,
  "totalValue" numeric,
  "deposit" numeric,
  "status" text,
  "notes" text,
  "equipment" jsonb default '[]'::jsonb,
  "created_at" timestamptz default now()
);

create table if not exists public.suppliers (
  "id" bigint primary key,
  "name" text,
  "cnpj" text,
  "phone" text,
  "whatsapp" text,
  "email" text,
  "city" text,
  "address" text,
  "categories" text,
  "site" text,
  "notes" text,
  "created_at" timestamptz default now()
);

-- ============================================================
-- Permissoes de acesso (anon) para o app funcionar direto
-- ============================================================
alter table public.inventory enable row level security;
alter table public.clients enable row level security;
alter table public.rentals enable row level security;
alter table public.suppliers enable row level security;

create policy "anon inventory all" on public.inventory
  for all using (true) with check (true);
create policy "anon clients all" on public.clients
  for all using (true) with check (true);
create policy "anon rentals all" on public.rentals
  for all using (true) with check (true);
create policy "anon suppliers all" on public.suppliers
  for all using (true) with check (true);

grant all on public.inventory to anon, authenticated;
grant all on public.clients to anon, authenticated;
grant all on public.rentals to anon, authenticated;
grant all on public.suppliers to anon, authenticated;