Use a_oe;

/*  demo 01  */
Create table a_testbed.z_tst_case (
  col_id int primary key
, col_1 varchar(10) not null
);

Insert into a_testbed.z_tst_case values (1, 'zebra');
Insert into a_testbed.z_tst_case values (2, 'ZEBRA');
Insert into a_testbed.z_tst_case values (3, 'Zebra');
Insert into a_testbed.z_tst_case values (4, 'ZEBra');


/*  demo 02  */
Select col_id, col_1 
From a_testbed.z_tst_case 
Where col_1 = 'zebra'; 


/*  demo 03  */
Select col_id, col_1 
From a_testbed.z_tst_case 
Where binary col_1 = 'zebra'; 


Select col_id, col_1 
From a_testbed.z_tst_case 
Where binary col_1 = 'ZEBra'; 

/*  demo04  */
Select col_id, col_1 
From a_testbed.z_tst_case 
Where col_1 = binary 'ZEBRA'; 


Select col_id, col_1 
From a_testbed.z_tst_case 
Where binary col_1 IN( 'ZEBRA', 'Zebra'); 

/*  demo 05  */
Select col_id, col_1 
From a_testbed.z_tst_case 
Where col_1 = 'zebra  ';

Select col_id, col_1 
From a_testbed.z_tst_case w
Where binary col_1 = 'zebra  ';


Select col_id, col_1 
From a_testbed.z_tst_case 
Where col_1 = binary 'zebra  '; 


/*  demo 06  */
create table a_testbed.z_tst_strings(
   col_id int primary key
 , col_1 char(10)
 , col_2 varchar(10)
 );


/*  demo 07  */
-- no explicit spaces
	insert into a_testbed.z_tst_strings values (1, 'zebra',      'zebra');
-- two trailing spaces for col_2 
	insert into a_testbed.z_tst_strings values (2, 'zebra',      'zebra  '); 
-- two leading spaces for col_2 
	insert into a_testbed.z_tst_strings values (3, 'zebra',      '  zebra');
-- explicit spaces for col_1 to a length of 10
	insert into a_testbed.z_tst_strings values (4, 'zebra     ', 'zebra');
-- explicit spaces for col_1 and col_2 to a length of 10
	insert into a_testbed.z_tst_strings values (5, 'zebra     ', 'zebra     ');


/*  demo 08  */
Select col_id, col_1, col_2
From  a_testbed.z_tst_strings
;


/*  demo 09  */
Select col_id
, concat(col_1, 'X') as col_1, length(col_1)
, concat(col_2, 'X') as col_2, length(col_2)
From  a_testbed.z_tst_strings ;


/*  demo 10  */
Select col_id, col_2,  concat(col_2, 'X') 
From a_testbed.z_tst_strings
Where col_2 = 'zebra';


/*  demo 11  */
Select col_id, col_2,  concat(col_2, 'X') 
From a_testbed.z_tst_strings
Where col_2 = binary 'zebra';


/*  demo 12  */
Select col_id, col_2,  concat(col_2, 'X') 
From a_testbed.z_tst_strings
Where col_2 = binary 'zebra  ';


/*  demo 13  */
Select  '450' + 5, '25.08' * 6;

/*  demo 14  */
Select  'ABC' + 5;

/*  demo 15  */
Select  '$10.25' + 5;

/*  demo 16  */
Select  null  + 5;

/*  demo 17  */
Select '123ABC' + 10, '123ABC' * 1, '123,456' * 1;

/*  demo 18  */
Select col_id, col_1 
From  a_testbed.z_tst_case 
Where col_1;

Select col_id, col_1, col_1 +1 
From  a_testbed.z_tst_case 
Where col_1 + 1;

Select * 
From  z_tst_case 
Where col_1 + 3;


Select * 
From  a_vets.vt_animals 
Where an_name;
