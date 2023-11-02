[Oracle11gDB 계정 생성]

1. 윈도우즈키 + r키 = cmd

C:\Users\guro-hi>sqlplus system/System1234

SQL*Plus: Release 11.2.0.1.0 Production on 토 2월 19 22:34:28 2022

Copyright (c) 1982, 2010, Oracle.  All rights reserved.


다음에 접속됨:
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options

SQL> drop user cherish cascade;

SQL> create user cherish identified by C1234;

사용자가 생성되었습니다.

SQL> grant resource, connect, dba to cherish;

권한이 부여되었습니다.

SQL> conn cherish/C1234;
연결되었습니다.
SQL> show user
USER은 "CHERISH"입니다
SQL>

==============================================================

[SpringBoot와 OracleDB 연동을 위한 개발환경 세팅]
1. Spring Boot 기본 설정하기

   1) Name 필드란에 Cherish 입력
   2) Type: Maven
   3) Packaging: War
   4) Java Version: 8
   5) Language: Java
   6) Group: SpringBootProject
   7) Artifact: Cherish
   8) Package: com.springboot.cherish

   Next - Spring Boot Version: 2.7.3

   Available: Dependency는 Spring Web, Lombok, Spring Boot DevTools,
                                   Spring Data JPA, Oracle Driver 추가!
  [Spring Boot DevTools를 처음에 추가하지 않고, 프로젝트 생성 후 추가하려면
   프로젝트 클릭 선택 후 마우스 우클릭 - Spring - Add DevTools 클릭해서 추가해 주면됨]

  [중요] : Cherish 프로젝트 생성 후 필히!
            application.properties 파일에 다음과 같이 포트 번호 작성 바랍니다.

   [참고로, Cherish 프로젝트에서는 JPA와 Hibernate를 활용하며,
    spring.jpa.hibernate.ddl-auto 설정합니다.
    즉, 데이터베이스 테이블이 자동 생성 되게 합니다]

  [application.properties 파일에 포트 번호 작성 예시]

server.port = 9008

spring.datasource.driver-class-name=oracle.jdbc.driver.OracleDriver
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:orcl
spring.datasource.username=cherish
spring.datasource.password=C1234
#hikari DBCP auto-commit true 설정
spring.datasource.hikari.auto-commit=true
spring.jpa.database-platform=org.hibernate.dialect.Oracle10gDialect

#스키마 생성(create)
# spring.jpa.hibernate.ddl-auto는 데이터베이스에 구조를 생성하는 DDL(Data Definition Language) 처리 옵션 지정 명령어
# update = 변경된 부분만 update 반영
# validate = Entity와 Table이 정상적으로 매핑되었는지만 확인
# none = 사용하지 않음
# create-drop = create와 같지만 종료 시점에 테이블 DROP 처리
# create = 기존 테이블 삭제 후 다시 생성
#spring.jpa.hibernate.ddl-auto=update
spring.jpa.hibernate.ddl-auto=create
spring.jpa.generate-ddl=false
spring.jpa.show-sql=true
spring.jpa.database=oracle

# 로그 레벨 info 지정
logging.level.org.hibernate=info
# 로그 레벨 debug 지정 : 상세 debug 로그 확인 가능함 
#logging.level.org.hibernate=debug

[중요 : Project Facets 설정]

Cherish 프로젝트 클릭 선택 - 마우스 우클릭 - properties
- Project Facets 클릭 선택 - 우측 Runtimes에서 WAS 체크 선택
- 중앙 Project Facet 하단 JPA 체크 박스 체크 선택 및 Version 2.1 선택
- Apply - Apply and Close

============================================================

2. C:\app\hi-guro\product\11.2.0\dbhome_1\jdbc\lib 폴더 안에 있는 ojdbc6.jar 파일을 준비합니다.

[참고] orai18n.jar 다운로드

https://www.oracle.com/database/technologies/appdev/jdbc-ucp-19-7-c-downloads.html

3. webapp 폴더 안에 WEB-INF 폴더 생성 - lib 폴더 안에  ojdbc6.jar 파일을 넣어줌.
Cherish 프로젝트 선택 - 마우스 우클릭 Java Build Path 클릭

   - Add Library... 클릭 - Web App Libraries 클릭해서 추가해줌.

============================================================

[node.js 설치하고 개발환경 설정]

https://nodejs.org/download/release/v16.20.0/
위 링크에서 node-v16.20.0-x64.msi 파일을 다운받고 실행

윈도우즈+r 누르고 cmd 실행

Microsoft Windows [Version 10.0.19044.1889]
(c) Microsoft Corporation. All rights reserved.

C:\Users\guro-hi>node
Welcome to Node.js v16.20.0.

C:\Users\guro-hi>node -v
v16.20.0

C:\Users\guro-hi>npm -v
8.19.4

C:\Users\guro-hi>cd\

C:\>mkdir react_study

C:\>cd react_study

C:\react_study>npm install -g yarn

C:\react_study>npm install -g create-react-app

===================================================
C:\Users\guro-hi\AppData\Roaming\npm 폴더 안에 확인 바랍니다.
===================================================

C:\react_study>create-react-app first_react

C:\react_study>cd first_react

C:\react_study\first_react>npm start

===================================================

Ctrl + C -> Y (Enter 클릭)

===================================================

C:\react_study\first_react>npm run build

C:\react_study\first_react>npm install -g serve

C:\react_study\first_react>serve -s build

[반응형 웹 개발을 위해 reactstrap, bootstrap 설치]
npm install --save reactstrap
npm install --save bootstrap
npm install react-bootstrap bootstrap
import 'bootstrap/dist/css/bootstrap.css'; 

[axios 설치]
npm install axios@0.24.0
import axios from 'axios';

[react-router-dom 쓰기 위해 설치]
npm install react-router-dom@5.3.0
import { BrowserRouter } from 'react-router-dom';
import { Link } from 'react-router-dom';
import { Route } from "react-router-dom";

[package.json에 프록시 추가]
"proxy": "http://localhost:9008",

[.env 파일 만들어서 아래 구문 추가]
DANGEROUSLY_DISABLE_HOST_CHECK=true