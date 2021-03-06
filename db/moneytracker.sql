DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS tags;

CREATE TABLE merchants (
  id SERIAL8 PRIMARY KEY,
  merchant_name VARCHAR(255)
  );

CREATE TABLE tags (
  id SERIAL8 PRIMARY KEY,
  tag_name VARCHAR(255)
  );

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  date VARCHAR(255),
  amount INT4,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT8 REFERENCES tags(id) ON DELETE CASCADE
  );