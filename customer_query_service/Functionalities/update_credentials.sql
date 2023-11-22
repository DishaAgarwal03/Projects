set serveroutput on
DECLARE
    pl_email credentials.email_address%type;
    old_password credentials.password%type;

    new_password credentials.password%type;
    new_username credentials.username%type;
    new_name varchar(20);
    new_address varchar(50);

    choice number(1);
begin
    dbms_output.put_line('Enter 1 to update login credentials ');
    dbms_output.put_line('Enter 2 to update agent name, address ');
    dbms_output.put_line('Enter 3 to update customer name, address ');
    choice := '&Enter_Choice';

    pl_email:='&pl_email';
    old_password:='&old_password';

    if choice=1 then
        new_username:='&new_username';
        new_password:='&new_password';
        update_login_creds(pl_email, old_password, new_password, new_username);
    elsif choice=2 then
        new_name:='&new_name';
        new_address:='&new_address';
        update_creds_A(pl_email, old_password, new_name, new_address);
    elsif choice=3 then
        new_name:='&new_name';
        new_address:='&new_address';
        update_creds_C(pl_email, old_password, new_name, new_address);
    else
        dbms_output.put_line("Invalid choice");
END;
/