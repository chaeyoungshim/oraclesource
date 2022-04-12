--앞에 resource, connection 부여해줘서 가능
create table emp(
        empno number(2)
);
drop table emp;

-- member 테이블 생성
-- id(숫자, 8자리) pk
-- name (가변문자열, 20자리) not null
-- addr(가변문자열, 50) not null
-- email(가변문자열, 30) not null
-- age(숫자, 3)
create table member (
        id number(8) primary key, --특별하게 이름 부여 안 할거라
        name varchar2(20) not null,
        addr varchar2(50) not null,
        email varchar2(30) not null,
        age number(3)
);
select * from member;

--기본 시퀀스 생성하자
create sequence member_seq; 

delete from member where name='한소희';

commit;
select * from member;

insert into member values(1, '한소희','강남','han@naver.com',25);
rollback;








