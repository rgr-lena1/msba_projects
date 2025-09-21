-- Farmers
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

-- Harvests
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

-- Buyers
INSERT INTO buyers (buyer_id, name, country, contract_start_date, contract_end_date) VALUES
(1, 'KaffeeImport GmbH', 'Germany', '2025-01-15', '2026-01-15'),
(2, 'UK Coffee Traders Ltd', 'United Kingdom', '2025-02-01', '2026-02-01'),
(3, 'Dubai Coffee Importers', 'UAE', '2025-03-01', '2026-03-01'),
(4, 'SwissCoffee SA', 'Switzerland', '2025-01-20', '2026-01-20'),
(5, 'Beijing Coffee Co', 'China', '2025-02-10', '2026-02-10'),
(6, 'American Coffee Corp', 'USA', '2025-03-15', '2026-03-15'),
(7, 'Rwanda Coffee Board', 'Rwanda', '2025-01-25', '2026-01-25');

-- Sales
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


