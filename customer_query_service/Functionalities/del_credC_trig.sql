create or replace trigger del_credC_trigger
before
    delete on
customer
for each row
declare
begin 
    insert into user_log values(:old.email_address,:old.name,:old.address,current_date,'C');
end;
/
