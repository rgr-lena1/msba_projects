-- Insert Farmers
INSERT INTO Farmers (name, district, cooperative_join_date)
VALUES 
('Jean Nshuti', 'Nyamagabe', '2018-03-12'),
('Alice Mukamana', 'Huye', '2019-06-25'),
('David Habimana', 'Gakenke', '2020-02-10'),
('Grace Uwimana', 'Rubavu', '2017-11-04'),
('Patrick Mugisha', 'Gisagara', '2021-01-15');

-- Insert Buyers
INSERT INTO Buyers (name, country, contract_start_date)
VALUES
('Global Coffee Ltd', 'Germany', '2019-04-01'),
('Premium Beans Co.', 'USA', '2020-07-20'),
('Kigali Exports', 'Rwanda', '2021-05-15'),
('Asia Roasters', 'Japan', '2018-09-10');

-- Insert Harvests
INSERT INTO Harvests (farmer_id, harvest_date, quantity_kg)
VALUES
(1, '2022-03-01', 1200),
(2, '2022-03-05', 950),
(3, '2022-03-10', 1400),
(4, '2022-04-01', 800),
(5, '2022-04-12', 600),
(1, '2023-03-01', 1500),
(2, '2023-03-04', 1100),
(3, '2023-03-09', 1300),
(4, '2023-04-03', 700),
(5, '2023-04-15', 750);

-- Insert Sales
INSERT INTO Sales (harvest_id, buyer_id, sale_date, price_per_kg, total_amount)
VALUES
(1, 1, '2022-03-15', 3.5, 4200),
(2, 2, '2022-03-18', 4.0, 3800),
(3, 3, '2022-03-22', 3.8, 5320),
(4, 4, '2022-04-10', 3.2, 2560),
(5, 1, '2022-04-18', 3.6, 2160),
(6, 2, '2023-03-20', 4.2, 6300),
(7, 3, '2023-03-25', 4.0, 4400),
(8, 4, '2023-03-28', 3.9, 5070),
(9, 1, '2023-04-12', 3.7, 2590),
(10, 2, '2023-04-20', 4.1, 3075);

