-- Mendapatkan total produk yang terjual (sub query) dengan beberapa filter
SELECT 
  it.product_name,
  COUNT(it.id) as total
FROM `bigquery-public-data.thelook_ecommerce.inventory_items` it
WHERE DATE(it.created_at) BETWEEN DATE_ADD('2021-01-01', INTERVAL - 3 MONTH) AND DATE('2022-01-01')
AND DATE(it.sold_at) >= DATE('2022-01-01')
AND it.product_category IN ('Fashion Hoodies & Sweatshirts','Socks & Hosiery','Fashion Hoodies & Sweatshirts')
AND it.product_id IN (
  SELECT 
    p.id
  FROM `bigquery-public-data.thelook_ecommerce.products` p
  WHERE p.cost >= 50 AND p.brand NOT IN ('TYR','2XU')
)
GROUP BY it.product_name
ORDER BY total DESC
