-- Zorigt Bazarragchaa

\W /* enable warnings! */

use a_xml;

/* TASK 00 */
select user(), current_date(), version(), @@sql_mode\G

/* TASK 01 */

insert into a_xml.xml_animals values (10,
'<client cl_id="0010"><cl_name>Faith</cl_name><pets><animal><an_id>110</an_id><an_type>Dinosaur</an_type><an_name>Prehisotric</an_name><an_price>1010</an_price></animal></pets></client>
');
 
insert into a_xml.xml_animals values (11,
'
<client cl_id="0011"><cl_name>Hope</cl_name><pets><animal><an_id>111</an_id><an_type>Elephant</an_type><an_name>Humongus</an_name><an_price>1011</an_price></animal></pets></client>
');

insert into a_xml.xml_animals values (12,
'
<client cl_id="0012"><cl_name>Joy</cl_name><pets><animal><an_id>112</an_id><an_type>snake</an_type><an_name>Black Momba</an_name><an_price>1012</an_price></animal></pets></client>
');

insert into a_xml.xml_animals values (13,
'
<client cl_id="0013"><cl_name>Peace</cl_name><pets><animal><an_id>113</an_id><an_type>Hippo</an_type><an_name>Oversized</an_name><an_price>1013</an_price></animal></pets></client>
');

insert into a_xml.xml_animals values (14,
'
<client cl_id="0014"><cl_name>War</cl_name><pets><animal><an_id>114</an_id><an_type>Dragon</an_type><an_name>Dangerous</an_name><an_price>1014</an_price></animal></pets></client>
');

select 
	id
,	extractValue(datax, '/client/cl_name') as Client
,	extractValue(datax, '/client/pets/animal/an_type') as TypeOfAnimal
,	extractValue(datax, '/client/pets/animal/an_name') as AnimalName
,	extractValue(datax, '/client/pets/animal/an_price') as AnimalPrice
from a_xml.xml_animals;

/* TASK 02 */
select 
	id
,	extractValue(datax, '/client/cl_name') as Client
,	extractValue(datax, '/client/@cl_id') as ClientID
from a_xml.xml_animals
where  extractValue(datax, '/client/pets/animal/an_type') like 'cat %'
or extractValue(datax, '/client/pets/animal/an_type') like '% cat %'
or extractValue(datax, '/client/pets/animal/an_type') like '% cat';

/* TASK 03 */
select 
	id
,	extractValue(datax, '/client/cl_name') as Client
,	extractValue(datax, '/client/@cl_id') as ClientID
from a_xml.xml_animals
where extractValue(datax, 'count(/client/pets/animal[an_type = "cat"])') > 0;

/* TASK 04 */
select 
	id
,	extractValue(datax, '/client/cl_name') as Client
,	extractValue(datax, '/client/@cl_id') as ClientID
from a_xml.xml_animals
where extractValue(datax, 'count(/client/pets/animal[an_price = 250 and an_type = "bird"])') > 0;

/* TASK 05 */
select 
	id
,	extractValue(datax, '/client/cl_name') as Client
,	extractValue(datax, '/client/@cl_id') as ClientID
,	concat(extractValue(datax, '/client/pets/animal[1]/an_type'), ' named ', extractValue(datax, '/client/pets/animal[1]/an_name')) as Animal_First
from a_xml.xml_animals;

/* TASK 06 */
select 
	id
,	extractValue(datax, '/client/cl_name') as Client
,	extractValue(datax, '/client/@cl_id') as ClientID
,	concat(extractValue(datax, '/client/pets/animal[1]/an_type'), 
			case when extractValue(datax, 'count(/client/pets/animal[1]/an_name)') = 0
				 then 'with no name'	
			else ' named '
			end, 
			case when extractValue(datax, 'count(/client/pets/animal[1]/an_name)') = 0
				 then ''
			else extractValue(datax, '/client/pets/animal[1]/an_name[last()]')
			end
			) as Animal_First
from a_xml.xml_animals;

/* TASK 07 */
select 
	id
,	extractValue(datax, '/client/cl_name') as Client
,	extractValue(datax, '/client/@cl_id') as ClientID
from a_xml.xml_animals
where extractValue(datax, '/client/pets/animal[2]/an_id') <> ''
and extractValue(datax, '/client/pets/animal[4]/an_id') = '';

/* TASK 08 */
select 
	id
,	extractValue(datax, '/client/cl_name') as Client
,	extractValue(datax, '/client/@cl_id') as ClientID
, 	extractValue(datax, 'count(/client/pets/animal)') as NumberOfAnimals
from a_xml.xml_animals
order by NumberOfAnimals desc;

/* TASK 09 */
select 
	extractValue(datax, '/client/@cl_id') as ClientID
, 	extractValue(datax, '/client/descendant::*') as AllData
from a_xml.xml_animals \G

/* TASK 10 */
select 
	extractValue(datax, '/client/cl_name') as Client
,	extractValue(datax, '/client/@cl_id') as ClientID
, 	case when extractValue(datax, 'count(/client/pets/animal/an_type[self:text()="bird"])') > 0
			then extractValue(datax, '/client/pets/animal/an_type[self:text()="bird"]/../an_name[1]')
			else ''
			end as AnimalName
,	case when extractValue(datax, 'count(/client/pets/animal/an_type[self:text()="bird"])') > 0
			then extractValue(datax, '/client/pets/animal/an_type[self:text()="bird"]/../child::*')
			else ''
			end as AnimalData
from a_xml.xml_animals \G

/* TASK 11 */
select 
	extractValue(datax, '/client/cl_name') as Client
,	extractValue(datax, '/client/@cl_id') as ClientID
, 	extractValue(datax, '/client/pets/animal/an_type[self:text()="bird"]/../an_name[1]') as AnimalName
,	extractValue(datax, '/client/pets/animal/an_type[self:text()="bird"]/../child::*') as AnimalData
from a_xml.xml_animals \G