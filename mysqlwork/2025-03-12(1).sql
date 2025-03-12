/*create table typeTest (
 a1 char(20),
 a2 varchar(20),
 a3 text,
 a4 tinyint,
 a5 int,
 a6 double,
 a7 date,
 a8 datetime,
 a9 enum('M','F'),
 a10 set('a','b','c','d') );
 */
-- (1)
insert into typeTest values
('aa1','aa2','aa3',10,10,10,'2025-03-12','2025-03-12 10:35:30','M','a');
select * from typeTest;

insert into typeTest values
('aa1','aa2','aa3',127,300,10.123,'2025/03/12','2025-03-12','F','b');
select * from typeTest;

-- 테이블 구조 변경
alter table typeTest modify a1 char(5);
alter table typeTest modify a2 varchar(5);

insert into typeTest values
('12345','abcde','aa3',127,300,10.123,'2025/03/12','2025-03-12','F','b');
select * from typeTest;

-- 정상 입력 : 정수타입에 실수값을 넣었을 경우 (자동)정수형으로 변환됨
insert into typeTest values
('111','222','aa3',77.123,77.123,77.12312,'2025/03/12','2025-03-12','F','b');
select * from typeTest;

-- 정상 입력 
insert into typeTest values
('3434','bbb','aa33',88.123,77.123,77.12312,'2025-03-12','2025-03-12','f','A');
select * from typeTest;

-- 오류 발생 : ~
insert into typeTest values
('444','nnn','aa33',88.123,77.123,77.12312,'2025-03-12','2025-03-12','F','Z');
select * from typeTest;

-- 
insert into typeTest values
('444','nnn','aa33',88.123,77.123,77.12312,'2025-03-12','2025-03-12','M','a,b,c,d');
select * from typeTest;



 
 
 
 
 
 
 