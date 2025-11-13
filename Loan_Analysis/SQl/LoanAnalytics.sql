CREATE DATABASE LoanAnalyticsDB;
USE LoanAnalyticsDB;

CREATE TABLE LoanData (
  Loan_ID VARCHAR(20) PRIMARY KEY,
  Gender VARCHAR(10),
  Married VARCHAR(10),
  Dependents VARCHAR(10),
  Education VARCHAR(50),
  Self_Employed VARCHAR(10),
  ApplicantIncome DECIMAL(10,2),
  CoapplicantIncome DECIMAL(10,2),
  LoanAmount DECIMAL(10,2),
  Loan_Amount_Term INT,
  Credit_History BIT,
  Property_Area VARCHAR(20),
  Loan_Status CHAR(1)
);

select * from LoanData;
SELECT COUNT(*) FROM LoanData;
SET SQL_SAFE_UPDATES = 0;
SELECT 
    SUM(CASE WHEN LoanAmount IS NULL THEN 1 ELSE 0 END) AS Null_LoanAmount,
    SUM(CASE WHEN Credit_History IS NULL THEN 1 ELSE 0 END) AS Null_CreditHistory,
    SUM(CASE WHEN ApplicantIncome IS NULL THEN 1 ELSE 0 END) AS Null_ApplicantIncome
FROM LoanData;

ALTER TABLE LoanData ADD COLUMN TotalIncome DECIMAL(10,2);
UPDATE LoanData 
SET TotalIncome = ApplicantIncome + CoapplicantIncome;

alter table LoanData 
drop COlumn TotalIncome;
alter table LoanData drop column IncomeLoanRatio ;
alter table LoanData Add column IncomeLoanRatio Decimal(10,2);
update LoanData
set IncomeLoanRatio = (TotalIncome / LoanAmount) /100
where LoanAmount <> 0 ;

alter table LoanData add column RiskCategory varchar(20);

update LoanData 
set RiskCategory = 
case 
	when Credit_History = 0 then "High Risk"
    when LoanAmount >200 and TotalIncome <300 then "Moderate Risk"
    else "Low Risk"
end;
SELECT * FROM LoanData ;
