Use a_testbed;
Drop Table If Exists a_testbed.z_em_empproj;
Drop Table If Exists a_testbed.z_em_emp;
Drop Table If Exists a_testbed.z_em_dept;

Create Table a_testbed.z_em_dept (
  d_id int
, d_name varchar(25)
);

Create Table a_testbed.z_em_emp (
  e_id int
, e_name varchar(25)
, d_id int
);

Create Table a_testbed.z_em_empproj (
  p_id varchar(25)
, e_id int
);

Insert Into a_testbed.z_em_dept
  Values 
    (100, 'Manufacturing')
  , (150, 'Accounting')
  , (200, 'Marketing')
  , (250, 'Research')
;
Insert Into a_testbed.z_em_emp
  Values 
    (1, 'Jones', 150)
  , (2, 'Martin', 150)
  , (3, 'Gates', 250)
  , (4, 'Anders', 100)
  , (5, 'Bossy', Null)
  , (6, 'Perkins', Null)
;

Insert Into a_testbed.z_em_empproj
  Values 
    ('ORDB-10', 3)
  , ('ORDB-10', 5)
  , ('ORDB-10', 2)
  , ('Q4-SALES', 2)
  , ('Q4-SALES', 4)
  , ('Q4-SALES', 5)
;

/*  demo01  */
Select
  a_testbed.z_em_dept.d_id
, d_name
, e_id
, e_name
From a_testbed.z_em_dept
Left Join a_testbed.z_em_emp On a_testbed.z_em_dept.d_id = a_testbed.z_em_emp.d_id
;

Select
  d_id
, d_name
, e_id
, e_name
From a_testbed.z_em_dept
Left Join a_testbed.z_em_emp Using (d_id)
;


/*  demo02  */   
Select
  a_testbed.z_em_dept.d_id
, d_name
, e_id
, e_name
From a_testbed.z_em_emp
Left Join a_testbed.z_em_dept On a_testbed.z_em_dept.d_id = a_testbed.z_em_emp.d_id;

Select
  d_id
, d_name
, e_id
, e_name
From a_testbed.z_em_emp
Left Join a_testbed.z_em_dept Using (d_id)
;

/*  demo03  */
Select
  a_testbed.z_em_dept.d_id
, d_name
, e_id
, e_name
From a_testbed.z_em_dept
Right Join a_testbed.z_em_emp On a_testbed.z_em_dept.d_id = a_testbed.z_em_emp.d_id;

Select
  d_id
, d_name
, e_id
, e_name
From a_testbed.z_em_dept
Right Join a_testbed.z_em_emp Using (d_id)
;

/*  demo04  */   
Select
  d_id
, d_name
, e_id
, e_name
, P_ID
From a_testbed.z_em_dept
Left Join a_testbed.z_em_emp Using (d_id)
Left Join a_testbed.z_em_empproj Using (e_id)
;

/*  demo05  */
Select
  e_id
, e_name
, d_id
, d_name
, P_ID
From a_testbed.z_em_emp
Left Join a_testbed.z_em_dept Using (d_id)
Left Join a_testbed.z_em_empproj Using (e_id)
;

/*  demo06  */
Select
  a_testbed.z_em_emp.e_id
, e_name
, a_testbed.z_em_dept.d_id
, d_name
, P_ID
From a_testbed.z_em_emp
Left Join a_testbed.z_em_dept On a_testbed.z_em_dept.d_id = a_testbed.z_em_emp.d_id
Join a_testbed.z_em_empproj On a_testbed.z_em_emp.e_id = a_testbed.z_em_empproj.e_id
;




-- switch database
Use a_oe;

/*  demo07  */
Select
  cust_id
, cust_name_last
, ord_id
From a_oe.customers
Join a_oe.order_headers Using (cust_id)
Where cust_id Between 404900 And 409030
Order By cust_id, ord_id;


/*  demo08  */
Select
  cust_id
, cust_name_last
, ord_id
From a_oe.customers
Left Join a_oe.order_headers Using (cust_id)
Where cust_id Between 404900 And 409030
Order By cust_id, ord_id;


/*  demo09  */
Select
  cust_id
, cust_name_last
, ord_id
From a_oe.customers
Right Join a_oe.order_headers Using (cust_id)
Where cust_id Between 404900 And 409030
Order By cust_id, ord_id;


/*  demo10  */
Select
  PR.prod_id
, PR.prod_desc
, PR.catg_id
, OD.ord_id
From a_prd.products PR
Join a_oe.order_details OD On PR.prod_id = OD.prod_id
Where PR.catg_id In ('MUS')
Order By PR.prod_id;


/*  demo11  */
Select
  PR.prod_id
, PR.prod_desc
, PR.catg_id
From a_prd.products PR
Where catg_id In ('MUS')
Order By PR.prod_id;


/*  demo12  */
Select
  PR.prod_id
, prod_desc
, catg_id
, ord_id
From a_prd.products PR
Left Join a_oe.order_details OD On PR.prod_id = OD.prod_id
Where catg_id In ('MUS')
Order By PR.prod_id;



/*  demo13  */
Select
  OD.prod_id
, prod_desc
, catg_id
, ord_id
From a_prd.products PR
Left Join a_oe.order_details OD On PR.prod_id = OD.prod_id
Where catg_id In ('MUS')
Order By OD.prod_id;