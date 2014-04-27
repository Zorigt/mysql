-- Zorigt Bazarragchaa

\W /* enable warnings! */

use a_testbed;

/* TASK 00 */

select user(), current_date(), version(), @@sql_mode\G

/* TASK 01 */

delete
from zoo
where z_id > 100;

select *
from zoo;

/* TASK 02 */

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (576, 'Oregon', 'Zebraish', 2501.25, '2013-08-02 08:25:00', '2013-05-03');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (947, 'Washington', 'Tigerish', 2502.25, '2013-08-02 09:25:00', '2013-06-04');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (295, 'California', 'Bearish', 2503.25, '2013-08-02 10:25:00', '2013-07-05');

/* TASK 03 */

Insert into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
Values (306, 'Carl', 'Wallaby', 13000, '2011-04-05 02:12:00', '2011-04-23'); 

Insert into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
Values (209,'Dee', 'Tarantula', 500, '2013-03-08 10:20:00', '2013-04-24');

Insert into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
Values (400, 'Cranky', 'Tortoise', 4000, '1930-02-23 12:12:00', '2000-03-01');

Insert into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
Values (306, 'Carl2', 'Wallaby', 13000, '2011-04-05 02:12:00', '2011-04-23'); 

Insert into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
Values (209,'Dee2', 'Tarantula', 500, '2013-03-08 10:20:00', '2013-04-24');

Insert into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
Values (400, 'Cranky2', 'Tortoise', 4000, '1930-02-23 12:12:00', '2000-03-01');

Insert into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
Values (306, 'Carl2', 'Wallaby', 13000, '2011-04-05 02:12:00', '2011-04-23'); 

Insert into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
Values (209,'Dee2', 'Tarantula', 500, '2013-03-08 10:20:00', '2013-04-24');

Insert into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
Values (400, 'Cranky2', 'Tortoise', 4000, '1930-02-23 12:12:00', '2000-03-01');

Insert into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
Values (306, 'Carl3', 'Wallaby', 13000, '2011-04-05 02:12:00', '2011-04-23'); 

Insert into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
Values (209,'Dee3', 'Tarantula', 500, '2013-03-08 10:20:00', '2013-04-24');

Insert into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
Values (400, 'Cranky3', 'Tortoise', 4000, '1930-02-23 12:12:00', '2000-03-01');


Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (111, 'Kitty', 'Tiger', 89000.00, '2000-09-11 01:45:00', '2005-07-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (123, 'Meow', 'Monkey', 45000.00, '1998-01-11 07:55:00', '2002-08-05');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (109, 'Oak', 'Snake', 25000.00, '1990-12-11 03:05:50', '2000-01-07');
  
/* TASK 04 */

select
  z_id
, z_name
, z_type
, z_cost
, z_dob
, z_acquired
from zoo;

/* TASK 05 */

select
  z_type
, z_cost
, z_name
from zoo
order by z_name;

/* TASK 06 */

select 
  z_type
, z_name
from zoo
order by z_name, z_type;

/* TASK 07 */

select distinct z_name
from zoo;


/* TASK 08 */

select distinct 
  z_type
, z_name
from zoo
order by z_type;

