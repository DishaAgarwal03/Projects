create or replace procedure c_interacts (pl_c_id number,pl_sub varchar,pl_body varchar) is
cursor c1 is select * from conversation;
cursor c2 is select * from agent;
pl_id number(6);
pl_m_id number(6);
pl_pm_id number(6);
pl_con_id number(6);
pl_a_id number(6);
flag number(1);
min_count number(6);
agent_min number(6);
count_c number;
begin
    flag:=0;
    for i in c1
        loop
            if i.c_id=pl_c_id and i.status='Ongoing' then
                flag:=1;
                select max(m_id) into pl_m_id from message;
                select max(m_id) into pl_pm_id from message m,conversation c where i.c_id=pl_c_id and m.con_id=c.con_id ;
                insert into message values(pl_m_id+1,current_timestamp,'C',i.con_id,pl_pm_id,pl_sub,pl_body);
            end if;
        end loop;
    if flag=0 then
        min_count:=999999;
        for i in c2
            loop
                select count(con_id) into count_c from conversation where a_id=i.a_id and status='Ongoing';
                if min_count>=count_c then
                    min_count:=count_c;
                    agent_min:=i.a_id;
                end if;
            end loop;
        select max(con_id) into pl_con_id from conversation;
        insert into conversation values(pl_con_id+1,'Ongoing',pl_c_id,agent_min);
        select max(m_id) into pl_m_id from message;
        select max(m_id) into pl_pm_id from message m,conversation c where c.c_id=pl_c_id and m.con_id=c.con_id ;
        insert into message values(pl_m_id+1,current_timestamp,'C',pl_con_id,pl_pm_id,pl_sub,pl_body);
    end if;
end;
/
