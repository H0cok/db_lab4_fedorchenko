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


-- Функція для виводу кількості продуктів, відповідно їх категорії

CREATE OR REPLACE FUNCTION num_prod_type(type_prod varchar(50))
RETURNS NUMERIC
LANGUAGE 'plpgsql'
AS $$
DECLARE num_prod NUMERIC;

BEGIN
	num_prod := (SELECT COUNT(purch_id) FROM conditions
					join purch_cond using(condition_id)
					WHERE condition_name = type_prod);
	RETURN num_prod;
END;
$$;

SELECT num_prod_type('fresh');

CREATE OR REPLACE FUNCTION modify_vegetables() RETURNS trigger AS
$$
     BEGIN
          UPDATE vegetables 
          SET  vegetable_name = vegetable_name || 's' WHERE vegetables.vegetable_id = NEW.vegetable_id; 
          RETURN NULL; 
     END;
$$ LANGUAGE 'plpgsql';
CREATE TRIGGER veget_insert
AFTER INSERT ON vegetables
FOR EACH ROW EXECUTE FUNCTION modify_vegetables();
INSERT INTO Vegetables(vegetable_id, vegetable_name) VALUES 
	(7, 'banana')

select * from vegetables;