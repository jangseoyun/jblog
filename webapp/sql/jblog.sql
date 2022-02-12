--##############[system 계정 생성]#############--------
--#jblog 계정 생성
create user jblog identified by jblog;
--#권한 부여
grant resource, connect to jblog;

-----------------------------------------------------
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

-----------------------------------------------------
--##############[blog 테이블 생성]#############----
--#테이블 삭제
drop table blog;

--#테이블 생성
create table blog(
        id varchar2(50),
        blogTitle varchar2(200) not null,
        logoFile varchar2(200),
        primary key(id),
        CONSTRAINT blog_fk FOREIGN key (id)
        REFERENCES users(id)
);

--#전체 출력
select *
from blog;

commit;

-----------------------------------------------------
--##############[category 테이블 생성]#############----
--#테이블 삭제
brop table category;

--#시퀀스 삭제 
brop sequence seq_category_no;

--#테이블 생성
create table category(
        cateNo number,
        id varchar2(50),
        cateName varchar2(200) not null,
        description varchar2(500),
        regDate date not null,
        primary key(cateNo),
        CONSTRAINT category_fk FOREIGN key (id)
        REFERENCES blog(id)
);

--#시퀀스 생성
create sequence seq_category_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

--#전체 출력
select *
from category;

commit;

-----------------------------------------------------
--##############[post 테이블 생성]#############----
--#테이블 삭제
drop table post;

--#시퀀스 삭제 
drop sequence seq_post_no;

--#테이블 생성
create table post(
        postNo number,
        cateNo number,
        postTitle varchar2(300) not null,
        postContent varchar2(4000),
        regDate date not null,
        primary key(postNo),
        CONSTRAINT post_fk FOREIGN key (cateNo)
        REFERENCES category(cateNo)
);

--#시퀀스 생성
create sequence seq_post_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

--#전체 출력
select *
from post;

commit;

-----------------------------------------------------
--##############[comments 테이블 생성]#############----
--#테이블 삭제
drop table comments;

--#시퀀스 삭제 
drop sequence seq_comments_no;

--#테이블 생성
create table comments
        cmtNo number,
        postNo number,
        userNo number,
        cmtContent varchar2(1000),
        regDate date not null,
        primary key(cmtNo),
        CONSTRAINT comments_fk FOREIGN key (userNo)
        REFERENCES post(postNo)
);

--#시퀀스 생성
create sequence seq_comments_no
INCREMENT BY 1
START WITH 1
NOCACHE ;

--#전체 출력
select *
from comments;

commit;


