CREATE INDEX IF NOT EXISTS idx_products_category ON products(category_id);
CREATE INDEX IF NOT EXISTS idx_products_price ON products(price);
CREATE INDEX IF NOT EXISTS idx_products_offer ON products(is_offer);
CREATE INDEX IF NOT EXISTS idx_products_created ON products(created_at);
