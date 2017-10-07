create table JSON_CONTACT_TYPE
(
    cod_type    tinyint,
    txt_name    varchar(30)
);

-- drop table Json_contact

create table JSON_CONTACT
(
    cod_user_host   integer,
    cod_user_guest  integer,
    cod_state       tinyint,
    fec_start       date,
    link_message    varchar(50),
    cod_type        tinyint
);

alter table JSON_CONTACT_TYPE add constraint Json_contype_pk primary key (cod_type);

alter table JSON_CONTACT add constraint Json_contact_pk primary key (cod_user_host,cod_user_guest);


-- drop table json_message

create TABLE JSON_MESSAGE
(
    fec_message datetime,
    from_user   integer,
    to_user  integer,
    txt_message varchar(178),
    ind_read tinyint
);

alter table JSON_MESSAGE add constraint JSON_MESSAGE_PK primary key (fec_message,from_user,to_user);

create index Json_message_idx01 on JSON_MESSAGE (to_user);

create index Json_message_idx02 on JSON_MESSAGE (fec_message,from_user,to_user);
