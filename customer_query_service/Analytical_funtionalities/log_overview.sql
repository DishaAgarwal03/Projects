create view c_log as (select email_address,name ,address,end_of_tenure from user_log where user_type='C');
set serveroutput on
declare
num_of_customers_del_in_year varchar(4);
cc number;
cursor c1 is select * from user_log;
begin
    disp('Details of deleted users:');
    disp('email_address                 '||'name         '||'address        '||'end_of_tenure   '||'user_type');
    for i in c1
        loop
        disp(i.email_address||' '||i.name||' '||i.address||' '||i.end_of_tenure||' '||i.user_type);
        end loop;
    num_of_customers_del_in_year:='&num_of_customers_del_in_year';
    select count(distinct(email_address)) into cc from c_log where EXTRACT(YEAR from end_of_tenure)=num_of_customers_del_in_year;
    disp('Number of deleted customer accounts in given year is '||cc);
    exception
    when NO_DATA_FOUND then
        raise_application_error(-20100,'NO DATA');
end;
/
