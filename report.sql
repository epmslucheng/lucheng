create table M_MESSAGE_INFO
(
  ID              VARCHAR2(16) primary key  not null,
  TEMPLATE_KEY    VARCHAR2(32) not null,
  INVOKER         VARCHAR2(128),
  DEST_ADDRS      VARCHAR2(2048),
  MESSAGE_TITLE   VARCHAR2(128),
  MESSAGE_CONTENT VARCHAR2(2048),
  MESSAGE_TYPE    VARCHAR2(16),
  SEND_STATUS     VARCHAR2(8),
  CREATE_TIME     TIMESTAMP(3),
  UPDATE_TIME     TIMESTAMP(3),
  SEND_TIME       TIMESTAMP(3),
  SEND_FLAG       VARCHAR2(32)
);

create table M_MESSAGE_TEMPLATE
(
  TEMPLATE_KEY     VARCHAR2(128) primary key  not null,
  TEMPLATE_NAME    VARCHAR2(256),
  MESSAGE_TITLE    VARCHAR2(512),
  TEMPLATE_CONTENT VARCHAR2(2048),
  SEND_USER        VARCHAR2(2048),
  MESSAGE_TYPE     VARCHAR2(16),
  UPDATE_TIME      TIMESTAMP(3)
);

create table M_MESSAGE_TEMPLATE_KEYWORD
(
  ID           NUMBER(16) primary key  not null,
  TEMPLATE_KEY VARCHAR2(128) not null,
  KEYWORD_NAME VARCHAR2(64),
  KEYWORD_DESC VARCHAR2(1024)
);

create table M_USER_MSG_SEND
(
  ID           NUMBER(16)  primary key  not null,
  MESSAGE_ID   VARCHAR2(16) not null,
  MESSAGE_TYPE VARCHAR2(16),
  SENDER       VARCHAR2(128),
  DEST_ADDR    VARCHAR2(256),
  SEND_STATUS  VARCHAR2(8),
  SEND_TIMES   NUMBER(8),
  REMARK       VARCHAR2(512),
  CREATE_TIME  TIMESTAMP(3),
  LAST_TIME    TIMESTAMP(3),
  SEND_FLAG    VARCHAR2(32)
);

create table M_EMAIL_CONFIG
(
  ID              NUMBER(16)  primary key  not null,
  SEND_SERVER     VARCHAR2(128),
  USER_NAME       VARCHAR2(128),
  EMAIL_PWD       VARCHAR2(128),
  EMAIL_STATUS    VARCHAR2(16),
  EMAIL_FROM      VARCHAR2(128),
  EMAIL_FROM_NAME VARCHAR2(128),
  EMAIL_TYPE      VARCHAR2(16),
  RECEIVE_SERVER  VARCHAR2(128),
  CREATE_TIME     TIMESTAMP(3),
  UPDATE_TIME     TIMESTAMP(3),
  EMAIL_PORT      NUMBER(16)
);
--初始化模板及模板关键字
insert into M_MESSAGE_TEMPLATE (TEMPLATE_KEY, TEMPLATE_NAME, MESSAGE_TITLE, TEMPLATE_CONTENT, SEND_USER, MESSAGE_TYPE, UPDATE_TIME)
values ('remind_report', 'remind_report', 'remind_report', 'Dear user  {USERID}:{USERNAME}' || chr(13) || '' || chr(13) || '    Your report [{REPORTNAME}] generation is completed, please pay attention to check.'  || chr(10) || 'Thank you!' || chr(13) || 'Date：{REMINDDATE}', null, '01', null);

insert into M_MESSAGE_TEMPLATE_KEYWORD (ID, TEMPLATE_KEY, KEYWORD_NAME, KEYWORD_DESC)
values ('1010', 'remind_report', 'USERID', 'the number of user');
insert into M_MESSAGE_TEMPLATE_KEYWORD (ID, TEMPLATE_KEY, KEYWORD_NAME, KEYWORD_DESC)
values ('1011', 'remind_report', 'USERNAME', 'the name of user');
insert into M_MESSAGE_TEMPLATE_KEYWORD (ID, TEMPLATE_KEY, KEYWORD_NAME, KEYWORD_DESC)
values ('1012', 'remind_report', 'REPORTNAME', 'the name of report file');
insert into M_MESSAGE_TEMPLATE_KEYWORD (ID, TEMPLATE_KEY, KEYWORD_NAME, KEYWORD_DESC)
values ('1013', 'remind_report', 'REMINDDATE', 'Date of notification');

alter table REPORT_REPORT_FILE add isSended number(1);

insert into report_sys_parameter (ID, MODULE, NAME, VALUE, REMARK, IS_PASSWORD)
values ('2001', 'Message-send', 'MSG_RESEND_SECOND', '1,3,5', 'Message retransmission times and time interval set, the unit of time is seconds', 0);
insert into report_sys_parameter (ID, MODULE, NAME, VALUE, REMARK, IS_PASSWORD)
values ('2002', 'Message-send', 'RESEND_MESSAGE_SWITCH', '1', 'Switch to resend the message, when 0 is closed, 1 is opened', 0);
insert into report_sys_parameter (ID, MODULE, NAME, VALUE, REMARK, IS_PASSWORD)
values ('2003', 'Message-Send-startTime', 'MSG_SEND_START_TIME', '8:30', 'Start time of sending messages every day', 0);
insert into report_sys_parameter (ID, MODULE, NAME, VALUE, REMARK, IS_PASSWORD)
values ('2004', 'Message-Send-endTime', 'MSG_SEND_END_TIME', '18:00', 'End time of sending messages every day', 0);
insert into report_sys_parameter (ID, MODULE, NAME, VALUE, REMARK, IS_PASSWORD)
values ('2005', 'Message-send', 'MESSAGE_UNDISTURBED_SWITCH', '1', 'Switch of undisturbed time to send message, when 0 is closed, 1 is opened', 0);



select * from v$parameter a ;


select * from t_sys_resource a where a.id='835' or a.url like '%/processJump/processJumpWorkflow%';


select * from report_log a;

select * from REPORT_REPORT_FILE a;

select * from t_sys_configuration a ;

select * from M_MESSAGE_INFO a;
select * from M_MESSAGE_TEMPLATE a;
select * from M_MESSAGE_TEMPLATE_KEYWORD a;
select * from M_USER_MSG_SEND a;
select a.rowid,a.* from report_user a;

select a.rowid,a.* from M_EMAIL_CONFIG a;

select * from report_sys_parameter a;

select * from t_sys_resource a where a.pid is null;

select * from v$parameter a where a.NAME like '%local%';
