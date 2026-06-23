-- Load raw marketing funnel CSVs into staging tables
-- No transformations, everything loaded as VARCHAR

LOAD DATA INFILE '<PATH TO FILE olist_marketing_qualified_leads_dataset.csv>'
INTO TABLE marketing.marketing_qualified_leads_staging
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(mql_id, first_contact_date, landing_page_id, origin);

LOAD DATA INFILE '<PATH TO FILE olist_marketing_closed_deals_dataset.csv>'
INTO TABLE marketing.marketing_closed_deals_staging
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(mql_id, seller_id, sdr_id, sr_id, won_date, business_segment, business_type, 
lead_type, lead_behaviour_profile, has_company, has_gtin, average_stock, 
declared_product_catalog_size, declared_monthly_revenue);
