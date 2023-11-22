set serveroutput on
declare
invalid_creds exception;
cursor c is select * from credentials;
cursor c1 is select * from customer;
cursor c2 is select * from message;
pl_email credentials.email_address%type;
pl_password credentials.password%type;
pl_c_id number(6);
flag1 number(1);
flag2 number(1);
pl_con_id number(6);
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
                    pl_c_id:=i.c_id;
                    flag1:=1;
                end if;
            end loop;
        if flag1=0 then
            raise invalid_creds;
        else
            disp('Latest conversation log');
            select max(con_id) into pl_con_id from conversation where c_id=pl_c_id;
            for i in c2
                loop
                    if i.con_id=pl_con_id then
                        disp('----------------------------------------------------------------- ');
                        if i.sender_type='A' then
                            disp('Agent: ');
                        else
                            disp('You: ');
                        end if;
                        disp('Sub: '||i.sub);
                        disp('Body: '||i.body);
                    end if;
                end loop;
        end if;
    end if;
exception
    when invalid_creds then
        dbms_output.put_line('Email not registered as customer or incorrect password');
end;
/