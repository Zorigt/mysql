Use a_testbed;

/* this includes more zoo rows for the demos */


-- This removes animal rows with an id value less than 100 and then inserts new rows.

Delete
  From zoo
Where z_id < 100;

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (23, 'Sam', 'Giraffe', 5000.00, '2002-05-15', '2002-05-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (25, 'Abigail', 'Armadillo', 490.25, '2010-01-15', '2010-04-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (56, 'Leon', 'Lion', 5000.50, '2009-03-25', '2010-03-25');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (57, 'Lenora', 'Lion', 5000.00, '2009-03-25', '2011-01-05');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (85, 'Sally', 'Giraffe', 5000.00, '2009-05-15', '2002-05-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (52, 'Floyd', 'giraffe', 3500.00, '2003-05-15', '2010-05-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (58, 'Bititi', 'Zebra', 500.99, '2004-04-01', '2004-11-22');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (34, 'Bulldozer', 'giraffe', 2500.00, '2007-08-11', '2008-06-05');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (90, 'Bri', 'giraffe', 500.00, '2009-01-26', '2009-01-26');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (44, Null, 'anteater', 500.00, '2006-02-22', '2010-05-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (23, 'Missy', 'koala', 2500.00, '2003-05-15', '2009-01-25');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (39, 'Monarch', 'bear', 500.00, '1984-04-01', '1999-06-05');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (12, Null, 'anteater', 500.00, '2006-02-22', '2006-02-22');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (75, 'Squeaky', 'penguin', 500.00, '2003-12-12', '2010-05-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (76, 'Squack', 'penguin', 750.00, '2005-12-10', '2006-02-22');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (77, 'Squeal', 'penguin', 750.00, '2005-12-12', '2006-02-22');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (78, 'Squall', 'penguin', 400.00, '2003-12-12', '2004-11-22');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (79, 'Squeaky', 'penguin', 500.00, '2008-10-08', '2010-05-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (88, 'Kachina', 'bear', 4500.00, '2007-05-15', '2008-06-05');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (89, 'Kiona', 'bear', 4500.00, '2007-05-15', '2008-06-05');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (77, Null, 'anteater', 500.00, '2008-04-01', '2010-05-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (78, 'Baxter', 'anteater', 500.00, '2008-06-04', '2011-01-05');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (35, 'Mister', 'koala', 1250.35, '2004-12-08', '2009-01-25');