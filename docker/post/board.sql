alter user 'root'@'localhost' identified by 'root';
alter user 'root'@'%' identified by 'root';
DROP DATABASE IF EXISTS pratice_board;
create database pratice_board;
use pratice_board;

CREATE TABLE post (
  `num` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(50) NOT NULL,
  `writer` VARCHAR(50) NOT NULL,
  `content` TEXT NOT NULL,
  `reg_date` DATETIME NOT NULL
  );

DROP DATABASE IF EXISTS BookMarketDB;
CREATE DATABASE BookMarketDB;
  
USE BookMarketDB;

CREATE TABLE IF NOT EXISTS book(
	b_id VARCHAR(10) NOT NULL,
	b_name VARCHAR(20),
	b_unitPrice  INTEGER,
	b_author VARCHAR(20),
	b_description TEXT,
	b_publisher VARCHAR(20),
   	b_category VARCHAR(20),	
	b_unitsInStock LONG,
	b_releaseDate   VARCHAR(20),
	b_condition VARCHAR(20),
	b_fileName  VARCHAR(20),
	PRIMARY KEY (b_id)
)default CHARSET=utf8;

CREATE TABLE board (
       num int not null auto_increment,
       id varchar(10) not null,
       name varchar(10) not null,
       subject varchar(100) not null,
       content text not null,
       regist_day varchar(30),
       hit int,
       ip varchar(20),
       PRIMARY KEY (num)
)default CHARSET=utf8; 

create table member ( 
    id varchar(10) not null,
    password varchar(10) not null,
    name varchar(10) not null,
    gender varchar(4),
    birth  varchar(10),
    mail  varchar(30),
    phone varchar(20),
    address varchar(90),
    regist_day varchar(50),    
    primary key(id) 
) default CHARSET=utf8;

INSERT INTO book VALUES('ISBN1234', 'C# 프로그래밍', 27000, '우재남','C#을 처음 접하는 독자를 대상으로 일대일 수업처럼 자세히 설명한 책이다. 꼭 알아야 할 핵심 개념은 기본 예제로 최대한 쉽게 설명했으며, 중요한 내용은 응용 예제, 퀴즈, 셀프 스터디, 예제 모음으로 한번 더 복습할 수 있다.', '한빛아카데미', 'IT모바일', 1000,  '2022/10/06', 'new', 'ISBN1234.jpg');
INSERT INTO book VALUES('ISBN1235', '자바마스터', 30000, '송미영', '자바를 처음 배우는 학생을 위해 자바의 기본 개념과 실습 예제를 그림을 이용하여 쉽게 설명합니다. 자바의 이론적 개념→기본 예제→프로젝트 순으로 단계별 학습이 가능하며, 각 챕터의 프로젝트를 실습하면서 온라인 서점을 완성할 수 있도록 구성하였습니다.', '한빛아카데미', 'IT모바일',1000, '2023/01/01', 'new', 'ISBN1235.jpg');
INSERT INTO book VALUES('ISBN1236', '파이썬 프로그래밍', 30000, '최성철', '파이썬으로 프로그래밍을 시작하는 입문자가 쉽게 이해할 수 있도록 기본 개념을 상세하게 설명하며, 다양한 예제를 제시합니다. 또한 프로그래밍의 기초 원리를 이해하면서 파이썬으로 데이터를 처리하는 기법도 배웁니다.', '한빛아카데미', 'IT모바일', 1000, '2023/01/01', 'new', 'ISBN1236.jpg');


DROP DATABASE IF EXISTS db_library;
CREATE DATABASE db_library;
use db_library;
CREATE TABLE tbl_hope_book(
	hb_no 		     INT		AUTO_INCREMENT, 
	u_m_no		     INT, 
	hb_name		     VARCHAR(30)	NOT NULL, 	
	hb_author	     VARCHAR(20)	NOT NULL, 	
	hb_publisher	     VARCHAR(20),
	hb_publish_year	     CHAR(4), 
	hb_reg_date	     DATETIME, 
	hb_mod_date	     DATETIME, 
	hb_result	     TINYINT	        NOT NULL DEFAULT 0, 
	hb_result_last_date  DATETIME,
	PRIMARY KEY(hb_no)
);

CREATE TABLE tbl_admin_member(
	a_m_no		INT 	AUTO_INCREMENT, 
	a_m_approval	INT	NOT NULL DEFAULT 0, 
	a_m_id		VARCHAR(20) 	NOT NULL, 
	a_m_pw		VARCHAR(100) 	NOT NULL, 
	a_m_name	VARCHAR(20) 	NOT NULL, 
	a_m_gender	CHAR(1) 	NOT NULL, 
	a_m_part	VARCHAR(20) 	NOT NULL,
	a_m_position	VARCHAR(20) 	NOT NULL,
	a_m_mail	VARCHAR(50) 	NOT NULL, 
	a_m_phone	VARCHAR(20) 	NOT NULL, 
	a_m_reg_date 	DATETIME, 
	a_m_mod_date	DATETIME, 
	PRIMARY KEY(a_m_no)
	);
    
    CREATE TABLE tbl_user_member(
	u_m_no		INT 	AUTO_INCREMENT, 
	u_m_id		VARCHAR(20) 	NOT NULL, 
	u_m_pw		VARCHAR(100) 	NOT NULL, 
	u_m_name	VARCHAR(20) 	NOT NULL, 
	u_m_gender	CHAR(1) NOT NULL, 
	u_m_mail	VARCHAR(50) 	NOT NULL, 
	u_m_phone	VARCHAR(20) 	NOT NULL, 
	u_m_reg_date 	DATETIME, 
	u_m_mod_date	DATETIME, 
	PRIMARY KEY(u_m_no)
	);
    
    CREATE TABLE tbl_rental_book(
    rb_no            INT AUTO_INCREMENT,
    b_no             INT,
    u_m_no           INT,
    rb_start_date    DATETIME,
    rb_end_date      DATETIME DEFAULT '1000-01-01',
    rb_reg_date      DATETIME,
    rb_mod_date      DATETIME,
    PRIMARY KEY(rb_no)
);
commit;