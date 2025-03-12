/*create table student_info (
 std_no int not null,
 std_name varchar(20) not null,
 std_birth date,
 std_gender enum('M','F'),
 std_grade enum('1','2','3')
);*/
/*
insert into student_info(std_no,std_name,std_birth,std_gender,std_grade)
				values('101','토마스','2024-02-21','M','2');
insert into student_info(std_no,std_name,std_birth,std_gender,std_grade)
				values('102','김유신','2001-11-07','F','3');
insert into student_info(std_no,std_name,std_birth,std_gender,std_grade)
				values('103','홍길동','2002-05-25','M','1');
insert into student_info(std_no,std_name,std_birth,std_grade)
				values('104','차범근','1994-10-06','4');
insert into student_info(std_no,std_name,std_birth,std_gender)
				values('105','에디슨','1998-04-12','F');
insert into student_info(std_no,std_name,std_birth,std_grade)
				values('106','디카프리오','2004-05-20','2');               
insert into student_info(std_no,std_name,std_birth,std_gender)
				values('107','캐빈','2004-08-04','M');
insert into student_info(std_no,std_name,std_birth,std_gender,std_grade)
				values('108','최삼용','1998-02-08','F','4');
insert into student_info(std_no,std_name,std_birth,std_gender,std_grade)
				values('109','홍길동','2000-05-19','M','4');               
insert into student_info(std_no,std_name,std_birth,std_gender,std_grade)
				values('110','심청이','1999-12-25','F','4');  

delete from student_info;
*/
select * from student_info;

-- alter table student_info modify std_grade enum('1','2','3','4');

-- 1. 여학생들만 출력
select * from student_info where std_gender='F';
-- 2. 4학년들만 출력
select * from student_info where std_grade='4';
-- 3. 1학년은 제외하고 전체 출력
select * from student_info where std_grade!='1';
-- 4. 4학년 + 남학생
select * from student_info where std_grade='4' 
							 and std_gender=ucase('m');
-- select ucase('m');

-- 5. 성별이 null 값으로 ~~
select * from student_info where std_gender is null;

-- 6. 이름이 2자로 되어있는 학생들 출력 -- 한글 한문자는 3byte를 차지
select * from student_info where length(std_name)=6;
-- select length(std_name) from student_info;

-- 7. 이름이 4자 이상으로 되어있는 학생들 출력
select * from student_info where length(std_name)>=12;

-- 8. 2000년 이후 출생자
select * from student_info 
              where left(std_birth,4) >= 2000;
 
select length(std_no), 
       length(std_name),
	   length(std_birth),
       length(std_gender),
       length(std_gender)
from  
	   student_info;
--------------------------------- 

select std_name,
       left(std_birth,4),
       substr(std_birth,6,2),  -- (데이터값,시작번호{1번부터},추출개수)
       right(std_birth,2)
  from 
      student_info;
---------------------------------

select std_name,
       left(std_birth,4),
       substr(std_birth,6,2),  -- (데이터값,시작번호{1번부터},추출개수)
       right(std_birth,2)
  from 
      student_info
  where 
       left(std_birth,4) < 2000;
---------------------------------
select std_name,
       left(std_birth,4),
       substr(std_birth,6,2),  -- (데이터값,시작번호{1번부터},추출개수)
       right(std_birth,2)
  from 
      student_info
  where 
        substr(std_birth,6,2) = 4;    -- (o)
	   -- substr(std_birth,6,2) = '04'; -- (o)
	   -- substr(std_birth,6,2) = '4'; -- (x)
          


      


       
       
       

       
              