-- Подключиться к БД Northwind и сделать следующие изменения:
-- 1. Добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)
ALTER TABLE products
ADD CONSTRAINT criterion CHECK (unit_price > 0);


-- 2. Добавить ограничение, что поле discontinued таблицы products может содержать только значения 0 или 1
ALTER TABLE products
ADD CONSTRAINT criterion_for_discontinued CHECK (discontinued IN (0, 1));


-- 3. Создать новую таблицу, содержащую все продукты, снятые с продажи (discontinued = 1)
CREATE TABLE discontinued_products AS (SELECT * FROM products WHERE discontinued = 1);
ALTER TABLE discontinued_products
ADD CONSTRAINT key_for_discontinued_products_id PRIMARY KEY(product_id);


-- 4. Удалить из products товары, снятые с продажи (discontinued = 1)
-- Для 4-го пункта может потребоваться удаление ограничения, связанного с foreign_key. Подумайте, как это можно решить, чтобы связь с таблицей order_details все же осталась.
SELECT * INTO clone_order_details FROM order_details
WHERE product_id IN (SELECT product_id FROM products WHERE discontinued=1);

DELETE FROM order_details
WHERE product_id IN (SELECT product_id FROM products WHERE discontinued=1);

DELETE FROM products WHERE discontinued=1
