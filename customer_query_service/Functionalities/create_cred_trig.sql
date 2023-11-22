create or replace trigger create_cred_trig
before
    insert or update on 
credentials
for each row
begin 
    if TRANSLATE(:new.email_address,'@',' ')= (:new.email_address) or REPLACE(:new.email_address,'.com',' ')= (:new.email_address) then
        raise_application_error(-20001,'Invalid Email');
    elsif UPPER(:new.password)= (:new.password) then
       raise_application_error(-20002,'Password needs to have atleast 1 lowercase letter');
    elsif LOWER(:new.password)= (:new.password) then
        raise_application_error(-20003,'Password needs to have atleast 1 uppercase letter');
    elsif TRANSLATE(:new.password,'0123456789',' ')= (:new.password) then
        raise_application_error(-20004,'Password needs to have atleast 1 digit');
    elsif LENGTH(:new.password)<5 then
       raise_application_error(-20005,'Password needs to have atleast 5 characters');
    else
        CASE
        WHEN UPDATING THEN 
            dbms_output.put_line('Account Updated Successfully!');
        WHEN INSERTING THEN 
            dbms_output.put_line('Account Created Successfully!');
        END CASE;
    end if;
end;
/