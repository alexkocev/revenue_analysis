-- BQ extract MAGENTO order data
-- store the output as bq_magento.csv in folder data/
-- 1Gb for 7M rows
SELECT  
  id AS transaction_id,
  time_stamp AS datetime,
  bill_addressee AS user_name,
  email AS email,
  CONCAT(ship_street1, " ", ship_street2, " ", ship_country) AS shipping_address,
  status AS order_status,
  total AS revenue,
  weight AS quantity,
  currency AS currency,
  discount AS discount,
  discount_code AS discount_code,
  sub_total AS sub_total,

FROM `steadfast-bebop-389314.purchasedata.orders`
WHERE time_stamp >= '2020-01-01' -- to split data if too large to export in CSV
GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12
ORDER BY 2







-- BQ extract GA4 data
-- store the output as bq_ga4.csv in folder data/
-- 14Gb for 1,1M rows
SELECT
  ecommerce.transaction_id AS transaction_id,
  FORMAT_TIMESTAMP('%Y-%m-%dT%H:%M:%S', TIMESTAMP_SECONDS(CAST(event_timestamp / 1000000 AS INT64))) AS datetime,

  -- TRAFFIC SOURCE data
  traffic_source.source AS traffic_source,
  traffic_source.medium AS traffic_medium,
  traffic_source.name AS traffic_name,


  -- ITEMS data
  item.item_name AS item_name, -- Product/item name
  item.item_category AS category_name1, -- Product/item category
  item.item_category2 AS category_name2, 
  item.item_category3 AS category_name3, 
  item.item_category4 AS category_name4, 
  item.item_category5 AS category_name5, 
  item.item_revenue AS item_revenue, -- Revenue per item
  item.quantity AS item_quantity, -- Quantity of the item purchased


  -- EVENT data
  ecommerce.purchase_revenue AS revenue, -- Total revenue per transaction
  ecommerce.total_item_quantity AS quantity -- Total quantity of items per transaction

  
FROM `steadfast-bebop-389314.analytics_310956983.events_*`,

  UNNEST(items) AS item -- Flatten the items array
WHERE 
  event_name = 'purchase'

order by datetime

