-- Mendapatkan data produk yang paling banyak memberikan keuntungan tiap bulannya.
SELECT 
    Month,
    product_id,
    product_name,
    Sales,
    Cost,
    Profit,
    Ranks
FROM (
    SELECT
        DATE(FORMAT_DATE('%Y-%m-1', inventory.created_at)) AS Month,
        product.id as product_id,
        product.name as product_name,
        product.retail_price as Sales,
        product.cost as Cost,
        (product.retail_price-product.cost) as Profit,
        ROW_NUMBER() OVER(PARTITION BY DATE(FORMAT_DATE('%Y-%m-1', inventory.created_at)) ORDER BY (product.retail_price-product.cost) DESC) AS Ranks  
    FROM `bigquery-public-data.thelook_ecommerce.products` product
    LEFT JOIN `bigquery-public-data.thelook_ecommerce.inventory_items` inventory ON product.id=inventory.id
) as mytable
WHERE Ranks <= 5
ORDER BY Month ASC, Ranks ASC