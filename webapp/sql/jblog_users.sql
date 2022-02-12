--##############[users 테이블 생성]#############-------
--#테이블 삭제
drop table users;

--#시퀀스 삭제
drop sequence seq_users_no;

--#테이블 생성
create table users(
        userNo number,
        id varchar2(50) not null unique,
        userName varchar2(100) not null,
        password varchar2(50) not null,
        joinDate date not null,
        primary key(userNo)
);

--#시퀀스 생성
create sequence seq_users_no
increment by 1
start with 1
nocache;

commit;

--#전체 출력
select *
from users;

--#회원가입 등록
insert into users
values(
    seq_users_no.nextval,'아이디입력','사용자이름','비밀번호',sysdate
);

--#아이디 중복 체크
select count(*)
from users
where id = 'java';

--#로그인
select userNo,
        userName,
        id
from users
where id='java'
and password = '2345';
