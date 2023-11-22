drop table message;
drop table conversation;
drop table customer;
drop table agent;
drop table credentials;
drop table user_log;

create table credentials(
  email_address varchar(50) primary key,
  username varchar(20) not null,
  password varchar(20) not null
);
  
  create table customer(
  c_id number(6) primary key,
  name varchar(20) not null,
  address varchar(50),
  email_address varchar(50) not null,
  foreign key (email_address) references credentials(email_address) on delete cascade
  );
 
  
create table agent(
  a_id number(6) primary key,
  name varchar(20) not null,
  address varchar(50),
  email_address varchar(50) not null,
  foreign key (email_address) references credentials(email_address) on delete cascade
  );		
  
create table conversation(
  con_id number(6) primary key,
  status varchar(12) default 'Ongoing',
  c_id number(6) not null,
  a_id number(6) not null,  
  foreign key (c_id) references customer(c_id) on delete cascade,
  foreign key (a_id) references agent(a_id) on delete cascade
  );
  
alter table conversation add constraint status_check check(status in ('Resolved','Ongoing'));

create table message(
  M_ID number(6) primary key,  
  time_stamp timestamp(0), 
  sender_type varchar(10) not null, 
  con_id number(6) not null, 
  pm_id number(6),
  sub varchar(80) not null, 
  body varchar(400),
  foreign key (con_id) references conversation(con_id) on delete cascade
);

alter table message add constraint pm_id_as_fk foreign key(pm_id) references message(m_id);

alter table message add constraint sender_type_check check(sender_type in ('A','C'));

create table user_log(
email_address varchar(50),
name varchar(20),
address varchar(50),
end_of_tenure date,
user_type varchar(20)
);

  
  
