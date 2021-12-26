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

select * from vegetables