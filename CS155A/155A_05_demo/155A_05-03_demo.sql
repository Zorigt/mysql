Use a_emp;


/*  demo 01  */
Select
  emp_id
, dept_id
, job_id
From a_emp.employees
Order By dept_id, emp_id;


/*  demo 02  */
Select
  emp_id
, dept_id
, job_id
From a_emp.employees
Where job_id = 16
Order By dept_id, emp_id;


/*  demo 03  */
Select
  emp_id
, dept_id
, job_id
From a_emp.employees
Where job_id = 16
Or job_id = 32
Order By emp_id;


/*  demo 04  */
Select
  emp_id
, dept_id
, job_id
From a_emp.employees
Where job_id = 16
And job_id = 32
Order By emp_id
;


/*  demo 05  */
Select Distinct
  dept_id
From a_emp.employees
Where job_id = 16;


/*  demo 06  */
Select Distinct
  dept_id
From a_emp.employees
Where job_id = 32;


/*  demo 07  */
Select Distinct
  dept_id
From a_emp.employees
Where job_id = 16
Or job_id = 32;


/*  demo 08  */
Select Distinct
  dept_id
From a_emp.employees
Where job_id = 16
And job_id = 32;

/*  demo 09  */
Select
  dept_id
From a_emp.departments
Where dept_id In (
  Select
    dept_id
  From a_emp.employees
  Where job_id = 16
)
And dept_id In (
  Select
    dept_id
  From a_emp.employees
  Where job_id = 32
);



/*  demo 10  */
Select
  oh.cust_id
, ord_id
, od.prod_id
From a_oe.order_headers oh
Join a_oe.order_details od Using (ord_id)
Where prod_id In (1050, 1060)
Order By oh.cust_id, ord_id, od.prod_id;



/*  demo 11  */
Select  oh.cust_id, ord_id, od.prod_id
from a_oe.order_headers oh 
join a_oe.order_details od using (ord_id)
where prod_id = 1050
or   prod_id = 1060
order by oh.cust_id, ord_id, od.prod_id;


/*  demo 12  */
Select
  oh.cust_id
, ord_id
, od.prod_id
From a_oe.order_headers oh
Join a_oe.order_details od Using (ord_id)
Where prod_id = 1050
And prod_id = 1060
Order By oh.cust_id, ord_id, od.prod_id;

/*  demo 13  */
Select
  oh.cust_id
, ord_id
, od.prod_id
From a_oe.order_headers oh
Join a_oe.order_details od Using (ord_id)
Order By ord_id;


/*  demo 14  */
Select
  oh.cust_id
, ord_id
From a_oe.order_headers oh
Where ord_id In (
  Select
    ord_id
  From a_oe.order_details od
  Where prod_id = 1050
)
And ord_id In (
  Select
    ord_id
  From a_oe.order_details od
  Where prod_id = 1060
)
Order By oh.cust_id, ord_id;


/*  demo 15  */
Select
  cust_id
From a_oe.customers
Where cust_id In (
  Select
    cust_id
  From a_oe.order_headers oh
  Join a_oe.order_details od Using (ord_id)
  Where prod_id = 1050
)
And cust_id In (
  Select
    cust_id
  From a_oe.order_headers oh
  Join a_oe.order_details od Using (ord_id)
  Where prod_id = 1060
)
Order By cust_id;