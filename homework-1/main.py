"""Скрипт для заполнения данными таблиц в БД Postgres."""
import csv
import psycopg2


def main():
    with psycopg2.connect(host="localhost", database="north", user="postgres",
                          password="1234567") as conn:
        with conn.cursor() as cur:
            with open('north_data/customers_data.csv',
                      encoding='utf-8') as cms_data_csv, open(
                    'north_data/employees_data.csv',
                    encoding='utf-8') as emplye_data_csv, open(
                    'north_data/orders_data.csv',
                    encoding='utf-8') as ordr_data_csv:

                for col in csv.DictReader(cms_data_csv):
                    cur.execute("INSERT INTO customers VALUES (%s, %s, %s)", (
                    col['customer_id'], col['company_name'],
                    col['contact_name']))

                for col in csv.DictReader(emplye_data_csv):
                    cur.execute(
                        "INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)",
                        (col['employee_id'], col['first_name'],
                         col['last_name'], col['title'],
                         col['birth_date'], col['notes']))

                for col in csv.DictReader(ordr_data_csv):
                    cur.execute(
                        "INSERT INTO orders VALUES (%s, %s, %s, %s, %s)", (
                        col['order_id'], col['customer_id'],
                        col['employee_id'], col['order_date'],
                        col['ship_city']))


if __name__ == "__main__":
    main()
