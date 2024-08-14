--CREATE A FUNCTION
CREATE function addition(@num1 int,@num2 int)
returns int
as 
begin
return  (@num1 + @num2)
end

select dbo.addition(2,5)as SUMOFNUM

--WHEN WE HAVE TO ALTER THE SAME FUNCTION THEN

ALTER function addition(@num1 int,@num2 int)
returns int
as 
begin
return  (@num1 * @num2)
end

select dbo.addition(2,4) as multiply

--wo function jo humko table ke form mai data returns karte hai
use students
alter table stu_details add gender varchar(30)
select * from stu_details

create function stuData(@gender varchar(30))
returns @DataofStudents Table(Stname varchar(30),branch varchar(30),email varchar(30))
as 
begin
      insert into @DataofStudents
	  select stu_name,stu_branch,stu_email from stu_details where gender = @gender
	  return
end

select * from [dbo].[stuData]('female')


--




