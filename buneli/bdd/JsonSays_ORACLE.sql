create table Json_contact_type
(
    cod_type    number,
    txt_name    varchar2(30)
);

-- drop table Json_contact

create table Json_contact
(
    cod_user_host   number,
    cod_user_guest  number,
    cod_state       number,
    fec_start       date,
    link_message    varchar2(50),
    cod_type        number
);

alter table Json_contact_type add constraint Json_contype_pk primary key (cod_type);

alter table Json_contact add constraint Json_contact_pk primary key (cod_user_host,cod_user_guest);


-- drop table json_message

create table json_message
(
    fec_message date,
    from_user   number,
    to_user  number,
    txt_message varchar2(178),
    ind_read number
);

create index Json_message_idx01 on json_message (to_user);

create index Json_message_idx02 on json_message (fec_message,from_user,to_user);


/*

Insert into JSON_MESSAGE
 Values
   (sysdate,2, 1, '["21\/05\/2013 19:59:00","hola como vas? yo muy bien aca trabjando hasta tarder, por que tengo mucho mucho que hacer, intentando sacar este proyecto adelante, y tu ?."]',null);

Insert into JSON_MESSAGE
 Values
   (sysdate,2, 1, '["21\/05\/2013 20:00:10","Mucho trabajo?"]',null);


commit

Insert into JSON_MESSAGE
 Values
   (sysdate,3, 1, '["25\/05\/2013 18:30:00","Entonces como va todo."]',null);


Insert into JSON_MESSAGE
 Values
   (sysdate,3, 1, '["25\/05\/2013 18:40:05","Contesteme que esta conectado"]',null);


Insert into JSON_MESSAGE
 Values
   (sysdate,3, 1, '["25\/05\/2013 18:42:00","Pirobo"]',null);


COMMIT;


*/