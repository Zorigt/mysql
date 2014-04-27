Use a_emp;


/*  demo 01  */
Select
  emp_id
, name_last As "Employee"
From a_emp.employees
Where dept_id = (
  Select dept_id
  From a_emp.employees
  Where emp_id = 162
);


/*  demo 02  */
Select
  emp_id
, name_last As "Employee"
From a_emp.employees
Where dept_id = (
  Select dept_id
  From a_emp.employees
  Where emp_id = 162
)
And emp_id <> 162
;

/*  demo 03  */
Select
  emp_id
, name_last As "Employee"
, salary
From a_emp.employees
Where salary > (
  Select salary
  From a_emp.employees
  Where emp_id = 162
);


/*  demo 04  */
Select
  emp_id
, name_last As "Employee"
, salary
From a_emp.employees
Where salary > (
  Select salary
  From a_emp.employees
  Where dept_id = 210
);

/*  demo 05   */
Select Distinct
  ord_id
From a_oe.order_details od
Join a_prd.products pr On od.prod_id = pr.prod_id
Where catg_id = 'spg'
Order By ord_id
;


/*  demo 06  */
Select Distinct
  ord_id
From a_oe.order_details
Where prod_id In (
  Select prod_id
  From a_prd.products
  Where catg_id = 'spg'
)
Order By ord_id
;