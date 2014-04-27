-- Zorigt Bazarragchaa

\W /* enable warnings! */


/* TASK 00 */
select user(), current_date(), version(), @@sql_mode\G

/* TASK 01 */
set @rundate := current_date;
set @m1 	= date_sub(@rundate, interval 8 month);
set @m2	= date_sub(@rundate, interval 7 month);
set @m3 	= date_sub(@rundate, interval 6 month);
select @rundate, @m1, @m2, @m3 \G

/* TASK 02 */
select *
from a_bkorders.bkv_custorders BV
where extract(year_month from BV.order_date) = extract(year_month from @m1)
union all
select *
from a_bkorders.bkv_custorders BV
where extract(year_month from BV.order_date) = extract(year_month from @m2)
union all
select *
from a_bkorders.bkv_custorders BV
where extract(year_month from BV.order_date) = extract(year_month from @m3);

/* TASK 03 */
select
	BV.c_id
,	BV.c_name
from a_bkorders.bkv_custorders BV
where extract(year_month from BV.order_date) = extract(year_month from @m1)
union
select
	BV.c_id
,	BV.c_name
from a_bkorders.bkv_custorders BV
where extract(year_month from BV.order_date) = extract(year_month from @m2)
union
select
	BV.c_id
,	BV.c_name
from a_bkorders.bkv_custorders BV
where extract(year_month from BV.order_date) = extract(year_month from @m3);

/* TASK 04 */
select distinct
	c_id
,	c_name
from a_bkorders.bkv_custorders 
where c_id in (
	select c_id
	from a_bkorders.bkv_custorders
	where extract(year_month from order_date) = extract(year_month from @m1))
and c_id in (
	select c_id
	from a_bkorders.bkv_custorders
	where extract(year_month from order_date) = extract(year_month from @m2))
and c_id in (
	select c_id
	from a_bkorders.bkv_custorders
	where extract(year_month from order_date) = extract(year_month from @m3));
	
/* TASK 05 */
select distinct
	c_id
,	c_name
from a_bkorders.bkv_custorders 
where c_id not in (
	select c_id
	from a_bkorders.bkv_custorders
	where extract(year_month from order_date) = extract(year_month from @m1))
and c_id not in (
	select c_id
	from a_bkorders.bkv_custorders
	where extract(year_month from order_date) = extract(year_month from @m2))
and c_id not in (
	select c_id
	from a_bkorders.bkv_custorders
	where extract(year_month from order_date) = extract(year_month from @m3));
	
/* TASK 06 */
select distinct
	c_id
,	c_name
from a_bkorders.bkv_custorders 
where c_id in (
	select c_id
	from a_bkorders.bkv_custorders
	where extract(year_month from order_date) = extract(year_month from @m1))
and c_id not in (
	select c_id
	from a_bkorders.bkv_custorders
	where extract(year_month from order_date) = extract(year_month from @m2))
and c_id not in (
	select c_id
	from a_bkorders.bkv_custorders
	where extract(year_month from order_date) = extract(year_month from @m3));

/* TASK 07 */
select distinct
	c_id
,	c_name
from a_bkorders.bkv_custorders 
where c_id in (
	select c_id
	from a_bkorders.bkv_custorders
	where extract(year_month from order_date) = extract(year_month from @m1))
and c_id in (
	select c_id
	from a_bkorders.bkv_custorders
	where extract(year_month from order_date) = extract(year_month from @m2)
	or extract(year_month from order_date) = extract(year_month from @m3));

/* TASK 08 */
select distinct
	c_id
,	c_name
from a_bkorders.bkv_custorders 
where c_id in(
	select c_id
	from a_bkorders.bkv_custorders
	where c_id in (
		select c_id
		from a_bkorders.bkv_custorders
		where extract(year_month from order_date) = extract(year_month from @m1))
	and c_id in (
		select c_id
		from a_bkorders.bkv_custorders
		where extract(year_month from order_date) = extract(year_month from @m2))
	and c_id not in (
		select c_id
		from a_bkorders.bkv_custorders
		where extract(year_month from order_date) = extract(year_month from @m3)))
or c_id in(
	select c_id
	from a_bkorders.bkv_custorders
	where c_id in (
		select c_id
		from a_bkorders.bkv_custorders
		where extract(year_month from order_date) = extract(year_month from @m1))
	and c_id in (
		select c_id
		from a_bkorders.bkv_custorders
		where extract(year_month from order_date) = extract(year_month from @m3))
	and c_id not in (
		select c_id
		from a_bkorders.bkv_custorders
		where extract(year_month from order_date) = extract(year_month from @m2)));
	

/* TASK 09 */
select distinct
	c_id
,	c_name
from a_bkorders.bkv_custorders 
where c_id in(
	select c_id
	from a_bkorders.bkv_custorders
	where c_id in (
		select c_id
		from a_bkorders.bkv_custorders
		where extract(year_month from order_date) = extract(year_month from @m1))
	and c_id not in (
		select c_id
		from a_bkorders.bkv_custorders
		where extract(year_month from order_date) = extract(year_month from @m3)))
or c_id in(
	select c_id
	from a_bkorders.bkv_custorders
	where c_id in (
		select c_id
		from a_bkorders.bkv_custorders
		where extract(year_month from order_date) = extract(year_month from @m2))
	and c_id not in (
		select c_id
		from a_bkorders.bkv_custorders
		where extract(year_month from order_date) = extract(year_month from @m3)));
	