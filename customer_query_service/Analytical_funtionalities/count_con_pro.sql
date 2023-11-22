create or replace procedure count_con(type varchar) is
cursor c1 is select * from agent;
cursor c2 is select * from customer;
cc number;
cur_max number;
cur_min number;
begin
    if type='A' then
        for i in c1
            loop
                select count(con_id) into cc from conversation where a_id=i.a_id;
                dbms_output.put_line('For agent id: '||i.a_id||' is '||cc);
            end loop;
    elsif type='C' then
        for i in c2
            loop
                select count(con_id) into cc from conversation where c_id=i.c_id;
                dbms_output.put_line('For customer id: '||i.c_id||' is '||cc);
            end loop;
    elsif type='A_r' then
        for i in c1
            loop
                select count(con_id) into cc from conversation where a_id=i.a_id and status='Resolved';
                dbms_output.put_line('For agent id: '||i.a_id||' is '||cc);
            end loop;
    elsif type='C_r' then
        for i in c2
            loop
                select count(con_id) into cc from conversation where c_id=i.c_id and status='Resolved';
                dbms_output.put_line('For customer id: '||i.c_id||' is '||cc);
            end loop;
    elsif type='A_o' then
        for i in c1
            loop
                select count(con_id) into cc from conversation where a_id=i.a_id and status='Ongoing';
                dbms_output.put_line('For agent id: '||i.a_id||' is '||cc);
            end loop;
    elsif type='C_o' then
        for i in c2
            loop
                select count(con_id) into cc from conversation where c_id=i.c_id and status='Ongoing';
                dbms_output.put_line('For customer id: '||i.c_id||' is '||cc);
            end loop;
    elsif type='max_r' then
        cc:=-1;
        for i in c1
            loop
                select count(con_id) into cur_max from conversation where a_id=i.a_id and status='Resolved';
                if cur_max>=cc then
                    cc:=cur_max;
                end if;
            end loop;
        for i in c1
            loop
                select count(con_id) into cur_max from conversation where a_id=i.a_id and status='Resolved';
                if cur_max=cc then
                    dbms_output.put_line('Agent : '||i.a_id||' has max resolved queries of '||cc);
                end if;
            end loop;
    elsif type='min_r' then
        cc:=999999;
        for i in c1
            loop
                select count(con_id) into cur_min from conversation where a_id=i.a_id and status='Resolved';
                if cur_min<=cc then
                    cc:=cur_min;
                end if;
            end loop;
        for i in c1
            loop
                select count(con_id) into cur_min from conversation where a_id=i.a_id and status='Resolved';
                if cur_min=cc then
                dbms_output.put_line('Agent : '||i.a_id||' has min resolved queries of '||cc);          
                end if;
            end loop;
    end if;

end;
/
