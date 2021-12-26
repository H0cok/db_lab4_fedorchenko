INSERT INTO Conditions(condition_id, condition_name) VALUES 
	(1, 'fresh'),
	(2, 'avarage'),
	(3, 'low');
	
INSERT INTO Vegetables(vegetable_id, vegetable_name) VALUES 
	(1, 'tomato'),
	(2, 'potato'),
	(3, 'onion'),
	(4, 'garlic'),
	(5, 'cucamber');
	


INSERT INTO Purchase(purch_id, temperature, price) VALUES 
	(1, 17, 20.5),
	(2, 12, 15),
	(3, 27, 11),
	(4, 17.6, 9.49),
	(5, 18, 25.49),
	(6, 22, 13),
	(7, 21, 18),
	(8, 23, 45.99);

INSERT INTO Purch_cond(purch_id, condition_id) VALUES 
	(1, 1),
	(2, 1),
	(3, 2),
	(4, 3),
	(5, 3),
	(6, 2),
	(7, 1),
	(8, 1);

INSERT INTO Purch_veg(purch_id, vegetable_id) VALUES 
	(1, 1),
	(2, 2),
	(3, 1),
	(4, 3),
	(5, 4),
	(6, 5),
	(7, 2),
	(8, 3);
	