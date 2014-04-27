Use a_testbed;

/*  demo 01  */
Select
  d.d_name
, d.d_id
, e.d_id
, e.e_id
, e.e_name
From z_em_dept d
Join z_em_emp e On d.d_id = e.d_id;

/*  demo 02  */
Select
  z_em_dept.d_name
, z_em_dept.d_id
, z_em_emp.d_id
, z_em_emp.e_id
, z_em_emp.e_name
From z_em_dept
   , z_em_emp;

/*  demo 03  */
Select
  z_em_dept.d_name
, z_em_dept.d_id
, z_em_emp.d_id
, z_em_emp.e_id
, z_em_emp.e_name
From z_em_dept
Cross Join z_em_emp;

/*  demo 04  */
Select
  z_em_dept.d_name
, z_em_dept.d_id
, z_em_emp.d_id
, z_em_emp.e_id
, z_em_emp.e_name
, p_id
From z_em_dept
Cross Join z_em_emp
Cross Join z_em_empproj;



/*  Create table and Inserts */
Use a_testbed;

Create Table z_em_dept (
  d_id integer
, d_name varchar(15)
);

Insert Into z_em_dept
  Values (100, 'Manufacturing');
Insert Into z_em_dept
  Values (150, 'Accounting');
Insert Into z_em_dept
  Values (200, 'Marketing');
Insert Into z_em_dept
  Values (250, 'Research');

Create Table z_em_emp (
  e_id integer
, e_name varchar(15)
, d_id integer
);

Insert Into z_em_emp
  Values (1, 'Jones', 150);
Insert Into z_em_emp
  Values (2, 'Martin', 150);
Insert Into z_em_emp
  Values (3, 'Gates', 250);
Insert Into z_em_emp
  Values (4, 'Anders', 100);
Insert Into z_em_emp
  Values (5, 'Bossy', Null);
Insert Into z_em_emp
  Values (6, 'Perkins', Null);

Create Table z_em_EmpProj (
  p_id varchar(15)
, e_id integer
);

Insert Into z_em_EmpProj
  Values ('ORDB-10', 3);
Insert Into z_em_EmpProj
  Values ('ORDB-10', 5);
Insert Into z_em_EmpProj
  Values ('Q4-SALES', 2);
Insert Into z_em_EmpProj
  Values ('Q4-SALES', 4);
Insert Into z_em_EmpProj
  Values ('ORDB-10', 2);
Insert Into z_em_EmpProj
  Values ('Q4-SALES', 5);