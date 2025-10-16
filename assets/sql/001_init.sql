CREATE TABLE categories(
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  icon_url TEXT,
  parent_id INTEGER,
  FOREIGN KEY(parent_id) REFERENCES categories(id)
);

CREATE TABLE products(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  image_url TEXT,
  price REAL NOT NULL,
  old_price REAL,
  category_id INTEGER,
  brand TEXT,
  condition TEXT CHECK(condition IN ('new','used')) DEFAULT 'new',
  payment_method TEXT CHECK(payment_method IN ('cash','installments','any')) DEFAULT 'any',
  is_offer INTEGER NOT NULL DEFAULT 0,
  created_at INTEGER,
  FOREIGN KEY(category_id) REFERENCES categories(id)
);

CREATE TABLE packages(
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  price REAL NOT NULL
);

CREATE TABLE package_items(
  id INTEGER PRIMARY KEY,
  package_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  qty INTEGER DEFAULT 1,
  FOREIGN KEY(package_id) REFERENCES packages(id),
  FOREIGN KEY(product_id) REFERENCES products(id)
);

CREATE TABLE favorites(
  product_id INTEGER PRIMARY KEY
);
