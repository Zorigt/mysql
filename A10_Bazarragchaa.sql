-- Zorigt Bazarragchaa

\W /* enable warnings! */

/* TASK 00 */
select user(), current_date(), version(), @@sql_mode\G

/* TASK 01 */
select
	B.book_id
,	B.title
from a_bkinfo.books B
where B.book_id in (
	select 
		OD.book_id
	from a_bkorders.order_details OD)
and B.book_id in(
	select 
		BT.book_id
	from a_bkinfo.book_topics BT
	where BT.topic_id in ('SQL', 'DB'))
order by B.book_id;

/* TASK 02 */
select
	B.book_id
,	B.title
from a_bkinfo.books B
where B.book_id in (
	select
		OD.book_id
	from a_bkorders.order_details OD
	group by OD.book_id
	having sum(OD.quantity) >= all(
		select sum(a.quantity)
		from a_bkorders.order_details a
		group by a.book_id)
);

/* TASK 03 */
select
	C.cust_id
,	C.cust_name_last
from a_bkorders.customers C
where C.cust_id in (
	select
		OH.cust_id
	from a_bkorders.order_headers OH
	group by OH.cust_id
	having count(OH.order_id) <= 5 )
order by C.cust_id;

/* TASK 04 */
select
	B.book_id
,	B.title
,	case when exists (
	select 'X'
	from a_bkorders.order_details OD
	where OD.book_id = B.book_id
	) then 'Have orders'
	else 'No orders'
	end as OrderStatus
from a_bkinfo.books B
where B.title like "%Bird%"
order by 3 desc, B.book_id;

/* TASK 05 */
select
	B.book_id
,	B.title
from a_bkinfo.books B
where (exists ( /* Testing title that has SSRV and ORA but not MySQL */
		select 'X'
		from a_bkinfo.book_topics BT
		where BT.book_id = B.book_id
		and BT.topic_id = 'SSRV')
	and exists (
		select 'X'
		from a_bkinfo.book_topics BT
		where BT.book_id = B.book_id
		and BT.topic_id = 'ORA')
	and not exists (
		select 'X'
		from a_bkinfo.book_topics BT
		where BT.book_id = B.book_id
		and BT.topic_id = 'MySQL'))
or (exists ( /* Testing title that has SSRV and MySQL but not ORA */
		select 'X'
		from a_bkinfo.book_topics BT
		where BT.book_id = B.book_id
		and BT.topic_id = 'SSRV')
	and not exists (
		select 'X'
		from a_bkinfo.book_topics BT
		where BT.book_id = B.book_id
		and BT.topic_id = 'ORA')
	and exists ( 
		select 'X'
		from a_bkinfo.book_topics BT
		where BT.book_id = B.book_id
		and BT.topic_id = 'MySQL'))
or (exists ( /* Testing title that has MySQL and ORA but not SSRV */
		select 'X'
		from a_bkinfo.book_topics BT
		where BT.book_id = B.book_id
		and BT.topic_id = 'MySQL')
	and exists (
		select 'X'
		from a_bkinfo.book_topics BT
		where BT.book_id = B.book_id
		and BT.topic_id = 'ORA')
	and not exists (
		select 'X'
		from a_bkinfo.book_topics BT
		where BT.book_id = B.book_id
		and BT.topic_id = 'SSRV'));

/* TASK 06 */
select
	C.cust_id
,	C.cust_name_last
from a_bkorders.customers C
where exists (
	select 'X'
	from a_bkorders.order_headers OH
	where OH.cust_id = C.cust_id
	and extract(year from OH.order_date) = extract(year from current_date() ) - 1 
	and extract(month from OH.order_date) in (10, 11, 12))
order by C.cust_id;

/* TASK 07 */
select
	A.author_name_first
,	A.author_name_last
,	A.author_id
from a_bkinfo.authors A
where exists (
	select 'X'
	from a_bkinfo.book_authors BA
	where BA.author_id = A.author_id
	and not exists (
		select 'X'
		from a_bkorders.order_details OD
		where OD.book_id = BA.book_id))
and exists (
	select 'X'
	from a_bkinfo.book_authors BA
	where BA.author_id = A.author_id
	group by BA.author_id
	having count(BA.book_id) > 1
)
order by A.author_id;

/* TASK 08 */
select
	C.cust_id
,	C.cust_name_last
,	coalesce(first_ord, 'No Order') as FirstOrder
,	coalesce(last_ord, 'No Order') as LastOrder
,	coalesce(total_ords, 'No Order') as Orders
,	coalesce(total_sales, 'No Order') as Sales 
from a_bkorders.customers C
left join (
	select 
		OHS.cust_id
	,	OHS.order_id
	,	min(order_date) as first_ord
	, 	max(order_date) as last_ord
	,	count(OHS.order_id) as total_ords
	,	sum(D.order_price) as total_sales
	from a_bkorders.order_headers OHS
	left join (
		select
			ODS.order_id
		,	ODS.order_price
		from a_bkorders.order_details ODS
		) D on D.order_id = OHS.order_id
	group by cust_id
) H on C.cust_id = H.cust_id
group by C.cust_id;

/* TASK 09 */
select 
	C.cust_id as Cust_ID
,	C.cust_name_last as Cust_LastName
from a_bkorders.order_headers OH
join (
	select
		cust_id
	,	cust_name_last
	from a_bkorders.customers
	) C on OH.cust_id = C.cust_id
join (
	select
		order_id
	,	order_line
	,	book_id
	from a_bkorders.order_details od
	where exists (
		select 'X'
		from a_bkorders.order_details ods
		where ods.order_id = od.order_id
		and ods.book_id = od.book_id
		and not ods.order_line = od.order_line
	)) ODD on ODD.order_id = OH.order_id
;

