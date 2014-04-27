-- Zorigt Bazarragchaa

\W /* enable warnings! */

use a_vets;

/* TASK 00 */
select user(), current_date(), version(), @@sql_mode\G

/* TASK 01 */
select
	concat(stf_name_first, ' ', stf_name_last) as stf_name
, 	stf_job_title
from a_vets.vt_staff
order by stf_name_last, stf_name_first;

/* TASK 02 */
select
	stf_hire_date
,	stf_salary
,	round(stf_salary * 1.12, 2) as WithRaise
from a_vets.vt_staff_pay
order by stf_hire_date desc;

/* TASK 03 */
select
	an_id as ID
, 	an_name as Name
, 	an_type as 'Animal Type'
, 	an_dob as 'Birth Date'
from a_vets.vt_animals
order by an_dob
limit 10;

/* TASK 04 */
select 
	srv_id
,	srv_list_price
,	srv_desc
from a_vets.vt_services
order by srv_list_price desc;

/* TASK 05 */
select
	ex_id as Exam_ID
,	ex_fee as Fee_Charged
,	round(ex_fee * 0.095, 2) as Tax_Charged
,	round(ex_fee * 0.095, 2) + ex_fee as Total_Due
from a_vets.vt_exam_details
order by ex_id, ex_fee
limit 10;

/* TASK 06 */
select
	an_id
,	ex_date
,	stf_id
from a_vets.vt_exam_headers
order by stf_id, ex_date;

/* TASK 07 */
select distinct
	cl_state
,	cl_city
from a_vets.vt_clients
order by cl_state, cl_city;


