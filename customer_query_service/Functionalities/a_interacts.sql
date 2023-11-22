set serveroutput on
declare
invalid_creds exception;
cursor c is select * from credentials;
cursor c1 is select * from agent;
pl_email credentials.email_address%type;
pl_password credentials.password%type;
pl_a_id number(6);
pl_c_id number(6);
flag1 number(1);
flag2 number(1);
pl_sub varchar(40);
pl_body varchar(100);
pl_status varchar(20);
begin
    pl_email:='&pl_email';
    pl_password:='&pl_password';
    pl_sub:='&pl_sub';
    pl_body:='&pl_body';
    pl_status:='&pl_status';
    pl_c_id:=&pl_c_id;
    flag1:=0;
    flag2:=0;
    for i in c
    loop
        if i.email_address=pl_email and i.password=pl_password then
            flag2:=1;
        end if;
    end loop;
    if flag2=0 then
        raise invalid_creds;
    else
        for i in c1
            loop
                if i.email_address=pl_email then
                    pl_a_id:=i.a_id;
                    flag1:=1;
                end if;
            end loop;
        if flag1=0 then
            raise invalid_creds;
        else
            a_interacts(pl_a_id,pl_sub,pl_body,pl_c_id,pl_status);

        end if;
    end if;
exception
    when invalid_creds then
        dbms_output.put_line('Email not registered or incorrect password');
end;
/