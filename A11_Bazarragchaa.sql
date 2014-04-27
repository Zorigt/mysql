-- Zorigt Bazarragchaa
/* Delimiter #
show create function a_testbed.BookSize\G
show create function a_testbed.InternalBlankCount\G
show create function a_testbed.PrevMonth\G
Delimiter ; */

/* TASK 01 */
select tstBlank, a_testbed.InternalBlankCount(tstBlank) as NumBlanks
from (
select 'foo bar' as tstBlank
union all
select ' foobarr ' 
union all
select ' ffoo bar'
union all
select ' ffoo barr '
union all
select 'fooo bar'
union all
select 'fooo  bbar'
union all
select ' ffoo barr '
union all
select ' ffooo  bbarr ' 
union all
select ' ffooo   bbbarr ' 
union all
select ' ffoooo    bbbarr ' 
union all
select '   foo bar foo  bar      bar    ') as tstData;


/* TASK 02 */

select tstPage, a_testbed.BookSize(tstPage) as Sizes
from (
	select 100 as tstPage
	union all
	select 200
	union all
	select 201
	union all 
	select 500
	union all 
	select 501
	union all 
	select 502
	union all 
	select 1000
	union all 
	select 1001
	union all 
	select 1002
	union all 
	select 1500
	union all 
	select 1501
	union all
	select 1502
	union all
	select 0
	union all
	select -1
	union all 
	select -20
	union all
	select null) as tstBook;

/* TASK 03 */
select
	a_testbed.BookSize(B.page_count) as 'BookSize'
,	count(B.book_id) as 'NumBooks'
from a_bkinfo.books B
group by a_testbed.BookSize(B.page_count)
order by field(a_testbed.BookSize(B.page_count), 'Mini', 'Small', 'Medium', 'Large', 'Too Long', 'Invalid Input');

/* TASK 04 */
set @rundate = current_date;
set @m1 	= a_testbed.PrevMonth(@rundate, 6);
set @m2		= a_testbed.PrevMonth(@rundate, 5);
set @m3 	= a_testbed.PrevMonth(@rundate, 4);
select @rundate, @m1, @m2, @m3 \G

select distinct
	c_id
,	c_name
from a_bkorders.bkv_custorders 
where c_id in (
	select c_id
	from a_bkorders.bkv_custorders
	where date_format(order_date, '%Y-%m') = @m1)
and c_id in (
	select c_id
	from a_bkorders.bkv_custorders
	where date_format(order_date, '%Y-%m') = @m2)
and c_id in (
	select c_id
	from a_bkorders.bkv_custorders
	where date_format(order_date, '%Y-%m') = @m3);
 	
/* TASK 05 */
set @m5		= a_testbed.PrevMonth(@rundate, 2);
set @m6 	= a_testbed.PrevMonth(@rundate, 1);
select @rundate, @m5, @m6 \G

select
	count(*) as 'NumOrders'
,	count(distinct cust_id) as 'NumCust'
from a_bkorders.order_headers
where 	date_format(order_date, '%Y-%m') = @m5
or 		date_format(order_date, '%Y-%m') = @m6;
