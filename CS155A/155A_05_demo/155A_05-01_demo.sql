Use a_prd;

/*  demo 01  */
Set @v_price = 12.95;

Select  @v_price As Price;

/*  demo 02  */
Set @v_price = 12.95;

Select
  prod_id
, prod_list_price
, catg_id
From a_prd.products
Where prod_list_price = @v_price;


/*  demo 03  */
Set @v_price = 25.50;

Select
  prod_id
, prod_list_price
, catg_id
From a_prd.products
Where prod_list_price = @v_price;

/*  demo 04  */
Set @sales_tax_rate := 0.095;

Select
  prod_id
, quantity_ordered As Quantity
, quoted_price As Price
, quantity_ordered * quoted_price As AmtDue
, quantity_ordered * quoted_price * @sales_tax_rate As SalesTaxDue
From a_oe.order_details
Limit 5;

/*  demo 05  */
Set @target := 'Shingler Hammer';

Select
  prod_id
, prod_list_price
, prod_name
From a_prd.products
Where prod_name = @target;


/*  demo 06  */
Set @r := 25 / 8 + 4 + 4 * 1.0;

Select
  @r;

/*  demo 07  */
Set @r := 25 / 8 + 4 + 4 * 1.0;
Set @r2 := @r + 3;

Select
  @r2;

/*  demo 08  */
Set @target := 'Hammer';
Set @target2 := CONCAT('%', @target, '%');

Select
  prod_id
, prod_list_price
, prod_name
From a_prd.products
Where prod_name Like @target2;