-- Zorigt Bazarragchaa

\W /* enable warnings! */

use a_vets;

/* TASK 00 */
select user(), current_date(), version(), @@sql_mode\G

/* TASK 01 */
select
	cl_name_first
,	cl_name_last
from vt_clients
where cl_state in ('CA');

/* TASK 02 */
select
	cl_name_first
,	cl_name_last
,	cl_phone
from vt_clients
where cl_phone is not null
order by cl_id;

/* TASK 03 */
select
	stf_name_last
,	stf_name_first
,	stf_id
from vt_staff
where stf_job_title in ('vet', 'vet assnt');

/* TASK 04 */
select
	cl_id
,	an_id
,	an_name
from vt_animals
where an_type in ('hamster', 'capybara', 'porcupine', 'dormouse') 
order by cl_id, an_id;

/* TASK 05 */
select distinct
	cl_id
,	an_type
from vt_animals
where an_type in ('snake', 'chelonian', 'crocodilian', 'lizard')
order by cl_id;

/* TASK 06 */
select
	cl_id
,	an_id
,	an_name
,	an_dob
,	an_type
from vt_animals
where an_type not in ('hamster', 'capybara', 'porcupine', 'dormouse', 'snake', 'chelonian', 'crocodilian', 'lizard')
order by an_dob desc;

/* TASK 07 */
select
	ex_id
,	srv_id
,	ex_fee
from vt_exam_details
where ex_fee between 35 and 50
order by srv_id;

/* TASK 08 */
select
	an_id
,	an_name
from vt_animals
where an_dob between '2000-01-01' and '2005-12-31 23:59:59';

