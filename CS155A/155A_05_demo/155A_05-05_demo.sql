use a_testbed;

/*  Demo 01  */
Create table z_dml_students (
  st_id  int unsigned primary key
, st_name varchar(15) null
) engine=InnoDB;

Create table z_dml_scores (
  st_id  int unsigned not null
, asgn_nmbr int unsigned not null
, asgn_score  int  unsigned null
, constraint z_dml_scores_pk  primary key(st_id, asgn_nmbr)
, constraint z_dml_scores_fk foreign key (st_id ) references z_dml_students(st_id )
) engine=InnoDB;
 
 
 /*  Demo 02  */
 Insert into z_dml_students ( st_id, st_name) values ( 101, 'Abagail');

Insert into z_dml_students values ( 102, 'Bronden');

Insert into z_dml_students ( st_id) values ( 103);


Insert into z_dml_students values ( 104, null);

 /*  Demo 03  */
 Insert into z_dml_students ( st_id, st_name) values 
  ( 112, 'Zane')
, ( 108, 'Mat')
, ( 114, 'Betty');

  /*  Demo 04  */

Insert into z_dml_scores ( st_id, asgn_nmbr, asgn_score) values 
  ( 102, 1, 83)
, ( 102, 2, 87)
, ( 102, 3, 92)
, ( 114, 2, 92)
, ( 114, 3, 90)
, ( 112, 2, 40)
;


Select *
From z_dml_scores;


/*  demo 05  */
Delete from z_dml_scores;

/*  demo 06  */
Delete from z_dml_scores
Where st_id = 114;


/*  demo 07  */
Delete from z_dml_students
Where st_id = 102;
