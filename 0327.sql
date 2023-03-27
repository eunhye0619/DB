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
    into menu values(1,'À½·á','¹Ù´Ò¶ó¶ó¶¼',5000)
    into menu values(2,'Çªµå','»÷µåÀ§Ä¡',7000)
    into menu values(3,'»óÇ°','ÄÅ',17000)
    select *
    from dual;
select * from menu;

insert into menu(m_no, m_group, m_name, m_price)
    select 4,'À½·á','ÄÝµåºê·ç',6000
    from dual union all
    select 5,'»óÇ°','ÅÒºí·¯',30000
    from dual union all
    select 6,'Çªµå','ÄÉÀÍ',8000
    from dual;
select * from menu;

UPDATE menu
set m_price=3000
where m_name='»÷µåÀ§Ä¡';

update menu
set m_price=m_price*0.9
where m_name='ÅÒºí·¯';

update menu
set m_name='¹öºíÆ¼'
where m_name like'%¶ó¶¼';