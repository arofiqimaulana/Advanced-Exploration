-- Mendapatkan rata-rata lama durasi penjualan tiap kategori penjualan
SELECT 
   product_category,
   avg(lama) as avg_duration
FROM (
    SELECT
        i.product_category,
        DATE_DIFF(i.sold_at,i.created_at,DAY) as lama
    FROM bigquery-public-data.thelook_ecommerce.inventory_items i) 
AS mytable
WHERE lama IS NOT NULL 
GROUP BY product_category