SELECT * FROM banking_management.banking_management;

#Create a table named banking_management.
CREATE TABLE banking_management.banking_management
(
Branch_code INT not null
Primary key,
Branch_name TEXT null,
Account_no BIGINT null,
Account_holder_name TEXT null,
Acoount_holder_address TEXT null,
Amount_deposited TEXT null,
Amount_withdraw TEXT null,
Proof_id TEXT null,
Mobile_no BIGINT null,
Type_of_account TEXT null,
Credit_card TEXT null
);

#Counting the number of rows.
SELECT COUNT(*) FROM banking_management.banking_management;

#Counting the number of Columns.
SELECT COUNT(*) AS Column_numbers 
FROM information_schema.columns
WHERE TABLE_NAME = "banking_management";

#Finding Account_holder_name from the table.
SELECT Account_holder_name FROM banking_management.banking_management LIMIT 7;

#In this query we are categorized banking transaction in the banking management table in to ‘high priority’, ‘average 
#priority’, ‘low priority’ based on amount deposited.
SELECT Branch_code, Account_holder_name, Amount_deposited,
CASE 
WHEN Amount_deposited >"400000" THEN 'High priority'
 WHEN Amount_deposited BETWEEN "100000" AND "350000" THEN 'Average priority'
 WHEN Amount_deposited <"100000" THEN 'Low priority'
END AS Priority
FROM banking_management.banking_management;

#.Now we want to retrieve all the columns from the table where the account holder reside in “ Dashmesh nagar”.
SELECT *
FROM banking_management.banking_management
Where Account_holder_address ="Dashmesh nagar";

#. Count Proof id which is more than 11.
SELECT Proof_id, COUNT(*) AS "Code_of_branch"
FROM banking_management.banking_management
GROUP BY Proof_id
HAVING COUNT(*) > 11;

#Count and list different type of account held by customers in this table, along with the number of occurance of each type of account.
SELECT Type_of_account, COUNT(*) AS 'Kinds_of_account'
FROM banking_management.banking_management
GROUP BY Type_of_account;

#Finding all the columns from table where “Proof Id” is “Pan card”.
SELECT * FROM banking_management.banking_management 
WHERE Proof_id = 'Pan Card';

#Finding Account holder name where Type of account is Current account or holder having Credit card.
SELECT Account_holder_name, Mobile_no
FROM banking_management.banking_management
WHERE Type_of_account ="Current Account" OR Credit_card="yes";

#In this problem statement we are finding the sum of Amount deposited.
SELECT SUM(Amount_deposited) 
FROM banking_management.banking_management;

#In this problem statement we are finding the average of Amount withdraw.
SELECT AVG(Amount_withdraw)
FROM banking_management.banking_management;

#Finding the sum of Amount deposited and Amount withdraw and in each type of account and new named as Amt_Deposit, Amt_withdraw.
SELECT Type_of_account,
SUM(Amount_deposited) AS Amt_Deposit,
SUM(Amount_withdraw) AS Amount_withdraw
FROM banking_management.banking_management
GROUP BY Type_of_account;

#Finding the top 10 Types of account (along with Proof id) with highest total deposited amount and total withdrawn amounts, having Proof id – “Pan card”.
SELECT Type_of_account, Proof_id, SUM(Amount_deposited) AS Amt_deposited,
 SUM(Amount_withdraw) AS Amt_withdraw
FROM banking_management.banking_management
WHERE Proof_id IN (SELECT Proof_id FROM banking_management.banking_management
WHERE Proof_id = "Pan Card"
)
GROUP BY Type_of_account
ORDER BY SUM(Amount_deposited) DESC
LIMIT 10;

#If we want to find Account holder name and amount withdraw whose values of amount withdraw is greater than the average of Amount deposited.
SELECT Account_holder_name, Amount_withdraw
FROM banking_management.banking_management
WHERE Amount_withdraw > (
 SELECT AVG(Amount_deposited)
 FROM banking_management.banking_management
);

#Finding the Branch name and account holder name whose branch name is Chandigarh.
SELECT Branch_name, Account_holder_name
FROM banking_management.banking_management
WHERE Branch_name IN (SELECT Branch_name FROM banking_management.banking_management
WHERE Branch_name= 'Chandigarh');

#.Finding all columns in each branch name having maximum amount deposited.
SELECT *
FROM banking_management.banking_management
WHERE (Branch_name, Amount_deposited) IN (SELECT Branch_name, MAX(Amount_deposited)
FROM banking_management.banking_management
Group BY Branch_name);

#Use upper case function in account holder name colum.
SELECT UPPER(Account_holder_name) AS Uppercase_Account_holder_Name
FROM banking_management.banking_management;

#Finding each Account holder address and do the sum of amount withdraw in ascending order.
SELECT Account_holder_address, SUM(Amount_withdraw) AS Amt_withdraw FROM banking_management.banking_management
GROUP BY Account_holder_address
ORDER BY Amt_withdraw;

#Finding the sum of amount deposited in each credit card as descending order.
SELECT Credit_card, SUM(Amount_deposited) AS Total_amount_deposited
FROM banking_management.banking_management
GROUP BY Credit_card
ORDER BY Total_amount_deposited DESC;

#Finding Distinct account holder address.
SELECT DISTINCT Account_holder_address
FROM banking_management.banking_management;

#Finding all the colunms where the type of account is saving account and the branch name is Chandigarh.
SELECT *
FROM banking_management.banking_management
WHERE Type_of_account ="Saving Account" AND Branch_name ="Chandigarh";

#Find the amount withdraw greater than 100000, first by amount withdraw and then by account holder name.
SELECT Account_holder_name,Amount_withdraw
FROM banking_management.banking_management
WHERE Branch_code IN(
SELECT Branch_code
 FROM banking_management.banking_management
 WHERE Amount_withdraw >100000
 )
ORDER BY Amount_withdraw, Account_holder_name;

#In this we are selected brach code, amount deposited and account no where amount deposited is greateer than 300000 and named new column as Priority.
SELECT Branch_code,Account_no,Amount_deposited,
CASE
 WHEN Amount_deposited >300000 THEN "HIGH PRICE"
END AS Priority
FROM banking_management.banking_management;
