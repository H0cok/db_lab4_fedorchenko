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