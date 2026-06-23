
CREATE TABLE IF NOT EXISTS marketing.marketing_qualified_leads_staging (
    mql_id VARCHAR(50),
    first_contact_date VARCHAR(50),
    landing_page_id VARCHAR(100),
    origin VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS marketing.marketing_closed_deals_staging (
    mql_id VARCHAR(50),
    seller_id VARCHAR(50),
    sdr_id VARCHAR(50),
    sr_id VARCHAR(50),
    won_date VARCHAR(50),
    business_segment VARCHAR(100),
    business_type VARCHAR(100),
    lead_type VARCHAR(100),
    lead_behaviour_profile VARCHAR(100),
    has_company VARCHAR(10),
    has_gtin VARCHAR(10),
    average_stock VARCHAR(50),
    declared_product_catalog_size VARCHAR(50),
    declared_monthly_revenue VARCHAR(50)
);
