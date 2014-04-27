Use a_oe;

/*  demo 01  */
Select
  a_prd.warehouses.warehouse_id
, a_prd.warehouses.loc_id
From a_prd.warehouses;

/*  demo 02  */
Select
  warehouses.warehouse_id
, warehouses.loc_id
From a_prd.warehouses;

Select
  warehouse_id
, loc_id
From a_prd.warehouses;

/*  demo 03  */
Select
  wh.warehouse_id
, wh.loc_id
From a_prd.warehouses wh;

Select
  warehouse_id
, loc_id
From a_prd.warehouses wh;

-- demo04  */
Select
  emp_id
, name_last As "Employee"
, dept_name
From a_emp.employees
Inner Join a_emp.departments Using (dept_id)
Limit 10;

/*  demo 05  */
Select
  cust_id
, cust_name_last As "Customer"
, ord_id
From a_oe.customers
Inner Join a_oe.order_headers Using (cust_id)
Order By cust_id
Limit 10;

/*  demo 06  */
Select
  cust_id
, cust_name_last As "Customer"
, ord_id
, prod_id
From a_oe.customers
Inner Join a_oe.order_headers Using (cust_id)
Inner Join a_oe.order_details Using (ord_id)
Order By cust_id, ord_id Limit 10;

/*  demo 07  */
Select
  cust_id
, cust_name_last As "Customer"
, ord_id
, prod_id
, prod_name
From a_oe.customers
Join a_oe.order_headers Using (cust_id)
Join a_oe.order_details Using (ord_id)
Join a_prd.products Using (prod_id)
Limit 10;

/*  demo 08  */
Select
  cust_id
, ord_id
, prod_id
, prod_name
, quoted_price
From a_oe.customers
Join a_oe.order_headers Using (cust_id)
Join a_oe.order_details Using (ord_id)
Join a_prd.products Using (prod_id)
Join a_prd.categories Using (catg_id)
Where catg_desc In ('APPLIANCES')
Limit 10;

/*  demo 09  */
Select
  ord_id
, cust_id
, emp_id
, name_last As "SalesRep"
From a_oe.order_headers oh
Join a_emp.employees em On oh.sales_rep_id = em.emp_id
Limit 10;

/*  demo 10  */
Select
  cs.cust_id
, cust_name_last As "Customer"
, ord_id
From a_oe.customers cs
Join a_oe.order_headers oh On cs.cust_id = oh.cust_id
Limit 10;

/*  demo 11  */
Select
  cs.cust_id
, cs.cust_name_last As "Customer"
, oh.ord_id
From a_oe.customers cs
Join a_oe.order_headers oh On cs.cust_id = oh.cust_id
Limit 10;

/*  demo 12  */
Select
  cs.cust_id
, cs.cust_name_last As "Customer"
, oh.ord_id
, em.emp_id
, em.name_last As "SalesRep"
From a_oe.customers cs
Join a_oe.order_headers oh Using (cust_id)
Join a_emp.employees em On oh.sales_rep_id = em.emp_id
Limit 10;

/*  demo 13  */
Select
  cs.cust_id
, oh.ord_id
, od.prod_id
, pr.prod_name
, od.quoted_price
From a_oe.customers cs
Join a_oe.order_headers oh On cs.cust_id = oh.cust_id
Join a_oe.order_details od On oh.ord_id = od.ord_id
Join a_prd.products pr On od.prod_id = pr.prod_id
Join a_prd.categories ct On pr.catg_id = ct.catg_id
Where ct.catg_desc In ('APPLIANCES')
Limit 10;

/*  demo 14  */
Select
  a_oe.customers.cust_id
, a_oe.order_headers.ord_id
, a_oe.order_details.prod_id
, a_prd.products.prod_name
, a_oe.order_details.quoted_price
From a_oe.customers
Join a_oe.order_headers On a_oe.customers.cust_id = a_oe.order_headers.Cust_id
Join a_oe.order_details On a_oe.order_details.ord_id = a_oe.order_headers.ord_id
Join a_prd.products On a_oe.order_details.prod_id = a_oe.order_details.prod_id
Join a_prd.categories On a_prd.categories.catg_id = a_prd.products.catg_id
Where a_prd.categories.catg_desc In ('APPLIANCES')
Limit 10;


/*  demo 15  */
Select
  *
From a_prd.warehouses w
Join a_prd.inventory i On w.warehouse_id = i.warehouse_id Limit 2;

Select
  *
From a_prd.warehouses w
Join a_prd.inventory i Using (warehouse_id) Limit 2;