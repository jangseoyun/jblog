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
select  cateNo,
        id,
        cateName,
        description,
        regDate
from category cate
order by regDate desc;

--#카테고리 글 등록
insert into category
values(3, 'java', '중복되는카테고리', '중복테스트', sysdate);

--#카테고리 삭제
delete from category
where cateNo = 31;

--#no,name가져오기
select  cateNo,
        cateName
from category;

commit;