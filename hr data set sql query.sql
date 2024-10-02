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


# Reason for leaving the company
select count(EmpID),TermReason from hrdataset_v14 
group by TermReason order by count(EmpID) desc ;

# Number of Employees in each department
select count(EmpID), Department from hrdataset_v14 
group by Department order by count(EmpID) desc ;


