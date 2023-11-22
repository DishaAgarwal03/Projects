set serveroutput on
CREATE OR REPLACE 
PROCEDURE update_login_creds(pl_email credentials.email_address%TYPE, old_password credentials.password%TYPE, new_password credentials.password%TYPE, new_username credentials.username%type) IS
cursor c is (select * from credentials where email_address=pl_email and password=old_password) for update;
f BOOLEAN:=FALSE;
begin
    for i in c
    loop
        UPDATE credentials SET username=new_username, password=new_password WHERE current of c;
        if c%FOUND then 
            dbms_output.put_line('Successfully updated the login credentials!');
            f:=TRUE;
        end if;
    end loop;
    
    if NOT f then
        dbms_output.put_line('Email not registered or incorrect password');
    END IF;
    
end;
/
