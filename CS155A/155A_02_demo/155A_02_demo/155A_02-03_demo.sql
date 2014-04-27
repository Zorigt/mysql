Use a_testbed;

/*  demo 01  */
Select
  z_name
, z_cost
From zoo;

/*  demo 02  */
Select
  z_name
, z_cost "Price more than 2K"
, z_type
From zoo
Where z_cost > 2000;

/*  demo 03  */
Select
  z_dob
, z_type
, z_name
From zoo
Where z_type = 'giraffe';

/*  demo 04  */
Select
  z_name
, z_cost "Price more than 20K"
, z_type
From zoo
Where z_cost > 20000;