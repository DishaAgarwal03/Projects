create or replace trigger del_credA_trigger
before
    delete on
agent
for each row
declare
begin 
    insert into user_log values(:old.email_address,:old.name,:old.address,current_date,'A');
end;
/
