-- Zorigt Bazarragchaa

\W /* enable warnings! */

use a_vets;

/* TASK 00 */
select user(), current_date(), version(), @@sql_mode\G

/* TASK 01 */
set @v_fee = 50;

select 
	vt_exam_details.srv_id
,	vt_exam_details.ex_fee
,	vt_exam_details.ex_id
,	vt_exam_headers.ex_date
from a_vets.vt_exam_details
join a_vets.vt_exam_headers using (ex_id)
where vt_exam_details.ex_fee > @v_fee;

set @v_fee = 100;

select 
	vt_exam_details.srv_id
,	vt_exam_details.ex_fee
,	vt_exam_details.ex_id
,	vt_exam_headers.ex_date
from a_vets.vt_exam_details
join a_vets.vt_exam_headers using (ex_id)
where vt_exam_details.ex_fee > @v_fee;

/* TASK 02 */
set @v_job = 'vet';

select
	vt_staff.stf_id
,	vt_staff.stf_name_first as 'First'
,	vt_staff.stf_name_last as 'Last'
,	vt_exam_headers.ex_id
,	vt_exam_headers.ex_date
from a_vets.vt_staff
join vt_exam_headers using (stf_id)
where vt_staff.stf_job_title != @v_job;

/* TASK 03 */
set @an_id = 15001;

select 
	vt_clients.cl_id
,	vt_clients.cl_name_last
,	vt_animals.an_type
,	vt_exam_details.srv_id
,	vt_exam_details.ex_desc
,	vt_exam_details.ex_fee
from a_vets.vt_clients
join a_vets.vt_animals using (cl_id)
join a_vets.vt_exam_headers using (an_id)
join a_vets.vt_exam_details using (ex_id)
where vt_animals.an_id = @an_id;

set @an_id = 16004;

select 
	vt_clients.cl_id
,	vt_clients.cl_name_last
,	vt_animals.an_type
,	vt_exam_details.srv_id
,	vt_exam_details.ex_desc
,	vt_exam_details.ex_fee
from a_vets.vt_clients
join a_vets.vt_animals using (cl_id)
join a_vets.vt_exam_headers using (an_id)
join a_vets.vt_exam_details using (ex_id)
where vt_animals.an_id = @an_id;

set @an_id = 21007;

select 
	vt_clients.cl_id
,	vt_clients.cl_name_last
,	vt_animals.an_type
,	vt_exam_details.srv_id
,	vt_exam_details.ex_desc
,	vt_exam_details.ex_fee
from a_vets.vt_clients
join a_vets.vt_animals using (cl_id)
join a_vets.vt_exam_headers using (an_id)
join a_vets.vt_exam_details using (ex_id)
where vt_animals.an_id = @an_id;

/* TASK 04 */
select
	vt_clients.cl_id
,	vt_clients.cl_name_last as 'Last Name'
from a_vets.vt_clients
where vt_clients.cl_id in (
	select cl_id
	from a_vets.vt_animals
	where vt_animals.an_type in ('bird')
);

/* TASK 05 */
select
	vt_clients.cl_id
,	vt_clients.cl_name_last as 'Last Name'
from a_vets.vt_clients
where vt_clients.cl_id in (
	select cl_id
	from a_vets.vt_animals
	where vt_animals.an_type in ('bird')
)
and vt_clients.cl_id in (
	select cl_id
	from a_vets.vt_animals
	where vt_animals.an_type in ('snake', 'chelonian', 'crocodilian', 'lizard')
);

/* TASK 06 */
select
	vt_clients.cl_id
,	vt_clients.cl_name_last as 'Last Name'
from a_vets.vt_clients
where vt_clients.cl_id in (
	select cl_id
	from a_vets.vt_animals
	where vt_animals.an_type in ('bird')
)
and not vt_clients.cl_id in (
	select cl_id
	from a_vets.vt_animals
	where vt_animals.an_type in ('snake', 'chelonian', 'crocodilian', 'lizard')
);

/* TASK 07 */
set @v_current_year = year(current_date());

select
	vt_animals.an_id
,	vt_animals.an_name
,	vt_animals.an_type
from a_vets.vt_animals
join a_vets.vt_exam_headers using (an_id)
where year(ex_date) in (@v_current_year, @v_current_year - 1);

