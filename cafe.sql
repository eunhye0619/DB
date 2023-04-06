 create table menu(
    m_no number primary key,
    m_group varchar2(10),
    m_name varchar2(30),
    m_price number
);
select * from menu;

create table "user"(
    u_no number primary key,
    u_id varchar2(20),
    u_pw varchar2(4),
    u_name varchar2(5),
    u_bd varchar2(14),
    u_point number,
    u_grade varchar2(10)
);
select * from "user";

create table orderlist(
    o_no number primary key,
    o_date date,
    u_no number,
    m_no number,
    o_group varchar2(10),
    o_size varchar2(1),
    o_price number,
    o_count number,
    o_amount number,
    foreign key(u_no) references "user"(u_no),
    foreign key(m_no) references menu(m_no)
);
select * from orderlist;

create table shopping(
    s_no number primary key,
    m_no number,
    s_price number,
    s_count number,
    s_size varchar2(30),
    s_amount number,
    foreign key(m_no) references menu(m_no)
);
select * from shopping;

insert all
    into menu values(1,'음료','바닐라라떼',5000)
    into menu values(2,'푸드','샌드위치',7000)
    into menu values(3,'상품','컵',17000)
    select *
    from dual;
select * from menu;

insert into menu(m_no, m_group, m_name, m_price)
    select 4,'음료','콜드브루',6000
    from dual union all
    select 5,'상품','텀블러',30000
    from dual union all
    select 6,'푸드','케익',8000
    from dual;
select * from menu;

UPDATE menu
set m_price=3000
where m_name='샌드위치';

update menu
set m_price=m_price*0.9
where m_name='텀블러';

update menu
set m_name='버블티'
where m_name like'%라떼';

insert all
    into "user" values(1,'소마고1','1234','박민하','0000',10000,'gold')
    into "user" values(2,'소마고2','1234','김경남','0000',3000,'silver')
    into "user" values(3,'소마고3','1234','정희철','0000',1000,'bronze')
    select *
    from dual;
select * from "user";

alter table "user" modify u_name varchar2(30);

update "user"
set u_grade='gold'
where u_point>=3000;

update "user"
set u_point=u_point+1000
where u_name like '박%';

select * from menu;

delete from menu
where m_no=6;

select distinct m_group
from menu;

select m_name
from menu
where m_price>=8000;

select u_id  
from "user"
where u_point between 1000 and 3000;

update "user"
set u_grade='silver'
where u_no=2;

select u_id
from "user"
where u_grade in ('gold','silver');

insert all
    into menu values(6,'음료','딸기라떼',6000)
    into menu values(7,'음료','딸기스무디',6500)
    into menu values(8,'음료','딸기프로틴',5500)
    select *
    from dual;

select m_price
from menu
where m_name like '%딸기%';

select *
from menu;

insert all 
    into menu values(1,'음료','바닐라라떼',5000)
    into menu values(2,'푸드','샌드위치',7000)
    into menu values(3,'상품','컵',17000)
    into menu values(4,'음료','콜드브루',6000)
    into menu values(5,'상품','텀블러',30000)
    into menu values(6,'푸드','케익',8000)
    into menu values(7,'음료','아메리카노',4000)
    into menu values(8,'음료','라떼',4500)
    into menu values(9,'음료','티',5000)
    into menu values(10,'푸드','마카롱',3000)
    into menu values(11,'음료','카페모카',5500)
    into menu values(12,'음료','돌체라떼',5900)
    into menu values(13,'음료','애플망고',4500)
    into menu values(14,'푸드','샐러드',6000)
    into menu values(15,'푸드','베이글',30000)
    into menu values(16,'음료','레몬에이드',6500)
    into menu values(17,'음료','아메리카노',4000)
    into menu values(18,'상품','보온병',45000)
    into menu values(19,'상품','쇼퍼백',11000)
    into menu values(20,'상품','콜드컵',13000)
    select *
    from dual;
    
select *
from menu
where m_price<=10000;

select *
from menu
where m_group in('음료','푸드');

select m_name, m_price
from menu
where m_name like '바닐라라떼';

select *
from menu
where (m_name like '%라떼%') and (m_price>=5000);

select *
from menu
order by m_price asc;

select *
from menu
order by m_price desc;

select sum(m_price)
from menu;

select count(m_name)
from menu;

select max(m_price)
from menu;

select min(m_price)
from menu;

select avg(m_price)
from menu;

select count(*), m_group
from menu 
group by m_group
having count(*)>=10;

select count(*)
from menu
where m_price>=5000;

select count(*), m_group
from menu
group by m_group;

select *
from "user" natural join orderlist;

insert into orderlist values(1,to_date('2023/03/05','yyyy/mm/dd'),2,3,'음료','s',5000,1,5000);

select *
from menu natural join orderlist;

select *
from menu, orderlist
where menu.m_no=orderlist.m_no;

select *
from menu natural join orderlist natural join "user";