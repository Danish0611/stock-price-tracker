-- Queries for Stock Price Tracker Project

-- 1. Retrieve all data from the stocks table
SELECT * FROM stocks;

-- 2. Retrieve all data from the daily_prices table
SELECT * FROM daily_prices;

-- 3. Retrieve daily prices for a specific stock by ticker symbol (e.g., 'RELIANCE')
SELECT s.ticker_symbol, d.date, d.open_price, d.close_price, d.high_price, d.low_price, d.volume
FROM stocks s
INNER JOIN daily_prices d ON s.id = d.stock_id
WHERE s.ticker_symbol = 'RELIANCE'
ORDER BY d.date;

-- 4. Retrieve daily prices for all stocks, sorted by date
SELECT s.ticker_symbol, d.date, d.open_price, d.close_price, d.high_price, d.low_price, d.volume
FROM stocks s
INNER JOIN daily_prices d ON s.id = d.stock_id
ORDER BY d.date;

-- 5. Calculate the average closing price for each stock
SELECT s.ticker_symbol, AVG(d.close_price) AS avg_close_price
FROM stocks s
INNER JOIN daily_prices d ON s.id = d.stock_id
GROUP BY s.ticker_symbol;

-- 6. Find the highest price change in a single day for each stock
SELECT s.ticker_symbol, MAX(d.high_price - d.low_price) AS max_price_change
FROM stocks s
INNER JOIN daily_prices d ON s.id = d.stock_id
GROUP BY s.ticker_symbol;

-- 7. Retrieve the stock with the highest trading volume on a specific date (e.g., '2024-08-01')
SELECT s.ticker_symbol, d.volume
FROM stocks s
INNER JOIN daily_prices d ON s.id = d.stock_id
WHERE d.date = '2024-08-01'
ORDER BY d.volume DESC
LIMIT 1;

-- 8. Retrieve total trading volume for each stock
SELECT s.ticker_symbol, SUM(d.volume) AS total_volume
FROM stocks s
INNER JOIN daily_prices d ON s.id = d.stock_id
GROUP BY s.ticker_symbol;

-- 9. Retrieve the latest price data for each stock
SELECT s.ticker_symbol, d.date, d.open_price, d.close_price, d.high_price, d.low_price, d.volume
FROM stocks s
INNER JOIN daily_prices d ON s.id = d.stock_id
WHERE d.date = (SELECT MAX(date) FROM daily_prices WHERE stock_id = s.id);

-- 10. Retrieve data for a specific date range (e.g., from '2024-08-01' to '2024-08-31')
SELECT s.ticker_symbol, d.date, d.open_price, d.close_price, d.high_price, d.low_price, d.volume
FROM stocks s
INNER JOIN daily_prices d ON s.id = d.stock_id
WHERE d.date BETWEEN '2024-08-01' AND '2024-08-31'
ORDER BY s.ticker_symbol, d.date;

-- 11. Count the number of records in daily_prices for each stock
SELECT s.ticker_symbol, COUNT(d.id) AS price_record_count
FROM stocks s
INNER JOIN daily_prices d ON s.id = d.stock_id
GROUP BY s.ticker_symbol;

-- 12. Find the stock with the highest average daily volume
SELECT s.ticker_symbol, AVG(d.volume) AS avg_daily_volume
FROM stocks s
INNER JOIN daily_prices d ON s.id = d.stock_id
GROUP BY s.ticker_symbol
ORDER BY avg_daily_volume DESC
LIMIT 1;

-- 13. List all stocks in a specific sector (e.g., 'Technology')
SELECT s.ticker_symbol, s.company_name, s.sector
FROM stocks s
WHERE s.sector = 'Technology';

-- 14. List the stock(s) with the highest closing price on a specific date (e.g., '2024-08-01')
SELECT s.ticker_symbol, d.close_price
FROM stocks s
INNER JOIN daily_prices d ON s.id = d.stock_id
WHERE d.date = '2024-08-01'
ORDER BY d.close_price DESC
LIMIT 1;
