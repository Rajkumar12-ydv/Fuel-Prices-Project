CREATE DATABASE global_fuel_prices;

USE global_fuel_prices;

USE global_fuel_prices;

CREATE TABLE fuel_prices (
    date DATE,
    country VARCHAR(100),
    region VARCHAR(100),
    income_level VARCHAR(50),
    subsidy_level VARCHAR(50),
    petrol_usd_liter DECIMAL(10,3),
    diesel_usd_liter DECIMAL(10,3),
    lpg_usd_liter DECIMAL(10,3),
    brent_crude_usd DECIMAL(10,3),
    tax_percentage DECIMAL(5,2)
);

DESCRIBE fuel_prices;

USE global_fuel_prices;

SHOW TABLES;

SELECT COUNT(*)
FROM global_fuel_prices_dataset;

USE global_fuel_prices;

SELECT *
FROM global_fuel_prices_dataset
LIMIT 10;

DESCRIBE global_fuel_prices_dataset;

SELECT
    COUNT(*) AS total_rows,
    SUM(date IS NULL) AS missing_date,
    SUM(country IS NULL) AS missing_country,
    SUM(region IS NULL) AS missing_region,
    SUM(income_level IS NULL) AS missing_income_level,
    SUM(subsidy_level IS NULL) AS missing_subsidy_level,
    SUM(petrol_usd_liter IS NULL) AS missing_petrol,
    SUM(diesel_usd_liter IS NULL) AS missing_diesel,
    SUM(lpg_usd_liter IS NULL) AS missing_lpg,
    SUM(brent_crude_usd IS NULL) AS missing_brent_crude,
    SUM(tax_percentage IS NULL) AS missing_tax
FROM global_fuel_prices_dataset;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT date, country) AS unique_date_country
FROM global_fuel_prices_dataset;

SELECT COUNT(*) AS blank_country
FROM global_fuel_prices_dataset
WHERE TRIM(country) = '';

SELECT COUNT(*) AS blank_region
FROM global_fuel_prices_dataset
WHERE TRIM(region) = '';

SELECT
    SUM(petrol_usd_liter < 0) AS negative_petrol,
    SUM(diesel_usd_liter < 0) AS negative_diesel,
    SUM(lpg_usd_liter < 0) AS negative_lpg,
    SUM(tax_percentage < 0) AS negative_tax,
    SUM(brent_crude_usd < 0) AS negative_brent_crude
FROM global_fuel_prices_dataset;

SELECT
    country,
    COUNT(*) AS total_records,
    ROUND(AVG(petrol_usd_liter), 3) AS avg_petrol,
    ROUND(AVG(diesel_usd_liter), 3) AS avg_diesel,
    ROUND(AVG(lpg_usd_liter), 3) AS avg_lpg,
    ROUND(AVG(tax_percentage), 2) AS avg_tax
FROM global_fuel_prices_dataset
GROUP BY country
ORDER BY avg_petrol DESC;

SELECT
    country,
    ROUND(AVG(tax_percentage), 2) AS avg_tax
FROM global_fuel_prices_dataset
GROUP BY country
ORDER BY avg_tax DESC
LIMIT 10;

SELECT
    country,
    ROUND(AVG(petrol_usd_liter), 3) AS avg_petrol
FROM global_fuel_prices_dataset
GROUP BY country
ORDER BY avg_petrol DESC
LIMIT 10;

USE global_fuel_prices;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT country) AS total_countries,
    ROUND(AVG(petrol_usd_liter), 3) AS avg_petrol,
    ROUND(AVG(diesel_usd_liter), 3) AS avg_diesel,
    ROUND(AVG(lpg_usd_liter), 3) AS avg_lpg,
    ROUND(AVG(tax_percentage), 2) AS avg_tax
FROM global_fuel_prices_dataset;