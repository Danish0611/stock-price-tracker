
-- Insert data into the stocks table
INSERT INTO stocks (ticker_symbol, company_name, sector, industry)
VALUES
('AAPL', 'Apple Inc.', 'Technology', 'Consumer Electronics'),
('MSFT', 'Microsoft Corporation', 'Technology', 'Software'),
('GOOGL', 'Alphabet Inc.', 'Communication Services', 'Internet Content & Information'),
('RELIANCE', 'Reliance Industries', 'Energy', 'Conglomerate'),
('TCS', 'Tata Consultancy Services', 'Technology', 'IT Services');

-- Insert data into the daily_prices table
INSERT INTO daily_prices (stock_id, date, open_price, close_price, high_price, low_price, volume)
VALUES
(1, '2024-08-01', 170.00, 172.50, 173.00, 169.00, 30000000),
(1, '2024-08-02', 172.00, 174.00, 175.00, 171.50, 31000000),
(2, '2024-08-01', 310.00, 315.50, 316.00, 308.50, 20000000),
(3, '2024-08-01', 2700.00, 2750.00, 2760.00, 2680.00, 1500000),
(4, '2024-08-01', 2400.00, 2450.00, 2470.00, 2390.00, 5000000),
(5, '2024-08-01', 3000.00, 3050.00, 3070.00, 2990.00, 6000000);
