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
    into menu values(1,'����','�ٴҶ��',5000)
    into menu values(2,'Ǫ��','������ġ',7000)
    into menu values(3,'��ǰ','��',17000)
    select *
    from dual;
select * from menu;

insert into menu(m_no, m_group, m_name, m_price)
    select 4,'����','�ݵ���',6000
    from dual union all
    select 5,'��ǰ','�Һ�',30000
    from dual union all
    select 6,'Ǫ��','����',8000
    from dual;
select * from menu;

UPDATE menu
set m_price=3000
where m_name='������ġ';

update menu
set m_price=m_price*0.9
where m_name='�Һ�';

update menu
set m_name='����Ƽ'
where m_name like'%��';

insert all
    into "user" values(1,'�Ҹ���1','1234','�ڹ���','0000',10000,'gold')
    into "user" values(2,'�Ҹ���2','1234','��泲','0000',3000,'silver')
    into "user" values(3,'�Ҹ���3','1234','����ö','0000',1000,'bronze')
    select *
    from dual;
select * from "user";

alter table "user" modify u_name varchar2(30);

update "user"
set u_grade='gold'
where u_point>=3000;

update "user"
set u_point=u_point+1000
where u_name like '��%';

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
    into menu values(6,'����','�����',6000)
    into menu values(7,'����','���⽺����',6500)
    into menu values(8,'����','��������ƾ',5500)
    select *
    from dual;

select m_price
from menu
where m_name like '%����%';

select *
from menu;

insert all 
    into menu values(1,'����','�ٴҶ��',5000)
    into menu values(2,'Ǫ��','������ġ',7000)
    into menu values(3,'��ǰ','��',17000)
    into menu values(4,'����','�ݵ���',6000)
    into menu values(5,'��ǰ','�Һ�',30000)
    into menu values(6,'Ǫ��','����',8000)
    into menu values(7,'����','�Ƹ޸�ī��',4000)
    into menu values(8,'����','��',4500)
    into menu values(9,'����','Ƽ',5000)
    into menu values(10,'Ǫ��','��ī��',3000)
    into menu values(11,'����','ī���ī',5500)
    into menu values(12,'����','��ü��',5900)
    into menu values(13,'����','���ø���',4500)
    into menu values(14,'Ǫ��','������',6000)
    into menu values(15,'Ǫ��','���̱�',30000)
    into menu values(16,'����','�����̵�',6500)
    into menu values(17,'����','�Ƹ޸�ī��',4000)
    into menu values(18,'��ǰ','���º�',45000)
    into menu values(19,'��ǰ','���۹�',11000)
    into menu values(20,'��ǰ','�ݵ���',13000)
    select *
    from dual;
    
select *
from menu
where m_price<=10000;

select *
from menu
where m_group in('����','Ǫ��');

select m_name, m_price
from menu
where m_name like '�ٴҶ��';

select *
from menu
where (m_name like '%��%') and (m_price>=5000);

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

insert into orderlist values(1,to_date('2023/03/05','yyyy/mm/dd'),2,3,'����','s',5000,1,5000);

select *
from menu natural join orderlist;

select *
from menu, orderlist
where menu.m_no=orderlist.m_no;

select *
from menu natural join orderlist natural join "user";