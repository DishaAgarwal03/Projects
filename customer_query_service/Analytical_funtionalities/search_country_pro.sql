create or replace procedure search_country (country varchar) is
cursor c1 is select * from customer;
cursor c2 is select * from agent;
pl_name varchar(20);
pl_address varchar(50);
pl_email varchar(50);
pl_id number(6);
begin
    disp('Customers:');
    disp('C_ID   name       address           email_address');
    for i in c1
        loop
            if SUBSTR(i.address,1,2)=country then
                dbms_output.put_line(i.c_id||'   '||i.name||'   '||i.address||'     '||i.email_address);
            end if;
        end loop;
    disp('Agents:');
    disp('A_ID   name       address           email_address');
    for i in c2
        loop
            if SUBSTR(i.address,1,2)=country then
                dbms_output.put_line(i.a_id||'  '||i.name||'    '||i.address||'     '||i.email_address);
            end if;
        end loop;
end;
/

