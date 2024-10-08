use rp;


# what are company's top 5 recruitment sources
select count(RecruitmentSource),RecruitmentSource 
  FROM hrdataset_v14 group by RecruitmentSource order by count(RecruitmentSource) desc limit 5; 
  
  
# Department which has terminated most employees for a cause
select  count(EmpID),Department
  FROM hrdataset_v14 where EmploymentStatus='Terminated for Cause' group by Department ;
  
  
#department which has most employee satisfaction
select avg(EmpSatisfaction),Department  FROM hrdataset_v14 group by Department;


# which manager has most employee satisfaction and no. of person he manages working under him
select avg(EmpSatisfaction),count(EmpID)as manages_people ,ManagerName  FROM hrdataset_v14 group by ManagerName order by avg(EmpSatisfaction) desc;


#top salary in each department
select max(salary), Department from hrdataset_v14 group by Department ;


#Least salary in each department
select min(salary), Department from hrdataset_v14 group by Department ;

#Employee who have salary more than average salary



# Reason for leaving the company
select count(EmpID),TermReason from hrdataset_v14 
group by TermReason order by count(EmpID) desc ;

#Employee who have salary more than average salary.
 
 select salary,Nameep from hrdataset_v14 where salary>(select avg(Salary) from hrdataset_v14) order by salary ;




# Number of Employees in each department
select count(EmpID), Department from hrdataset_v14 
group by Department order by count(EmpID) desc ;

# Get all data from table along with max salary of that department(use of window function)
select * ,
max(Salary) over(partition by Department ) as max_salary 
 from hrdataset_v14;
 
 #extract employ of each department who joined company before to after
 select Nameep,EmpID,Department ,
 row_number() over(partition by Department order by EmpID) as loyal_employees
 from hrdataset_v14;
 
 # Fetch top 3 employees from each department according to salary
 select * from(
 select Nameep,EmpID,Department ,Salary,
 rank() over(partition by Department order by salary desc ) as most_earning
 from hrdataset_v14) x
 where x.most_earning<4;
 

 

 






