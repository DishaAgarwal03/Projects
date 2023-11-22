set serveroutput on
declare
invalid_creds exception;
cursor c is select * from credentials;
cursor c1 is select * from agent;
cursor c2 is select * from conversation;
pl_email credentials.email_address%type;
pl_password credentials.password%type;
pl_a_id number(6);
flag1 number(1);
flag2 number(1);
begin
    pl_email:='&pl_email';
    pl_password:='&pl_password';
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
            disp('con_id '||' '||'status'||' '||'c_id');
            disp('------------------------');
            for i in c2
            loop
                if i.a_id=pl_a_id then
                    disp(i.con_id||'   '||i.status||'  '||i.c_id);
                end if;
            end loop;
        end if;
    end if;
exception
    when invalid_creds then
        dbms_output.put_line('Email not registered as agent or incorrect password');
end;
/