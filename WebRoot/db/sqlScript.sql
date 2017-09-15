
create table BAS_DICT
(
  DICT_ID          NUMBER(4) not null,
  DICT_TYPE        VARCHAR2(50) not null,
  DICT_ITEM        VARCHAR2(50) not null,
  DICT_VALUE       VARCHAR2(50) not null,
  DICT_IS_EDITABLE NUMBER default 1
);
alter table BAS_DICT
  add constraint BAS_DICT_PK primary key (DICT_ID);

create table CST_CUSTOMER
(
  CUST_NO              VARCHAR2(17) not null,
  CUST_NAME            VARCHAR2(100) not null,
  CUST_REGION          VARCHAR2(50) default '',
  CUST_MANAGER_ID      NUMBER(4) default 0,
  CUST_MANAGER_NAME    VARCHAR2(50) default '',
  CUST_LEVEL           NUMBER(4) default 1,
  CUST_LEVEL_LABEL     VARCHAR2(50) default '',
  CUST_SATISFY         NUMBER(4) default 3,
  CUST_CREDIT          NUMBER(4) default 3,
  CUST_ADDR            VARCHAR2(300) default '',
  CUST_ZIP             VARCHAR2(10) default '',
  CUST_TEL             VARCHAR2(50) default '',
  CUST_FAX             VARCHAR2(50) default '',
  CUST_WEBSITE         VARCHAR2(50) default '',
  CUST_LICENCE_NO      VARCHAR2(50) default '',
  CUST_CHIEFTAIN       VARCHAR2(50) default '',
  CUST_BANKROLL        NUMBER(4) default 0,
  CUST_TURNOVER        NUMBER(4) default 0,
  CUST_BANK            VARCHAR2(200) default '',
  CUST_BANK_ACCOUNT    VARCHAR2(50) default '',
  CUST_LOCAL_TAX_NO    VARCHAR2(50) default '',
  CUST_NATIONAL_TAX_NO VARCHAR2(50) default '',
  CUST_STATUS          VARCHAR2(1) default 1
);
alter table CST_CUSTOMER
  add constraint CST_CUSTOMER_PK primary key (CUST_NO);


create table CST_ACTIVITY
(
  ATV_ID        NUMBER(4) not null,
  ATV_CUST_NO   VARCHAR2(17) not null,
  ATV_CUST_NAME VARCHAR2(100),
  ATV_DATE      DATE default sysdate,
  ATV_PLACE     VARCHAR2(200) not null,
  ATV_TITLE     VARCHAR2(500) not null,
  ATV_DESC      VARCHAR2(2000) not null
);
alter table CST_ACTIVITY
  add constraint CST_ACTIVITY_PK primary key (ATV_ID);
alter table CST_ACTIVITY
  add constraint FK_ATV_CUST_NO foreign key (ATV_CUST_NO)
  references CST_CUSTOMER (CUST_NO);


create table CST_LINKMAN
(
  LKM_ID        NUMBER(4) not null,
  LKM_CUST_NO   VARCHAR2(17) not null,
  LKM_CUST_NAME VARCHAR2(100),
  LKM_NAME      VARCHAR2(50) not null,
  LKM_SEX       VARCHAR2(5) default ('男'),
  LKM_POSTION   VARCHAR2(50) default '',
  LKM_TEL       VARCHAR2(50) default '',
  LKM_MOBILE    VARCHAR2(50),
  LKM_MEMO      VARCHAR2(300)
);
alter table CST_LINKMAN
  add constraint SCT_LINKMAN primary key (LKM_ID);
alter table CST_LINKMAN
  add constraint FK_LKM_CUST_NO foreign key (LKM_CUST_NO)
  references CST_CUSTOMER (CUST_NO);


create table CST_LOST
(
  LST_ID                NUMBER(4) not null,
  LST_CUST_NO           VARCHAR2(17) not null,
  LST_CUST_NAME         VARCHAR2(100) not null,
  LST_CUST_MANAGER_ID   NUMBER(4) not null,
  LST_CUST_MANAGER_NAME VARCHAR2(50) not null,
  LST_LAST_ORDER_DATE   DATE,
  LST_LOST_DATE         DATE,
  LST_DELAY             VARCHAR2(4000) not null,
  LST_REASON            VARCHAR2(2000) not null,
  LST_STATUS            VARCHAR2(10) default 1
);
alter table CST_LOST
  add constraint CST_LOST_PK primary key (LST_ID);
alter table CST_LOST
  add constraint FK_LST_CUST_NO foreign key (LST_CUST_NO)
  references CST_CUSTOMER (CUST_NO);


create table CST_SERVICE
(
  SVR_ID          NUMBER(4) not null,
  SVR_TYPE        VARCHAR2(20) not null,
  SVR_TITLE       VARCHAR2(500) not null,
  SVR_CUST_NO     VARCHAR2(17),
  SVR_CUST_NAME   VARCHAR2(100) not null,
  SVR_STATUS      VARCHAR2(10) default ('新创建'),
  SVR_REQUEST     VARCHAR2(3000) not null,
  SVR_CREATE_ID   NUMBER(4) not null,
  SVR_CREATE_BY   VARCHAR2(50) not null,
  SVR_CREATE_DATE DATE default sysdate,
  SVR_DUE_ID      NUMBER(4) not null,
  SVR_DUE_TO      VARCHAR2(50) not null,
  SVR_DUE_DATE    DATE,
  SVR_DEAL        VARCHAR2(3000) not null,
  SVR_DEAL_ID     NUMBER(4) not null,
  SVR_DEAL_BY     VARCHAR2(50) not null,
  SVR_DEAL_DATE   DATE,
  SVR_RESULT      VARCHAR2(500) not null,
  SVR_SATISFY     NUMBER(4) not null
);
alter table CST_SERVICE
  add constraint CST_SERVICE_PK primary key (SVR_ID);
alter table CST_SERVICE
  add constraint FK_SVR_CUST_NO foreign key (SVR_CUST_NO)
  references CST_CUSTOMER (CUST_NO);


create table ORDERS
(
  ODR_ID       NUMBER(4) not null,
  ODR_CUSTOMER VARCHAR2(100) not null,
  ODR_DATE     DATE not null,
  ODR_ADDR     VARCHAR2(200) not null,
  ODR_STATUS   VARCHAR2(1) not null
);
alter table ORDERS
  add constraint ORDERS_PK primary key (ODR_ID);


create table ORDERS_LINE
(
  ODD_ID       NUMBER(4) not null,
  ODD_ORDER_ID NUMBER(4) not null,
  ODD_PROD_ID  NUMBER(4) not null,
  ODD_COUNT    NUMBER(4) not null,
  ODD_UNIT     VARCHAR2(10) not null,
  ODD_PRICE    NUMBER(8,2) not null
);
alter table ORDERS_LINE
  add constraint ORDERS_LINE_PK primary key (ODD_ID);


create table PRODUCT
(
  PROD_ID    NUMBER(4) not null,
  PROD_NAME  VARCHAR2(200) not null,
  PROD_TYPE  VARCHAR2(100) not null,
  PROD_BATCH VARCHAR2(100) not null,
  PROD_UNIT  VARCHAR2(10) not null,
  PROD_PRICE NUMBER(8,2) not null,
  PROD_MEMO  VARCHAR2(200)
);
alter table PRODUCT
  add constraint PRODUCT_PK primary key (PROD_ID);


create table SAL_CHANCE
(
  CHC_ID          NUMBER(4) not null,
  CHC_SOURCE      VARCHAR2(50) not null,
  CHC_CUST_NAME   VARCHAR2(100) not null,
  CHC_TITLE       VARCHAR2(200) not null,
  CHC_RATE        NUMBER(4) default 0,
  CHC_LINKMAN     VARCHAR2(50) not null,
  CHC_TEL         VARCHAR2(50) not null,
  CHC_DESC        VARCHAR2(2000) not null,
  CHC_CREATE_ID   NUMBER(4) not null,
  CHC_CREATE_BY   VARCHAR2(50) not null,
  CHC_CREATE_DATE DATE default sysdate,
  CHC_DUE_ID      NUMBER(4) not null,
  CHC_DUE_TO      VARCHAR2(50) not null,
  CHC_DUE_DATE    DATE,
  CHC_STATUS      VARCHAR2(10) default 1
);
alter table SAL_CHANCE
  add constraint SAL_CHANCE_PK primary key (CHC_ID);


create table SAL_PLAN
(
  PLA_ID     NUMBER(4) not null,
  PLA_CHC_ID NUMBER(4) not null,
  PLA_DATE   DATE not null,
  PLA_TODO   VARCHAR2(500) not null,
  PLA_RESULT VARCHAR2(500) not null
);
alter table SAL_PLAN
  add constraint SAL_PLAN_PK primary key (PLA_ID);
alter table SAL_PLAN
  add constraint FK_PLAN_CHANCE foreign key (PLA_CHC_ID)
  references SAL_CHANCE (CHC_ID);


create table STORAGE
(
  STK_ID        NUMBER(4) not null,
  STK_PROD_ID   NUMBER(4) not null,
  STK_WAREHOUSE VARCHAR2(50) not null,
  STK_WARE      VARCHAR2(50) not null,
  STK_COUNT     NUMBER(4) not null,
  STK_MEMO      VARCHAR2(200)
);
alter table STORAGE
  add constraint STORAGE_PK primary key (STK_ID);

create table SYS_RIGHT
(
  RIGHT_CODE        VARCHAR2(50) not null,
  RIGHT_PARENT_CODE VARCHAR2(50) not null,
  RIGHT_TYPE        VARCHAR2(20) not null,
  RIGHT_TEXT        VARCHAR2(50) not null,
  RIGHT_URL         VARCHAR2(100) not null,
  RIGHT_TIP         VARCHAR2(50) not null
);
alter table SYS_RIGHT
  add constraint SYS_RIGHT_PK primary key (RIGHT_CODE);

create table SYS_ROLE
(
  ROLE_ID   NUMBER(4) not null,
  ROLE_NAME VARCHAR2(50) not null,
  ROLE_DESC VARCHAR2(50) not null,
  ROLE_FLAG NUMBER(4) not null
);
alter table SYS_ROLE
  add constraint SYS_ROLE_PK primary key (ROLE_ID);


create table SYS_ROLE_RIGHT
(
  RF_ID         NUMBER(4) not null,
  RF_ROLE_ID    NUMBER(4) not null,
  RF_RIGHT_CODE VARCHAR2(50) not null
);
alter table SYS_ROLE_RIGHT
  add constraint SYS_ROLE_RIGHT_PK primary key (RF_ID);
alter table SYS_ROLE_RIGHT
  add constraint FK_RF_RIGHT_CODE foreign key (RF_RIGHT_CODE)
  references SYS_RIGHT (RIGHT_CODE);
alter table SYS_ROLE_RIGHT
  add constraint FK_SYS_ROLE_RIGHT_SYS_RIGHT foreign key (RF_ROLE_ID)
  references SYS_ROLE (ROLE_ID);

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



alter table CST_ACTIVITY disable constraint FK_ATV_CUST_NO;
alter table CST_LINKMAN disable constraint FK_LKM_CUST_NO;
alter table CST_LOST disable constraint FK_LST_CUST_NO;
alter table CST_SERVICE disable constraint FK_SVR_CUST_NO;
alter table SAL_PLAN disable constraint FK_PLAN_CHANCE;
alter table SYS_ROLE_RIGHT disable constraint FK_RF_RIGHT_CODE;
alter table SYS_ROLE_RIGHT disable constraint FK_SYS_ROLE_RIGHT_SYS_RIGHT;
alter table SYS_USER disable constraint FK_SYS_USER_SYS_ROLE;

insert into BAS_DICT (DICT_ID, DICT_TYPE, DICT_ITEM, DICT_VALUE, DICT_IS_EDITABLE)
values (2, '服务类型', '咨询', '咨询', 1);
insert into BAS_DICT (DICT_ID, DICT_TYPE, DICT_ITEM, DICT_VALUE, DICT_IS_EDITABLE)
values (3, '服务类型', '建议', '建议', 1);
insert into BAS_DICT (DICT_ID, DICT_TYPE, DICT_ITEM, DICT_VALUE, DICT_IS_EDITABLE)
values (4, '服务类型', '投诉', '投诉', 1);
insert into BAS_DICT (DICT_ID, DICT_TYPE, DICT_ITEM, DICT_VALUE, DICT_IS_EDITABLE)
values (7, '客户等级', '普通客户', '1', 0);
insert into BAS_DICT (DICT_ID, DICT_TYPE, DICT_ITEM, DICT_VALUE, DICT_IS_EDITABLE)
values (9, '客户等级', '重点开发客户', '2', 0);
insert into BAS_DICT (DICT_ID, DICT_TYPE, DICT_ITEM, DICT_VALUE, DICT_IS_EDITABLE)
values (10, '客户等级', '大客户', '3', 0);
insert into BAS_DICT (DICT_ID, DICT_TYPE, DICT_ITEM, DICT_VALUE, DICT_IS_EDITABLE)
values (11, '客户等级', '合作伙伴', '4', 0);
insert into BAS_DICT (DICT_ID, DICT_TYPE, DICT_ITEM, DICT_VALUE, DICT_IS_EDITABLE)
values (12, '客户等级', '战略合作伙伴', '5', 0);
insert into BAS_DICT (DICT_ID, DICT_TYPE, DICT_ITEM, DICT_VALUE, DICT_IS_EDITABLE)
values (13, '地区', '河北', '河北', 1);
insert into BAS_DICT (DICT_ID, DICT_TYPE, DICT_ITEM, DICT_VALUE, DICT_IS_EDITABLE)
values (14, '地区', '北京', '北京', 1);
insert into BAS_DICT (DICT_ID, DICT_TYPE, DICT_ITEM, DICT_VALUE, DICT_IS_EDITABLE)
values (15, '地区', '东北', '东北', 1);
insert into BAS_DICT (DICT_ID, DICT_TYPE, DICT_ITEM, DICT_VALUE, DICT_IS_EDITABLE)
values (16, '地区', '中南', '中南', 1);
insert into BAS_DICT (DICT_ID, DICT_TYPE, DICT_ITEM, DICT_VALUE, DICT_IS_EDITABLE)
values (17, '地区', '上海', '上海', 1);
commit;

insert into CST_CUSTOMER (CUST_NO, CUST_NAME, CUST_REGION, CUST_MANAGER_ID, CUST_MANAGER_NAME, CUST_LEVEL, CUST_LEVEL_LABEL, CUST_SATISFY, CUST_CREDIT, CUST_ADDR, CUST_ZIP, CUST_TEL, CUST_FAX, CUST_WEBSITE, CUST_LICENCE_NO, CUST_CHIEFTAIN, CUST_BANKROLL, CUST_TURNOVER, CUST_BANK, CUST_BANK_ACCOUNT, CUST_LOCAL_TAX_NO, CUST_NATIONAL_TAX_NO, CUST_STATUS)
values ('KH071207032218637', '三', '河北', null, null, 3, '大客户', 4, 2, null, null, null, null, null, null, null, null, null, null, null, null, null, '2');
insert into CST_CUSTOMER (CUST_NO, CUST_NAME, CUST_REGION, CUST_MANAGER_ID, CUST_MANAGER_NAME, CUST_LEVEL, CUST_LEVEL_LABEL, CUST_SATISFY, CUST_CREDIT, CUST_ADDR, CUST_ZIP, CUST_TEL, CUST_FAX, CUST_WEBSITE, CUST_LICENCE_NO, CUST_CHIEFTAIN, CUST_BANKROLL, CUST_TURNOVER, CUST_BANK, CUST_BANK_ACCOUNT, CUST_LOCAL_TAX_NO, CUST_NATIONAL_TAX_NO, CUST_STATUS)
values ('KH071207032218638', '聪海信息科技有限公司', '河北', 2, 'hlliu', 4, '合作伙伴', 5, 5, '1', '2 ', '3', '4', '5', '6', '7', 8, 9, '10', '11', '12', '13', '1');
insert into CST_CUSTOMER (CUST_NO, CUST_NAME, CUST_REGION, CUST_MANAGER_ID, CUST_MANAGER_NAME, CUST_LEVEL, CUST_LEVEL_LABEL, CUST_SATISFY, CUST_CREDIT, CUST_ADDR, CUST_ZIP, CUST_TEL, CUST_FAX, CUST_WEBSITE, CUST_LICENCE_NO, CUST_CHIEFTAIN, CUST_BANKROLL, CUST_TURNOVER, CUST_BANK, CUST_BANK_ACCOUNT, CUST_LOCAL_TAX_NO, CUST_NATIONAL_TAX_NO, CUST_STATUS)
values ('KH071207174', '客户3', '河北', null, null, 3, '大客户', 3, 1, null, null, null, null, null, null, null, null, null, null, null, null, null, '3');
insert into CST_CUSTOMER (CUST_NO, CUST_NAME, CUST_REGION, CUST_MANAGER_ID, CUST_MANAGER_NAME, CUST_LEVEL, CUST_LEVEL_LABEL, CUST_SATISFY, CUST_CREDIT, CUST_ADDR, CUST_ZIP, CUST_TEL, CUST_FAX, CUST_WEBSITE, CUST_LICENCE_NO, CUST_CHIEFTAIN, CUST_BANKROLL, CUST_TURNOVER, CUST_BANK, CUST_BANK_ACCOUNT, CUST_LOCAL_TAX_NO, CUST_NATIONAL_TAX_NO, CUST_STATUS)
values ('KH071207251', '客户4', '中南', 2, 'hlliu', 3, '大客户', 3, 3, '6', '6666', '666666666', '6', '6666666666666666', null, '666', 0, 0, '6666666', '66', null, null, '3');
insert into CST_CUSTOMER (CUST_NO, CUST_NAME, CUST_REGION, CUST_MANAGER_ID, CUST_MANAGER_NAME, CUST_LEVEL, CUST_LEVEL_LABEL, CUST_SATISFY, CUST_CREDIT, CUST_ADDR, CUST_ZIP, CUST_TEL, CUST_FAX, CUST_WEBSITE, CUST_LICENCE_NO, CUST_CHIEFTAIN, CUST_BANKROLL, CUST_TURNOVER, CUST_BANK, CUST_BANK_ACCOUNT, CUST_LOCAL_TAX_NO, CUST_NATIONAL_TAX_NO, CUST_STATUS)
values ('KH07122406540272 ', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
commit;
insert into CST_ACTIVITY (ATV_ID, ATV_CUST_NO, ATV_CUST_NAME, ATV_DATE, ATV_PLACE, ATV_TITLE, ATV_DESC)
values (1, 'KH071207032218637', null, to_date('08-12-2007', 'dd-mm-yyyy'), 'didia', 'title', 'desc');
insert into CST_ACTIVITY (ATV_ID, ATV_CUST_NO, ATV_CUST_NAME, ATV_DATE, ATV_PLACE, ATV_TITLE, ATV_DESC)
values (6, 'KH071207032218637', null, to_date('09-12-2008', 'dd-mm-yyyy'), '我', '我', '万维网');
insert into CST_ACTIVITY (ATV_ID, ATV_CUST_NO, ATV_CUST_NAME, ATV_DATE, ATV_PLACE, ATV_TITLE, ATV_DESC)
values (7, 'KH071207251', null, to_date('09-03-2008', 'dd-mm-yyyy'), '三', '三', '三');
insert into CST_ACTIVITY (ATV_ID, ATV_CUST_NO, ATV_CUST_NAME, ATV_DATE, ATV_PLACE, ATV_TITLE, ATV_DESC)
values (8, 'KH071207032218637', null, to_date('09-09-2008', 'dd-mm-yyyy'), '11', '11', '111');
insert into CST_ACTIVITY (ATV_ID, ATV_CUST_NO, ATV_CUST_NAME, ATV_DATE, ATV_PLACE, ATV_TITLE, ATV_DESC)
values (9, 'KH071207032218638', null, to_date('09-09-2009', 'dd-mm-yyyy'), '的', ' 的的', '三');
commit;

insert into CST_LINKMAN (LKM_ID, LKM_CUST_NO, LKM_CUST_NAME, LKM_NAME, LKM_SEX, LKM_POSTION, LKM_TEL, LKM_MOBILE, LKM_MEMO)
values (4, 'KH071207032218637', null, '姓名', '男', '职位', '办公电话', '手机', '备注');
insert into CST_LINKMAN (LKM_ID, LKM_CUST_NO, LKM_CUST_NAME, LKM_NAME, LKM_SEX, LKM_POSTION, LKM_TEL, LKM_MOBILE, LKM_MEMO)
values (5, 'KH071207032218637', null, '21', '男', '21', '21', '21', '21');
insert into CST_LINKMAN (LKM_ID, LKM_CUST_NO, LKM_CUST_NAME, LKM_NAME, LKM_SEX, LKM_POSTION, LKM_TEL, LKM_MOBILE, LKM_MEMO)
values (7, 'KH071207251', null, '6', '男', '66666666', '6', '66666666666', '666');
insert into CST_LINKMAN (LKM_ID, LKM_CUST_NO, LKM_CUST_NAME, LKM_NAME, LKM_SEX, LKM_POSTION, LKM_TEL, LKM_MOBILE, LKM_MEMO)
values (10, 'KH071207032218637', null, '6', '男', '66', '6', '6', '6');
insert into CST_LINKMAN (LKM_ID, LKM_CUST_NO, LKM_CUST_NAME, LKM_NAME, LKM_SEX, LKM_POSTION, LKM_TEL, LKM_MOBILE, LKM_MEMO)
values (11, 'KH071207032218637', null, '7', '女', '7', '7', '7', '7');
insert into CST_LINKMAN (LKM_ID, LKM_CUST_NO, LKM_CUST_NAME, LKM_NAME, LKM_SEX, LKM_POSTION, LKM_TEL, LKM_MOBILE, LKM_MEMO)
values (6, 'KH071207032218637', null, '往往', null, '我', '我', '我', ' ');
insert into CST_LINKMAN (LKM_ID, LKM_CUST_NO, LKM_CUST_NAME, LKM_NAME, LKM_SEX, LKM_POSTION, LKM_TEL, LKM_MOBILE, LKM_MEMO)
values (8, 'KH071207251', null, '6', '女', '6', '6', '66666666666666', ' ');
insert into CST_LINKMAN (LKM_ID, LKM_CUST_NO, LKM_CUST_NAME, LKM_NAME, LKM_SEX, LKM_POSTION, LKM_TEL, LKM_MOBILE, LKM_MEMO)
values (9, 'KH071207032218637', null, '66666666666', '男', '666', '6', ' ', '666666666666666');
insert into CST_LINKMAN (LKM_ID, LKM_CUST_NO, LKM_CUST_NAME, LKM_NAME, LKM_SEX, LKM_POSTION, LKM_TEL, LKM_MOBILE, LKM_MEMO)
values (12, 'KH07122406540272 ', '2', '5', null, null, '6', null, null);
commit;

insert into CST_LOST (LST_ID, LST_CUST_NO, LST_CUST_NAME, LST_CUST_MANAGER_ID, LST_CUST_MANAGER_NAME, LST_LAST_ORDER_DATE, LST_LOST_DATE, LST_DELAY, LST_REASON, LST_STATUS)
values (2, 'KH071207032218637', '客户', 1, '经理', to_date('08-08-2007', 'dd-mm-yyyy'), to_date('10-12-2007', 'dd-mm-yyyy'), '延迟方法<br />三四<br />三三四<br />琐琐碎碎', '诉讼', '3');
commit;
insert into CST_SERVICE (SVR_ID, SVR_TYPE, SVR_TITLE, SVR_CUST_NO, SVR_CUST_NAME, SVR_STATUS, SVR_REQUEST, SVR_CREATE_ID, SVR_CREATE_BY, SVR_CREATE_DATE, SVR_DUE_ID, SVR_DUE_TO, SVR_DUE_DATE, SVR_DEAL, SVR_DEAL_ID, SVR_DEAL_BY, SVR_DEAL_DATE, SVR_RESULT, SVR_SATISFY)
values (1, '咨询', '概要', null, '客户', '已归档', '请求', 2, 'hlliu', to_date('08-12-2007', 'dd-mm-yyyy'), 2, 'hlliu', to_date('06-12-2007', 'dd-mm-yyyy'), '处理方法', 2, 'hlliu', to_date('06-12-2007', 'dd-mm-yyyy'), '的', 4);
insert into CST_SERVICE (SVR_ID, SVR_TYPE, SVR_TITLE, SVR_CUST_NO, SVR_CUST_NAME, SVR_STATUS, SVR_REQUEST, SVR_CREATE_ID, SVR_CREATE_BY, SVR_CREATE_DATE, SVR_DUE_ID, SVR_DUE_TO, SVR_DUE_DATE, SVR_DEAL, SVR_DEAL_ID, SVR_DEAL_BY, SVR_DEAL_DATE, SVR_RESULT, SVR_SATISFY)
values (2, '咨询', '三', null, '三', '已处理', '三', 0, 'hlliu', to_date('07-12-2007', 'dd-mm-yyyy'), 2, 'hlliu', to_date('07-12-2007', 'dd-mm-yyyy'), 'rrrrrrr', 2, 'hlliu', to_date('13-12-2007', 'dd-mm-yyyy'), 'sdsd', 2);
insert into CST_SERVICE (SVR_ID, SVR_TYPE, SVR_TITLE, SVR_CUST_NO, SVR_CUST_NAME, SVR_STATUS, SVR_REQUEST, SVR_CREATE_ID, SVR_CREATE_BY, SVR_CREATE_DATE, SVR_DUE_ID, SVR_DUE_TO, SVR_DUE_DATE, SVR_DEAL, SVR_DEAL_ID, SVR_DEAL_BY, SVR_DEAL_DATE, SVR_RESULT, SVR_SATISFY)
values (3, '建议', '三', null, '三', '已分配', ' 三', 0, 'hlliu', to_date('07-12-2007', 'dd-mm-yyyy'), 2, 'hlliu', to_date('07-12-2007', 'dd-mm-yyyy'), '四分 ', 2, 'hlliu', to_date('07-12-2007', 'dd-mm-yyyy'), 'r', 2);
insert into CST_SERVICE (SVR_ID, SVR_TYPE, SVR_TITLE, SVR_CUST_NO, SVR_CUST_NAME, SVR_STATUS, SVR_REQUEST, SVR_CREATE_ID, SVR_CREATE_BY, SVR_CREATE_DATE, SVR_DUE_ID, SVR_DUE_TO, SVR_DUE_DATE, SVR_DEAL, SVR_DEAL_ID, SVR_DEAL_BY, SVR_DEAL_DATE, SVR_RESULT, SVR_SATISFY)
values (4, '咨询', 'rrrrrrr', null, 'rrrrrrrrrrrrrrrrr', '已归档', 'rrrrrrrrrrrrrrrrr', 0, 'hlliu', to_date('13-12-2007', 'dd-mm-yyyy'), 2, 'hlliu', to_date('13-12-2007', 'dd-mm-yyyy'), 'rrrrrrrrrreeeeeeeeeeeeeeerrrrrre', 2, 'hlliu', to_date('13-12-2007', 'dd-mm-yyyy'), 'rrrrrrrrr', 3);
commit;

insert into ORDERS (ODR_ID, ODR_CUSTOMER, ODR_DATE, ODR_ADDR, ODR_STATUS)
values (1, '聪海信息科技有限公司', to_date('13-03-2007', 'dd-mm-yyyy'), '北京海淀区劳动路205号', '6');
commit;
insert into ORDERS_LINE (ODD_ID, ODD_ORDER_ID, ODD_PROD_ID, ODD_COUNT, ODD_UNIT, ODD_PRICE)
values (1, 1, 4, 2, '台', 10800);
insert into ORDERS_LINE (ODD_ID, ODD_ORDER_ID, ODD_PROD_ID, ODD_COUNT, ODD_UNIT, ODD_PRICE)
values (2, 1, 7, 2, '台', 16800);
commit;

insert into PRODUCT (PROD_ID, PROD_NAME, PROD_TYPE, PROD_BATCH, PROD_UNIT, PROD_PRICE, PROD_MEMO)
values (1, '幸福牌电视机', '818 FFT', '2388 EA03', '台', 7500, '代生产');
insert into PRODUCT (PROD_ID, PROD_NAME, PROD_TYPE, PROD_BATCH, PROD_UNIT, PROD_PRICE, PROD_MEMO)
values (2, '幸福牌收音机', '天语007', '7878 006A', '台', 36, '代生产');
insert into PRODUCT (PROD_ID, PROD_NAME, PROD_TYPE, PROD_BATCH, PROD_UNIT, PROD_PRICE, PROD_MEMO)
values (4, '海龙笔记本电脑', 'i60', '2688 9966', '台', 9800, null);
insert into PRODUCT (PROD_ID, PROD_NAME, PROD_TYPE, PROD_BATCH, PROD_UNIT, PROD_PRICE, PROD_MEMO)
values (7, '海龙笔记本电脑', 'i61', '2689 6688', '台', 16800, null);
insert into PRODUCT (PROD_ID, PROD_NAME, PROD_TYPE, PROD_BATCH, PROD_UNIT, PROD_PRICE, PROD_MEMO)
values (10, '海龙笔记本电脑', 'i61', '2689 6689', '台', 15800, null);
commit;

insert into SAL_CHANCE (CHC_ID, CHC_SOURCE, CHC_CUST_NAME, CHC_TITLE, CHC_RATE, CHC_LINKMAN, CHC_TEL, CHC_DESC, CHC_CREATE_ID, CHC_CREATE_BY, CHC_CREATE_DATE, CHC_DUE_ID, CHC_DUE_TO, CHC_DUE_DATE, CHC_STATUS)
values (1, '来源', '客户', '概要', 80, '联系人', '电话', '描述', 1, 'hlliu', to_date('05-12-2007', 'dd-mm-yyyy'), 2, 'hlliu', to_date('07-12-2007', 'dd-mm-yyyy'), '3 ');
insert into SAL_CHANCE (CHC_ID, CHC_SOURCE, CHC_CUST_NAME, CHC_TITLE, CHC_RATE, CHC_LINKMAN, CHC_TEL, CHC_DESC, CHC_CREATE_ID, CHC_CREATE_BY, CHC_CREATE_DATE, CHC_DUE_ID, CHC_DUE_TO, CHC_DUE_DATE, CHC_STATUS)
values (3, '来源', '名称', '概要', 80, '联系人', '电话', '机会描述', 0, 'hlliu', to_date('06-12-2007', 'dd-mm-yyyy'), 2, 'hlliu', to_date('07-12-2007', 'dd-mm-yyyy'), '4 ');
insert into SAL_CHANCE (CHC_ID, CHC_SOURCE, CHC_CUST_NAME, CHC_TITLE, CHC_RATE, CHC_LINKMAN, CHC_TEL, CHC_DESC, CHC_CREATE_ID, CHC_CREATE_BY, CHC_CREATE_DATE, CHC_DUE_ID, CHC_DUE_TO, CHC_DUE_DATE, CHC_STATUS)
values (4, '来源', '名称', '概要', 80, '联系人', '电话', '机会描述', 0, 'hlliu', to_date('06-12-2007', 'dd-mm-yyyy'), 2, 'hlliu', to_date('07-12-2007', 'dd-mm-yyyy'), '3 ');
insert into SAL_CHANCE (CHC_ID, CHC_SOURCE, CHC_CUST_NAME, CHC_TITLE, CHC_RATE, CHC_LINKMAN, CHC_TEL, CHC_DESC, CHC_CREATE_ID, CHC_CREATE_BY, CHC_CREATE_DATE, CHC_DUE_ID, CHC_DUE_TO, CHC_DUE_DATE, CHC_STATUS)
values (9, 'ww', '122222', '1s33', 98, '1s3', '1s33', '1dddds33', 0, 'hlliu', to_date('06-12-2007', 'dd-mm-yyyy'), 2, 'hlliu', to_date('07-12-2007', 'dd-mm-yyyy'), '3 ');
insert into SAL_CHANCE (CHC_ID, CHC_SOURCE, CHC_CUST_NAME, CHC_TITLE, CHC_RATE, CHC_LINKMAN, CHC_TEL, CHC_DESC, CHC_CREATE_ID, CHC_CREATE_BY, CHC_CREATE_DATE, CHC_DUE_ID, CHC_DUE_TO, CHC_DUE_DATE, CHC_STATUS)
values (10, '1', '2', '4', 3, '5', '6', '7', 0, 'hlliu', to_date('24-12-2007', 'dd-mm-yyyy'), 2, ' ', to_date('24-12-2007', 'dd-mm-yyyy'), '3');
commit;

insert into SAL_PLAN (PLA_ID, PLA_CHC_ID, PLA_DATE, PLA_TODO, PLA_RESULT)
values (3, 9, to_date('22-02-2008', 'dd-mm-yyyy'), 'new dd', 'dddddddd');
insert into SAL_PLAN (PLA_ID, PLA_CHC_ID, PLA_DATE, PLA_TODO, PLA_RESULT)
values (4, 9, to_date('22-02-2007', 'dd-mm-yyyy'), 'ddd', 'dddd');
insert into SAL_PLAN (PLA_ID, PLA_CHC_ID, PLA_DATE, PLA_TODO, PLA_RESULT)
values (5, 9, to_date('22-02-1982', 'dd-mm-yyyy'), 'd', 'dddddd');
insert into SAL_PLAN (PLA_ID, PLA_CHC_ID, PLA_DATE, PLA_TODO, PLA_RESULT)
values (6, 10, to_date('22-02-2008', 'dd-mm-yyyy'), 'ddd', 'ss');
insert into SAL_PLAN (PLA_ID, PLA_CHC_ID, PLA_DATE, PLA_TODO, PLA_RESULT)
values (7, 10, to_date('23-02-2008', 'dd-mm-yyyy'), 'ssss', 'sssssssssssssss');
commit;

insert into STORAGE (STK_ID, STK_PROD_ID, STK_WAREHOUSE, STK_WARE, STK_COUNT, STK_MEMO)
values (3, 4, '北京-马甸库', 'EA-A6', 8, null);
insert into STORAGE (STK_ID, STK_PROD_ID, STK_WAREHOUSE, STK_WARE, STK_COUNT, STK_MEMO)
values (4, 7, '天津-恒远电子C库', '北26位', 36, null);
insert into STORAGE (STK_ID, STK_PROD_ID, STK_WAREHOUSE, STK_WARE, STK_COUNT, STK_MEMO)
values (5, 7, '天津-恒远电子C库', '北27位', 36, null);
insert into STORAGE (STK_ID, STK_PROD_ID, STK_WAREHOUSE, STK_WARE, STK_COUNT, STK_MEMO)
values (6, 7, '天津-恒远电子C库', '北28位', 30, null);
insert into STORAGE (STK_ID, STK_PROD_ID, STK_WAREHOUSE, STK_WARE, STK_COUNT, STK_MEMO)
values (1, 1, '北京-西直门库', 'EC-D2', 16, null);
commit;

insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L01', 'ROOT_MENU', 'Folder', '营销管理', ' ', '营销管理');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0101', 'L01', 'Document', '销售机会管理', 'chance.do?o=toList', '销售机会管理');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0102', 'L01', 'Document', '客户开发计划', 'plan.do?o=toList', '客户开发计划');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L02', 'ROOT_MENU', 'Folder', '客户管理', ' ', '客户管理');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0201', 'L02', 'Document', '客户信息管理', 'customer.do?o=toList', '客户信息管理');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0202', 'L02', 'Folder', '客户流失管理', 'lost.do?o=toList', '客户流失管理');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L03', 'ROOT_MENU', 'Folder', '服务管理', ' ', '服务管理');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0301', 'L03', 'Document', '服务创建', 'service.do?o=toAdd', '服务创建');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0302', 'L03', 'Document', '服务分配', 'service.do?o=toDispatch', '服务分配');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0303', 'L03', 'Document', '服务处理', 'service.do?o=toDealList', '服务处理');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0304', 'L03', 'Document', '服务反馈', 'service.do?o=toFeedbackList', '服务反馈');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0305', 'L03', 'Document', '服务归档', 'service.do?o=toArchList', '服务归档');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L04', 'ROOT_MENU', 'Folder', '统计报表', ' ', '统计报表');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0401', 'L04', 'Document', '客户贡献分析', 'contrRpt.do?o=toList', '客户贡献分析');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0402', 'L04', 'Document', '客户构成分析', 'consRpt.do?o=toList', '客户构成分析');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0403', 'L04', 'Document', '客户服务分析', 'svrRpt.do?o=toList', '客户服务分析');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0404', 'L04', 'Document', '客户流失分析', 'lostRpt.do?o=toList', '客户流失分析');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L05', 'ROOT_MENU', 'Folder', '基础数据', ' ', '基础数据');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0501', 'L05', 'Document', '数据字典管理', 'dict.do?o=toList', '数据字典管理');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0502', 'L05', 'Document', '查询产品信息', 'product.do?o=toList', '查询产品信息');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0503', 'L05', 'Document', '查询库存', 'storage.do?o=toList', '查询库存');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L06', 'ROOT_MENU', 'Folder', '权限管理', ' ', '权限管理');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0601', 'L06', 'Folder', '用户管理', 'user.do?o=toList', '用户管理');
insert into SYS_RIGHT (RIGHT_CODE, RIGHT_PARENT_CODE, RIGHT_TYPE, RIGHT_TEXT, RIGHT_URL, RIGHT_TIP)
values ('L0602', 'L06', 'Folder', '角色管理', 'role.do?o=toList', '角色管理');
commit;

insert into SYS_ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, ROLE_FLAG)
values (1, '管理员', '拥有所有权限', 1);
insert into SYS_ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, ROLE_FLAG)
values (2, '客户经理', '拥有部分权限', 1);
insert into SYS_ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, ROLE_FLAG)
values (3, '销售主管', '拥有部分权限', 1);
insert into SYS_ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, ROLE_FLAG)
values (4, '高管', '拥有部分权限', 1);
commit;

insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (39, 1, 'L01');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (40, 1, 'L0101');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (41, 1, 'L0102');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (42, 1, 'L02');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (43, 1, 'L0201');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (44, 1, 'L0202');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (45, 1, 'L03');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (46, 1, 'L0301');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (47, 1, 'L0302');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (48, 1, 'L0303');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (49, 1, 'L0304');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (50, 1, 'L0305');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (51, 1, 'L04');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (52, 1, 'L0401');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (53, 1, 'L0402');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (54, 1, 'L0403');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (55, 1, 'L0404');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (56, 1, 'L05');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (57, 1, 'L0501');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (58, 1, 'L0502');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (59, 1, 'L0503');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (60, 1, 'L06');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (61, 1, 'L0601');
insert into SYS_ROLE_RIGHT (RF_ID, RF_ROLE_ID, RF_RIGHT_CODE)
values (62, 1, 'L0602');
commit;

insert into SYS_USER (USR_ID, USR_NAME, USR_PASSWORD, USR_ROLE_ID, USR_FLAG)
values (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 1);
insert into SYS_USER (USR_ID, USR_NAME, USR_PASSWORD, USR_ROLE_ID, USR_FLAG)
values (2, 'newer_c', '0c10f4a0c12ba89211235026b861263d', 2, 1);
insert into SYS_USER (USR_ID, USR_NAME, USR_PASSWORD, USR_ROLE_ID, USR_FLAG)
values (3, 'newer_s', '0c10f4a0c12ba89211235026b861263d', 3, 1);
insert into SYS_USER (USR_ID, USR_NAME, USR_PASSWORD, USR_ROLE_ID, USR_FLAG)
values (4, 'newer_m', '0c10f4a0c12ba89211235026b861263d', 4, 1);
commit;

alter table CST_ACTIVITY enable constraint FK_ATV_CUST_NO;
alter table CST_LINKMAN enable constraint FK_LKM_CUST_NO;
alter table CST_LOST enable constraint FK_LST_CUST_NO;
alter table CST_SERVICE enable constraint FK_SVR_CUST_NO;
alter table SAL_PLAN enable constraint FK_PLAN_CHANCE;
alter table SYS_ROLE_RIGHT enable constraint FK_RF_RIGHT_CODE;
alter table SYS_ROLE_RIGHT enable constraint FK_SYS_ROLE_RIGHT_SYS_RIGHT;
alter table SYS_USER enable constraint FK_SYS_USER_SYS_ROLE;



