-- Процедура, яка створює нову таблицю з даними про продукти певної категорії

CREATE OR REPLACE PROCEDURE products_category(prod_cat varchar(50))
LANGUAGE 'plpgsql'
AS $$
BEGIN
	DROP TABLE IF EXISTS products_category;
	CREATE TABLE products_category
	AS
	(SELECT purch_id, vegetable_name, price, temperature FROM purchase 
	 join purch_veg using(purch_id)
	 join vegetables using(vegetable_id)
	 WHERE  vegetable_name = prod_cat);
END;
$$;

CALL products_category('tomato');
select * from products_category;