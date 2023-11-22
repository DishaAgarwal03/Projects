set serveroutput on
CREATE OR REPLACE 
PROCEDURE update_creds_A(pl_email credentials.email_address%TYPE, old_password credentials.password%TYPE, new_name agent.name%TYPE, new_address agent.address%TYPE) IS
cursor c is (select * from credentials where email_address=pl_email and password=old_password);
cursor c1 is (select * from agent where email_address=pl_email) for update;
f BOOLEAN:=FALSE;
f1 BOOLEAN:=FALSE;
begin
    for i in c
    loop
        f:=TRUE;
    end loop;

    if f then
        for i in c1
        loop
            UPDATE agent SET name=new_name, address=new_address WHERE current of c1;
            if c%FOUND then 
                dbms_output.put_line('Successfully updated the agent information!');
                f1:=TRUE;
            end if;
        end loop;
    else
        dbms_output.put_line('Email not registered or incorrect password');
    END IF;

    if NOT f1 then 
        dbms_output.put_line('No customer with the given email address');
    end if;
    
end;
/
