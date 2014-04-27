Use a_testbed;

/*   demo 01  */
Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (99, Null, 'Horse', 490.00, '2010-05-15 08:30:00 ', '2010-04-15');

/*   demo 02  */
Select
  z_type
, z_name
From zoo;

/*   demo 03  */
Select
  z_dob
, z_cost
, z_name
From zoo;

/*   demo 04  */
Select  *
From zoo;

/*   demo 05  */
Select
  z_id
, z_dob As birthdate
, z_cost As price
, z_name As name
From zoo;

/*   demo 06  */
Select
  z_id
, z_dob As "Date of Birth"
, z_cost As "Price $"
, z_name As "Name"
From zoo;

/*   demo 07  */
Select
  z_id
, z_dob As "BirthDate"
, z_cost As "Price"
, z_name As "Name"
From zoo
Order By z_cost;

/*   demo 08  */
Select
  z_id
, z_dob As "BirthDate"
, z_cost As "Price"
, z_name As "Name"
From zoo
Order By z_cost Desc;

/*   demo 09  */
Select
  z_type As "Type"
, z_cost As "Price"
, z_name As "Name"
From zoo
Order By z_type, z_cost;

/*   demo 10  */
Select
  z_type As "Type"
, z_cost As "Price"
, z_name As "Name"
From zoo
Order By z_type, z_cost Desc;

/*   demo 11  */
Select
  z_type As "Type"
, z_name As "Name"
From zoo
Order By z_name;

/*   demo 12  */
Select
  z_type As "Type"
, z_name As "Name"
From zoo
Order By z_name Desc;

/*   demo 13  */
Select
  z_id
, z_dob As "BirthDate"
, z_name As "Name"
From zoo
Order By z_dob Desc;

/*   demo 14  */
Select
  z_id
, z_dob As "Date of Birth"
, z_name As "Name"
From zoo
Order By `Date of Birth`;

/*   demo 15  */
Select
  z_id
, z_dob As "Date of Birth"
, z_name As "Name"
From zoo
Order By "Date of Birth";

/*   demo 16  */
Select
  z_id
, z_type
, z_name
From zoo
Order By 2, 3;

/*   demo 17  */
Select
  z_id
, EXTRACT(Month From z_dob) As "Birth Month"
, z_name As "Name"
From zoo
Order By EXTRACT(Month From z_dob);

/*   demo 18  */
Select
  z_type
From zoo;

/*   demo 19  */
Select Distinct
  z_type
From zoo;

/*   demo 20  */
Select Distinct
  z_type
, z_cost
From zoo
Order By z_type, z_cost;

/*   demo 21  */
Select Distinct
  z_type
From zoo
Order By z_type;

/*   demo 22  */
Select Distinct
  z_type
From zoo
Order By z_name
;
