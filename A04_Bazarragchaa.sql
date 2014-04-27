-- Zorigt Bazarragchaa

\W /* enable warnings! */

use a_vets;

/* TASK 00 */
select user(), current_date(), version(), @@sql_mode\G

/* TASK 01 */
select
	cl_id
,	cl_name_last
,	an_name
from vt_animals
join vt_clients using (cl_id);

/* TASK 02 */
select
	ex_id
,	srv_id
,	srv_desc
,	srv_list_price
,	ex_fee
from vt_exam_details
join vt_services using (srv_id)
where ex_fee between 30 and 50
order by srv_id;

/* TASK 03 */
select
	ex_id
,	ex_date
,	srv_id
,	ex_fee
from vt_exam_details
join vt_exam_headers using (ex_id)
join vt_animals using (an_id)
where an_type in ('hamster', 'capybara', 'porcupine', 'dormouse') 
order by srv_id;

/* TASK 04 */
select
	stf_id
,	stf_name_first
,	stf_name_last
from vt_staff
join vt_exam_headers using (stf_id)
join vt_animals using (an_id)
where an_type in ('snake', 'chelonian', 'crocodilian', 'lizard');

/* TASK 05 */
select *
from a_vets.vt_services
where srv_desc like '%feline%'
and srv_desc not like '%dental%'
order by srv_type, srv_id;

/* TASK 06 */
select 
	an_id
,	an_name
,	an_dob
,	an_type
from a_vets.vt_animals
where (an_dob like '2008%' or an_dob like '2010%')
and not an_type in ('snake', 'chelonian', 'bird');

/* TASK 07 */
select distinct
	cl_id
,	cl_name_last
from a_vets.vt_animals
join a_vets.vt_clients using (cl_id)
where vt_animals.an_type in ('cat')
order by vt_animals.cl_id;

/* TASK 08 */
select distinct
	cl_id
,	cl_name_last
from a_vets.vt_animals
join a_vets.vt_clients using (cl_id)
where not vt_animals.an_type in ('cat');




