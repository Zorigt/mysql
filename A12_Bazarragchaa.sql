-- Zorigt Bazarragchaa

\W /* enable warnings! */



/* TASK 00 */
select user(), current_date(), version(), @@sql_mode\G

/* TASK 01 */
select
	OH.order_date as OrderDate
,	count(*) as NumberOrders
,	sum(OD.order_price*OD.quantity) as AmntDue
,	sum(OD.quantity) as NumbBooksPurch
from a_bkorders.order_details OD
join a_bkorders.order_headers OH using (order_id)
where year(OH.order_date) = year(current_date())
group by OH.order_date with rollup;

/* TASK 02 */
select 
	coalesce(od_year, 'Grand Total') as Order_year
,	coalesce(od_month, 'Yearly Total') as Order_month
,	OrderID
,	AmntDue
,	NumberItems
from (
	Select 
		YEAR(order_date) as od_year
	,	MONTH(order_date) as od_month
	, 	OH.order_id as OrderID
	, 	SUM(OD.order_price * OD.quantity) As AmntDue
	, 	SUM(OD.quantity) As NumberItems
	From a_bkorders.order_headers OH
	Join a_bkorders.order_details OD using (order_id)
	Group by year(order_date), month(order_date), order_id with rollup
) agg_data;

/* TASK 03 */
select 
	coalesce(od_year, 'Grand Total') as Order_year
,	coalesce(od_month, 'Yearly Total') as Order_month
,	NumberOrders
,	AmntDue
,	NumberItems
from (
	Select
		YEAR(order_date) as od_year
	,	MONTH(order_date) as od_month
	, 	count(*) as NumberOrders
	, 	SUM(OD.order_price * OD.quantity) As AmntDue
	, 	SUM(OD.quantity) As NumberItems
	From a_bkorders.order_headers OH
	Join a_bkorders.order_details OD using (order_id)
	Group by year(order_date), month(order_date) with rollup
) agg_data1;

/* TASK 04 */
select
	coalesce(a_id, ' All Authors') as AuthorID
,	coalesce(b_id, 'All Books') as BookID
,	coalesce(tq, 0) as TotalQuantity
,	coalesce(ts, 'No Sales') as TotalSales
from (
	select
		BA.author_id as a_id
	,	BA.book_id as b_id
	,	sum(OD.quantity) as tq
	,	sum(OD.quantity * OD.order_price) as ts
	from a_bkinfo.book_authors BA
	left join a_bkorders.order_details OD using (book_id)
	where BA.author_sequence = 1 and BA.book_id is not null
	group by BA.author_id, BA.book_id with rollup
) agg_data2;

/* TASK 05 */
select
	B1.book_id as Book_ID
,	B1.page_count as Page_count
,	(
	select count(distinct ceiling(page_count / 250))
	from a_bkinfo.books as B2
	left join a_bkinfo.book_topics BT2 using (book_id)
	where B2.page_count >= B1.page_count
	and BT2.topic_id = 'SQL'
	) as 'Rankk'
from a_bkinfo.books B1
left join a_bkinfo.book_topics BT1 using (book_id)
where BT1.topic_id = 'SQL'
order by Rankk;

/* TASK 06 */
select -- dept_id, salary, salary_rank
	author_id as Publ_ID
,	title as Title
,	page_count as Page_Count
,	b_rank
from (
	select 
		e.author_id
	,	b.title
	, 	b.page_count
	, 	find_in_set(b.page_count, dptgrp.b_list) as b_rank
	from a_bkinfo.book_authors as e
	join a_bkinfo.books as b using(book_id)
	,
		(
		select author_id
		, group_concat(page_count order by page_count ) b_list
		from a_bkinfo.book_authors
		join a_bkinfo.books using (book_id)
		group by author_id
		) as dptgrp
	where e.author_id = dptgrp.author_id
	) as z
where b_rank <= 3
order by author_id, b_rank;

/* TASK 07 */
Select 
		a1.order_date as OrderDate
	,	count(a2.order_id) as '3 Day Order Count'
	,	sum(a2.quantity) as '3 Day Total Quantity'
From (
	select
		order_date
	,	order_id
	,	quantity
	from a_bkorders.order_headers
	join a_bkorders.order_details using (order_id)
) as a1
Join ( 
	select
		order_date
	,	order_id
	,	quantity
	from a_bkorders.order_headers
	join a_bkorders.order_details using (order_id)
) as a2
 on a2.order_date
between date_sub(a1.order_date, interval 1 day) and date_add(a1.order_date, interval 1 day)
Group by a1.order_date
Order by a1.order_date;


/* TASK 08 */
select
	OH.order_date as OrderDate
,	sum(OD.quantity) as QuantityOrdered
,	sum(OD.quantity * OD.order_price) as TotalSales
from a_bkorders.order_details OD
join a_bkorders.order_headers OH using (order_id)
group by OH.order_date;

