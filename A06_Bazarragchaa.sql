-- Zorigt Bazarragchaa

\W /* enable warnings! */

use a_vets;

/* TASK 00 */
select user(), current_date(), version(), @@sql_mode\G

/* TASK 01 */
select
	vt_clients.cl_id
,	vt_clients.cl_name_last
from a_vets.vt_clients
left join a_vets.vt_animals on vt_animals.cl_id = vt_clients.cl_id
where vt_animals.an_id is null;

/* TASK 02 */
select
	vt_clients.cl_id
,	vt_clients.cl_name_last
from a_vets.vt_clients
where vt_clients.cl_id not in (
	select
		vt_animals.cl_id
	from a_vets.vt_animals
);

/* TASK 03 */
select distinct
	vt_clients.cl_id
,	vt_clients.cl_name_last
from a_vets.vt_clients
left join a_vets.vt_animals on vt_animals.cl_id = vt_clients.cl_id
where vt_animals.an_id is not null;

/* TASK 04 */
select distinct
	vt_clients.cl_id
,	vt_clients.cl_name_last
from a_vets.vt_clients
where vt_clients.cl_id in (
	select
		vt_animals.cl_id
	from a_vets.vt_animals
);

/* TASK 05 */
select
	vt_clients.cl_id
,	vt_clients.cl_name_last
,	vt_animals.an_name
,	vt_animals.an_type
from a_vets.vt_clients
left join a_vets.vt_animals on vt_animals.cl_id = vt_clients.cl_id
order by vt_clients.cl_id, vt_animals.an_type;

/* TASK 06 */
select distinct
	vt_clients.cl_id
,	vt_clients.cl_name_last
from a_vets.vt_clients
left join a_vets.vt_animals on vt_animals.cl_id = vt_clients.cl_id
where vt_animals.an_type in ('snake', 'chelonian', 'crocodilian', 'lizard');

/* TASK 07 */
select distinct
	vt_clients.cl_id
,	vt_clients.cl_name_last
from a_vets.vt_clients
left join a_vets.vt_animals on vt_animals.cl_id = vt_clients.cl_id
where vt_clients.cl_id not in (
	select
		vt_animals.cl_id
	from a_vets.vt_animals
	where vt_animals.an_type in ('snake', 'chelonian', 'crocodilian', 'lizard')
)
and vt_animals.an_id is not null;

/* TASK 08 */
select distinct
	vt_clients.cl_id
,	vt_clients.cl_name_last
from a_vets.vt_clients
left join a_vets.vt_animals on vt_animals.cl_id = vt_clients.cl_id
where vt_animals.an_type not in ('snake', 'chelonian', 'crocodilian', 'lizard');

/* TASK 09 */
set @v_cl_id = 1825;

select
	vt_animals.an_id
,	vt_animals.an_type
,	year(vt_exam_headers.ex_date) as 'ExamYear'
from (
	select *
	from vt_clients
	where vt_clients.cl_city in (
		select
			vt_clients.cl_city
		from vt_clients
		where vt_clients.cl_id = @v_cl_id
		)
	and vt_clients.cl_state in (
		select
			vt_clients.cl_state
		from vt_clients
		where vt_clients.cl_id = @v_cl_id
		)
	) tbl
left join a_vets.vt_animals using (cl_id)
left join a_vets.vt_exam_headers using (an_id);
	