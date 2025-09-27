-- Rwanda Coffee Database (Tables& Data for Farmers,Harvests,Buyers and Sales) + QUERIES

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

-- Farmers Data
INSERT INTO farmers (farmer_id, name, district, cooperative_join_date) VALUES
(1, 'Jean Bosco Habimana', 'Huye', '2025-01-20'),
(2, 'Claudine Uwimana', 'Kayonza', '2025-02-05'),
(3, 'Eric Nshimiyimana', 'Gakenke', '2025-01-28'),
(4, 'Aline Mukamana', 'Nyamasheke', '2025-03-02'),
(5, 'Thierry Mugisha', 'Karongi', '2025-01-15'),
(6, 'Diane Uwera', 'Ruhango', '2025-02-18'),
(7, 'Innocent Hakizimana', 'Rutsiro', '2025-03-12'),
(8, 'Beatrice Umutoni', 'Rusizi', '2025-02-25'),
(9, 'Samuel Ndayisenga', 'Nyamagabe', '2025-01-30'),
(10, 'Chantal Iradukunda', 'Kayonza', '2025-03-08');

-- Harvests Data
INSERT INTO harvests (harvest_id, farmer_id, harvest_date, quantity_kg, quality_score, batch_code) VALUES
(1, 1, '2025-03-15', 125.50, 85, 'BATCH001'),
(2, 2, '2025-03-20', 110.75, 88, 'BATCH002'),
(3, 3, '2025-03-25', 140.00, 90, 'BATCH003'),
(4, 4, '2025-03-28', 135.25, 87, 'BATCH004'),
(5, 5, '2025-04-05', 150.00, 92, 'BATCH005'),
(6, 6, '2025-04-10', 95.40, 83, 'BATCH006'),
(7, 7, '2025-04-15', 160.00, 89, 'BATCH007'),
(8, 8, '2025-04-18', 120.80, 84, 'BATCH008'),
(9, 9, '2025-04-22', 130.00, 86, 'BATCH009'),
(10, 10, '2025-04-25', 145.00, 91, 'BATCH010');

-- Buyers Data
INSERT INTO buyers (buyer_id, name, country, contract_start_date, contract_end_date) VALUES
(1, 'KaffeeImport GmbH', 'Germany', '2025-01-15', '2026-01-15'),
(2, 'UK Coffee Traders Ltd', 'United Kingdom', '2025-02-01', '2026-02-01'),
(3, 'Dubai Coffee Importers', 'UAE', '2025-03-01', '2026-03-01'),
(4, 'SwissCoffee SA', 'Switzerland', '2025-01-20', '2026-01-20'),
(5, 'Beijing Coffee Co', 'China', '2025-02-10', '2026-02-10'),
(6, 'American Coffee Corp', 'USA', '2025-03-15', '2026-03-15'),
(7, 'Rwanda Coffee Board', 'Rwanda', '2025-01-25', '2026-01-25');

-- Sales Data
INSERT INTO sales (sale_id, harvest_id, buyer_id, sale_date, quantity_sold_kg, sale_price_per_kg) VALUES
(1, 1, 1, '2025-03-22', 100.00, 5.50),
(2, 2, 2, '2025-03-27', 90.00, 5.60),
(3, 3, 3, '2025-04-01', 120.00, 5.80),
(4, 4, 4, '2025-04-05', 100.00, 5.75),
(5, 5, 5, '2025-04-12', 140.00, 6.00),
(6, 6, 6, '2025-04-18', 80.00, 5.40),
(7, 7, 7, '2025-04-20', 150.00, 5.90),
(8, 8, 1, '2025-04-25', 100.00, 5.55),
(9, 9, 2, '2025-04-28', 110.00, 5.70),
(10, 10, 3, '2025-05-02', 120.00, 6.10);


-- QUERIES

-- Query 1: Average quality score per district

SELECT f.district,
       ROUND(AVG(h.quality_score), 2) AS avg_quality
FROM farmers f
JOIN harvests h ON f.farmer_id = h.farmer_id
GROUP BY f.district
ORDER BY avg_quality DESC;


-- Query 2: Farmers with highest revenue

SELECT f.name AS farmer_name, f.district,
       SUM(s.quantity_sold_kg * s.sale_price_per_kg) AS total_revenue
FROM farmers f
JOIN harvests h ON f.farmer_id = h.farmer_id
JOIN sales s ON h.harvest_id = s.harvest_id
GROUP BY f.name, f.district
ORDER BY total_revenue DESC;


-- Query 3: Buyer concentration per revenue

SELECT b.name AS buyer_name, b.country,
       SUM(s.quantity_sold_kg * s.sale_price_per_kg) AS revenue
FROM buyers b
JOIN sales s ON b.buyer_id = s.buyer_id
GROUP BY b.name, b.country
ORDER BY revenue DESC;


-- Query 4: Average quantity per harvest per farmer

SELECT f.name AS farmer_name, f.district,
       ROUND(AVG(h.quantity_kg), 2) AS avg_quantity
FROM farmers f
JOIN harvests h ON f.farmer_id = h.farmer_id
GROUP BY f.name, f.district
ORDER BY avg_quantity DESC;


-- Query 5: Low performing batches

SELECT h.batch_code, h.quantity_kg,
       COALESCE(SUM(s.quantity_sold_kg), 0) AS sold_kg,
       h.quantity_kg - COALESCE(SUM(s.quantity_sold_kg), 0) AS unsold_kg
FROM harvests h
LEFT JOIN sales s ON h.harvest_id = s.harvest_id
GROUP BY h.batch_code, h.quantity_kg
HAVING h.quantity_kg - COALESCE(SUM(s.quantity_sold_kg), 0) > 0
ORDER BY unsold_kg DESC;


-- Query 6: Revenue per district

SELECT f.district, 
       SUM(s.quantity_sold_kg * s.sale_price_per_kg) AS total_revenue
FROM farmers f
JOIN harvests h ON f.farmer_id = h.farmer_id
JOIN sales s ON h.harvest_id = s.harvest_id
GROUP BY f.district
ORDER BY total_revenue DESC;


-- Query 7: Highest quality batches and their buyers

SELECT h.batch_code, h.quality_score,
       b.name AS buyer_name, b.country,
       s.sale_date, s.quantity_sold_kg
FROM harvests h
JOIN sales s ON h.harvest_id = s.harvest_id
JOIN buyers b ON s.buyer_id = b.buyer_id
WHERE h.quality_score >= 90
ORDER BY h.quality_score DESC, s.sale_date;


-- Query 8: Buyers with contracts expiring soon

SELECT buyer_id, name, country, contract_end_date
FROM buyers
WHERE contract_end_date <= CURRENT_DATE + INTERVAL '3 months'
ORDER BY contract_end_date;


-- Query 9: Total sales revenue per buyer

SELECT b.name AS buyer_name, b.country,
       SUM(s.quantity_sold_kg * s.sale_price_per_kg) AS total_revenue
FROM buyers b
JOIN sales s ON b.buyer_id = s.buyer_id
GROUP BY b.name, b.country
ORDER BY total_revenue DESC;


-- Query 10:List of all farmers and their harvests

SELECT f.farmer_id, f.name AS farmer_name, f.district,
       h.harvest_id, h.harvest_date, h.quantity_kg
FROM farmers f
JOIN harvests h ON f.farmer_id = h.farmer_id
ORDER BY h.quantity_kg DESC;





