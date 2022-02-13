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
select  postNo,
        cateNo,
        postTitle,
        postContent,
        regDate
from post;

--#post글작성
insert into post
values(seq_post_no.nextval,
            29,
        '포스트 타이트을', 
        '글내용입니당', 
        sysdate);

--#post카운트
select count(*)
from post
where cateNo = 3;

--#등록
insert into post
values(seq_post_no.nextval,
        29,
        '포스트타이틀',
        '포스트컨텐츠',
        sysdate
);

--#cateNo & cateName 가져오기
select  po.cateNo,
        cate.cateName
from post po, category cate
where po.cateNo = cate.cateNo;

commit;
