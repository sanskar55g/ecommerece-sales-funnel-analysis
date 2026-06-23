/*
E-commerce core tables for Olist marketplace analytics.

These tables represent the cleaned, analytical layer used for
transactional analysis, seller performance, customer behavior,
and revenue reporting.

Source: Olist Brazilian E-Commerce Dataset (Kaggle)
*/

LOAD DATA INFILE '<PATH TO FILE olist_customers_dataset.csv>'
INTO TABLE ecommerce.olist_customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '<PATH TO FILE olist_products_dataset.csv>'
INTO TABLE ecommerce.olist_products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_category_name, @product_name_length, @product_description_length, 
@product_photos_qty, @product_weight_g, @product_length_cm, @product_height_cm, @product_width_cm)
SET 
product_name_length = NULLIF(@product_name_length, ''),
product_description_length = NULLIF(@product_description_length, ''),
product_photos_qty = NULLIF(@product_photos_qty, ''),
product_weight_g = NULLIF(@product_weight_g, ''),
product_length_cm = NULLIF(@product_length_cm, ''),
product_height_cm = NULLIF(@product_height_cm, ''),
product_width_cm = NULLIF(@product_width_cm, '');

LOAD DATA INFILE '<PATH TO FILE olist_orders_dataset.csv>'
INTO TABLE ecommerce.olist_orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, customer_id, order_status, @order_purchase_timestamp, @order_approved_at, 
@order_delivered_carrier_date, @order_delivered_customer_date, @order_estimated_delivery_date)
SET
order_purchase_timestamp = NULLIF(@order_purchase_timestamp, ''),
order_approved_at = NULLIF(@order_approved_at, ''),
order_delivered_carrier_date = NULLIF(@order_delivered_carrier_date, ''),
order_delivered_customer_date = NULLIF(@order_delivered_customer_date, ''),
order_estimated_delivery_date = NULLIF(@order_estimated_delivery_date, '');

LOAD DATA INFILE '<PATH TO FILE olist_sellers_dataset.csv>'
INTO TABLE ecommerce.olist_sellers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(seller_id, @seller_zip_code_prefix, seller_city, seller_state)
SET
seller_zip_code_prefix = NULLIF(@seller_zip_code_prefix, '');

LOAD DATA INFILE '<PATH TO FILE olist_order_items_dataset.csv>'
INTO TABLE ecommerce.olist_order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, order_item_id, product_id, seller_id, @shipping_limit_date, @price, @freight_value)
SET
shipping_limit_date = NULLIF(@shipping_limit_date, ''),
price = NULLIF(@price, ''),
freight_value = NULLIF(@freight_value, '');

LOAD DATA INFILE '<PATH TO FILE olist_order_payments_dataset.csv>'
INTO TABLE ecommerce.olist_order_payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, @payment_sequential, payment_type, @payment_installments, @payment_value)
SET
payment_sequential = NULLIF(@payment_sequential, ''),
payment_installments = NULLIF(@payment_installments, ''),
payment_value = NULLIF(@payment_value, '');

LOAD DATA INFILE '<PATH TO FILE olist_geolocation_dataset.csv>'
INTO TABLE ecommerce.olist_geolocation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@geolocation_zip_code_prefix, @geolocation_lat, @geolocation_lng, geolocation_city, geolocation_state)
SET
geolocation_zip_code_prefix = NULLIF(@geolocation_zip_code_prefix, ''),
geolocation_lat = NULLIF(@geolocation_lat, ''),
geolocation_lng = NULLIF(@geolocation_lng, '');

LOAD DATA INFILE '<PATH TO FILE olist_order_reviews_dataset.csv>'
IGNORE
INTO TABLE ecommerce.olist_order_reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(review_id, order_id, @review_score, @review_comment_title, @review_comment_message, 
@review_creation_date, @review_answer_timestamp)
SET
review_score = NULLIF(@review_score, ''),
review_comment_title = NULLIF(@review_comment_title, ''),
review_comment_message = NULLIF(@review_comment_message, ''),
review_creation_date = NULLIF(@review_creation_date, ''),
review_answer_timestamp = NULLIF(@review_answer_timestamp, '');

LOAD DATA INFILE '<PATH TO FILE product_category_name_translation.csv>'
INTO TABLE ecommerce.product_category_name_translation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_category_name, @product_category_name_english)
SET
product_category_name_english = NULLIF(@product_category_name_english, '');
