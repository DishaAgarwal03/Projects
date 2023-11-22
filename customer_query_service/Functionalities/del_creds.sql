set serveroutput on
CREATE OR REPLACE 
PROCEDURE del_creds(emailad credentials.email_address%TYPE, pwd credentials.password%TYPE) IS
cursor c is (select * from credentials where email_address=emailad and password=pwd) for update;
f BOOLEAN:=FALSE;
begin
    for i in c
    loop
        DELETE FROM credentials WHERE current of c;
        if c%FOUND then 
            dbms_output.put_line('Successfully deleted the account!');
            f:=TRUE;
        end if;
    end loop;
    
    if NOT f then
        dbms_output.put_line('Email not registered or incorrect password');
    END IF;
    
end;
/
