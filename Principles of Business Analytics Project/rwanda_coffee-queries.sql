-- Query 1: Farmers and Number of Harvests
SELECT farmer_id, COUNT(*) 
FROM harvests 
GROUP BY farmer_id;

-- Query2: Average Quality Score per District

SELECT f.district, AVG(h.quality_score) 
FROM farmers f 
JOIN harvests h ON f.farmer_id = h.farmer_id 
GROUP BY f.district;

-- Query 3: Top Buyers by Total Purchase Amount

SELECT buyer_id, SUM(total_amount) 
FROM sales 
GROUP BY buyer_id 
ORDER BY SUM(total_amount) DESC;

-- Query 4: Monthly Revenue in 2023

SELECT DATE_TRUNC('month', sale_date) AS month, SUM(total_amount) 
FROM sales 
WHERE EXTRACT (YEAR FROM sale_date) = 2023 
GROUP BY month;

-- Query 5: Fully Sold Harvest Batches

SELECT h.harvest_id 
FROM harvests h 
JOIN sales s ON h.harvest_id = s.harvest_id 
GROUP BY h.harvest_id 
HAVING SUM(s.quantity_sold_kg) >= h.quantity_kg;


-- Query 6: Buyers with Contracts Expiring Soon

SELECT buyer_id, contract_end_date 
FROM buyers 
WHERE contract_end_date < CURRENT_DATE + INTERVAL '1 year';


-- Query 7: Farmer Contributions to Revenue
SELECT f.farmer_id, SUM(s.total_amount) 
FROM farmers f 
JOIN harvests h ON f.farmer_id = h.farmer_id 
JOIN sales s ON h.harvest_id = s.harvest_id 
GROUP BY f.farmer_id;

-- Query 8: Average Price per Kilogram by Batch
SELECT h.harvest_id, AVG(s.price_per_kg) 
FROM harvests h 
JOIN sales s ON h.harvest_id = s.harvest_id 
GROUP BY h.harvest_id;


-- Query 9: Top Districts by Sales Quantity
SELECT f.district, SUM(s.quantity_sold_kg) 
FROM farmers f 
JOIN harvests h ON f.farmer_id = h.farmer_id 
JOIN sales s ON h.harvest_id = s.harvest_id 
GROUP BY f.district 
ORDER BY SUM(s.quantity_sold_kg) DESC;

-- Query 10: Unsold Harvests
SELECT h.harvest_id 
FROM harvests h 
LEFT JOIN sales s ON h.harvest_id = s.harvest_id 
WHERE s.sale_id IS NULL;

