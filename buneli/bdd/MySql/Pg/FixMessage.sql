select replace(txt_message,'/','\/'), txt_message from json_message
WHERE txt_message <> '["26\/09\/2017 21:59:27","ep lxz"]'


UPDATE json_message
SET txt_message = replace(txt_message,'\','')
WHERE txt_message <> '["26\/09\/2017 21:59:27","ep lxz"]'



UPDATE json_message
SET txt_message = replace(txt_message,'/','\/')
WHERE txt_message <> '["26\/09\/2017 21:59:27","ep lxz"]'

DELETE FROM json_message

UPDATE json_message
SET ind_read = null


select to_timestamp('28092017212921','ddmmyyyyhh24miss')::timestamp without time zone

select * , fec_message::timestamp without time zone
from json_message
WHERE to_char(fec_message,'DDMMYYYYHH24MISS') = '28092017215833'


SELECT * FROM FN_USERMESSAGES(3)

BEGIN;
SELECT PR_SETMESSAGEREAD(3,2,'28092017215833')