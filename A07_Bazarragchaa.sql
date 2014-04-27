-- Zorigt Bazarragchaa

\W /* enable warnings! */



/* TASK 00 */
select user(), current_date(), version(), @@sql_mode\G

/* TASK 01 */
select
	CS.cust_id
,	CS.cust_name_last
, 	BS.title
from a_bkorders.customers CS
join a_bkorders.order_headers OH using (cust_id)
join a_bkorders.order_details OD using (order_id)
join a_bkinfo.books BS using (book_id)
where not find_in_set(CS.cust_state, 'IL,ID,IA,KS,MI,MN,MS,NE,ND,OH,SD,WI')
order by BS.title
limit 20;

/* TASK 02 */
set @tp_id = 'SQL';

select
	BS.book_id
,	BS.title
,	BT.topic_id
from a_bkinfo.books BS
join a_bkinfo.book_topics BT using (book_id)
where BS.title regexp 'SQL'
and BT.topic_id <> @tp_id;

/* TASK 03 */
select distinct
	books.book_id
,	substring(books.title, 1, 20) as 'Title 20 Chars'
,	case
		when book_topics.topic_id = 'POE' then round(books.list_price, -1)
		when book_topics.topic_id = 'PGM' then round(books.list_price, -1)
		else books.list_price
	end as 'List Price'
from a_bkinfo.books
join a_bkinfo.book_topics using (book_id)
order by case books.list_price
			when book_topics.topic_id = 'POE' then round(books.list_price, -1)
			when book_topics.topic_id = 'PGM' then round(books.list_price, -1)
			else books.list_price
		end 
		, books.book_id;

/* TASK 04 */
select
	cust_id
,	order_id
,	order_date
from a_bkorders.order_headers
where dayofmonth(order_date) = 1;

/* TASK 05 */
select 
	cust_id
,	order_id
,	order_date
from a_bkorders.order_headers
where order_date = last_day(order_date);

/* TASK 06 */
set @ct_dt = curdate();
select 
	cust_id
,	order_date
,	case
		when datediff(@ct_dt, order_date) < 14 then 'Less than 14 days'
		when datediff(@ct_dt, order_date) < 30 then 'Less than 30 days'
		when datediff(@ct_dt, order_date) < 90 then 'Less than 90 days'
		when datediff(@ct_dt, order_date) < 180 then 'Less than 180 days'
		when datediff(@ct_dt, order_date) >= 180 then '180 days or more'
	end as 'orderAged'
from a_bkorders.order_headers
where datediff(@ct_dt, order_date) > 0
order by cust_id
limit 20;

/* TASK 07 */
set @ct_dt = curdate();
select
	cust_id
,	cust_name_last as 'Last Name'
,	cust_acct_opened as 'Acct Open'
from a_bkorders.customers
where cust_acct_opened >= date_sub(@ct_dt, interval 8 month);

/* TASK 08 */
select 
	a_bkorders.order_details.order_id as 'Order ID'
,	a_bkorders.order_details.book_id as 'Book id'
,	substring(a_bkinfo.books.title, 1, 20) as 'Title'
,	a_bkorders.order_details.quantity * a_bkorders.order_details.order_price as 'Ext Cost'
,	round((floor(rand() * (5-1)) + 1)/100, 2) * (a_bkorders.order_details.quantity * a_bkorders.order_details.order_price) as 'Discount Amount'
from a_bkorders.order_details 
join a_bkinfo.books using (book_id)
order by a_bkorders.order_details.order_id;

