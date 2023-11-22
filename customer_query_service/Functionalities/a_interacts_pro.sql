create or replace procedure a_interacts (pl_a_id number,pl_sub varchar,pl_body varchar,pl_c_id number,pl_status varchar) is
cursor c1 is select * from conversation for update;
resolved_error exception;
pl_id number(6);
pl_m_id number(6);
pl_pm_id number(6);
pl_con_id number(6);
flag number(1);
agent_max number(6);
agent_min number(6);
begin
    flag:=0;
    for i in c1
        loop
            if i.a_id=pl_a_id and i.c_id=pl_c_id and i.status='Ongoing' then
                flag:=1;
                select max(m_id) into pl_m_id from message;
                select max(m_id) into pl_pm_id from message m,conversation c where i.c_id=pl_c_id and i.a_id=pl_a_id and m.con_id=c.con_id ;
                insert into message values(pl_m_id+1,current_timestamp,'A',i.con_id,pl_pm_id,pl_sub,pl_body);
                update conversation set status=pl_status where current of c1;
            end if;
        end loop;
    if flag=0 then
       raise resolved_error;
    end if;
    exception
        when resolved_error then
            dbms_output.put_line('Query already resolved or does not exist');
end;
/