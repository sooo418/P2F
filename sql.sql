create table userinfo(
	id varchar2(20) CONSTRAINT user_id_pk primary key,
	name varchar2(20),
	pw varchar2(20),
	nickname varchar2(20),
	phone varchar2(20),
	profile varchar2(150),
	gender varchar2(10),
	hint varchar2(30)
);

create table board(
	bseq number(10) CONSTRAINT board_seq_pk primary key,
	bcontent varchar2(300) ,
	latitude varchar2(20),
	longitude varchar2(20),
	regdate date default sysdate,
	img varchar2(150),
	open varchar2(10),
	cntlike number(10),
	id varchar2(20),
	FOREIGN KEY (id) REFERENCES userinfo (id));



create table todo(
	tseq number(10) CONSTRAINT todo_seq_pk primary key,
	tcontent varchar2(150) ,
	latitude varchar2(20),
	longitude varchar2(20),
	tododate date default sysdate,
	priority number(10) default 3,
	sharing varchar2(30),
	id varchar2(20),
	FOREIGN KEY (id) REFERENCES userinfo (id));

create table friendlist(
	myid varchar2(20),
	fid varchar2(20)
);


	
	
	
	
	
	
