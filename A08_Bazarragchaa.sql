-- Zorigt Bazarragchaa

\W /* enable warnings! */


/* TASK 00 */
select user(), current_date(), version(), @@sql_mode\G

/* TASK 01 */
select
	OD.book_id
,	round(avg(OD.order_price), 0) as AvgPrice
,	sum(OD.quantity) as CopiesOrdered
from a_bkorders.order_details OD
group by OD.book_id;

/* TASK 02 */
 select
	T.topic_id as ID
,	T.topic_descr
,	coalesce(count(BT.book_id), 0) as NumberofBooks
, 	round(coalesce(avg(B.list_price), 'n/a'), 2) as AvgListPrice 
from a_bkinfo.topics T
left join a_bkinfo.book_topics BT using (topic_id)
left join a_bkinfo.books B using (book_id)
group by T.topic_id
; 

/* TASK 03 */
select
	count(*) as NumberOrders
,	count(distinct OH.cust_id) as NumberCustWithOrders
from a_bkorders.order_details OD
join a_bkorders.order_headers OH using (order_id)
where year(OH.order_date) = year(now())
and	month(OH.order_date) = month(date_sub(now(), interval 1 month)) 
;

/* TASK 04 */
set @t_id = 'SCI';

select
	count(*) as "NumOrders Indicated Topic"
from a_bkinfo.book_topics BT
join a_bkorders.order_details OD using (book_id)
where BT.topic_id = @t_id;


/* TASK 05 */
select
	concat(P.publ_id, ' ', P.publ_name) as Publisher
,	coalesce(max(OH.order_date), 'No Orders') as MostRecentOrder
,	coalesce(min(OH.order_date), 'No Orders') as OldestOrder
from a_bkinfo.publishers P
left join a_bkinfo.books using (publ_id)
left join a_bkorders.order_details using (book_id)
left join a_bkorders.order_headers OH using (order_id)
group by P.publ_id;

/* TASK 06 */
select
	concat(P.publ_id, ' ', P.publ_name) as Publisher
from a_bkinfo.publishers P
join a_bkinfo.books B using (publ_id)
join a_bkinfo.book_topics BT using (book_id)
where BT.topic_id in ('PGM', 'VB', 'NET', 'ADO')
group by P.publ_id
having count(B.book_id) between 4 and 10;

/* TASK 07 */
select
	count(distinct case when BT.topic_id in ('SCI') then BT.book_id else null end) as "Science"
,	count(distinct case when BT.topic_id in ('PGM', 'VB', 'NET', 'ADO') then BT.book_id else null end) "Programming"
,	count(distinct case when BT.topic_id in ('DB', 'SQL', 'SSRV', 'MySQL', 'ORA', 'ADO') then BT.book_id else null end) "Database/SQL"
,	count(distinct case when BT.topic_id in ('FCT', 'POE') then BT.book_id else null end) "Fiction/Poetry"
,	count(*) as "All Books"
from a_bkinfo.book_topics BT;

/* TASK 08 */
select
	date_format(OH.order_date, '%Y-%M') as "Year-month"
,	count(*) as "NumberOrders"
,	round(sum(OD.order_price), 2) as "TotalSales"
from a_bkorders.order_details OD
join a_bkorders.order_headers OH using (order_id)
group by date_format(OH.order_date, '%Y-%M')
order by year(OH.order_date), month(OH.order_date);