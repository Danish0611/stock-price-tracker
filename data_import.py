import psycopg2
import pandas as pd

# Database connection parameters
conn_params = {
    'host': 'localhost',
    'database': 'stock_tracker',
    'user': 'your_username',
    'password': 'your_password'
}

# Function to import data from CSV to PostgreSQL
def import_data(csv_file, table_name):
    conn = psycopg2.connect(**conn_params)
    cursor = conn.cursor()

    # Read CSV file into DataFrame
    df = pd.read_csv(csv_file)

    # Generate the SQL statement for inserting data
    columns = ', '.join(df.columns)
    values = ', '.join(['%s'] * len(df.columns))
    insert_query = f'INSERT INTO {table_name} ({columns}) VALUES ({values})'

    # Insert data into PostgreSQL
    for row in df.itertuples(index=False):
        cursor.execute(insert_query, row)

    conn.commit()
    cursor.close()
    conn.close()
    print(f"Data from {csv_file} imported into {table_name}.")

# Example usage
import_data('data/stock_data.csv', 'stocks')
import_data('data/price_data.csv', 'daily_prices')
