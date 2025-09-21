-- Create the database schema and tables 
CREATE SCHEMA rwanda_coffee;

-- Farmers table captures information of cooperative members
CREATE TABLE farmers (
    farmer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    district VARCHAR(50) NOT NULL,
    cooperative_join_date DATE NOT NULL
);

-- Buyers table contains information of local and international buyers
CREATE TABLE buyers (
    buyer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    contract_start_date DATE NOT NULL,
    contract_end_date DATE NOT NULL
);

-- Harvests table captures each coffee harvest linked to a buyer
CREATE TABLE harvests (
    harvest_id SERIAL PRIMARY KEY,
    farmer_id INT NOT NULL,
    harvest_date DATE NOT NULL,
    quantity_kg DECIMAL(10,2) CHECK (quantity_kg > 0),
    quality_score INT CHECK (quality_score BETWEEN 0 AND 100),
    batch_code VARCHAR(50) UNIQUE NOT NULL,
    FOREIGN KEY (farmer_id) REFERENCES farmers(farmer_id) ON DELETE CASCADE
);

-- Sales table links harvests with buyers and records transactions
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    harvest_id INT NOT NULL,
    buyer_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity_sold_kg DECIMAL(10,2) CHECK (quantity_sold_kg > 0),
    price_per_kg DECIMAL(10,2) CHECK (price_per_kg > 0),
    total_amount DECIMAL(12,2) GENERATED ALWAYS AS (quantity_sold_kg * price_per_kg) STORED,
    invoice_no VARCHAR(50) UNIQUE NOT NULL,
    FOREIGN KEY (harvest_id) REFERENCES harvests(harvest_id) ON DELETE CASCADE,
    FOREIGN KEY (buyer_id) REFERENCES buyers(buyer_id) ON DELETE CASCADE
);
