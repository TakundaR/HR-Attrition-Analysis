#DATA CLEANING
#The data has been checked and it is clean.There are no null values,inconsistencies and duplicates.

# Job-related factors(page1)
# Attrition by department
SELECT department, 
SUM(CASE WHEN Attrition='YES' THEN 1 ELSE 0 END)  FROM emp_attrition
GROUP BY department;

#Attrition by job role
SELECT COUNT(EmployeeNumber) COUNT, JobRole
FROM emp_attrition
WHERE Attrition='Yes'
GROUP BY JobRole
ORDER BY COUNT DESC;

# Attrition by overtime
SELECT COUNT(EmployeeNumber), Overtime
FROM emp_attrition
WHERE Attrition='Yes'
GROUP BY overtime;

#Attrition by number of working years
SELECT CASE WHEN TotalWorkingYears <=10 THEN '0-10'
WHEN TotalWorkingYears BETWEEN  11 AND 20 THEN '11-20'
WHEN TotalWorkingYears >=21 THEN '>21'
 END AS WorkingYears,
COUNT(*) wy_count
FROM emp_attrition
WHERE Attrition='Yes'
GROUP BY 1;

#Number of total employees
SELECT COUNT(*) Total_Employees
 FROM emp_attrition;
 
 # Number of Attrition employees
 SELECT  COUNT(*) FROM Emp_Attrition
 WHERE Attrition='YES';
 
 # Attrition Rate
 SELECT  COUNT(*)/ 1470  AS Count
 FROM Emp_Attrition
 WHERE Attrition='YES'
 GROUP BY Attrition;
 

#Personal factors (page 2)

#Attrition by age category
SELECT CASE WHEN Age <25 THEN '< 25'
WHEN Age BETWEEN 25 AND 34 THEN '25-34'
WHEN Age BETWEEN 35 AND 44 THEN '35-45'
WHEN Age BETWEEN 45 AND 54 THEN '45-54'
 WHEN Age >= 55 THEN '>55'
 END AS age_category,
 COUNT(*) age_count
FROM emp_attrition
WHERE Attrition='Yes'
GROUP BY 1
ORDER BY  MIN(Age);

#Attrition by marital status
SELECT COUNT(*), MaritalStatus
FROM emp_attrition
WHERE Attrition='Yes'
GROUP BY 2;

# Attrition by monthly income catergory
SELECT CASE WHEN MonthlyIncome <=2500 THEN '<2500'
WHEN MonthlyIncome BETWEEN 2501 AND 5000 THEN '2501-5000'
WHEN MonthlyIncome BETWEEN 5001 AND 7500 THEN '5001-7500'WHEN MonthlyIncome > 7500 THEN '>7500'
END AS Income_category,COUNT(*) 
FROM emp_attrition
WHERE Attrition ='Yes'
GROUP BY 1;

# Attrition by distance from home
SELECT CASE WHEN DistanceFromHome <10 THEN '<10'
WHEN  DistanceFromHome BETWEEN 10 AND 20 THEN '11-20'
WHEN DistanceFromhome >20 THEN '>20'
END AS distance_category,COUNT(*)
FROM emp_attrition
WHERE Attrition='Yes'
GROUP BY 1;

#Attrition by number of companies worked insert
SELECT CASE WHEN NumCompaniesWorked <3 THEN '1-2'
WHEN  NumCompaniesWorked BETWEEN 3 AND 5 THEN '3 to 5'
WHEN NumCompaniesWorked >=6 THEN '6 or more'
END AS numcompanies_category,COUNT(*)
FROM emp_attrition
WHERE Attrition='Yes'
GROUP BY 1 ;

#Attrition by education field
SELECT COUNT(*), EducationField
FROM emp_attrition
WHERE Attrition='Yes'
GROUP BY 2;

#Male and female attrition rate
SELECT 87/237 Female_atrition_rate, 150/237 Male_attrition_rate;

#Employee experience and ratings(Page 3)
#Attrrition by job satisfaction
SELECT COUNT(*),Jobsatisfaction
FROM emp_attrition
WHERE Attrition='Yes'
GROUP BY 2;

#Attrition by business travel
SELECT COUNT(*),BusinessTravel
FROM emp_attrition
WHERE Attrition='Yes'
GROUP BY 2;

#Attrition by work life balnce rating
SELECT COUNT(*), WorkLifeBalance
FROM emp_attrition
WHERE Attrition='Yes'
GROUP BY WorkLifeBalance;

#Attrition by environment satisfaction
SELECT COUNT(*),EnvironmentSatisfaction
FROM emp_attrition
WHERE Attrition='Yes'
GROUP BY 2
