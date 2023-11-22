set serveroutput on
DECLARE
emailad credentials.email_address%TYPE; 
pwd credentials.password%TYPE;
begin
    emailad:='&Email_Address';
    pwd:='&Password';
    del_creds(emailad,pwd);
END;
/