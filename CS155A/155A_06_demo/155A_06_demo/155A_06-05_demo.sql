Use a_vets;

/*  demo01  */
Select
  CONCAT(ClientName, ' lives in ', cl_state)
From (
  Select
    CONCAT(cl_name_last, ' ', cl_name_first) As ClientName
  , cl_state
  From vt_clients
) tbl
;

Use a_oe;

/*  demo02  */
Select
  ord_id
, ord_date
, itemTotal
From (
  Select
    OH.ord_id
  , OH.ord_date
  , OD.quoted_price * quantity_ordered As itemTotal
  From a_oe.order_headers OH
  Join a_oe.order_details OD On OH.ord_id = OD.ord_id
  Join a_prd.products PR On OD.prod_id = PR.prod_id
  Where quoted_price > 0
  And quantity_ordered > 0
) rpt_base
Where ord_date < '2011-11-01'
;

/*  demo03  */
Select
  t_cust.cust_id
, cust_name
, prod_id
, ext_price
From (
  Select
    cust_id
  , CONCAT(cust_name_first, ' ', cust_name_last) As cust_name
  From a_oe.customers
  Where cust_name_first = 'William'
) t_cust
Join (
  Select
    OH.ord_id
  , ord_date
  , cust_id
  , prod_id
  , quoted_price * quantity_ordered As ext_price
  From a_oe.order_headers OH
  Join a_oe.order_details OD On OH.ord_id = OD.ord_id
) t_ord On t_cust.cust_id = t_ord.cust_id
;

/*  demo04  */
Select
  cust_id
, cust_name_last
, prod_id
, ext_price
From a_oe.customers
Join (
  Select
    OH.ord_id
  , ord_date
  , cust_id
  , prod_id
  , quoted_price * quantity_ordered As ext_price
  From a_oe.order_headers OH
  Join a_oe.order_details OD On OH.ord_id = OD.ord_id
) t_ord Using (cust_id)
;

/*  demo05  */
Select
  order_id, ExtCost
From (
  Select
    ord_id as order_id
  , quantity_ordered * quoted_price As extCost
  From (
    Select
      ord_id
    , quantity_ordered
    , quoted_price
    From a_oe.order_details
    Where prod_id = 1060
  ) tbl_details
) tbl_extCost
;

Select 
  ord_id as order_id
, quantity_ordered * quoted_price As extCost
From a_oe.order_details
Where prod_id = 1060 ; 
