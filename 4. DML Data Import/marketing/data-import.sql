-- Load raw marketing funnel CSVs into staging tables
-- No transformations, everything loaded as VARCHAR

LOAD DATA INFILE 'PATH TO olist_marketing_qualified_leads_dataset.csv'
IGNORE
INTO TABLE marketing.marketing_qualified_leads_staging
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'PATH TO olist_closed_deals_dataset.csv'
IGNORE
INTO TABLE marketing.marketing_closed_deals_staging
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
