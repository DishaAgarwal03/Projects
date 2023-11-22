set serveroutput on
DECLARE
    pl_admin_email credentials.email_address%type;
    admin_email credentials.email_address%type;
    pl_admin_password credentials.password%type;
    admin_password credentials.password%type;
    pl_email credentials.email_address%type;
    pl_username credentials.username%type;
    new_password credentials.password%type;
    pl_name varchar(20);
    pl_address varchar(50);
begin
    admin_password:='Admin_123';
    admin_email:='admin123@gmail.com';
    pl_admin_email:='&pl_admin_email';
    pl_admin_password:='&pl_admin_password';
    pl_email:='&pl_email';
    pl_username:='&pl_username';
    new_password:='&new_password';
    pl_name:='&pl_name';
    pl_address:='&pl_address';
    if pl_admin_email=admin_email and pl_admin_password=admin_password then
        create_creds(1, pl_email, pl_username, new_password, pl_name, pl_address);
    else
        raise_application_error(-20101,'Incorrect admin credentials ');
    end if;
END;
/