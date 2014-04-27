Use a_oe;

/*  demo01  */   
Select
  *
From a_oe.credit_ratings
;

/*  demo02  */   
Select
  cust_id
, credit_limit
, rating
From a_oe.customers
Join a_oe.credit_ratings On credit_limit Between low_limit And high_limit
Order By cust_id
;

/*  demo03  */
Select
  cust_id
, credit_limit
, rating
From a_oe.customers
   , a_oe.credit_ratings
Where credit_limit Between low_limit And high_limit
Order By cust_id
;

/*  demo04  */   
Select
  a_prd.products.prod_id
, quoted_price
, prod_list_price
, ord_id
From a_oe.order_details od
Join a_prd.products On od.prod_id = a_prd.products.prod_id
And quoted_price > prod_list_price
;

/*  demo05  */
Select
  CONCAT(m.emp_id, ' ', m.name_last) As "Manager"
, CONCAT(e.emp_id, ' ', e.name_last) As "Supervises"
From a_emp.employees e
Left Join a_emp.employees m On m.emp_id = e.emp_mng
Order By `Manager`, `Supervises`;


/*  demo06  */   
Select
  emp_1.job_id
, emp_1.emp_id As emp1
, emp_2.emp_id As emp2
From a_emp.employees emp_1
Join a_emp.employees emp_2 On emp_1.job_id = emp_2.job_id
And emp_1.emp_id < emp_2.emp_id
Order By emp_1.job_id, emp_1.emp_id, emp_2.emp_id;


/*  demo07  */
Select
  e1.emp_id
, e1.salary
, ' earns more than '
, e2.emp_id
, e2.salary
From a_emp.employees e1
   , a_emp.employees e2
Where e1.salary > e2.salary
Order By e1.salary Desc, e1.emp_id;


/*  demo08  */
Select
  cust_id
, oh.ord_id
, prod_id
, quantity_ordered * quoted_price As "extprice"
From a_oe.order_headers oh
Join a_oe.order_details od On oh.ord_id = od.ord_id
Order By cust_id, oh.ord_id;


/*  demo09  */   
Select
  oh.cust_id
, oh.ord_id
, od.prod_id
, od.quantity_ordered * od.quoted_price As "extprice"
From a_oe.order_headers oh
   , a_oe.order_details od
Where oh.ord_id = od.ord_id
Order By oh.cust_id, oh.ord_id;