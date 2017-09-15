create table SYS_ROLE
(
  ROLE_ID   NUMBER(4) not null,
  ROLE_NAME VARCHAR2(50) not null,
  ROLE_DESC VARCHAR2(50) not null,
  ROLE_FLAG NUMBER(4) not null
);
alter table SYS_ROLE
  add constraint SYS_ROLE_PK primary key (ROLE_ID);

  

create table SYS_USER
(
  USR_ID       NUMBER(4) not null,
  USR_NAME     VARCHAR2(50) not null,
  USR_PASSWORD VARCHAR2(50) not null,
  USR_ROLE_ID  NUMBER(4) not null,
  USR_FLAG     NUMBER(4) not null
);
alter table SYS_USER
  add constraint SYS_USER_PK primary key (USR_ID);
alter table SYS_USER
  add constraint FK_SYS_USER_SYS_ROLE foreign key (USR_ROLE_ID)
  references SYS_ROLE (ROLE_ID);  
  
  
  
insert into SYS_ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, ROLE_FLAG)
values (1, '管理员', '拥有所有权限', 1);
insert into SYS_ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, ROLE_FLAG)
values (2, '客户经理', '拥有部分权限', 1);
insert into SYS_ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, ROLE_FLAG)
values (3, '销售主管', '拥有部分权限', 1);
insert into SYS_ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, ROLE_FLAG)
values (4, '高管', '拥有部分权限', 1);
commit;

-- admin 21232f297a57a5a743894a0e4a801fc3
-- newer 0c10f4a0c12ba89211235026b861263d
insert into SYS_USER (USR_ID, USR_NAME, USR_PASSWORD, USR_ROLE_ID, USR_FLAG)
values (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 1);
insert into SYS_USER (USR_ID, USR_NAME, USR_PASSWORD, USR_ROLE_ID, USR_FLAG)
values (2, 'newer_c', '0c10f4a0c12ba89211235026b861263d', 2, 1);
insert into SYS_USER (USR_ID, USR_NAME, USR_PASSWORD, USR_ROLE_ID, USR_FLAG)
values (3, 'newer_s', '0c10f4a0c12ba89211235026b861263d', 3, 1);
insert into SYS_USER (USR_ID, USR_NAME, USR_PASSWORD, USR_ROLE_ID, USR_FLAG)
values (4, 'newer_m', '0c10f4a0c12ba89211235026b861263d', 4, 1);
commit;  
