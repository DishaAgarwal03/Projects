create or replace trigger business_hrs_msg_trigger
before
    insert or update or delete on
message
for each row
declare
    day varchar(10);
    time varchar(10);
begin 
    SELECT TO_CHAR(CURRENT_DATE, 'DAY') into day FROM dual;
    SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') into time FROM dual;
    if UPPER(day)='SUNDAY' then 
        raise_application_error(-20010, 'Not Business Hours!');
    elsif time<'08:00:00' or time>'18:00:00' then
        raise_application_error(-20010, 'Not Business Hours!');
    end if;
end;
/
