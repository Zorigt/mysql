-- Zorigt Bazarragchaa

show create function a_testbed.BookSize\G
show create function a_testbed.InternalBlankCount\G
show create function a_testbed.PrevMonth\G

/* Delimiter #
use a_testbed #

drop function if exists InternalBlankCount #

create function InternalBlankCount (
	in_string char(100)
	)
	returns int
begin
	declare v_new_string char(100);
	declare v_no_blank char(100);
	declare v_num_blanks int default 0;
	set v_new_string = trim(in_string);
	set v_no_blank = replace(v_new_string, ' ', '');
	set v_num_blanks = length(v_new_string) - length(v_no_blank);
	
	return v_num_blanks;
end;
#

drop function if exists BookSize #

create function BookSize (
	in_pages int
	)
	returns char(13)
begin
	declare v_book_type char(13);
	
	if (in_pages is null or in_pages < 0) then
		set v_book_type = 'Invalid Input';
	elseif (in_pages <= 200) then
		set v_book_type = 'Mini';
	elseif (in_pages >= 201 and in_pages <= 500)then
		set v_book_type = 'Small';
	elseif (in_pages >= 501 and in_pages <= 1000)then
		set v_book_type = 'Medium';
	elseif (in_pages >= 1001 and in_pages <= 1500)then
		set v_book_type = 'Large';
	else
		set v_book_type = 'Too Long';
	end if;
	
	return v_book_type;
end;
#

drop function if exists PrevMonth #

create function PrevMonth (
	in_date date
,	in_mn_count int
	)
	returns varchar(7)
begin
	
	declare v_date date;
	declare v_mn_count int;
	
	set v_date = coalesce(in_date, current_date());
	set v_mn_count = coalesce(in_mn_count, 0);
	
	if (in_mn_count < 0) then
		set v_mn_count = 0;
	end if;
		
	set v_date = date_sub(v_date, interval v_mn_count month);
	
	return date_format(v_date, '%Y-%m');
end;
#

Delimiter ; */