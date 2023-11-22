set serveroutput on
declare
country_code varchar(2);
begin
    country_code:='&country_code';
    search_country(country_code);
end;
/