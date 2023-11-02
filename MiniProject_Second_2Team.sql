- 계정 생성
drop user cherish cascade;
create user cherish identified by C1234;
grant resource, connect, dba to cherish;
conn cherish/C1234;
show user

CREATE TABLE "member" (
	"member_id"	varchar(25)		NOT NULL,
	"member_email"	varchar(25)		NOT NULL
	"member_name"	varchar(25)		NOT NULL,
	"member_nickname"	varchar(25)		NOT NULL,
	"member_password"	varchar(150)		NOT NULL,
);

CREATE TABLE "board" (
	"bno"	number(10,0)		NOT NULL,
	"title"	varchar(50)		NOT NULL,
	"content"	varchar(2000)		NOT NULL,
	"writer"	varchar(25)		NOT NULL
);

CREATE TABLE "question" (
	"qno"	number(10,0)		NOT NULL,
	"type"	number(2)		NOT NULL,
	"content"	varchar(2000)		NOT NULL,
	"writer"	varchar(50)		NOT NULL,
	"contactnumber"	varchar(50)		NOT NULL
);

ALTER TABLE "member" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"member_id"
);

ALTER TABLE "board" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"bno"
);

ALTER TABLE "question" ADD CONSTRAINT "PK_QUESTION" PRIMARY KEY (
	"qno"
);



-- 테스트 ---------------

-- member 데이터 입력- member 데이터 입력
INSERT INTO member(member_id, member_name, member_nickname, member_email, member_password)
values('aa11', 'nick1@naver.com', '김체리1', 'nick1', '1111');
INSERT INTO member(member_id, member_name, member_nickname, member_email, member_password)
values('aa13', 'nick2@naver.com', '김체리2', 'nick2', '2222');
INSERT INTO member(member_id, member_name, member_nickname, member_email, member_password)
values('aa12', 'nick3@naver.com', '김체리3', 'nick3', '3333);

commit;
select * from member;


- board_seq 시퀀스 생성
create sequence board_seq
increment by 1
start with 0
maxvalue 9999999
minvalue 0;


-- board 데이터 입력 후 더미데이터 생성하기
INSERT INTO board(bno, title, content, writer)
values(board_seq.nextval, '제목1', '1번 본문입니다', '이강인');
INSERT INTO board(bno, title, content, writer)
values(board_seq.nextval, '제목2', '2번 본문입니다', '손흥민');
INSERT INTO board(bno, title, content, writer)
values(board_seq.nextval, '제목3', '3번 본문입니다', '차두리');
INSERT INTO board(bno, title, content, writer)
values(board_seq.nextval, '제목4', '4번 본문입니다', '기성용');
INSERT INTO board(bno, title, content, writer)
values(board_seq.nextval, '제목5', '5번 본문입니다', '백승호');
INSERT INTO board(bno, title, content, writer)
values(board_seq.nextval, '제목6', '6번 본문입니다', '구자철');
INSERT INTO board(bno, title, content, writer)
values(board_seq.nextval, '제목7', '7번 본문입니다', '나상호');
INSERT INTO board(bno, title, content, writer)
values(board_seq.nextval, '제목8', '8번 본문입니다', '정우영');
INSERT INTO board(bno, title, content, writer)
values(board_seq.nextval, '제목9', '9번 본문입니다', '작은정우영');
INSERT INTO board(bno, title, content, writer)
values(board_seq.nextval, '제목0', '10번 본문입니다', '손준호');

select * from board;

INSERT into board(bno, title, content, writer)
(SELECT board_seq.nextval, title, content, writer from board);

commit;


- - question_seq 시퀀스 생성
create sequence question_seq
increment by 1
start with 0
maxvalue 9999999
minvalue 0;
- - question 테이블에 데이터 입력
INSERT INTO question(qno, type, content, writer)
values(question_seq.nextval, 1, '배송문의입니다 왜 아직도 안와요', '유재석');

select * from question;

commit;