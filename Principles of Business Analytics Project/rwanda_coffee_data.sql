-- Farmers
INSERT INTO Farmers (farmer_id, name, district, cooperative_join_date) VALUES
(1, 'Jean Claude', 'Huye', '2019-03-15'),
(2, 'Alice Mukamana', 'Kayonza', '2020-06-20'),
(3, 'Eric Nkurunziza', 'Gakenke', '2018-11-10'),
(4, 'Marie Uwitonze', 'Nyamasheke', '2021-02-05'),
(5, 'Patrick Habimana', 'Karongi', '2019-12-30'),
(6, 'Jeanne Uwamahoro', 'Ruhango', '2022-01-15'),
(7, 'Emma Kayitesi', 'Rutsiro', '2020-07-22'),
(8, 'Claudine Iradukunda', 'Rusizi', '2021-09-10'),
(9, 'Fabrice Munyaneza', 'Nyamagabe', '2018-05-25'),
(10, ‘Claire Mukarwego', 'Kayonza', '2022-03-12');

-- Harvests
INSERT INTO Harvests (harvest_id, farmer_id, harvest_date, quantity_kg, quality_score, batch_code) VALUES
(1, 1, '2025-03-15', 125.0, 85, 'BATCH001'),
(2, 2, '2025-03-20', 130.0, 88, 'BATCH002'),
(3, 3, '2025-03-25', 140.0, 87, 'BATCH003'),
(4, 4, '2025-03-28', 135.0, 86, 'BATCH004'),
(5, 5, '2025-04-05', 120.0, 84, 'BATCH005'),
(6, 6, '2025-04-10', 150.0, 89, 'BATCH006'),
(7, 7, '2025-04-12', 145.0, 88, 'BATCH007'),
(8, 8, '2025-04-15', 138.0, 85, 'BATCH008'),
(9, 9, '2025-04-18', 132.0, 83, 'BATCH009'),
(10, 10, '2025-04-20', 140.0, 87, 'BATCH010');

-- Buyers
INSERT INTO Buyers (buyer_id, name, country, contract_start_date, contract_end_date) VALUES
(1, 'Berlin Coffee Exports', 'Germany', '2025-01-01', '2027-12-31'),
(2, 'London Coffee Ltd', 'UK', '2025-03-01', '2027-02-28'),
(3, 'Dubai Arabica Traders', 'UAE', '2025-01-15', '2028-01-14'),
(4, 'Swiss Coffee Importers', 'Switzerland', '2025-04-01', '2028-03-31'),
(5, 'Beijing Coffee Co', 'China', '2025-05-01', '2028-04-30'),
(6, 'Chicago Coffee Importers', 'USA', '2025-02-01', '2028-01-31'),
(7, 'Kigali Coffee Exporters', 'Rwanda', '2025-06-01', '2027-05-31');

-- Sales
INSERT INTO Sales (sale_id, harvest_id, buyer_id, sale_date, quantity_sold_kg, price_per_kg, invoice_no) VALUES
(1, 1, 7, '2025-03-20', 50.0, 5.5, 'INV001'),
(2, 1, 1, '2025-03-25', 75.0, 5.6, 'INV002'),
(3, 2, 2, '2025-03-30', 80.0, 5.8, 'INV003'),
(4, 3, 3, '2025-04-05', 90.0, 5.7, 'INV004'),
(5, 4, 4, '2025-04-10', 85.0, 5.9, 'INV005'),
(6, 5, 5, '2025-04-15', 70.0, 6.0, 'INV006'),
(7, 6, 6, '2025-04-20', 100.0, 6.1, 'INV007'),
(8, 7, 7, '2025-04-22', 95.0, 5.5, 'INV008'),
(9, 8, 1, '2025-04-25', 90.0, 5.7, 'INV009'),
(10, 9, 2, '2025-04-28', 80.0, 5.8, 'INV010'),
(11, 10, 3, '2025-05-01', 95.0, 6.0, 'INV011'),
(12, 2, 4, '2025-05-05', 50.0, 5.6, 'INV012');
