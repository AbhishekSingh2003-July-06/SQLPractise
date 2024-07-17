use students
select * from stu_details

--use of in operator 
select stu_rollno from stu_details where stu_branch in ('CE','ME')

--use of between operator
select * from stu_details where  stu_rollno between 1 and 4;

--use of and operator 
select * from stu_details where stu_name='rohan' and stu_branch= 'CSE' --no one student present
select * from stu_details where stu_name='ram' and stu_branch= 'me' --give the detail of ram 

--use of not operator
select * from stu_details where not stu_branch ='CSE' 

--use of order by 
select * from stu_details 
order by stu_rollno desc --gives the roll no in order by desc

select * from stu_details
order by stu_branch asc;

--use of distinct keyword 
select distinct(stu_branch) from stu_details--give only unique values from a table

--use of top 
SELECT TOP 1 * FROM stu_details 

--aggregate functions
--max
select max(stu_rollno) as highestRollNo from stu_details 

--min
select min(stu_rollno) as lowestRollNo from stu_details 

--count
select count(stu_rollno) as totalStudents from stu_details 

--sum 
select sum(stu_rollno) as SumofRollNo from stu_details 

--avg
select avg(stu_rollno) as AvgofRollNo from stu_details 

--wildcards

select * from stu_details where stu_name like 'r%' --%r and %r% same output denge

select * from stu_details where stu_branch like 'c_%'

--union(give only unique values)
select * from stu_details
union 
select * from stu_details 

--union all ( contains the duplicate also)
select * from stu_details
union all
select * from stu_details 

--except(return the value of first table only )
select * from stu_details
except
select * from stu_details 

--intersect (common data )

select * from stu_details
intersect
select * from stu_details 


