Use a_prd;

/*  demo 01  */	
Select
  emp_id
, name_last As "Employee"
, hire_date
, salary
From a_emp.employees
Where hire_date Between '2008-01-01' And '2008-12-31'
;

/*  demo 02  */	
Select
  emp_id
, name_last As "Employee"
, hire_date
, salary
From a_emp.employees
Where hire_date Between '2008-01-01' And '2008-12-31'
And salary > 50000
;

/*  demo 03  */
Select
  job_id
, min_salary
, max_salary
From a_emp.jobs
Where job_id Not Like '%Sales%'
And min_salary > 40000
;

/*  demo 04  */	
Select
  emp_id
, name_last As "Employee"
, salary
From a_emp.employees
Where salary Between 12000 And 25000
Order By salary, emp_id;

/*  demo 05  */	
Select
  emp_id
, name_last As "Employee"
, salary
From a_emp.employees
Where salary > 12000
And salary < 25000
Order By salary, emp_id;

/*  demo 06  */
Select
  emp_id
, name_last As "Employee"
, salary
From a_emp.employees
Where salary < 12000
And salary > 25000
Order By salary, emp_id;

/*  demo 07  */
Select
  emp_id
, name_last As "Employee"
, hire_date
, salary
, job_id
From a_emp.employees
Where hire_date Between '1985-01-01' And '2005-12-31'
And salary > 50000
And job_id In (8, 16)
;

/*  demo 08  */
Select
  prod_id
, prod_name
, catg_id
, prod_warranty_period
From a_prd.products
Where row(catg_id, prod_warranty_period) = row('HW', 12);

Select
  prod_id
, prod_name
, catg_id
, prod_warranty_period
From a_prd.products
Where catg_id = 'HW'
And prod_warranty_period = 12;


/*  demo 09  */
Select
  emp_id
, name_last As "Employee"
, dept_id
From a_emp.employees
Where dept_id = 30
Or dept_id = 20
Order By `Employee`
;

/*  demo 10  */
Select
  emp_id
, hire_date
, salary
, job_id
From a_emp.employees
Where salary > 50000
;

/*  demo 11  */
Select
  emp_id
, hire_date
, salary
, job_id
From a_emp.employees
Where hire_date Between '1985-01-01' And '2005-12-31'
Or salary > 50000
;

/*  demo 12  */
Select
  emp_id
, hire_date
, salary
, job_id
From a_emp.employees
Where hire_date Between '1985-01-01' And '2005-12-31'
Or salary > 50000
Or job_id In (8, 16)
;

/*  demo 13  */
Select
  job_id
, job_title
, min_salary
, max_salary
From a_emp.jobs
Where max_salary >= 20000
Or max_salary Is Null
;

/*  demo 14  */
Select
  emp_id
, name_last As "Employee"
, dept_id
From a_emp.employees
Where Not dept_id In (30, 20)
Order By "Employee"
;

/*  demo 15  */
Select
  prod_id
, prod_list_price
, catg_id
From a_prd.products
Where catg_id = 'PET'
Or catg_id = 'SPG'
And prod_list_price < 100
;

/*  demo 16  */
Select
  emp_id
, name_last As Employee
, dept_id
, salary
From a_emp.employees
Where dept_id = 30
Or salary < 20000
Order By dept_id, salary;

/*  demo 17  */
Select
  emp_id
, name_last As Employee
, dept_id
, salary
From a_emp.employees
Where dept_id = 30
Xor salary < 20000
Order By dept_id, salary;

/*  demo 18  */
Select 
  prod_id
, prod_list_price
, catg_id
From a_prd.products
Where catg_id = 'PET' OR catg_id = 'SPG'
AND prod_list_price < 100;



/*  demo 19  */
Select
  prod_id
, prod_list_price
, catg_id
From a_prd.products
Where catg_id = 'SPG'Or catg_id = 'PET'
And prod_list_price < 100
;


/*  demo 20  */
Select
  prod_id
, prod_list_price
, catg_id
From a_prd.products
Where (catg_id = 'SPG'Or catg_id = 'PET')
And prod_list_price < 100
;


/*  demo 21  */
Select
  prod_id
, prod_list_price
, catg_id
From a_prd.products
Where catg_id In ('SPG', 'PET')
And prod_list_price < 100
;