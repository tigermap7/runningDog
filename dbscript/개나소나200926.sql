-- *****************************************************************************************
-- member DB 2020.09.26 최종
-- *****************************************************************************************
-- MEMBER 테이블 삭제
DROP TABLE MEMBER CASCADE CONSTRAINTS;

-- MEMBER 테이블 생성
CREATE TABLE MEMBER (
    UNIQUE_NUM   NUMBER CONSTRAINT UNPK PRIMARY KEY NOT NULL,
    USER_ID   VARCHAR2(30) NOT NULL UNIQUE,
    USER_PWD VARCHAR2(60),
    NICKNAME   VARCHAR2(100) NOT NULL UNIQUE,
    PHONE VARCHAR2(30) NOT NULL UNIQUE,
    ORIGIN_PROFILE VARCHAR2(200),
    RENAME_PROFILE VARCHAR2(200),
    JOIN_DATE DATE DEFAULT SYSDATE,
    LAST_ACCESS_DATE DATE DEFAULT SYSDATE,
    LOGIN_TYPE VARCHAR2(10),
    ADMIN_CHK CHAR(1) DEFAULT 'N' NOT NULL,
    CONSTRAINT ADMINCHK CHECK (ADMIN_CHK IN ('Y','N')),
    LOGIN_LIMIT CHAR(1) DEFAULT 'N' NOT NULL,
    CONSTRAINT L_LIMIT CHECK (LOGIN_LIMIT IN ('Y','N'))
);

-- 시퀀스 삭제
DROP SEQUENCE UNIQUE_NUM_SEQ;
-- 시퀀스 설정
CREATE SEQUENCE UNIQUE_NUM_SEQ INCREMENT BY 1 START WITH 1 MINVALUE 1 NOMAXVALUE NOCYCLE NOCACHE;

-- MEMBER 컬럼명
COMMENT ON COLUMN MEMBER.UNIQUE_NUM IS '회원번호';
COMMENT ON COLUMN MEMBER.USER_ID IS '아이디(이메일)';
COMMENT ON COLUMN MEMBER.USER_PWD IS '비밀번호';
COMMENT ON COLUMN MEMBER.NICKNAME IS '닉네임';
COMMENT ON COLUMN MEMBER.PHONE IS '핸드폰번호';
COMMENT ON COLUMN MEMBER.ORIGIN_PROFILE IS '프로필이미지 원본이름';
COMMENT ON COLUMN MEMBER.RENAME_PROFILE IS '프로필이미지 새이름';
COMMENT ON COLUMN MEMBER.JOIN_DATE IS '가입일';
COMMENT ON COLUMN MEMBER.LAST_ACCESS_DATE IS '최근접속일';
COMMENT ON COLUMN MEMBER.LOGIN_TYPE IS '로그인타입';
COMMENT ON COLUMN MEMBER.ADMIN_CHK IS '관리자권한';
COMMENT ON COLUMN MEMBER.LOGIN_LIMIT IS '로그인제한';

COMMIT;

-- MEMBER insert
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'admin@runningdog.com', '$2a$10$kyuLy.TfWFJqAhAhPeO8DeC4zA5VWYnD8TS5BVEg4ETtqq76x.5Fa', '관리자', '010-1111-1111', '20200914/animalImg01.jpg', '20200914/20200914154337891.jpg', '20/08/10', '20/08/10', 'facebook', 'Y', DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'spark1033@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '멍무이', '010-3387-7583', '20200914/animalImg02.jpg', '20200914/20200914092756919.jpg', '20/08/11', '20/08/11', 'kakao', 'Y', DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user01@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '말랑카우', '010-2222-2222', '20200914/animalImg03.jpg', '20200914/20200914348637891.jpg', '20/08/12', '20/08/12', 'naver',DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user02@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '헤쉬그레이', '010-3333-3333', '20200914/animalImg04.jpg', '20200914/20200914154537891.jpg', '20/08/13', '20/08/13', null,DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user03@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '헤쉬브라운', '010-4444-4444', '20200914/animalImg01.jpg', '20200914/20200914154337891.jpg', '20/09/01', '20/09/01', null,DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user04@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '파라오', '010-5555-5555', '20200914/animalImg02.jpg', '20200914/20200914132404929.jpg', '20/09/02', '20/09/02', null,DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user05@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '핑크몽몽', '010-6666-6666', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/03', '20/09/03', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user06@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '팔랑카', '010-7777-8888', '20200914/animalImg04.jpg', '20200914/20200914092756919.jpg', '20/09/04', '20/09/04', 'naver', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user07@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '밤톨이', '010-9999-9999', '20200914/animalImg05.jpg', '20200914/20200914132404929.jpg', '20/09/05', '20/09/05', 'facebook', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user08@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '백곰이', '010-1010-1010', '20200914/animalImg03.jpg', '20200914/20200914154337891.jpg', '20/09/06', '20/09/06', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user09@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '양옹이', '010-2020-2020', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/07', '20/09/07', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user10@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '망망', '010-3030-3030', '20200914/animalImg03.jpg', '20200914/20200914348637891.jpg', '20/09/08', '20/09/08', 'naver', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user11@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '코코', '010-4040-4040', '20200914/animalImg03.jpg', '20200914/20200914154337891.jpg', '20/09/09', '20/09/08', 'facebook', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user12@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '유이', '010-5050-5050', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/10', '20/09/10', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user13@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '코로로', '010-6060-6060', '20200914/animalImg03.jpg', '20200914/20200914154337891.jpg', '20/09/11', '20/09/11', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user14@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '센시아', '010-7070-7070', '20200914/animalImg03.jpg', '20200914/20200914092756919.jpg', '20/09/11', '20/09/11', 'kakao', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user15@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '티아라', '010-8080-8080', '20200914/animalImg03.jpg', '20200914/20200914154537891.jpg', '20/09/12', '20/09/12', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user16@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '아이유', '010-9090-9090', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/12', '20/09/12', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user17@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '벨벳', '010-2121-2121', '20200914/animalImg03.jpg', '20200914/20200914154337891.jpg', '20/09/12', '20/09/12', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user18@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '식빵', '010-3131-3131', '20200914/animalImg03.jpg', '20200914/20200914092756919.jpg', '20/09/12', '20/09/12', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user19@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '시바개', '010-4141-4141', '20200914/animalImg03.jpg', '20200914/20200914154337823.jpg', '20/09/12', '20/09/12', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user20@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '냥냥펀치', '010-5151-5151', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/13', '20/09/13', 'naver', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user21@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '크아', '010-6161-6161', '20200914/animalImg03.jpg', '20200914/20200914092756919.jpg', '20/09/13', '20/09/13', 'facebook', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user22@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '코오', '010-7171-7171', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/13', '20/09/13', 'naver', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user23@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '키카', '010-8181-8181', '20200914/animalImg03.jpg', '20200914/20200914234337891.jpg', '20/09/13', '20/09/13', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user24@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '삐카츄', '010-9191-9191', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/13', '20/09/13', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user25@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '밍밍', '010-1212-1212', '20200914/animalImg03.jpg', '20200914/20200914092756919.jpg', '20/09/13', '20/09/13', 'facebook', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user26@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '요요', '010-1313-1313', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/13', '20/09/13', 'kakao', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user27@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '이지금', '010-1414-1414', '20200914/animalImg03.jpg', '20200914/20200914154337823.jpg', '20/09/13', '20/09/13', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user28@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '슈터', '010-1515-1515', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/13', '20/09/13', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user29@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '반요스케', '010-1616-1616', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/13', '20/09/13', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user30@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '적토마', '010-1717-1717', '20200914/animalImg03.jpg', '20200914/20200914154537891.jpg', '20/09/13', '20/09/13', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user31@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '아이오', '010-1818-1818', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/14', '20/09/14', 'kakao', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user32@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '사과', '010-1919-1919', '20200914/animalImg03.jpg', '20200914/20200914234337891.jpg', '20/09/14', '20/09/14', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user33@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '딸기', '010-5151-5151', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/14', '20/09/14', 'naver', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user34@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '바나나', '010-5152-5151', '20200914/animalImg03.jpg', '20200914/20200914154337823.jpg', '20/09/14', '20/09/14', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user35@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '는 맛있다', '010-5153-5151', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/14', '20/09/14', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user36@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '맛있으면', '010-5154-5151', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/14', '20/09/14', 'kakao', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user37@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '뭐먹지', '010-5155-5151', '20200914/animalImg03.jpg', '20200914/20200914154537891.jpg', '20/09/14', '20/09/14', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user38@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '다먹으면', '010-5156-5151', '20200914/animalImg03.jpg', '20200914/20200914092756919.jpg', '20/09/15', '20/09/15', 'naver', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user39@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '배탈나', '010-5157-5151', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/15', '20/09/15', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user40@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '배탈나도', '010-5158-5151', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/15', '20/09/15', 'naver', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user41@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '막먹어', '010-5159-5151', '20200914/animalImg03.jpg', '20200914/20200914234337891.jpg', '20/09/16', '20/09/16', 'kakao', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user42@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '그러다간', '010-5111-5151', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/16', '20/09/16', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user43@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '꿀꿀이', '010-5121-5151', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/17', '20/09/17', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user44@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '꿀꿀되면', '010-5131-5151', '20200914/animalImg03.jpg', '20200914/20200914154337823.jpg', '20/09/17', '20/09/17', 'naver', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user45@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '헬스가자', '010-5141-5151', '20200914/animalImg03.jpg', '20200914/20200914154537891.jpg', '20/09/17', '20/09/17', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user46@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '헬스장엔', '010-5161-5151', '20200914/animalImg03.jpg', '20200914/20200914154337891.jpg', '20/09/18', '20/09/18', 'facebook', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user47@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '선남선녀', '010-5171-5151', '20200914/animalImg03.jpg', '20200914/20200914154337823.jpg', '20/09/19', '20/09/19', 'naver', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user48@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '나도한번', '010-5181-5151', '20200914/animalImg03.jpg', '20200914/20200914234337891.jpg', '20/09/20', '20/09/20', 'kakao', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user49@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '운동할까', '010-5191-5151', '20200914/animalImg03.jpg', '20200914/20200914348637891.jpg', '20/09/21', '20/09/21', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user50@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '내일아침', '010-5251-5151', '20200914/animalImg03.jpg', '20200914/20200914154337891.jpg', '20/09/22', '20/09/22', 'facebook', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user51@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '일어나서', '010-5351-5151', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/23', '20/09/23', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user52@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '없던일로', '010-5451-5151', '20200914/animalImg03.jpg', '20200914/20200914154337823.jpg', '20/09/24', '20/09/24', null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user53@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '생각하고', '010-5551-5151', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', '20/09/25', '20/09/25', 'kakao', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user54@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '핸드폰을 들어', '010-5651-5151', '20200914/animalImg03.jpg', '20200914/20200914154337891.jpg', '20/09/26', '20/09/26', 'naver', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user55@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '지금당장', '010-5751-5151', '20200914/animalImg03.jpg', '20200914/20200914234337891.jpg', '20/09/27', '20/09/27', 'naver', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user56@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '배달의민족', '010-5851-5151', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', DEFAULT, DEFAULT, 'kakao', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES(UNIQUE_NUM_SEQ.NEXTVAL, 'user57@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '어플을켜서', '010-5951-5151', '20200914/animalImg03.jpg', '20200914/20200914154537891.jpg', DEFAULT, DEFAULT, 'naver', DEFAULT, DEFAULT);


-- LEAVE_MEMBER 테이블 삭제
DROP TABLE LEAVE_MEMBER CASCADE CONSTRAINTS;

-- LEAVE_MEMBER 테이블 생성
CREATE TABLE LEAVE_MEMBER (
    LEAVE_UNIQUE_NUM NUMBER NOT NULL,
    LEAVE_USER_ID VARCHAR2(30) NOT NULL,
    LEAVE_USER_PWD VARCHAR2(60),
    LEAVE_NICKNAME VARCHAR2(100) NOT NULL,
    LEAVE_PHONE VARCHAR2(30) NOT NULL,
    LEAVE_ORIGIN_PROFILE VARCHAR2(200),
    LEAVE_RENAME_PROFILE VARCHAR2(200),
    LEAVE_JOIN_DATE DATE DEFAULT SYSDATE,
    LEAVE_DATE DATE DEFAULT SYSDATE,
    LEAVE_LOGIN_TYPE VARCHAR2(10)
);

-- LEAVE_MEMBER 컬럼명
COMMENT ON COLUMN LEAVE_MEMBER.LEAVE_UNIQUE_NUM IS '회원번호';
COMMENT ON COLUMN LEAVE_MEMBER.LEAVE_USER_ID IS '아이디(이메일)';
COMMENT ON COLUMN LEAVE_MEMBER.LEAVE_USER_PWD IS '비밀번호';
COMMENT ON COLUMN LEAVE_MEMBER.LEAVE_NICKNAME IS '닉네임';
COMMENT ON COLUMN LEAVE_MEMBER.LEAVE_PHONE IS '핸드폰번호';
COMMENT ON COLUMN LEAVE_MEMBER.LEAVE_ORIGIN_PROFILE IS '프로필이미지 원본이름';
COMMENT ON COLUMN LEAVE_MEMBER.LEAVE_RENAME_PROFILE IS '프로필이미지 새이름';
COMMENT ON COLUMN LEAVE_MEMBER.LEAVE_JOIN_DATE IS '가입일';
COMMENT ON COLUMN LEAVE_MEMBER.LEAVE_DATE IS '탈퇴일';
COMMENT ON COLUMN LEAVE_MEMBER.LEAVE_LOGIN_TYPE IS '로그인타입';


-- LEAVE_MEMBER insert
INSERT INTO LEAVE_MEMBER VALUES(80, 'test01@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '한남자', '010-5951-5151', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', DEFAULT, DEFAULT, 'naver');
INSERT INTO LEAVE_MEMBER VALUES(81, 'test02@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '있어', '010-5951-5152', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', DEFAULT, DEFAULT, 'kakao');
INSERT INTO LEAVE_MEMBER VALUES(82, 'test03@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '널너무', '010-5951-5153', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', DEFAULT, DEFAULT, 'facebook');
INSERT INTO LEAVE_MEMBER VALUES(83, 'test04@naver.com', '$2a$10$UvlOgRwKqZrsouycemTEpODYD.0gUfI.dT7JqmSYvGQPJiZbjWEea', '사랑한', '010-5951-5154', '20200914/animalImg03.jpg', '20200914/20200914132404929.jpg', DEFAULT, DEFAULT, DEFAULT);

COMMIT;





-- *****************************************************************************************
-- NOTICE 테이블 삭제
DROP TABLE NOTICE CASCADE CONSTRAINTS;

-- NOTICE 테이블 생성
CREATE TABLE NOTICE (
   NOTICE_NO   NUMBER      NOT NULL,
   NOTICE_WRITER   VARCHAR2(30)      NOT NULL,
   NOTICE_TITLE    VARCHAR2(100)      NOT NULL,
   NOTICE_CONTENT    VARCHAR2(4000)      NOT NULL,
   NOTICE_DATE   DATE   DEFAULT SYSDATE   NOT NULL,
   NOTICE_READCOUNT   NUMBER   DEFAULT 0   NOT NULL,
   NOTICE_STATE    VARCHAR2(10)    NULL,
   NOTICE_ORIGINAL_FILENAME1    VARCHAR2(260)      NULL,
   NOTICE_RENAME_FILENAME1   VARCHAR2(50)      NULL,
   NOTICE_ORIGINAL_FILENAME2    VARCHAR2(260)      NULL,
   NOTICE_RENAME_FILENAME2   VARCHAR2(50)      NULL,
   NOTICE_ORIGINAL_FILENAME3    VARCHAR2(260)      NULL,
   NOTICE_RENAME_FILENAME3   VARCHAR2(50)      NULL
);
-- PK 설정
ALTER TABLE NOTICE ADD CONSTRAINT PK_NOTICE_NO PRIMARY KEY(NOTICE_NO);
-- ALTER TABLE NOTICE DROP CONSTRAINT PK_NOTICE_NO;

-- NOTICE 코멘트
COMMENT ON COLUMN NOTICE.NOTICE_NO IS '글번호';
COMMENT ON COLUMN NOTICE.NOTICE_WRITER IS '작성자닉네임';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '내용';
COMMENT ON COLUMN NOTICE.NOTICE_DATE IS '작성날짜';
COMMENT ON COLUMN NOTICE.NOTICE_READCOUNT IS '조회수';
COMMENT ON COLUMN NOTICE.NOTICE_STATE IS '알림설정';
COMMENT ON COLUMN NOTICE.NOTICE_ORIGINAL_FILENAME1 IS '첨부파일기존명1';
COMMENT ON COLUMN NOTICE.NOTICE_RENAME_FILENAME1 IS '첨부파일변경명1';
COMMENT ON COLUMN NOTICE.NOTICE_ORIGINAL_FILENAME2 IS '첨부파일기존명2';
COMMENT ON COLUMN NOTICE.NOTICE_RENAME_FILENAME2 IS '첨부파일변경명2';
COMMENT ON COLUMN NOTICE.NOTICE_ORIGINAL_FILENAME3 IS '첨부파일기존명3';
COMMENT ON COLUMN NOTICE.NOTICE_RENAME_FILENAME3 IS '첨부파일변경명3';

-- 시퀀스 삭제
DROP SEQUENCE NOTICE_NO_SEQ;
-- 시퀀스 설정
CREATE SEQUENCE NOTICE_NO_SEQ INCREMENT BY 1 START WITH 1 MINVALUE 1 NOMAXVALUE NOCYCLE NOCACHE;


-- FK 설정
ALTER TABLE NOTICE ADD CONSTRAINT FK_MEMBER_TO_NOTICE_WRITER FOREIGN KEY(NOTICE_WRITER) REFERENCES MEMBER(NICKNAME); -- 작성자 닉네임으로 FK 설정

-- NOTICE INSERT
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (21,'관리자','유기동물 발견시_긴급동물 발견시 대처요령','차량 사고 등으로 인해 긴급 치료를 요할 시 동물을 인근 동물병원으로 옮기셔야합니다.
가장 빠른 방법은 목격자만이 할 수 있기 때문에 다음 방법에 의해 대처해 주시기 바랍니다.
동물 구조 및 보호조치는 119시스템처럼 바로 출동을 할 수 있는 여건이 안되어 있기 때문에 단체 관계자가 그 현장 가까이에 있지 않는 한,
이는 어느 동물단체에서도 해결할 수 없습니다.
이때 주인이 없는 동물일 경우 다소 난감하게 대하는 동물의사도 있습니다. 
치료비 때문이라기보다는 동물의 사후 처리에 대해 곤혹스러운 마음이 들어서일 것입니다. 먼저 동물을 병원에 버리고 가지 않는다는 신뢰를 줄 수 있도록 잘 설득하시고, 치료비 일부라도 지불해 응급처치를 받을 수 있게 해주십시오.

- 동물이송
대부분의 목격자들이 동물 이송을 난감해 하는데 이는 그리 어려운 일이 아닙니다. 마음을 진정시키고 다음과 같이 침착하게 대처해 주십시오. 
작은 동물일 경우 그대로 품에 안아서 택시를 이용하는 방법도 있으며, 
조금 큰 동물은 주변의 상가나 주변인에게 도움을 요청, 종이 박스 같은 것에 담아서 이송하는 방법도 있습니다. 
이때 동물이 구토, 설사, 출혈 등의 경우도 있으므로 반드시 타월이나 신문지, 비닐봉투 등을 준비하시기 바랍니다.

- 동물이송
대부분의 목격자들이 동물 이송을 난감해 하는데 이는 그리 어려운 일이 아닙니다. 
마음을 진정시키고 다음과 같이 침착하게 대처해 주십시오. 작은 동물일 경우 그대로 품에 안아서 택시를 이용하는 방법도 있으며, 조금 큰 동물은 주변의 상가나 주변인에게 도움을 요청, 종이 박스 같은 것에 담아서 이송하는 방법도 있습니다. 
이때 동물이 구토, 설사, 출혈 등의 경우도 있으므로 반드시 타월이나 신문지, 비닐봉투 등을 준비하시기 바랍니다.

- 중대형의 개일 경우
통증 때문에 난폭한 행동을 할 수 있으므로 119에 도움을 요청하십시오. 
지역에 따라 119가 출동하기를 난감해 하는 경우도 있습니다. 그럴 경우, 난폭한 개를 보통의 사람이 이송할 경우 인재로 이어지게 되면 어차피 119가 출동해야 한다는 것을 주지시키고, 
사전 예방을 위한 조치라는 것을 잘 설득하셔서 도움을 받으십시오.

- 긴급한 동물의 응급처치를 끝낸후의 조치

 > 긴급한 동물은 가능한 구조자가 임시보호해 주시면서 동물단체를 통해 입양될 수 있도록 해주시기 바랍니다.
       모든 동물 단체는 늘어만 가는 집 없는 동물로 인해 한계상황에 처해 있고, 누구에게나 임시보호는 힘에 겨운 
       일입니다. 가여운 생명을 외면하지 말고 조금만 더 적극적인 입장을 취해 주시기 바랍니다. 그러나 도저히 그럴 
       입장이 안 되시면 동물 구조 단체에 도움을 요청하십시오. 동물단체가 성의껏 도와줄 것입니다

 > 주인을 찾아보는 일은 꼭 해주셔야 합니다.
       구조자는 구조 동물에 대해 주인을 찾을 수 있도록 노력해 주시기 바랍니다. 동물이 버려진 것이 아니라 집을 
       나왔다가 길을 잃은 것이라면 주인이 애타게 찾고 있을 겁니다. 동물 입장에서도 입양보다는 주인을 찾는 것이 
       우선이며 더 좋은 일입니다. 인근지역에 동물의 특성을 표기한 후 사진을 첨부해서 전단지를 붙이고, 파출소, 
       구청, 동물병운, 애견샵 등에 배포, 부착해 주시기바랍니다.',to_date('20/08/10','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (3,'관리자','TEST공지사항','첫번째 공지사항 입니다',to_date('20/07/10','RR/MM/DD'),2,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (4,'관리자','TEST공지사항','두번째 공지사항 입니다',to_date('20/08/01','RR/MM/DD'),2,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (5,'관리자','메인 개선 안내','메인 개선 안내',to_date('20/07/10','RR/MM/DD'),3,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (7,'관리자','어느기기에서나 손쉽게 ‘지금 달려갈 개’를 만나보세요.','어느기기에서나 손쉽게 ‘지금 달려갈 개’를 만나보세요.',to_date('20/08/09','RR/MM/DD'),4,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (8,'관리자','''작은 천사들 검색'' 서비스가 종료됩니다.','안녕하세요. ''지금 달려갈 개''입니다.
?
''지금 달려갈 개''의 ''작은 천사들 검색'' 서비스가 2020년 하반기에 종료됩니다.
?
작은 천사들 검색이란, 현재 도움이 필요한 동물들을 사용자들이 검색하는 서비스입니다. 
앞으로 보다 나은 추천, 연관 콘텐츠 서비스 제공을 위해 서비스를 종료할 예정입니다.

''작은 천사들 검색'' 안내
?
그 동안 ''작은 천사들 검색''를 이용해준 분들께 깊이 감사드리며, 향후 더욱 개선된 추천 서비스를 제공할 수 있도록 최선을 다하겠습니다.
서비스 종료와 관련하여 추가로 궁금하신 사항은 고객센터를 통해 알려주시면 친절하게 안내드리도록 하겠습니다.
?
감사합니다.',to_date('20/08/08','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (10,'관리자','''지금 달려갈 개'' 미디어 담당 활동가 모집','모집부문

전략사업국
(신입 / 경력 0명)

- 미디어 홍보 담당
- 콘텐츠 생산 및 시민 소통
- SNS, 블로그 등 매체 관리   - 시민사회단체 유경험자
- 스토리텔링 능숙자
- 간단한 포토샵 가능자

근무조건 및 환경

?근무형태   계약직(1년 후 정규직 전환 검토)
근무시간   주5일(월~금) 오전9시~오후 6시 *시차출퇴근제 적용 가능
근무지역   본국 - 서울 성동구 행당동
급여   회사내규에 따름(연봉환산 신입초봉 2,400만 원/년 수준)


전형절차

1차 서류전형   채용 마감시 게시물 제목에 [채용마감] 표시
2차 면접전형   1차 서류합격자 개별통보(면접일정 개별조율, 상시진행)
근무시작   채용일 협의가능
※ 면접은 접수 중에도 상시 진행되므로 경우에 따라 조기 마감될 수 있습니다.



제출서류

?이력서, 자기소개서 
*한국사회에서의 동물운동에 대한 견해 / 동물자유연대 지원동기 포함(필수)

※경력증명서, 졸업증명서, 자격증명서 등은 1차 서류합격자에 한해 제출합니다.
※제출하신 서류는 반환되지 않습니다.



기타 유의사항

?입사 후 채식 실천을 권장하며, 다양한 채식에 열린 태도를 지향합니다.
입사지원 서류에 허위사실이 발견될 경우, 채용 확정 이후라도 채용이 취소될 수 있습니다.
',to_date('20/08/23','RR/MM/DD'),3,'checked','지금 달려갈 개 작년 입사지원 경쟁률.xlsx','20200923163914461.xlsx','지금 달려갈 개 입사지원서 예시.docx','20200923163914462.docx','지금 달려갈 개 입사지원서 예시.pdf','20200923163914464.pdf');
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (12,'관리자','TEST공지사항','첫번째 공지사항 입니다',to_date('20/07/10','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (13,'관리자','TEST공지사항','두번째 공지사항 입니다',to_date('20/08/01','RR/MM/DD'),3,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (15,'관리자','TEST공지사항','두번째 공지사항 입니다',to_date('20/07/10','RR/MM/DD'),3,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (16,'관리자','TEST공지사항','첫번째 공지사항 입니다',to_date('20/07/10','RR/MM/DD'),2,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (17,'관리자','TEST공지사항','두번째 공지사항 입니다',to_date('20/08/01','RR/MM/DD'),2,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (18,'관리자','TEST공지사항','첫번째 공지사항 입니다',to_date('20/07/10','RR/MM/DD'),2,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (19,'관리자','TEST공지사항','두번째 공지사항 입니다',to_date('20/08/01','RR/MM/DD'),2,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (20,'관리자','휴면 전환된 계정 탈퇴 안내','휴면 전환된 계정 탈퇴 안내',to_date('20/09/23','RR/MM/DD'),14,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (22,'관리자','유기동물 발견시_이런 동물의 구조는 미뤄보세요.','- 육안으로 보아 건강상태가 비교적 양호한, 그러나 다소 초췌한 발바리들을 만날지라도 모두 구조의 대상으로 보지 말아주십시오.
대다수의 발바리들은 주인의 관리로부터 자유롭게 키워지는 경우가 많아 행동 반경이 넓습니다. 
인근지역 어딘가에 집이 있는 경우가 많으므로 떠돌이 개라고 추정될 경우엔 즉각적으로 잡는 것보다는 시간을 두고 지켜보는 것이 좋습니다.


- 떠돌이 생활에 적응력을 보이는 개를 포획할 경우, 오히려 불행한 결과를 초래할 수도 있습니다.
이들은 최선의 환경을 제공할 수 있는 입양의 기회가 매우 적은 현실이므로 전문 구조단체에서 보호하다가 수용능력 한계로 인해 일정기간이 지나면 안락사될 수도 있습니다. 
사설보육원들은 모두 한계상황이기 때문에 이들을 다 받아줄 수도 없고 재정 부족으로 확장도 어려운 상황에 있습니다. 
그리고 운좋게 사설보육시설에 수용된다고 하더라도 수백 마리의 틈에서 살아가야 하기 때문에 이들은 반려동물로서 좋은 환경과 사랑을 얻기 어렵고, 사육의 개념으로 목숨을 이어갈 수밖에 없습니다. 
부상, 질병 등의 긴급을 요하는 사안이 아닐 경우엔 그대로 지켜보며 동물들의 자유로운 행동을 인정해 주며 적당하고 간헐적인 관리를 하는 것도 동물을 돌보는 방법 중 하나라 할 수 있습니다.


- 어린 아기 고양이
엄마 고양이로부터 떨어진 아기 고양이를 섣불리 만지셔서는 안되며 데려오는 일도 신중하셔야 합니다. 
엄마 고양이와 함께 이동 중에 떨어져 있을 수도 있기 때문입니다. 
이럴 경우에는 시간을 두고 엄마 고양이가 찾으러 올 때까지 기다려야 합니다. 
그럼에도 불구하고 섣불리 데려오면 어디에선가 엄마 고양이가 오히려 안타깝게 울부짖을 겁니다.
혹은 이제부터 혼자서 살아가는 방법을 터득해야 할 시기일 수도 있습니다. 
동물은 주어진 환경의 생태 속에서 스스로 조절되는 것만이 오히려 대량 학살을 피할 수 있습니다. 
또한 야생성이 강한 모습을 보이는 어린 고양이들도 억지로 잡으려 애쓰지 마십시오. 
나름대로 도심 속에서 야생 형태로 살아가는 고양이들의 삶을 인정하여야 합니다. 
다만, 할 수만 있다면 성장한 고양이는 불임 수술 후 재방사할 수 있는 방법을 취해 주시면 도심 속의 고양이 대량 증가 문제 해소에 큰 역할을 하게 될 것입니다.',to_date('20/07/09','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (23,'관리자','유기동물 발견시_보호조치 접수방법','- 서울시내 구별 유기동물 구조·보호 담당 기관
강남구   지역경제과   2104-1637   강남25시동물병원   02-545-8575
동물구조관리협회   031-867-9119
강동구   지역경제과   480-1784   동물구조관리협회   031-867-9119
서울동물메디컬센터   02-457-0075
강북구   지역경제과   901-6455   동물구조관리협회   031-867-9119
강서구   지역경제과   2600-6283   동물구조관리협회   031-867-9119
관악구   지역경제과   880-3379   러브펫종합동물병원   02-837-8875
광진구   지역경제과   450-7322   동물구조관리협회   031-867-9119
구로구   지역보건과   860-2428   동물구조관리협회   031-867-9119
금천구   지역경제과   2627-1312   강현림동물병원   02-2642-8886
동물구조관리협회   031-867-9119
노원구   일자리경제과   2116-3482   동물구조관리협회   031-867-9119
도봉구   일자리경제과   2289-1577   현대종합동물병원   02-3491-2851
동물구조관리협회   031-867-9119
동대문구   경제진흥과   2127-4272   동물구조관리협회   031-867-9119
동작구   일자리경제과   820-1184   디아크동물병원   02-816-7582
동물구조관리협회   031-867-9119
마포구   지역경제과   3153-8563   수의사회 마포구분회   02-3141-8274
서대문구   일자리경제과   330-1918   동물구조관리협회   031-867-9119
서초구   기업환경과   2155-6449   2014길고양이TNR   02-2155-6454
동물구조관리협회   031-867-9119
성동구   지역경제과   2286-6149   동물구조관리협회   031-867-9119
성북구   지역경제과   920-3365   동물구조관리협회   031-867-9119
송파구   경제진흥과   2147-2516   동물구조관리협회   031-867-9119
양천구   지역경제과   2620-3245   우신동물병원   02-2693-8883
영등포구   지역경제과   22670-3419   대림동물병원   02-845-3368
동물구조관리협회   031-867-9119
용산구   지역경제과   2199-6810   서울수의사용산구분회   02-778-7582
은평구   생활경제과   351-6842   동물구조관리협회   031-867-9119
종로구   산업환경과   2148-2423   동물구조관리협회   031-867-9119
중구   지역경제과   3396-5073   미래지동물병원   02-2233-7574
동물구조관리협회   031-867-9119
중랑구   지역경제과   2094-1286   강남25시동물병원   02-545-8575
동물구조관리협회   031-867-9119


- 야생동물 구조 관련 단체 및 기관
서울   서울시 관악구 관악로 1   02-880-8659   서울대학교 수의과대학   위탁
부산   부산시 사하구 낙동남로 1240-2   051-209-2091   낙동강 에코센터   직영
대전   대전시 유성구 궁동 대학로 99   042-821-7930   충남대학교 수의과대학   위탁
울산   울산시 남구 옥동 506-3   052-256-5322   울산대공원   직영
경기   강원도 춘천시 강원대학길 1   033-250-7504   강원대학교 수의과대학   위탁
충북   충북 청주시 청원구 양청4길 45   043-216-3328   충북대학교 수의과대학   위탁
충남   충남 예산군 예산읍 대학로 54 (공주대학교 산업과학대학 내)   041-334-1666   공주대학교 산학협력단   위탁
전북   전북 익산시 고봉로 79번지   063-850-0983   전북대학교 수의과대학   위탁
전남   전남 순천시 순천만길 922-15   061-749-4800   순천시 환경보호과   직영
경북   경북 안동시 도산면 퇴계로 2150-44   054-840-8250   경상북도 산림자원개발원   직영
경남   경남 진주시 진주대로 501(가좌동 900)   055-754-9575   경상대학교 수의과대학   위탁
제주   제주도 제주시 산천단남길 42   064-752-9982   제주대학교 수의과대학   위탁
인천   인천시 연수구 송도동 13-20 (솔찬공원내)   032-858-9702   인천시 보건환경연구원   직영
광주   광주시 서구 유촌동 719-2일원   062-613-6651   광주시 보건환경연구원   직영',to_date('20/07/09','RR/MM/DD'),2,null,'서울시내 구별 듀기동물 구조보호 담당 기관.xlsx','20200923163502365.xlsx','야생동물 구조 관련 단체 및 기관.xlsx','20200923163502366.xlsx',null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (24,'관리자','서울시내 구별 길고양이 중성화사업 담당 기관','강남구   지역경제과   2104-1637   강남25시동물병원   02-545-8575
강동구   지역경제과   480-1784   동물구조관리협회   031-867-9119
강북구   지역경제과   901-6455   동물구조관리협회   031-867-9119
강서구   지역경제과   2600-6283   동물구조관리협회   031-867-9119
관악구   지역경제과   880-3379   서울동물병원   02-888-8807
광진구   지역경제과   450-7322   이다종합동물병원   02-463-7075
구로구   지역보건과   860-2428   이동훈동물병원   02-415-6275
금천구   지역경제과   2627-1312   강현림동물병원   02-2642-8886
노원구   일자리경제과   2116-3482   동물구조관리협회   031-867-9119
도봉구   일자리경제과   2289-1577   동물구조관리협회   031-867-9119
동대문구   경제진흥과   2127-4272   전농종합동물병원   02-2215-7582
동작구   일자리경제과   820-1184   디아크동물병원   02-816-7582
마포구   지역경제과   3153-8563   수의사회 마포구분회   02-3141-8274
서대문구   일자리경제과   330-1918   대림동물병원   02-845-3368
서초구   기업환경과   2155-6449   동물구조관리협회   031-867-9119
성동구   지역경제과   2286-6149   동물구조관리협회   031-867-9119
성북구   지역경제과   920-3365   동물구조관리협회   031-867-9119
송파구   경제진흥과   2147-2516   동물구조관리협회   031-867-9119
양천구   지역경제과   2620-3245   우신동물병원   02-2693-8883
영등포구   지역경제과   2670-3419   동물구조관리협회   031-867-9119
용산구   지역경제과   2199-6810   수의사회 용산구분회   02-778-7582
은평구   생활경제과   351-6842   러브 마이펫   02-382-7582
종로구   산업환경과   2148-2423   서울호서전문학교   031-954-0900
중구   지역경제과   3396-5073   미래지동물병원   02-2233-7574
중랑구   지역경제과   2094-1286   태능종합동물병원   02-973-1953',to_date('20/07/09','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (25,'관리자','동물학대 대응 매뉴얼','??[목차]

Ⅰ. 개요
 1. 제작 배경 및 필요성
 2. 동물학대의 개념 및 유형

Ⅱ. 동물학대 관련 법조항 및 발생 시 대응방법
 1. 동물학대 사건 처리 프로세스
 2. 사건 단계별 대응
 3. 학대 유형별 대응사례

Ⅲ. 동물학대 대응 매뉴얼의 활용
 1. 동물학대 현장 체크리스트 
 2. 동물학대 사건 모니터링

출처 : 동물자유연대',to_date('20/07/09','RR/MM/DD'),1,null,'2020년 동물학대 대응 매뉴얼.pdf','20200923162248702.pdf',null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (26,'관리자','회원 정보수정은 어떻게 하나요?','ㄴㄴㄴㄴ',to_date('20/07/09','RR/MM/DD'),0,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (27,'관리자','10월 5일(월) 23:00~ 23:15 홈페이지 서버 점검으로 인한 접속 제한','홈페이지 보안서버 인증서 갱신 작업으로 2020년 4월 13일(월) 23:00~23:15까지 약 15분간 홈페이지 접속이 일부 불안정할 수 있습니다.

다소의 불편을 드리게 된 점 양해 부탁드립니다.

감사합니다.',to_date('20/09/23','RR/MM/DD'),4,'checked',null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (28,'관리자','후원하기 방법이 변경됩니다','??10월 1일부터

후원 증액 방식이 더욱 편리하게 변경됩니다.

''지금 달려갈 개''를지지해주시고, 사랑해주시는 회원님들에게, 

좀더 편리하게 다가가고자, 

후원증액 방법을 변경하였습니다.

후원증액은 마이페이지의 후원내역 중 조회하기에서

바로 설정하실 수 있습니다.',to_date('20/07/09','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (29,'관리자','로그인 방법이 이메일 아이디로 10월 1일부터 변경 됩니다','저희의 활동을 회원님들에게 더 많이, 더 자주, 더 친숙하게 알려드리고, 

회원님들께 더욱 편리하고 안정적인 서비스를 드리고자 하기함이오니, 

처음 다소 불편함이 있으시더라도, 아무쪼록 이해를 부탁드립니다.



이에 따라 로그인 방식이 기존 아이디/패스워드 입력방식에서 

이메일/패스워드 방식으로 변경됩니다.',to_date('20/09/23','RR/MM/DD'),9,'checked',null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (30,'관리자','반려동물분양시 주의사항','반려동물분양시 계약서 입니다.',to_date('20/08/07','RR/MM/DD'),1,null,'반려동물분양 계약서.hwp','20200923162218318.hwp',null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (31,'관리자','자원봉사시 안내사항','보호소 유기견을 볼 때 흔하게 하는 오해 보호소에 오랜 기간 있는 강아지의 경우, 긴장감에 따라 아래와 같은 행동을 보일 수 있다. 
- 겁을 먹고 소심하게 몸을 숙이는 행동 
- 주변 혹은 사람에 대한 무관심함 
- 과도한 짖음

',to_date('20/07/10','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (32,'관리자','동물보호법','동물보호법
[시행 2020. 8. 12.] [법률 제16977호, 2020. 2. 11., 일부개정]

농림축산식품부(동물복지정책과-동물학대 등의 금지, 동물복지축산농장), 044-201-2372

농림축산식품부(동물복지정책과-동물의 구조·보호, 동물실험), 044-201-2374

농림축산식품부(동물복지정책과-반려동물 관련 영업), 044-201-2377

농림축산식품부(동물복지정책과-동물등록, 등록대상동물의 관리, 맹견의 관리 등 기타), 044-201-2382

 본문
제1장 총칙
제1조 목적
제2조 정의
제3조 동물보호의 기본원칙
제4조 국가ㆍ지방자치단체 및 국민의 책무
제5조 동물복지위원회
제6조 다른 법률과의 관계
제2장 동물의 보호 및 관리
제7조 적정한 사육ㆍ관리
제8조 동물학대 등의 금지
제9조 동물의 운송
제9조의2 반려동물 전달 방법
제10조 동물의 도살방법
제11조 동물의 수술
제12조 등록대상동물의 등록 등
제13조 등록대상동물의 관리 등
제13조의2 맹견의 관리
제13조의2 맹견의 관리
제13조의3 맹견의 출입금지 등
제14조 동물의 구조ㆍ보호
제15조 동물보호센터의 설치ㆍ지정 등
제16조 신고 등
제17조 공고
제18조 동물의 반환 등
제19조 보호비용의 부담
제20조 동물의 소유권 취득
제21조 동물의 분양ㆍ기증
제22조 동물의 인도적인 처리 등
제3장 동물실험
제23조 동물실험의 원칙
제24조 동물실험의 금지 등
제24조의2 미성년자 동물 해부실습의 금지
제25조 동물실험윤리위원회의 설치 등
제26조 윤리위원회의 기능 등
제27조 윤리위원회의 구성
제28조 윤리위원회의 구성 등에 대한 지도ㆍ감독
제4장 동물복지축산농장의 인증
제29조 동물복지축산농장의 인증
제30조 부정행위의 금지
제31조 인증의 승계
제5장 영업
제32조 영업의 종류 및 시설기준 등
제33조 영업의 등록
제33조의2 공설 동물장묘시설의 설치·운영 등
제33조의3 공설 동물장묘시설의 사용료 등
제34조 영업의 허가
제35조 영업의 승계
제36조 영업자 등의 준수사항
제36조 영업자 등의 준수사항
제37조 교육
제38조 등록 또는 허가 취소 등
제38조의2 영업자에 대한 점검 등
제6장 보칙
제39조 출입ㆍ검사 등
제40조 동물보호감시원
제41조 동물보호명예감시원
제41조의2 삭제 <2020. 2. 11.>
제42조 수수료
제43조 청문
제44조 권한의 위임
제45조 실태조사 및 정보의 공개
제7장 벌칙
제46조 벌칙
제46조 벌칙
제46조의2 양벌규정
제47조 과태료
제47조 과태료',to_date('20/08/22','RR/MM/DD'),2,null,'동물보호법.pdf','20200923162235155.pdf',null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (33,'관리자','잃어버린 반려동물 찾기','▶분실신고
 동물등록이 되어 있는 반려동물을 잃어버린 경우에는 다음의 서류를 갖추어서 등록대상동물을 잃어버린 날부터 10일 이내에 시장·군수·구청장(자치구의 구청장을 말함)·특별자치시장(이하 “시장·군수·구청장”이라 함)에게 분실신고를 해야 합니다(규제「동물보호법」 제12조제2항제1호 및 규제「동물보호법 시행규칙」 제9조제2항).
 동물등록 변경신고서(「동물보호법 시행규칙」 별지 제1호서식)
 동물등록증
 주민등록표 초본(「전자정부법」 제36조제1항에 따른 전자적 확인에 동의하지 않는 경우에만 첨부)
※ 동물보호관리시스템(www.animal.go.kr)에서도 분실신고가 가능합니다.
 잃어버린 반려동물에 대한 정보는 동물보호관리시스템(www.animal.go.kr)에 공고됩니다(「동물보호법 시행규칙」 별지 제1호서식 변경신고 안내란).

▶주변 탐문
 반려동물을 잃어버렸다면, 먼저 잃어버린 장소를 중심으로 그 주변에 있는 사람들에게 도움을 청하고, 근처 동물병원과 반려견 센터 및 반려견 샵을 확인해 보는 것이 좋습니다.
 또한 개인적으로 전단지를 만들어 탐문조사 시 사람들에게 나누어 줄 수 있으며, 반려동물을 잃어버린 지역에서 발행되는 지역정보지 등에 반려동물을 찾는 광고를 할 수도 있습니다.

▶인터넷 사이트 활용
 주변 탐문 후에도 찾지 못했을 경우에는 동물보호관리시스템(www.animal.go.kr)을 통해 분실신고를 해야 합니다. 또한 동물보호관리시스템을 통해서 전국에서 구조된 동물들을 확인할 수 있습니다.
 지역에 따라 자체관리로 동물보호관리시스템(www.animal.go.kr)에 포함되지 않을 수 있으니, 자세한 것은 해당지역 지방자치단체의 동물보호담당자에게 문의하는 것이 좋습니다.
※ 지방자치단체 동물보호 업무 부서 연락처 목록(정보마당-동물보호 업무 부서)
 또한, 해당 시·군·구의 인터넷 홈페이지 공고란 또는 해당 시·군·구에 소재하는 동물보호센터를 찾아보아야 하고, 동물보호를 목적으로 하는 법인이나 단체의 홈페이지도 확인해 보는 것이 좋습니다.

▶동물보호센터
 지방자치단체에서는 도로·공원 등의 공공장소를 돌아다니는 반려동물을 발견하면 그 동물을 해당 지방자치단체에서 운영 또는 위탁한 동물보호센터에서는 구조한 동물을 일정기간 보호하면서 소유자와 소유자를 위해 반려동물의 사육·관리 또는 보호에 종사하는 사람(이하 “소유자 등”이라 함)이 반려동물을 찾을 수 있도록 7일 이상 공고하고 있습니다(「동물보호법」 제17조 및 「동물보호법 시행령」 제7조제1항).
 따라서, 해당 지방자치단체의 인터넷 홈페이지 공고란 또는 해당 지방자치단체에 소재하는 동물보호센터를 찾아보아야 합니다.

▶경찰서
 반려동물이 다른 사람에 의해 구조되었다면 그 사람이 경찰서(지구대·파출소·출장소를 포함) 또는 자치경찰단 사무소(제주특별자치도의 경우)에 습득사실을 알렸을 수 있습니다(「유실물법」 제1조제1항, 제12조, 「유실물법 시행령」 제1조제1항).
반려동물의 습득신고를 받으면 해당 경찰서 등 게시판에 습득사실이 공고되므로 관할 경찰서 등도 확인해 보아야 합니다(「유실물법」 제1조제2항 후단, 「유실물법 시행령」 제3조제1항).

',to_date('20/08/22','RR/MM/DD'),3,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (34,'관리자','''지금 달려갈 개'' 이용약관 개정에 대한 안내','''지금 달려갈 개'' 이용약관 개정에 대한 안내',to_date('20/05/09','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (35,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/06/08','RR/MM/DD'),0,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (36,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/07/10','RR/MM/DD'),2,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (37,'관리자','2019년 후원금 및 활용실적 명세 보고','2019년 후원금 및 활용실적 명세 보고',to_date('19/12/25','RR/MM/DD'),2,null,'2019년_지금달려갈개 후원금 활용실적 명세서.pdf','20200923162300920.pdf',null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (38,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/06/08','RR/MM/DD'),0,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (39,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/07/10','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (41,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/06/08','RR/MM/DD'),0,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (42,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/07/10','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (43,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/05/09','RR/MM/DD'),2,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (44,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/06/08','RR/MM/DD'),0,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (45,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/07/10','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (46,'관리자','채팅 서비스 시스템 점검 작업 안내','채팅 서비스 시스템 점검 작업 안내채팅 서비스 시스템 점검 작업 안내채팅 서비스 시스템 점검 작업 안내',to_date('20/01/01','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (47,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/06/08','RR/MM/DD'),0,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (48,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/07/10','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (49,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/05/09','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (50,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/06/08','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (51,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/07/10','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (52,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/05/09','RR/MM/DD'),0,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (53,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/06/08','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (54,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/07/10','RR/MM/DD'),0,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (55,'관리자','후원 결제 시스템 점검 작업 안내','결제 시스템 점검을 위해 일시후원 결제가 일시 중단됨을 안내드립니다.

일시후원은 신용카드, 핸드폰, 실시간계좌이체를 통하여 일시적으로 후원금을 입금하시는 방법입니다.

이외에 정기후원, 페이팔은 정상적으로 진행됩니다. 

일시후원 이용 시 아래의 내용 참고 부탁드립니다.

■ ''지금 달려갈 개'' 결제 시스템 점검 작업 안내

 - 일시 : 2019년 6월 15일(토) 17:00 ~ 16일(일) 24:00

 - 영향 : 일시후원 결제 일시 중단

※ 해당 작업은 작업 상태에 따라 단축되거나 연장될 수 있음을 감안하여 주시기 바랍니다. 

일시후원 이용에 불편을 드린 점 널리 양해 부탁드리며 

더 나은 서비스 제공을 위해 최선을 다하겠습니다.

고맙습니다.',to_date('19/05/02','RR/MM/DD'),5,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (56,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/06/08','RR/MM/DD'),0,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (57,'관리자','TEST공지사항','공지사항 내용~ 블라블라',to_date('20/07/10','RR/MM/DD'),0,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (40,'관리자','''지금 달려갈 개'' 운영정책 변경 안내','


안녕하세요. 카카오입니다.

카카오 서비스를 이용해 주시는 회원 여러분께 감사드리며, 운영정책 변경에 관해 안내 말씀 드립니다.

 

변경될 운영정책 내용을 확인하시고 서비스 이용에 참고하시기 바랍니다. 

 

1. 변경 사항

''지금 달려갈 개 서비스의 휴면 정책이 일부 변경 되었습니다.

 

변경 전

변경 후

5. 서비스 휴면 정책 (장기 미접속 회원의 서비스 이용 안내)

정보통신망 이용촉진 및 정보보호 등에 관한 법률 시행령에 따라 아래 기간 동안 서비스를 이용하지 않으면 개인정보를 파기 또는 분리 보관 후 이용계약을 해지할 수 있습니다.

 

③ 본 운영정책에서 정한 휴면 정책과 개별 서비스의 휴면 정책이 다른 경우는 아래와 같으며, 개별 서비스의 휴면 정책 내용을 우선하여 적용합니다.

?  유기동물 매칭 서비스 운영정책

?  채팅 서비스 운영정책


5. 서비스 휴면 정책 (장기 미접속 회원의 서비스 이용 안내)

정보통신망 이용촉진 및 정보보호 등에 관한 법률 시행령에 따라 아래 기간 동안 서비스를 이용하지 않으면 개인정보를 파기 또는 분리 보관 후 이용계약을 해지할 수 있습니다.

 

③ 본 운영정책에서 정한 휴면 정책과 개별 서비스의 휴면 정책이 다른 경우는 아래와 같으며, 개별 서비스의 휴면 정책 내용을 우선하여 적용합니다.

?  유기동물 매칭 서비스 운영정책

?  채팅 서비스 운영정책

?  후원하기 운영정책

 

2. 변경 시기

변경된 운영정책은 2020년 9월 1일자로 효력이 발생됩니다.

 

감사합니다.',to_date('20/03/25','RR/MM/DD'),1,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (9,'관리자','''오늘의 이슈'' 장애 발생에 대해 사과드립니다.','안녕하세요.
지금 달려갈 개 서비스 총괄 공유입니다.

최근 오늘의 이슈서비스 장애로 불편을 끼쳐 사과드립니다.

오늘의 이슈는 지난 8일(16시30분 ~ 18시03분)과 12일(11시39분~12시55분, 13시30분 ~ 15시43분) 시스템 장애로 오늘의 이슈 서비스가 제공되지 않았습니다.

최근 서비스가 성장하면서 이용자 분들의 편의를 높이기 위해, 시스템을 개선하는 작업이 있었고, 이후 예상치 못한 오작동이 발생하면서 불편을 드리게 됐습니다.
장애 발생 직후 긴급히 개발팀을 투입, 복구한 상태입니다.

회사 차원에서,
금번 장애로 피해를 입은 사업자와 이용자에 대한 보상 계획을 마련 중이며, 추후 여러 통로를 통해 알려드리도록 하겠습니다.

무엇보다, 향후 장애가 재발하지 않도록 장비와 시스템을 면밀히 점검해, 서비스 이용자 여러분들을 실망시키지 않도록 최선의 노력을 기울이겠습니다.

다시 한번, 큰 불편을 드려 사과드립니다.',to_date('20/08/23','RR/MM/DD'),3,null,null,null,null,null,null,null);
Insert into RUNNINGDOG.NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE,NOTICE_READCOUNT,NOTICE_STATE,NOTICE_ORIGINAL_FILENAME1,NOTICE_RENAME_FILENAME1,NOTICE_ORIGINAL_FILENAME2,NOTICE_RENAME_FILENAME2,NOTICE_ORIGINAL_FILENAME3,NOTICE_RENAME_FILENAME3) values (58,'관리자','‘지금 달려갈 개''가 반응형 웹으로 전환되었습니다.','어느기기에서나 손쉽게 ‘지금 달려갈 개’를 만나보세요.

지금 달려갈 개 사이트가 PC, 핸드폰, 테블릿등
기기에 맞게 화면구성이 되어있습니다.
어디서든 간편하게 지금 달려갈 개를 이용해주세요',to_date('20/09/23','RR/MM/DD'),3,null,null,null,null,null,null,null);



COMMIT;



--------------------------------------------------------
--  파일이 생성됨 - 토요일-9월-26-2020   
--------------------------------------------------------
DROP TABLE "RUNNINGDOG"."ISSUE" cascade constraints;
--------------------------------------------------------
--  DDL for Table ISSUE
--------------------------------------------------------

  CREATE TABLE "RUNNINGDOG"."ISSUE" 
   (   "ISSUE_ORDER" VARCHAR2(100 BYTE), 
   "PARTNER_NAME" VARCHAR2(100 BYTE), 
   "PARTNER_IMG" VARCHAR2(4000 BYTE), 
   "ISSUE_TITLE" VARCHAR2(4000 BYTE), 
   "ISSUE_THUMBNAIL" VARCHAR2(4000 BYTE), 
   "ISSUE_DATE" VARCHAR2(100 BYTE), 
   "ISSUE_READCOUNT" NUMBER, 
   "ISSUE_LINK" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "RUNNINGDOG"."ISSUE"."ISSUE_ORDER" IS '정렬기준';
   COMMENT ON COLUMN "RUNNINGDOG"."ISSUE"."PARTNER_NAME" IS '파트너이름';
   COMMENT ON COLUMN "RUNNINGDOG"."ISSUE"."PARTNER_IMG" IS '파트너이미지';
   COMMENT ON COLUMN "RUNNINGDOG"."ISSUE"."ISSUE_TITLE" IS '제목';
   COMMENT ON COLUMN "RUNNINGDOG"."ISSUE"."ISSUE_THUMBNAIL" IS '썸네일';
   COMMENT ON COLUMN "RUNNINGDOG"."ISSUE"."ISSUE_DATE" IS '작성일';
   COMMENT ON COLUMN "RUNNINGDOG"."ISSUE"."ISSUE_READCOUNT" IS '조회수';
   COMMENT ON COLUMN "RUNNINGDOG"."ISSUE"."ISSUE_LINK" IS '상세페이지링크';
REM INSERTING into RUNNINGDOG.ISSUE
SET DEFINE OFF;
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('view','비마이펫','https://t1.daumcdn.net/news/201911/05/bemypet/20191105105020150pmpk.png','멈출 수 없는 뽁뽁이의 세계','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fbemypet%2F9ddc47d6813f4b578f03671f3964c53d.jpeg',null,56776,'https://1boon.kakao.com/bemypet/5f363611f2910a6deac7bbbd');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('view','비마이펫','https://t1.daumcdn.net/news/201911/05/bemypet/20191105105020150pmpk.png','강아지 무지개 다리 건너기 전 신체적 변화','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fbemypet%2F7a14075116104321a4599a11ff182da7.png',null,55609,'https://1boon.kakao.com/bemypet/5f22347aa223e9534e187047');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('view','비마이펫','https://t1.daumcdn.net/news/201911/05/bemypet/20191105105020150pmpk.png','강아지 죽기 전 행동 및 대처법','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fbemypet%2F941b1eb5f7d548f788eb331cfee52e50.jpeg',null,54053,'https://1boon.kakao.com/bemypet/5e315c5dbc6d9b20e0b9feda');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('view','비마이펫','https://t1.daumcdn.net/news/201911/05/bemypet/20191105105020150pmpk.png','고양이의 신기한 자세에 깜짝 놀란 집사','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fbemypet%2F901039f7ea144d5c8db86959f04828e4.jpeg',null,51819,'https://1boon.kakao.com/bemypet/5ef95329ebc9ff0b10554abb');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('view','비마이펫','https://t1.daumcdn.net/news/201911/05/bemypet/20191105105020150pmpk.png','이렇게 쪼꼬맸던 꼬물이들이 벌써...!','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fbemypet%2Fb41e079c956144b1bbc83d2fbe189582.JPG',null,51637,'https://1boon.kakao.com/bemypet/5f02a6cd0a682c3859984448');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('view','비마이펫','https://t1.daumcdn.net/news/201911/05/bemypet/20191105105020150pmpk.png','강아지 마운팅, 교정 방법 알아보기','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fbemypet%2F216f4e5545d943bea93bdf09a78d7841.png',null,50310,'https://1boon.kakao.com/bemypet/5db162ed6654465edc216c27');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('view','비마이펫','https://t1.daumcdn.net/news/201911/05/bemypet/20191105105020150pmpk.png','고양이가 집사에게 미안할 때 하는 행동 5가지','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fbemypet%2Ff8eda47958ce494a9fb179457147cc47.JPG',null,50154,'https://1boon.kakao.com/bemypet/5ea7ea66c2ec55600886b99f');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('view','비마이펫','https://t1.daumcdn.net/news/201911/05/bemypet/20191105105020150pmpk.png','집사만이 할 수 있는 젤리 문신','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fbemypet%2F57b77afdb8f64e0895d8fb46fafaffae.png',null,46810,'https://1boon.kakao.com/bemypet/5f30e922a223e9534e18c061');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('view','비마이펫','https://t1.daumcdn.net/news/201911/05/bemypet/20191105105020150pmpk.png','제발 더이상의 과잉진료는 NO!','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fbemypet%2F8170e41a1c2342d5989abd61b5f26b4d.png',null,44703,'https://1boon.kakao.com/bemypet/5ef57750b4f5a8248108f5ac');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('view','비마이펫','https://t1.daumcdn.net/news/201911/05/bemypet/20191105105020150pmpk.png','고양이가 죽기 전 하는 행동과 대처법은?','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fbemypet%2Fa109a947a47446e09f13a3627040b87d.png',null,43880,'https://1boon.kakao.com/bemypet/5e3916777391205c8a52030e');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('order','노트펫','https://t1.daumcdn.net/news/201908/30/notepet/20190830155158729jl2t.jpeg','애교 부리는 막내에게 선 그은 고양이.."우리 사이는 이 정도!"','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fnotepet%2F59d777bd1659469b963a613ab5786aa2.JPG','2020.09.21',null,'https://1boon.kakao.com/notepet/5f67ff5ea6e3606d4827e926');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('order','koreadognews','http://t1.daumcdn.net/liveboard/_profile/890e1edf98fa49ae82a2626632eb4fe5.png','지하실에서 이상한 소리가 난다... 안에 들어가있던 동물을 보고 충격...','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fkoreadognews%2F9d5e5e81285f4de2baac29d91f8b098c.JPG','2020.09.21',null,'https://1boon.kakao.com/koreadognews/5f6019605803646c206789c7');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('order','koreadognews','http://t1.daumcdn.net/liveboard/_profile/890e1edf98fa49ae82a2626632eb4fe5.png','자꾸 택배가 사라져서 CCTV를 설치한 집주인이 확인한 범인','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fkoreadognews%2F46765f6804f047448d4173886de06d18.JPG','2020.09.21',null,'https://1boon.kakao.com/koreadognews/5f600be0a6e3606d4827bbcd');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('order','koreadognews','http://t1.daumcdn.net/liveboard/_profile/890e1edf98fa49ae82a2626632eb4fe5.png','갑자기 수도요금 폭탄을 맞은 이유?!?! 똑같이 썼는데..!??!','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fkoreadognews%2Fd5331f36a7134e8b98f1a068218f4951.JPG','2020.09.21',null,'https://1boon.kakao.com/koreadognews/5f600119f874e345a86b6f20');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('order','비마이펫','https://t1.daumcdn.net/news/201911/05/bemypet/20191105105020150pmpk.png','고양이 깜짝 생일 선물 주기','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fbemypet%2F506df454f1724d35a1521b9d86d3e027.png','2020.09.21',null,'https://1boon.kakao.com/bemypet/5f6840785803646c2067ba22');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('order','노트펫','https://t1.daumcdn.net/news/201908/30/notepet/20190830155158729jl2t.jpeg','"혼자 간식 먹다 고양이한테 폭행당했습니다!"','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fnotepet%2F42c68e5f78bc4eb299f266c2c0f472f6.JPG','2020.09.20',null,'https://1boon.kakao.com/notepet/5f6453cdf874e345a86b9498');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('order','koreadognews','http://t1.daumcdn.net/liveboard/_profile/890e1edf98fa49ae82a2626632eb4fe5.png','강아지가 여권을 갈기갈기 찢어놓은 이유는?!!?','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fkoreadognews%2Fcb2cd588357842769ee03b447c079ccd.JPG','2020.09.20',null,'https://1boon.kakao.com/koreadognews/5f5edc585803646c206782c2');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('order','koreadognews','http://t1.daumcdn.net/liveboard/_profile/890e1edf98fa49ae82a2626632eb4fe5.png','아기가 갑자기 소리를 질러 달려간 엄마가 본 광경..','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fkoreadognews%2F2186ab66c8b34da9bc5ac1d47472c9b7.JPG','2020.09.20',null,'https://1boon.kakao.com/koreadognews/5f6421fca6e3606d4827dbde');
Insert into RUNNINGDOG.ISSUE (ISSUE_ORDER,PARTNER_NAME,PARTNER_IMG,ISSUE_TITLE,ISSUE_THUMBNAIL,ISSUE_DATE,ISSUE_READCOUNT,ISSUE_LINK) values ('order','비마이펫','https://t1.daumcdn.net/news/201911/05/bemypet/20191105105020150pmpk.png','고양이 수돗물 마셔도 괜찮을까?','//img1.daumcdn.net/thumb/S600x434/?scode=1boon&fname=https%3A%
