-- Rwanda Coffee Database for Farmers,Harvests,Buyers and Sales

-- Farmers table captures information of cooperative members
CREATE TABLE farmers (
    farmer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    district VARCHAR(50) NOT NULL,
    cooperative_join_date DATE NOT NULL
);

-- Harvests table captures each coffee harvest linked to a buyer
CREATE TABLE harvests (
    harvest_id SERIAL PRIMARY KEY,
    farmer_id INT NOT NULL,
    harvest_date DATE NOT NULL,
    quantity_kg DECIMAL(10,2) NOT NULL,
    quality_score INT NOT NULL,
    batch_code VARCHAR(20) UNIQUE NOT NULL,
    FOREIGN KEY (farmer_id) REFERENCES farmers(farmer_id)
);

-- Buyers table contains information of local and international buyers
CREATE TABLE buyers (
    buyer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    contract_start_date DATE NOT NULL,
    contract_end_date DATE NOT NULL
);

-- Sales table links harvests with buyers and records transactions
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    harvest_id INT NOT NULL,
    buyer_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity_sold_kg DECIMAL(10,2) NOT NULL,
    sale_price_per_kg DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (harvest_id) REFERENCES harvests(harvest_id),
    FOREIGN KEY (buyer_id) REFERENCES buyers(buyer_id)
);
