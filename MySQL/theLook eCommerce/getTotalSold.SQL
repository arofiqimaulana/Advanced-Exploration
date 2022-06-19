SELECT 
    DATE(FORMAT_DATE('%Y-%m-1', it.sold_at)) AS sold_at,
    (
    SELECT p.name FROM `bigquery-public-data.thelook_ecommerce.products` p WHERE p.id = it.product_id
    ) AS product_name,
    COUNT(it.id) AS total_sold
FROM `bigquery-public-data.thelook_ecommerce.inventory_items` it
WHERE it.sold_at IS NOT NULL
GROUP BY product_name,sold_at
ORDER BY sold_at ASC, product_name ASC
