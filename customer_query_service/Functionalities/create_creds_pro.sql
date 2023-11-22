set serveroutput on
CREATE OR REPLACE 
PROCEDURE create_creds(acctype number,pl_email credentials.email_address%type,pl_username credentials.username%type,new_password credentials.password%type,pl_name varchar,pl_address varchar) IS
    pl_id number(6);
begin

    insert into credentials values(pl_email,pl_username,new_password);

    if acctype=0 then
        select max(c_id) into pl_id from customer;
        insert into customer values(pl_id+1,pl_name,pl_address,pl_email);
    else
        select max(a_id) into pl_id from agent;
        insert into agent values(pl_id+1,pl_name,pl_address,pl_email);
    end if;

    exception
        WHEN DUP_VAL_ON_INDEX THEN
            raise_application_error(-20006,'Email already registered!');
   
end;
/
