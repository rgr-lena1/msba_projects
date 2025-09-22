-- Query 1: Average quality score per district
SELECT f.district,
       ROUND(AVG(h.quality_score), 2) AS avg_quality
FROM farmers f
JOIN harvests h ON f.farmer_id = h.farmer_id
GROUP BY f.district
ORDER BY avg_quality DESC;

-- Query 2: Revenue per farmer

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

-- Query 6: Average quantity per harvest
SELECT f.name AS farmer_name, f.district,
       ROUND(AVG(h.quantity_kg), 2) AS avg_quantity
FROM farmers f
JOIN harvests h ON f.farmer_id = h.farmer_id
GROUP BY f.name, f.district
ORDER BY avg_quantity DESC;

-- Query 7: Revenue per district
SELECT f.district, 
       SUM(s.quantity_sold_kg * s.sale_price_per_kg) AS total_revenue
FROM farmers f
JOIN harvests h ON f.farmer_id = h.farmer_id
JOIN sales s ON h.harvest_id = s.harvest_id
GROUP BY f.district
ORDER BY total_revenue DESC;

-- Query 8: Highest quality batches and their buyers
SELECT h.batch_code, h.quality_score,
       b.name AS buyer_name, b.country,
       s.sale_date, s.quantity_sold_kg
FROM harvests h
JOIN sales s ON h.harvest_id = s.harvest_id
JOIN buyers b ON s.buyer_id = b.buyer_id
WHERE h.quality_score >= 90
ORDER BY h.quality_score DESC, s.sale_date;

-- Query 9: Buyers with contracts expiring soon
SELECT buyer_id, name, country, contract_end_date
FROM buyers
WHERE contract_end_date <= CURRENT_DATE + INTERVAL '3 months'
ORDER BY contract_end_date;

