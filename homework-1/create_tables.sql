CREATE DATABASE north
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE employees
(
    employee_id int PRIMARY KEY,
    first_name varchar(100) NOT NULL,
    second_name varchar(100) NOT NULL,
	title varchar(100) NOT NULL,
	birthday date,
	information text
);

CREATE TABLE customers
(
    customer_id varchar(5) PRIMARY KEY,
    company_name varchar(100) NOT NULL,
    contact_name varchar(100) NOT NULL
);

CREATE TABLE orders
(
    order_id int PRIMARY KEY,
    customer_id varchar(5) REFERENCES customers(customer_id) NOT NULL,
    employee_id int REFERENCES employees(employee_id) NOT NULL,
	order_date date,
	ship_city varchar(100) NOT NULL
);