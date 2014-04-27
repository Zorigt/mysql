a_testbed;

/*  demo 01  */
Select * 
From a_testbed.z_tst_nulls;


/*  demo 02  */
Select col_id, col_int 
From a_testbed.z_tst_nulls 
Where col_int is null;

Select col_id, col_int 
From a_testbed.z_tst_nulls 
Where col_int is not null;

/*  demo 03  */
Select col_id, col_int 
From a_testbed.z_tst_nulls 
Where col_int > 15;

Select col_id, col_int 
From a_testbed.z_tst_nulls 
Where col_int > 15 or col_int <= 15;

Select col_id, col_int 
From a_testbed.z_tst_nulls 
Where col_int <> 15;

/*  demo 04  */
set @tst_1 = 10;

/*  demo 05  */
Select col_id, col_int 
From a_testbed.z_tst_nulls 
Where col_int = @tst_1;


/*  demo 06  */
Select col_id, col_int 
From a_testbed.z_tst_nulls 
Where col_int <=> @tst_1;


/*  demo 07  */
Select col_id, col_int 
From a_testbed.z_tst_nulls 
Where col_int = @tst_2;


/*  demo 08  */
Select col_id, col_int 
From a_testbed.z_tst_nulls 
Where col_int <=> @tst_2;

/*  demo 09  */
Select 
  col_id
, col_int
, col_int <=> @tst_1
, col_int <=> @tst_2
From a_testbed.z_tst_nulls 
;
