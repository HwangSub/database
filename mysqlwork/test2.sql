select concat('my','sql');
select concat('html','을 배우고 있습니다.');
select concat('10+20=',(10+20));
select length('html');
select lpad('mysql',7,'*'); -- (데이터값,출력길이,채울값) 남는 공간이 왼쪽에 채워짐
select rpad('mysql',7,'*'); -- 남는 공간이 오른쪽에 채워짐
select rpad('901225-',14,'*');
select md5('123456');
-- Math.abs(-100)
select abs(-100);  -- 부호를 없애는 함수
-- Math.min(30,20);
select least(30,20,100,3);
select greatest(30,20,100,3);
select round(1.58); -- 2
select ceil(1.001); -- 2
select floor(1.001); -- 1
select 35/10;  -- 3.5000
select 35%10;  -- 5
select mod(35,10) -- 5



