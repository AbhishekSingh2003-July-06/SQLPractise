
use students

create table emp_details(
userid int primary key,
name varchar(30),
per_hour_salary money,
working_hour int,
total_salary money)

select * from emp_details
alter table  emp_details add acc_count int not null default 0;

--using trigger calculate the total_salary automatically
create trigger before_insert_user on
emp_details after insert 
as begin
update emp_details
set total_salary = i.working_hour*i.per_hour_salary
from inserted  i
where emp_details.userid=i.userid
end

insert into emp_details(userid,name,per_hour_salary,working_hour)
values(6,'Sonali','15000','8')
insert into emp_details(userid,name,per_hour_salary,working_hour)
values(8,'sakshi','12500','10')

select * from emp_details

--update trigger 

create trigger before_update_user on emp_details after update
as begin 
update emp_details
set total_salary = i.per_hour_salary*i.working_hour
from inserted i 
where emp_details.userid= i.userid
end

update emp_details set working_hour = 7 where userid = 8
select * from emp_details

-- delete trigger 
--new table to store the deleted data 
create table deleted_emp_detail(
id int,
empname varchar(30),
per_hour_salary money,
working_hour int,
total_salary money)
drop table deleted_emp_detail

create trigger delete_user_data on emp_details after delete
as begin 
insert into deleted_emp_detail (id,empname,per_hour_salary,
working_hour,total_salary)
select d.userid,d.name,d.per_hour_salary,
d.working_hour,d.total_salary 
from deleted d 
end

delete from emp_details where userid = 2
select * from emp_details
select * from deleted_emp_detail


-----calculate the number of accounts of a user
/*create table accounts(
account_no int,
userid int,
balance int default 0
)
drop table accounts

select * from accounts
select * from emp_details

create trigger open_account  on emp_details 
after insert
as begin 
update emp_details
set acc_count = i.acc_count + 1 from inserted i where 
emp_details.userid =i.userid
end
drop trigger open_account

insert into accounts(account_no,userid,balance)
values(200155,5,50000)

select * from accounts
select * from emp_details*/



