-- BQ extract MAGENTO data
-- Get order data
-- Update field and table name
-- 834Mb for 6.8M rows
SELECT  
  id AS transaction_id,
  time_stamp AS datetime,
  bill_addressee AS user_name,
  email AS email,
  CONCAT(ship_street1, " ", ship_street2, " ", ship_country) AS shipping_address,
  status AS order_status,
  total AS revenue,
  weight AS quantity,
  MD5(CONCAT(bill_addressee, email, ship_street1, ship_street2, ship_country)) AS user_id
FROM `steadfast-bebop-389314.purchasedata.orders`
GROUP BY 1,2,3,4,5,6,7,8,9;






-- BQ extract GA4 data TRAFFIC SOURCE
-- 11.5Gb for 540k rows

SELECT
  ecommerce.transaction_id AS transaction_id,
  
  FORMAT_TIMESTAMP('%Y-%m-%dT%H:%M:%S', TIMESTAMP_SECONDS(CAST(event_timestamp / 1000000 AS INT64))) AS datetime,

  traffic_source.source AS traffic_source,
  traffic_source.medium AS traffic_medium,
  traffic_source.name AS traffic_name,

  ecommerce.purchase_revenue as revenue,
  ecommerce.total_item_quantity as quantity,
  
-- FROM `ga4-bigquery-363918.analytics_253942452.events_*`
FROM `steadfast-bebop-389314.analytics_310956983.events_*`

WHERE 
  event_name = 'purchase'

group by 1,2,3,4,5,6,7
order by datetime



-- BQ extract GA4 data ITEM DATA
-- 6.4Gb for 1.1M rows

SELECT
  ecommerce.transaction_id AS transaction_id,
  FORMAT_TIMESTAMP('%Y-%m-%dT%H:%M:%S', TIMESTAMP_SECONDS(CAST(event_timestamp / 1000000 AS INT64))) AS datetime,
  
  item.item_name AS item_name, -- Product/item name
  item.item_category AS category_name1, -- Product/item category
    item.item_category2 AS category_name2, 
  item.item_category3 AS category_name3, 
  item.item_category4 AS category_name4, 
  item.item_category5 AS category_name5, 


  item.item_revenue AS item_revenue, -- Revenue per item
  item.quantity AS item_quantity, -- Quantity of the item purchased

  ecommerce.purchase_revenue AS total_transaction_revenue, -- Total revenue per transaction
  ecommerce.total_item_quantity AS total_transaction_quantity -- Total quantity of items per transaction

-- FROM `ga4-bigquery-363918.analytics_253942452.events_*`,
FROM `steadfast-bebop-389314.analytics_310956983.events_*` ,

  UNNEST(items) AS item -- Flatten the items array

WHERE 
  event_name = 'purchase'

ORDER BY 
  datetime;



