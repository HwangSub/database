drop table stdScore;

create table stdscore1 (
 no int not null auto_increment,
 id varchar(50) not null,
 loc varchar(100) not null,
 kor tinyint unsigned default 0, --  -128 ~ 127 -> 255
 eng tinyint unsigned default 0,
 primary key(no)
);
-- not null : 널값을 허용 안함(누락방지)
-- auto_increment 
--    1. 자동 숫자 등록(기본 1부터)
--    2. 중복데이터를 허용 안함
--    3. 고유성을 보장 받음 - 데이터 삭제 시 자동 재생 불가
--    4. primary key 반드시 설정 
-- primary key : 중복 값 없는 컬럼에서 설정 ( 고유성보장,빠른검색 )
-- unsigned : 음수공간을 양수공간으로 전이
-- default  : 초기 값 설정 (누락 시 효과)
-- insert into stdScore(id,loc,kor,eng) values('aaaaaa','강원',250,256);
-- truncate table stdScore;  -- 테이블 초기화
select * from stdScore;
/*
update stdscore set loc='서울' where loc='1';
update stdscore set loc='대구' where loc='2';
update stdscore set loc='원주' where loc='3';
update stdscore set loc='전주' where loc='4';
*/
select * from stdScore;
-- (1) 
select eng from stdscore order by eng desc;
select * from stdscore order by id asc;  -- a ~ z
select * from stdscore order by id desc;
-- (2)
select max(eng) as '영어최고점' from stdscore;
-- (3) 
select avg(eng) as '영어평균' from stdscore;
-- round() : 반올림;  
select round(avg(eng),2) as '영어평균' from stdscore;
select round((eng+kor)/2,2) as '평균' from stdscore where id='spring7';

-- (4)
select * from stdscore where eng < 60;

-- (5)
select * from stdscore where eng>=60 and kor>=60;
 
-- (6)
select * from stdscore where eng<60 or kor<60;

-- (6-1) 평균이 60 이상인 학생들 출력
select id,(eng+kor)/2 as 'avg' from stdscore 
                               where (eng+kor)/2 >= 60;

-- (7) 1등 ~ 5등
select id,eng from stdscore order by eng desc limit 5;

-- (8) 6등 ~ 10등  ( limit 자리번호(0번부터),출력개수 )
select id,eng from stdscore order by eng desc limit 5,5;

-- 행번호(index번호) 존재 (출력 안됨)
select * from stdscore;
select * from stdscore limit 0,5;   -- 기본(0번은 생략가능)
select * from stdscore limit 5;     -- 자리번호 생략 됨 (기본 0)
select * from stdscore limit 7,7;   -- 7번부터 7개 출력
select * from stdscore limit 10,5;  -- 10번부터 5개 출력

-- (10) 'spring7'의 영어점수를 +10 해준다. (누적의 개념)
update stdscore set eng=eng+10 where id='spring7';

-- 무조건 90점으로 만들겠다.
update stdscore set eng=90 where id='spring7';

-- spring7의 정보 변경( 구리, 80, 70 )
update stdscore set eng=70
                   ,kor=80
				   ,loc='구리'
      where id='spring7';

select * from stdscore where id='spring7';

-- (9) 1등의 정보(아이디,총합점수)

select * from stdscore 
		       order by (eng+kor) desc limit 1;
-- ------------------ ------------------------------              
select * from stdscore 
		 where (eng+kor) = (select max(eng+kor) from stdscore);
-- ---------------------------------------------------
select max(eng+kor) from stdscore;
-- ---------------------------------------------------
-- (11)
select * from stdscore where loc='대구';
-- (12)
select count(*) from stdscore where loc='대구';
-- (13)
select id,eng from stdscore
 where loc='대구' and eng=(select max(eng) from stdscore where loc='대구');
-- ---------------------------------------------------------------------
select max(eng) from stdscore where loc='대구';

-- (14)
select id,(eng+kor) '총점' from stdscore
 where loc='대구' 
   and (eng+kor) = (select max(eng+kor) from stdscore where loc='대구');
-- ---------------------------
update stdscore set loc='서울특별시 강남구' where loc='서울';
update stdscore set loc='대구광역시 수성구' where loc='대구';
update stdscore set loc='강원도 원주시'    where loc='원주';
update stdscore set loc='전라북도 전주시'   where loc='전주';
update stdscore set loc='구리시 수택동'   where loc='구리';

select * from stdscore;

-- ----- 검색 ( LIKE )  =>  % : 임의의 문자열(이 올수도 있고 안 올수도 있다)
-- "수성구"라는 단어가 들어가 있는 주소
select * from stdscore where loc like '%수성구%';
-- "수택"이라는 단어가 들어가 있는 주소 
select * from stdscore where loc like '%수택%';

-- "강원"이라는 단어로 시작하는 주소를 검색한다.
select * from stdscore where loc like '강원%';

-- "원주시"이라는 단어로 끝나는 주소를 검색한다.
select * from stdscore where loc like '%원주시';

-- "st"로 시작하는 아이디를 검색한다.
select * from stdscore where id like 'st%';

-- "st"로 시작하는 아이디를 검색한다. (정확하게 5자리인 값)
-- select * from stdscore where id like 'st...';
select * from stdscore 
		where id like 'st%' and length(id)=5;

-- --------------------------------------------
select count(*) from stdscore 
					where loc like '대구%';
                    
select avg(eng) from stdscore
					where loc like '강원도%';








