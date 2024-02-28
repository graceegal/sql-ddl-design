CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE bikes (
    code VARCHAR(5) PRIMARY KEY,
    model VARCHAR(25) NOT NULL UNIQUE,
    price_USD NUMERIC(10, 2) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers,
    date_placed TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders,
    model_code VARCHAR(5) NOT NULL REFERENCES models,
    purchase_cost NUMERIC(10, 2) NOT NULL,
    notes TEXT NOT NULL DEFAULT ''
);
