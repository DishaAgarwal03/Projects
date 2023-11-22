set serveroutput on
declare
c_num number;
begin
    disp('Total number of users: ');
    c_num:=count_users('Cred');
    disp(TO_CHAR(c_num));
    disp('Total number of agents: ');
    c_num:=count_users('A');
    disp(TO_CHAR(c_num));
    disp('Total number of customers: ');
    c_num:=count_users('C');
    disp(TO_CHAR(c_num));
    disp('Total number of conversations: ');
    c_num:=count_users('con');
    disp(TO_CHAR(c_num));
    disp('Total number of resolved conversations: ');
    c_num:=count_users('con_r');
    disp(TO_CHAR(c_num));
    disp('Total number of ongoing conversations: ');
    c_num:=count_users('con_o');
    disp(TO_CHAR(c_num));
    disp('Total number of messages: ');
    c_num:=count_users('msg');
    disp(TO_CHAR(c_num));
end;
/
