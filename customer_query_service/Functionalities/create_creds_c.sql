set serveroutput on
DECLARE
    pl_email credentials.email_address%type;
    pl_username credentials.username%type;
    new_password credentials.password%type;
    pl_name varchar(20);
    pl_address varchar(50);
begin
    pl_email:='&pl_email';
    pl_username:='&pl_username';
    new_password:='&new_password';
    pl_name:='&pl_name';
    pl_address:='&pl_address';
    create_creds(0, pl_email, pl_username, new_password, pl_name, pl_address);
END;
/
