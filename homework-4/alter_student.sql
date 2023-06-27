-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE student(
	student_id SERIAL,
	first_name VARCHAR,
	last_name VARCHAR,
	birthday DATE,
	phone VARCHAR
);


-- 2. Добавить в таблицу student колонку middle_name varchar
ALTER TABLE student
ADD middle_name VARCHAR NULL;

-- 3. Удалить колонку middle_name
ALTER TABLE student
DROP COLUMN middle_name;

-- 4. Переименовать колонку birthday в birth_date
ALTER TABLE student
RENAME COLUMN birthday TO birth_date;

-- 5. Изменить тип данных колонки phone на varchar(32)
ALTER TABLE student
ALTER COLUMN phone TYPE VARCHAR(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора
INSERT INTO student (student_id, first_name, last_name, birth_date, phone)
VALUES
(1, 'Иван', 'Царевич', '01.02.976', '8888888888'),
(2, 'Максим', 'Перепелица', '01.01.1921', '0101010101'),
(3, 'John', 'Wick', '12.09.1964', '66666666');

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE student RESTART IDENTITY;