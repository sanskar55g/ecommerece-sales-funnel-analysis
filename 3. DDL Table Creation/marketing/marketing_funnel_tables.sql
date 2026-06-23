CREATE SCHEMA IF NOT EXISTS marketing;

CREATE TABLE IF NOT EXISTS marketing.marketing_qualified_leads (
    mql_id VARCHAR(50) PRIMARY KEY,
    first_contact_date DATE,
    landing_page_id VARCHAR(100),
    origin VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS marketing.marketing_closed_deals (
    mql_id VARCHAR(50) PRIMARY KEY,
    seller_id VARCHAR(50),
    sdr_id VARCHAR(50),
    sr_id VARCHAR(50),
    won_date DATE,
    business_segment VARCHAR(100),
    business_type VARCHAR(100),
    lead_type VARCHAR(100),
    lead_behaviour_profile VARCHAR(100),
    has_company TINYINT(1),
    has_gtin TINYINT(1),
    average_stock VARCHAR(50),
    declared_product_catalog_size NUMERIC(10,2),
    declared_monthly_revenue NUMERIC(15,2),
    FOREIGN KEY (mql_id) REFERENCES marketing.marketing_qualified_leads(mql_id),
    FOREIGN KEY (seller_id) REFERENCES ecommerce.olist_sellers(seller_id)
);
