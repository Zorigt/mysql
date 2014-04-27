Use a_prd;

/*  demo 01 */	
Create Table a_testbed.z_wildcards (
  cust_id int
, cust_phone varchar(12)
, cust_address varchar(30)
)
Engine = Innodb;

Insert Into a_testbed.z_wildcards
  Values (1, '510-239-8989', '101 Bush Street');
Insert Into a_testbed.z_wildcards
  Values (2, '510-45-78785', 'One Bush Street');
Insert Into a_testbed.z_wildcards
  Values (3, '415-809-8989', '124 High');
Insert Into a_testbed.z_wildcards
  Values (4, '415-124-2398', '15 High Road');
Insert Into a_testbed.z_wildcards
  Values (5, '415-239-8523', '1554 Rural Highway 12');

/*  demo 02 */		
Select
  cust_id
, cust_address
From a_testbed.z_wildcards
Where cust_Address Like '%Bush%'
;

/*  demo 03 */	
Select   
  cust_id
, cust_phone 
From a_testbed.z_wildcards  
Where cust_phone LIKE '415%'
;

/*  demo 04 */		
Select
  cust_id
, cust_phone
From a_testbed.z_wildcards
Where cust_phone Like '%239%'
;

/*  demo 05 */		
Select
  cust_id
, cust_phone
From a_testbed.z_wildcards
Where cust_phone Like '%-239-%'
;

/*  demo 06 */	
Select
  cust_id
, cust_address
From a_testbed.z_wildcards
Where cust_address Like '%High%'
;

/*  demo 07 */	
Select
  cust_id
, cust_address
From a_testbed.z_wildcards
Where cust_address Like '%High %'
;

/*  demo 08 */	
Create Table a_testbed.z_wild_nbr (
  col_id int Not Null
, col_test int(5) Zerofill
);

Insert Into a_testbed.z_wild_nbr
  Values (1, 25);
Insert Into a_testbed.z_wild_nbr
  Values (2, 250);
Insert Into a_testbed.z_wild_nbr
  Values (3, 25000);
Insert Into a_testbed.z_wild_nbr
  Values (4, 250);
Insert Into a_testbed.z_wild_nbr
  Values (5, 250);


/*  demo 09 */	
Select * 
From a_testbed.z_wild_nbr;

/*  demo 10 */	
Select  *
From a_testbed.z_wild_nbr
Where col_test Like '%25%';

/*  demo 11 */	
Select  *
From a_testbed.z_wild_nbr
Where col_test Like '25%';

/*  demo 12 */	
Select *
From a_testbed.z_wild_nbr
Where col_test = 25 ;

/*  demo 13 */	
Select col_test + 0 as col_test
From a_testbed.z_wild_nbr  ;

/*  demo 14 */	
Select
  ex_id
, ex_date
From a_vets.vt_exam_headers
Where ex_date Like '2011%';

/*  demo 15 */	
Select
  ex_id
, ex_date
From a_vets.vt_exam_headers
Where ex_date Like '%06%';

/*  demo 16 */	
Select
  ex_id
, ex_date
From a_vets.vt_exam_headers
Where ex_date Like '%-06-%';