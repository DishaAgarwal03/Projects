set serveroutput on
declare
invalid_creds exception;
con_id_error exception;
cursor c is select * from credentials;
cursor c1 is select * from agent;
cursor c2 is select * from message;
cursor c3 is select * from conversation;
pl_email credentials.email_address%type;
pl_password credentials.password%type;
pl_a_id number(6);
flag1 number(1);
flag2 number(1);
flag3 number(1);
pl_con_id number(6);
begin
    pl_email:='&pl_email';
    pl_password:='&pl_password';
    pl_con_id:=&pl_con_id;
    flag1:=0;
    flag2:=0;
    flag3:=0;
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
        for i in c3
        loop
            if i.con_id=pl_con_id and i.a_id=pl_a_id then
                flag3:=1;
            end if;
        end loop;
        if flag1=0 then
            raise invalid_creds;
        elsif flag3=0 then
            raise con_id_error;
        else
            disp('Conversation log');
            for i in c2
                loop
                    if i.con_id=pl_con_id then
                        disp('----------------------------------------------------------------- ');
                        if i.sender_type='C' then
                            disp('Customer:');
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
        dbms_output.put_line('Email not registered as agent or incorrect password');
    when con_id_error then
        dbms_output.put_line('Con_id does not exist or is not accessible.');
end;
/