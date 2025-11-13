Create database HumanResourceHR;
use HumanResourceHR;

select * from humanResource;
SELECT COUNT(*) FROM humanResource;
Select * from humanResource where Department is null ;
SELECT DISTINCT Department FROM humanResource;
explain select * from humanResource;

show columns from humanResource;
-- update humanResource 
-- set DateofHire = str_to_date(DateofHire , '%y-%m-%d'),
-- 	DateofTermination = str_to_date(DateofTermination ,'%m/%d/%y' );

SET SQL_SAFE_UPDATES = 0;
-- SELECT DateofHire, STR_TO_DATE(DateofHire, '%m-%d-%Y') 
-- FROM humanResource
-- LIMIT 10;
-- UPDATE humanResource
-- SET 
--   DateofHire = CASE
--     WHEN DateofHire LIKE '%-%' THEN STR_TO_DATE(DateofHire, '%m-%d-%Y')
--     WHEN DateofHire LIKE '%/%' THEN STR_TO_DATE(DateofHire, '%m/%d/%Y')
--     ELSE NULL
--   END,
--   DateofTermination = CASE
--     WHEN DateofTermination LIKE '%-%' THEN STR_TO_DATE(DateofTermination, '%m-%d-%Y')
--     WHEN DateofTermination LIKE '%/%' THEN STR_TO_DATE(DateofTermination, '%m/%d/%Y')
--     ELSE NULL
--   END;
  
  -- changed column type for hire date and termdate
  UPDATE humanResource
SET 
  DateofHire = CASE
    WHEN DateofHire LIKE '%-%' AND SUBSTRING_INDEX(DateofHire, '-', 1) > 12 
         THEN STR_TO_DATE(DateofHire, '%d-%m-%Y')
    WHEN DateofHire LIKE '%-%' THEN STR_TO_DATE(DateofHire, '%m-%d-%Y')
    WHEN DateofHire LIKE '%/%' AND SUBSTRING_INDEX(DateofHire, '/', 1) > 12 
         THEN STR_TO_DATE(DateofHire, '%d/%m/%Y')
    WHEN DateofHire LIKE '%/%' THEN STR_TO_DATE(DateofHire, '%m/%d/%Y')
    ELSE NULL
  END,
  
  DateofTermination = CASE
    WHEN DateofTermination LIKE '%-%' AND SUBSTRING_INDEX(DateofTermination, '-', 1) > 12 
         THEN STR_TO_DATE(DateofTermination, '%d-%m-%Y')
    WHEN DateofTermination LIKE '%-%' THEN STR_TO_DATE(DateofTermination, '%m-%d-%Y')
    WHEN DateofTermination LIKE '%/%' AND SUBSTRING_INDEX(DateofTermination, '/', 1) > 12 
         THEN STR_TO_DATE(DateofTermination, '%d/%m/%Y')
    WHEN DateofTermination LIKE '%/%' THEN STR_TO_DATE(DateofTermination, '%m/%d/%Y')
    ELSE NULL
  END;
  
  -- check nulls
SELECT 
    ï»¿Employee_Name,
    DateofHire,
    COUNT(*) AS duplicate_count
FROM humanResource
GROUP BY ï»¿Employee_Name, DateofHire
HAVING COUNT(*) > 1;

show Columns from humanResource;
select Salary from humanResource;

-- Added New annualsalary column
ALTER TABLE humanResource ADD COLUMN AnnualSalary DECIMAL(10,2);
UPDATE humanResource SET AnnualSalary = Salary * 12;
alter table humanResource ;
-- drop column AnnualSalary;

SELECT Department, COUNT(*) AS TotalEmployees, AVG(AnnualSalary),0 AS AvgSalary
FROM humanResource
GROUP BY Department;
