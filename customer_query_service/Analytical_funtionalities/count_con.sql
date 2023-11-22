set serveroutput on
begin
    disp('Number of Agent conversations:');
    count_con('A');
    disp('------------------------------------------------------');
    disp('Number of resolved Agent conversations:');
    count_con('A_r');
    disp('------------------------------------------------------');
    disp('Number of Ongoing Agent conversations:');
    count_con('A_o');
    disp('------------------------------------------------------');
    disp('Number of Customer conversations:');
    count_con('C');
    disp('------------------------------------------------------');
    disp('Number of Resolved Customer conversations:');
    count_con('C_r');
    disp('------------------------------------------------------');
    disp('Number of Ongoing Customer conversations:');
    count_con('C_o');
    disp('------------------------------------------------------');
    disp('Agent with max resolved conversations:');
    count_con('max_r');
    disp('------------------------------------------------------');
    disp('Agent with min resolved conversations:');
    count_con('min_r');
end;
/