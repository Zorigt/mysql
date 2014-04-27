Use a_testbed;

/*   demo 01  */
Select 
  z_type
, z_cost
From a_testbed.zoo
Limit 5;


/*   demo 02  */
Select 
  z_type
, z_cost
From a_testbed.zoo
Order by z_cost desc
Limit 5;


/*   demo 03  */
Select 
  z_type
, z_cost
From a_testbed.zoo
Order by z_cost desc
Limit 12;


/*   demo 04  */
Select 
  z_type
, z_cost
From a_testbed.zoo
Order by z_cost desc, z_type
Limit 12;


/*   demo 05  */
Select 
  an_id
, an_name
From a_vets.vt_animals
Order by an_id
Limit 10;


/*   demo 06  */
Select 
  an_id
, an_name
From a_vets.vt_animals
Order by an_id
Limit 6, 10;


/*   demo 07  */
Select 
  an_id
, an_name
From a_vets.vt_animals
Order by an_id
Limit 10, 9999999999999999999;


/*   demo 08  */
Select 
  an_id
, an_name
From a_vets.vt_animals
Order by an_id
Limit 5;

Select 
  an_id
, an_name
From a_vets.vt_animals
Order by an_id
Limit 0, 5;


