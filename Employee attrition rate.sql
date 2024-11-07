
select *
from emp_attrition_rate;

rename table employeeattrition
to Emp_attrition_rate;

select *
from emp_attrition_rate;


-------------------Data Cleaning and preparation-----------------------------

--------1.Delete unnecessary columns
--------2.Change datatype
--------3.change column values
--------4.change column name
--------5.change null values 
--------6.drop columns if unnecessary
--------7.change column order
--------8.change row values


/*Delete unnecessary columns */

select employeecount
from emp_attrition_rate
where EmployeeCount > 1;

alter table emp_attrition_rate
drop column MonthlyRate,
drop column StockOptionLevel,
drop column TrainingTimesLastYear ;

alter table emp_attrition_rate
drop column Education_Field;

alter table emp_attrition_rate
drop column Education;

alter table emp_attrition_rate
drop column Relationship_Satisfaction,
drop column Environment_Satisfaction,
drop column business_travel;



/* Change datatype in column */

alter table emp_attrition_rate
Modify EnvironmentSatisfaction varchar(40);

alter table emp_attrition_rate
Modify JobInvolvement varchar(40),
Modify Joblevel varchar(40),
Modify JobSatisfaction varchar(40),
Modify PerformanceRating varchar(40),
Modify RelationshipSatisfaction varchar(40),
Modify worklifebalance varchar(40);

/* change column values */

update emp_attrition_rate
set JobInvolvement = case 
when JobInvolvement=4 then 'very_high'
when JobInvolvement=3 then 'high'
when JobInvolvement=2 then 'medium'
when JobInvolvement=1 then 'low'
end
;

update emp_attrition_rate
set jobsatisfaction = case 
when jobsatisfaction =4 then 'very_high'
when jobsatisfaction =3 then 'high'
when jobsatisfaction =2 then 'medium'
when jobsatisfaction =1 then 'low'
end;

update emp_attrition_rate
set joblevel = case 
when joblevel =4 then 'Very_top_level'
when joblevel =3 then 'Top_level'
when joblevel =2 then 'medium'
when joblevel =1 then 'low'
end;

update emp_attrition_rate
set joblevel = case 
when joblevel = 'Medium' then 'medium_level'
when joblevel ='low' then 'low_level'
end;

update emp_attrition_rate
set relationshipsatisfaction = case 
when relationshipsatisfaction =4 then 'Very_high'
when relationshipsatisfaction =3 then 'high'
when relationshipsatisfaction =2 then 'medium'
when relationshipsatisfaction =1 then 'low'
end;

select *
from emp_attrition_rate;

/* change column name */

ALTER TABLE emp_attrition_rate
RENAME COLUMN `ï»¿Age` TO `Age`;

ALTER TABLE emp_attrition_rate
change `BusinessTravel` Business_Travel  varchar(100) ;

ALTER TABLE emp_attrition_rate
change `EducationField` Education_Field varchar(100) ,
change `distancefromhome`  distance_from_home varchar(100) ,
change `employeenumber` employee_number varchar(100),
change `EnvironmentSatisfaction` Environment_Satisfaction varchar(100),
change `JobInvolvement` Job_Involvement varchar(100),
change `Joblevel` Job_level varchar(100),
change `JobRole` Job_Role varchar(100),
change `JobSatisfaction` Job_Satisfaction varchar(100),
change `MaritalStatus` Marital_Status varchar(100),
change `MonthlyIncome` Monthly_Income varchar(100),
change `NumCompaniesWorked` Num_Comp_Worked varchar(100),
change `OverTime` Over_Time varchar(100),
change `PercentSalaryHike` Percent_Salary_Hike varchar(100),
change `PerformanceRating` Performance_Rating varchar(100),
change `RelationshipSatisfaction` Relationship_Satisfaction varchar(100),
change `StandardHours` Standard_Hours varchar(100),
change `TotalWorkingYears` Total_Working_Years varchar(100),
change `worklifebalance` work_life_balance varchar(100),
change `YearsAtCompany` Years_At_Company varchar(100),
change `YearsInCurrentRole` Years_In_Current_Role varchar(100),
change `YearsSinceLastPromotion` Years_Since_Last_Promotion varchar(100),
change `YearsWithCurrManager` YearsWithCurrManager varchar(100);

ALTER TABLE emp_attrition_rate
change `YearsWithCurrManager` Years_With_Curr_Manager varchar(100);


/* change null values  */

select *
from emp_attrition_rate
where Over_Time is null;

update emp_attrition_rate
set job_level = 'high_level'
where job_role = 'manufacturing director';

select *
from emp_attrition_rate;

update emp_attrition_rate
set job_level = 'high_level'
where Job_Role='manager' or Job_Role='research director';

update emp_attrition_rate
set job_level = 'medium_level'
where Job_Role='Sales Executive' or Job_Role='Healthcare Representative';

update emp_attrition_rate
set job_level = 'high_level'
where job_role = 'Human resources';

update emp_attrition_rate
set job_level = case
when job_role='Laboratory Technician' then 'low_level'
when job_role='Research Scientist' then 'high_level'
end;

update emp_attrition_rate
set job_level = 'low_level'
where job_role = 'sales representative';

/* drop columns if unnecessary */

select *
from emp_attrition_rate
where Over18 ='N';

alter table emp_attrition_rate
drop column Over18;

select Standard_Hours
from emp_attrition_rate
where Standard_Hours != 80;

alter table emp_attrition_rate
drop column Standard_Hours;

/* change column order */

ALTER TABLE emp_attrition_rate
MODIFY COLUMN employee_number INT FIRST;

ALTER TABLE emp_attrition_rate
MODIFY COLUMN Department varchar(42) after employee_number;

ALTER TABLE emp_attrition_rate
MODIFY COLUMN Gender varchar(42) after age;

ALTER TABLE emp_attrition_rate
MODIFY COLUMN distance_from_home varchar(42) after Years_With_Curr_Manager;

ALTER TABLE emp_attrition_rate
MODIFY COLUMN Monthly_Income varchar(42) after hourlyrate;

ALTER TABLE emp_attrition_rate
MODIFY COLUMN annual_income int after monthly_income;

ALTER TABLE emp_attrition_rate
MODIFY COLUMN Job_Role varchar(42) after attrition;

ALTER TABLE emp_attrition_rate
MODIFY COLUMN Marital_Status varchar(42) after gender;

ALTER TABLE emp_attrition_rate
MODIFY COLUMN Department varchar(42) after job_role,
MODIFY COLUMN Job_level varchar(42) after department;

ALTER TABLE emp_attrition_rate
MODIFY COLUMN Years_At_Company varchar(42) after job_level,
MODIFY COLUMN Years_In_Current_Role varchar(42) after years_at_company,
MODIFY COLUMN Years_With_Curr_Manager varchar(42) after years_in_current_role,
MODIFY COLUMN Percent_Salary_Hike varchar(42) after annual_income;

/* ------ change row values */

UPDATE emp_attrition_rate
SET department = 'R&D'
WHERE department='Research & Development';  		

UPDATE emp_attrition_rate
SET department = 'HR'
WHERE department='Human Resources';  		
	
select *
from emp_attrition_rate;

/*---------add new column */

ALTER TABLE emp_attrition_rate
ADD COLUMN  annual_income int;

UPDATE emp_attrition_rate
SET annual_income = monthly_income * 12;


/*-------------------------------------Data manipulation-------------------------------------------------------------------------------------*/


select employee_number,Job_Role,monthly_income,max(Num_Comp_Worked) as Most_comp_worked
from emp_attrition_rate
group by employee_number,Job_Role,monthly_income
having Most_comp_worked != 0
order by Most_comp_worked desc
limit 10;

select Attrition,Job_Role,annual_income,Job_Satisfaction,Num_Comp_Worked,Percent_Salary_Hike,Years_At_Company
from emp_attrition_rate;

select max(annual_income) as highest_paid_salary,min(annual_income) as lowest_paid_salary, employee_number,Attrition,Job_Satisfaction,Num_Comp_Worked,Percent_Salary_Hike,Years_At_Company
from emp_attrition_rate
group by job_role,employee_number,Attrition,Job_Satisfaction,Num_Comp_Worked,Percent_Salary_Hike,Years_At_Company
order by highest_paid_salary desc, lowest_paid_salary asc
limit 10;

select Gender,round(avg(Years_At_Company),0) as average_years_worked
from emp_attrition_rate
group by Gender;


select min(annual_income) as lowest_paid_salary,employee_number,Attrition,Job_Satisfaction,Num_Comp_Worked,Percent_Salary_Hike,Years_At_Company
from emp_attrition_rate
group by employee_number,Attrition,Job_Satisfaction,Num_Comp_Worked,Percent_Salary_Hike,Years_At_Company;

select *
from emp_attrition_rate;

/*-----attrition rate-----------*/

SELECT department, job_role, COUNT(*) AS attrition_count
FROM emp_attrition_rate
WHERE attrition = 'Yes'
GROUP BY department, job_role;

SELECT years_at_company, COUNT(*) AS attrition_count
FROM emp_attrition_rate
WHERE attrition = 'Yes'
GROUP BY years_at_company
ORDER BY years_at_company;

SELECT gender, 
       CASE 
           WHEN age BETWEEN 20 AND 29 THEN '20-29'
           WHEN age BETWEEN 30 AND 39 THEN '30-39'
           WHEN age BETWEEN 40 AND 49 THEN '40-49'
           ELSE '50+'
       END AS age_group,
       COUNT(*) AS attrition_count
FROM emp_attrition_rate
WHERE attrition = 'Yes'
GROUP BY gender, age_group
ORDER BY age_group, gender;

/* salary insights */

SELECT department, job_level, round(AVG(monthly_income),0) AS avg_monthly_income
FROM emp_attrition_rate
GROUP BY department, job_level;

SELECT performance_rating, round(AVG(percent_salary_hike),2) AS avg_salary_hike
FROM emp_attrition_rate
GROUP BY performance_rating
ORDER BY performance_rating;

SELECT gender, job_role, round(AVG(monthly_income),0) AS avg_monthly_income
FROM emp_attrition_rate
GROUP BY gender, job_role
ORDER BY gender, job_role;

/* employee experience */

SELECT department, job_role, round(AVG(years_at_company),0) AS avg_years_at_company
FROM emp_attrition_rate
GROUP BY department, job_role
ORDER BY department, job_role;

SELECT job_role, round(AVG(years_with_curr_manager),2) AS avg_years_with_manager
FROM emp_attrition_rate
GROUP BY job_role
ORDER BY avg_years_with_manager DESC;

SELECT 
    performance_rating,
    ROUND(AVG(years_since_last_promotion), 2) AS avg_years_since_promotion
FROM
    emp_attrition_rate
GROUP BY performance_rating
ORDER BY performance_rating;

/* work life balance */

SELECT distance_from_home, COUNT(*) AS attrition_count
FROM emp_attrition_rate
WHERE attrition = 'Yes'
GROUP BY distance_from_home
ORDER BY distance_from_home;

SELECT over_time, COUNT(*) AS attrition_count
FROM emp_attrition_rate
WHERE attrition = 'Yes'
GROUP BY over_time;

/* performance and job satisfaction */

SELECT job_level, round(AVG(performance_rating),2) AS avg_performance_rating
FROM emp_attrition_rate
GROUP BY job_level
ORDER BY job_level;

/* career progression */

SELECT job_level, round(AVG(years_since_last_promotion),2) AS avg_years_since_promotion
FROM emp_attrition_rate
GROUP BY job_level
ORDER BY job_level;

SELECT num_comp_worked, COUNT(*) AS attrition_count
FROM emp_attrition_rate
WHERE attrition = 'Yes'
GROUP BY num_comp_worked
ORDER BY num_comp_worked;

/* comparatiive analysis */

SELECT job_level, job_role, round(AVG(age),0) AS avg_age
FROM emp_attrition_rate
GROUP BY job_level, job_role
ORDER BY job_level, job_role;

/* promotion and tenure insights */

SELECT department, job_role, round(AVG(years_since_last_promotion),2) AS avg_years_since_promotion
FROM emp_attrition_rate
GROUP BY department, job_role
ORDER BY avg_years_since_promotion;

SELECT job_level, round(AVG(years_at_company),2) AS avg_tenure
FROM emp_attrition_rate
GROUP BY job_level
ORDER BY job_level;

/* job satisfaction analysis */

SELECT round(AVG(performance_rating),2) AS avg_performance_rating
FROM emp_attrition_rate;

/* attrition and engagement patterns */

SELECT job_involvement, job_satisfaction, COUNT(*) AS attrition_count
FROM emp_attrition_rate
WHERE attrition = 'Yes'
GROUP BY job_involvement, job_satisfaction
ORDER BY job_involvement, job_satisfaction;

SELECT job_level, distance_from_home, COUNT(*) AS attrition_count
FROM emp_attrition_rate
WHERE attrition = 'Yes'
GROUP BY job_level, distance_from_home
ORDER BY job_level, distance_from_home;

/* work place well being insights */

SELECT job_level, round(AVG(work_life_balance),2) AS avg_work_life_balance
FROM emp_attrition_rate
GROUP BY job_level
ORDER BY job_level;

SELECT over_time, round(AVG(work_life_balance),2) AS avg_work_life_balance
FROM emp_attrition_rate
GROUP BY over_time;

/* diversity and inclusion analysis */

SELECT department, job_level, gender, COUNT(*) AS gender_count
FROM emp_attrition_rate
GROUP BY department, job_level, gender
ORDER BY department, job_level, gender;

SELECT gender, job_level, COUNT(*) AS attrition_count
FROM emp_attrition_rate
WHERE attrition = 'Yes'
GROUP BY gender, job_level
ORDER BY gender, job_level;

/* comparision and carrer growth insights */

SELECT job_role, job_level, AVG(annual_income) AS avg_annual_income
FROM emp_attrition_rate
GROUP BY job_role, job_level
ORDER BY job_role, job_level;

SELECT years_at_company, round(AVG(percent_salary_hike),2) AS avg_salary_hike
FROM emp_attrition_rate
GROUP BY years_at_company
ORDER BY years_at_company;

/* historical work experience analysis */

SELECT job_role, round(AVG(total_working_years),2) AS avg_total_working_years
FROM emp_attrition_rate
GROUP BY job_role
ORDER BY avg_total_working_years;

/* commuting patterns */

SELECT department, job_role, round(AVG(distance_from_home),2) AS avg_distance_from_home
FROM emp_attrition_rate
GROUP BY department, job_role
ORDER BY department, job_role;

SELECT distance_from_home, round(AVG(performance_rating),2) AS avg_performance_rating
FROM emp_attrition_rate
GROUP BY distance_from_home
ORDER BY distance_from_home;

/* employee tenure and career development */

SELECT job_level, round(AVG(years_at_company),2) AS avg_years_at_company
FROM emp_attrition_rate
GROUP BY job_level
ORDER BY job_level;

SELECT performance_rating, round(AVG(years_since_last_promotion),2) AS avg_years_since_last_promotion
FROM emp_attrition_rate
WHERE performance_rating >= 4  -- assuming 4 and 5 are high ratings
GROUP BY performance_rating
ORDER BY performance_rating;

/* compensation dynamics */

SELECT years_with_curr_manager, round(AVG(monthly_income),0) AS avg_monthly_income
FROM emp_attrition_rate
GROUP BY years_with_curr_manager
ORDER BY years_with_curr_manager;

SELECT job_satisfaction, round(AVG(percent_salary_hike),2) AS avg_salary_hike
FROM emp_attrition_rate
GROUP BY job_satisfaction
ORDER BY job_satisfaction;

/* training and developmemt needs */

SELECT job_role, round(AVG(years_in_current_role),2) AS avg_years_in_role
FROM emp_attrition_rate
GROUP BY job_role
ORDER BY avg_years_in_role DESC;

SELECT years_with_curr_manager, round(AVG(performance_rating),2) AS avg_performance_rating
FROM emp_attrition_rate
GROUP BY years_with_curr_manager
ORDER BY years_with_curr_manager;

/* retention and risk analysis */

SELECT job_satisfaction, work_life_balance, COUNT(*) AS risk_count
FROM emp_attrition_rate
WHERE attrition = 'No' AND job_satisfaction <= 2 AND work_life_balance <= 2
GROUP BY job_satisfaction, work_life_balance;

SELECT num_comp_worked, COUNT(*) AS attrition_count
FROM emp_attrition_rate
WHERE attrition = 'Yes'
GROUP BY num_comp_worked
ORDER BY num_comp_worked;

/* producticity and efficency insights */

SELECT job_role, round(AVG(dailyrate),0) AS avg_daily_rate
FROM emp_attrition_rate
GROUP BY job_role
ORDER BY avg_daily_rate;

SELECT years_in_current_role, round(AVG(performance_rating),2) AS avg_performance_rating
FROM emp_attrition_rate
GROUP BY years_in_current_role
ORDER BY years_in_current_role;

/* engagement and satisfaction drivers */

SELECT distance_from_home, round(AVG(work_life_balance),2) AS avg_work_life_balance
FROM emp_attrition_rate
GROUP BY distance_from_home
ORDER BY distance_from_home;

SELECT job_involvement, COUNT(*) AS attrition_count
FROM emp_attrition_rate
WHERE attrition = 'Yes'
GROUP BY job_involvement
ORDER BY job_involvement;

/* salary growth and incentive analysis */

SELECT job_satisfaction, performance_rating, round(AVG(percent_salary_hike),2) AS avg_salary_hike
FROM emp_attrition_rate
GROUP BY job_satisfaction, performance_rating
ORDER BY job_satisfaction, performance_rating;

SELECT job_satisfaction, round(AVG(monthly_income),2) AS avg_monthly_income
FROM emp_attrition_rate
GROUP BY job_satisfaction
ORDER BY job_satisfaction;

/* carrer stability and mobility */

SELECT num_comp_worked, round(AVG(years_at_company),2) AS avg_years_at_company
FROM emp_attrition_rate
GROUP BY num_comp_worked
ORDER BY num_comp_worked;

SELECT job_level, round(AVG(years_in_current_role),2) AS avg_years_in_role
FROM emp_attrition_rate
GROUP BY job_level
ORDER BY job_level;

/* compensation and cost analysis */

SELECT department, SUM(annual_income) AS total_compensation
FROM emp_attrition_rate
GROUP BY department
ORDER BY total_compensation DESC;

SELECT job_role, COUNT(*) AS attrition_count, round(AVG(monthly_income),0) AS avg_monthly_income, 
       COUNT(*) * AVG(monthly_income) AS estimated_cost_of_attrition
FROM emp_attrition_rate
WHERE attrition = 'Yes'
GROUP BY job_role
ORDER BY estimated_cost_of_attrition DESC;

/* manager employee relationship */

SELECT years_with_curr_manager, round(AVG(performance_rating),2) AS avg_performance_rating
FROM emp_attrition_rate
GROUP BY years_with_curr_manager
ORDER BY years_with_curr_manager;

/* Cumulative Attrition Rate by Department */

WITH Attrition_CTE AS (
    SELECT 
        department,
        COUNT(*) OVER (PARTITION BY department) AS department_total,
        COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) OVER (PARTITION BY department) AS attrition_count
    FROM emp_attrition_rate
)
SELECT 
    department,
    attrition_count,
    department_total,
    (attrition_count / department_total) * 100 AS attrition_rate_percentage
FROM Attrition_CTE
GROUP BY department, attrition_count, department_total
ORDER BY attrition_rate_percentage DESC;

/* Average Salary by Job Role with Department-Wide Average Comparison */

WITH DepartmentAvgSalary AS (
    SELECT 
        department,
        job_role,
        monthly_income,
        round(AVG(monthly_income) OVER (PARTITION BY department) ,0)AS avg_department_salary
    FROM emp_attrition_rate
)
SELECT 
    department,
    job_role,
    round(AVG(monthly_income),0) AS avg_job_role_salary,
    avg_department_salary,
    round(AVG(monthly_income) - avg_department_salary,0) AS salary_difference
FROM DepartmentAvgSalary
GROUP BY department, job_role, avg_department_salary
ORDER BY department, salary_difference DESC;


/* Ranking Employees by Monthly Income within Departments */

SELECT 
    employee_number,
    department,
    monthly_income,
    RANK() OVER (PARTITION BY department ORDER BY monthly_income DESC) AS income_rank
FROM emp_attrition_rate
ORDER BY department, income_rank;

/* Identify Tenure Quartiles within Each Job Role */

SELECT 
    employee_number,
    job_role,
    years_at_company,
    NTILE(4) OVER (PARTITION BY job_role ORDER BY years_at_company) AS tenure_quartile
FROM emp_attrition_rate
ORDER BY job_role, tenure_quartile;

/* Calculate Running Total of Monthly Income by Department */

SELECT 
    employee_number,
    department,
    monthly_income,
    SUM(monthly_income) OVER (PARTITION BY department ORDER BY employee_number) AS running_total_income
FROM emp_attrition_rate
ORDER BY department, employee_number;

/* Calculate Average Tenure by Department with Overall Company Average */

WITH DepartmentTenure AS (
    SELECT 
        department,
        round(AVG(years_at_company),2) AS avg_department_tenure
    FROM emp_attrition_rate
    GROUP BY department
),
CompanyTenure AS (
    SELECT 
        round(AVG(years_at_company),2) AS company_avg_tenure
    FROM emp_attrition_rate
)
SELECT 
    dt.department,
    dt.avg_department_tenure,
    ct.company_avg_tenure,
    round(dt.avg_department_tenure - ct.company_avg_tenure,2) AS tenure_difference
FROM DepartmentTenure dt
CROSS JOIN CompanyTenure ct
ORDER BY tenure_difference DESC;

/* Percentage of Total Income by Department */

SELECT 
    employee_number,
    department,
    monthly_income,
    round((monthly_income / SUM(monthly_income) OVER (PARTITION BY department)) * 100,2) AS income_percentage_of_department
FROM emp_attrition_rate
ORDER BY department, income_percentage_of_department DESC;

/* Calculate Yearly Attrition Count and Rank it by Year */

WITH AttritionByTenure AS (
    SELECT 
        years_at_company AS tenure_years,
        COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS attrition_count
    FROM emp_attrition_rate
    GROUP BY years_at_company
)
SELECT 
    tenure_years,
    attrition_count,
    RANK() OVER (ORDER BY attrition_count DESC) AS attrition_rank
FROM AttritionByTenure
ORDER BY attrition_rank;

/* Performance Rating and Salary Hike Analysis with Department Comparison */

WITH SalaryHikeCTE AS (
    SELECT 
        employee_number,
        department,
        percent_salary_hike,
        round(AVG(percent_salary_hike) OVER (PARTITION BY department),2) AS avg_department_salary_hike
    FROM emp_attrition_rate
)
SELECT 
    employee_number,
    department,
    percent_salary_hike,
    avg_department_salary_hike,
    round((percent_salary_hike - avg_department_salary_hike),2) AS hike_difference
FROM SalaryHikeCTE
ORDER BY department, hike_difference DESC;

/*  Calculate Tenure and Performance by Quartile */

WITH TenureQuartiles AS (
    SELECT 
        employee_number,
        years_at_company,
        performance_rating,
        NTILE(4) OVER (ORDER BY years_at_company) AS tenure_quartile
    FROM emp_attrition_rate
)
SELECT 
    tenure_quartile,
    round(AVG(performance_rating),2) AS avg_performance
FROM TenureQuartiles
GROUP BY tenure_quartile
ORDER BY tenure_quartile;


select *
from emp_attrition_rate;



