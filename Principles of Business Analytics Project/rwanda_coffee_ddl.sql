-- Create the database schema and tables 
CREATE SCHEMA rwanda_coffee;

-- Farmers table captures information of cooperative members
CREATE TABLE Farmers (
    name VARCHAR(100) NOT NULL,
    district VARCHAR(50) NOT NULL,
    cooperative_join_date DATE NOT NULL,
    PRIMARY KEY (farmer_id)
);

-- Buyers table contains information of local and international buyers
CREATE TABLE Buyers (
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    contract_start_date DATE NOT NULL,
    contract_start_date DATE NOT NULL,
    PRIMARY KEY (buyer_id)
);

-- Harvests table captures each coffee harvest linked to a buyer
CREATE TABLE Harvests (
    farmer_id INT NOT NULL,
    harvest_date DATE NOT NULL,
    quantity_kg NUMERIC (10,2) CHECK (quantity_kg > 0),
    batch_code VARCHAR(50) UNIQUE NOT NULL,
    PRIMARY KEY  (harvest_id),
    FOREIGN KEY (farmer_id) REFERENCES Farmers(farmer_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Sales table links harvests with buyers and records transactions
CREATE TABLE Sales (
    harvest_id INT NOT NULL,
    buyer_id INT NOT NULL,
    sale_date DATE NOT NULL,
    price_per_kg NUMERIC (10,2) CHECK (price_per_kg > 0),
    total_amount NUMERIC (10,2) CHECK (total_amount >= 0),
    PRIMARY KEY (sale_id)
    FOREIGN KEY (harvest_id) REFERENCES Harvests(harvest_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (buyer_id) REFERENCES Buyers(buyer_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
