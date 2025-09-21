
-- Farmers table
CREATE TABLE Farmers (
    farmer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    district VARCHAR(50),
    cooperative_join_date DATE
);

-- Buyers table
CREATE TABLE Buyers (
    buyer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    contract_start_date DATE
);

-- Harvests table
CREATE TABLE Harvests (
    harvest_id SERIAL PRIMARY KEY,
    farmer_id INT NOT NULL,
    harvest_date DATE NOT NULL,
    quantity_kg NUMERIC CHECK (quantity_kg > 0),
    CONSTRAINT fk_farmer
        FOREIGN KEY (farmer_id)
        REFERENCES Farmers(farmer_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Sales table
CREATE TABLE Sales (
    sale_id SERIAL PRIMARY KEY,
    harvest_id INT NOT NULL,
    buyer_id INT NOT NULL,
    sale_date DATE NOT NULL,
    price_per_kg NUMERIC CHECK (price_per_kg > 0),
    total_amount NUMERIC CHECK (total_amount >= 0),
    CONSTRAINT fk_harvest
        FOREIGN KEY (harvest_id)
        REFERENCES Harvests(harvest_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_buyer
        FOREIGN KEY (buyer_id)
        REFERENCES Buyers(buyer_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
