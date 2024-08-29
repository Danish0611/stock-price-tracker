

-- Create the stocks table
CREATE TABLE stocks (
    id SERIAL PRIMARY KEY,
    ticker_symbol VARCHAR(10) UNIQUE NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    sector VARCHAR(100),
    industry VARCHAR(100)
);

-- Create the daily_prices table
CREATE TABLE daily_prices (
    id SERIAL PRIMARY KEY,
    stock_id INTEGER REFERENCES stocks(id) ON DELETE CASCADE,
    date DATE NOT NULL,
    open_price DECIMAL(10, 2) NOT NULL,
    close_price DECIMAL(10, 2) NOT NULL,
    high_price DECIMAL(10, 2) NOT NULL,
    low_price DECIMAL(10, 2) NOT NULL,
    volume INTEGER NOT NULL,
    UNIQUE(stock_id, date)
);
