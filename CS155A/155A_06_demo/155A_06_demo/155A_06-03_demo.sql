Use a_testbed;

/*  demo01  */
Select
  z_em_emp.d_id As "EM_Emp.d_id"
, z_em_dept.d_id As "EM_Dept.d_id"
, d_name
From z_em_dept
Left Join z_em_emp On z_em_dept.d_id = z_em_emp.d_id
Where z_em_emp.d_id Is Null
;

/*  demo02  */
Select
  z_em_emp.d_id As "EM_Emp.d_id"
, z_em_dept.d_id As "EM_Dept.d_id"
, d_name
From z_em_dept
Left Join z_em_emp On z_em_dept.d_id = z_em_emp.d_id
Where z_em_dept.d_id Is Null
;

/*  demo03  */
Select
  d_id
, d_name
From z_em_dept
Left Join z_em_emp Using (d_id)
Where d_id Is Null
;

/*  demo04  */
Select
  z_em_emp.d_id As "EM_Emp.d_id"
, z_em_dept.d_id As "EM_Dept.d_id"
, d_name
From z_em_dept
Left Join z_em_emp Using (d_id)
Where z_em_emp.d_id Is Null
;

/*  demo05  */
Select
  z_em_emp.d_id As "EM_Emp.d_id"
, z_em_dept.d_id As "EM_Dept.d_id"
, d_name
From z_em_dept
Left Join z_em_emp On z_em_dept.d_id = z_em_emp.d_id
;

/*  demo06  */
Select
  cust_id
, cust_name_last
, ord_id
From a_oe.customers
Left Join a_oe.order_headers Using (cust_id)
Where cust_id Between 404900 And 409030
And ord_id Is Null
Order By cust_id
;

/*  demo07  */
Select
  CS.cust_id
, CS.cust_name_last
, OH.ord_id
From a_oe.order_headers OH
Left Join a_oe.customers CS On CS.cust_id = OH.cust_id
Where OH.cust_id Is Null
;


/*  demo08  */
Select
  catg_id As catg
, prod_id As p_id
, prod_desc As product
, prod_list_price As price
From a_prd.products
Left Join a_oe.order_details Using (prod_id)
Where ord_id Is Null
Order By catg_id, prod_id;

/*  demo09  */
Select
  catg_id
, a_prd.products.prod_id
, prod_name As product
, quantity_on_hand
From a_prd.products
Left Join a_prd.inventory On a_prd.products.prod_id = a_prd.inventory.prod_id
Where a_prd.inventory.prod_id Is Null
Or quantity_on_hand = 0
Order By quantity_on_hand, catg_id, prod_id;

/*  demo10  */

Select
  cust_id
, cust_name_last
From a_oe.customers
Where cust_id Not In (
  Select
    cust_id
  From a_oe.order_headers
);

/*  demo11  */
Select
  catg_id As catg
, prod_id As p_id
, prod_desc As product
, prod_list_price As price
From a_prd.products
Where prod_id Not In (
  Select
    prod_id
  From a_oe.order_details
)
Order By catg_id, prod_id;

/*  demo12  */
Select
  emp_id
, name_last
, Ord_id
From a_emp.employees
Left Join a_oe.order_headers On emp_id = sales_rep_id
;

/*  demo13  */
Select
  emp_id
, name_last
From a_emp.employees
Left Join a_oe.order_headers On emp_id = sales_rep_id
Where ord_id Is Null
;

/*  demo14  */
Select
  emp_id
, name_last
From a_emp.employees
Where emp_id Not In (
  Select
    sales_rep_id
  From a_oe.order_headers
);

/*  demo15  */
Select
  emp_id
, name_last
From a_emp.employees
Where emp_id Not In (
  Select
    sales_rep_id
  From a_oe.order_headers
  Where sales_rep_id Is Not Null
);