create table buneli_user
(
  cod_user number not null,
  txt_name varchar2(100) not null,
  txt_surname varchar2(100) not null,
  txt_email varchar2(100) not null,
  txt_pass varchar2(33) not null,
  mob_number varchar2(25),
  dat_singup date not null,
  dat_singaway date null,
  cod_state number not null,
  cod_country varchar2(3) not null,
  img_user    varchar2(100)
);


alter table buneli_user add com_file varchar2(50);

alter table BUNELI_USER add code NUMBER;

alter table BUNELI_USER add pass_recovery_email varchar2(100) null;

create table buneli_state
(
  cod_state number,
  txt_state varchar2(25)
);

create table buneli_app
(
    cod_app    number,
    txt_name    varchar2(25),
    cod_state number,
    dat_begin date,
    dat_end date
);

create table buneli_option
(
  cod_app number,
  cod_option number,
  txt_option varchar2(25),
  url_validate varchar2(200),
  url_execute varchar2(200),
  url_draw varchar2(200),
  opt_menu number,
  opt_father_menu number,
  img_user    varchar2(100),
  pop_up number,
  txt_command   varchar2(100)
);

-- alter table buneli_option add txt_command varchar2(100);

alter table buneli_option add pop_up number;

create table buneli_country
(
    cod_country  varchar2(3),
    txt_country  varchar2(150)
);

--drop table buneli_messages

create table buneli_messages
(
    cod_app number,
    cod_message varchar2(15),
    cod_language varchar2(3),
    txt_message varchar2(120),
    ind_application number
);

--alter table buneli_messages add ind_application number

create table buneli_languages
(
    cod_language    varchar2(3),
    txt_language    varchar2(30)
);

--06082012
create table buneli_option_dictionary
(
    txt_option      varchar2(25),
    cod_language    varchar2(3),
    txt_translation varchar2(25)
);

alter table buneli_user add constraint buneli_user_pk primary key (cod_user);

alter table buneli_state add constraint buneli_state_pk primary key (cod_state);

alter table buneli_app add constraint buneli_app_pk primary key (cod_app);

alter table buneli_option add constraint buneli_option primary key (cod_app,cod_option);

alter table buneli_country add constraint buneli_country primary key (cod_country);

alter table buneli_messages add constraint buneli_messages_pk primary key (cod_app,cod_message,cod_language);

alter table buneli_languages add constraint buneli_languages_pk primary key (cod_language);

create unique index buneli_user_idx01 on buneli_user(txt_email);

--06082012
alter table buneli_option_dictionary add constraint buneli_ipdi_pk primary key (txt_option,cod_language);

