create or replace function count_users(type varchar)
return number as
c_num number;
begin
if type='A' then
    select count(distinct(a_id)) into c_num from agent;
elsif type='C' then 
    select count(distinct(c_id)) into c_num from customer;
elsif type='Cred' then 
    select count(distinct(email_address)) into c_num from credentials;
elsif type='con' then 
    select count(distinct(con_id)) into c_num from conversation;
elsif type='con_r' then 
    select count(distinct(con_id)) into c_num from conversation where status='Resolved';
elsif type='con_o' then 
    select count(distinct(con_id)) into c_num from conversation where status='Ongoing';
elsif type='msg' then 
    select count(distinct(m_id)) into c_num from message;
end if;
return c_num;
exception
    when NO_DATA_FOUND then
    return 0;
end;
/
