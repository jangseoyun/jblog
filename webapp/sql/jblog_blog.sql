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
select id,
        blogTitle,
        logoFile
from blog;

commit;

--#블로그 메인 수정(블로그 제목,이미지)
update blog
set blogTitle = '',
    logoFile = ''
where id='';

--#파일 경로 출력
select logoFile
from blog;

--#임시등록
insert into blog
values('java','블로그제목','경로오오오');
