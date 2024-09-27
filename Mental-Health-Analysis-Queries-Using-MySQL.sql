-- It will print all the data inside the table.
select * from mentalhealth;

-- It will print the description of the table. 
desc mentalhealth;

-- It will count total rows in Employee ID.
select count(Employee_ID) as Total_Rows from mentalhealth;

-- It will select region and count of each regiom then it will group the region and make the region column in ascending order.
select Region,count(region) as Region_Occurance from mentalhealth group by Region order by Region asc;

/* It will count Mental Health Condition, print column Mental Health Condition, Region, Age. Perform inner join
between mental health and remote work table. It will then group Region,Mental Health Condition and age column
and order the region column. */
select count(M.MentalHealth_Condition) as TotalOf_MentalHealth_Condition_by_AgeAndRegion,M.MentalHealth_Condition,
M.Region,R.Age from mentalhealth as M inner join remotework as R on
 M.Employee_ID=R.Employee_ID group by M.Region,M.MentalHealth_Condition,R.Age order by M.Region;
 
 /* It will count Employee ID, print Satisfaction with remote work, physical activity, region column from mental health
 table and then group the Satisfaction with remote work, physical activity, region column and order the region,
physical activity, satisfaction with remote work column. */
 select count(Employee_ID) as Total_Employee,Satisfactionwith_RemoteWork,Physical_Activity,Region from mentalhealth 
 group by Satisfactionwith_RemoteWork,Physical_Activity,Region order by Region,Physical_Activity,Satisfactionwith_RemoteWork;
 
 /* It will select company support for remote work column from mental health table and apply condition where company support
 for remote work = select maximum of company support for remote column from mental health table. */
 select CompanySupportfor_RemoteWork from mentalhealth where CompanySupportfor_RemoteWork=
 (select max(CompanySupportfor_RemoteWork) from mentalhealth);
 
 
select M.MentalHealth_Condition,R.Age,R.Job_Role,R.Experience from mentalhealth as M  cross join
remotework as R on M.Employee_ID=R.Employee_ID group by M.MentalHealth_Condition,R.Age,
R.Job_Role,R.Experience order by R.Experience;


select Region from mentalhealth where left(Region,1) in ("A","E","I","O","U") group by Region;

/* It will select region column from mental health table and check 1st alphabet from left of region table
and match it will not start from a,e,i,o,u.  */
select Region from mentalhealth where left(Region,1) not in ("A","E","I","O","U") group by Region;
 
 
 select * from remotework;
 
alter table remotework drop column `MyUnknownColumn_[1]`;

delimiter //
create procedure Execute_All()
begin
desc remotework;
select count(Employee_ID) as Total_Rows from remotework;
select Age,Gender,count(Gender) as Gender_Occurance from remotework group by Age,Gender order by Age;
select Age,Gender,Job_Role,HoursWorked_PerWeek from remotework group by 
Age,Gender,Job_Role,HoursWorked_PerWeek order by Age;
select Job_Role,Age,Experience from remotework where Industry="Healthcare" group by Job_Role,Age,Experience 
order by Experience asc,Age asc limit 5;
select Job_Role,Age,Experience from remotework where Industry="Healthcare" group by Job_Role,Age,Experience 
order by Experience asc,Age asc limit 1 offset 1;
select Job_Role,Age,Experience from remotework where Industry="Healthcare" group by Job_Role,Age,Experience 
order by Experience desc,Age desc limit 5;
select Age,count(Employee_ID) as Total_Employees,Gender,Job_Role,
case
	when HoursWorked_PerWeek <=25 then "Poor Work"
    when HoursWorked_PerWeek <40 then "Less Work"
	when HoursWorked_PerWeek =40 then "Perfect Work"
    else "Over Time"
end as Worked_Status
from remotework group by Age,Gender,Job_Role,HoursWorked_PerWeek order by Age,Job_Role;
end //
delimiter ;

call Execute_All;



 
 
 
 