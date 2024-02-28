CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE bikes (
    model TEXT PRIMARY KEY,
    cost INT NOT NULL
);

CREATE TABLE order (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers,
    model_id REFERENCES bikes,
    time_ordered TIMESTAMP with time zone NOT NULL
        DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders_items (
    id SERIAL PRIMARY KEY,
    model_bought TEXT REFERENCES order,
    purchase_cost NUMERIC(10, 2) NOT NULL,
    note TEXT NOT NULL DEFAULT ''
);