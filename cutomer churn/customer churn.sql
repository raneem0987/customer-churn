create database churn
go

use churn;

select * from Churn_Modelling;

-------------- preview dataset ---------------

select *
from churn_modelling;

-------------- total number of rows ---------------

select count(*) as total_rows
from churn_modelling;

-------------- check missing values ---------------

select count(*) as total_rows,
count(customerid) as customer_id,
count(creditscore) as credit_score,
count(geography) as geography,
count(gender) as gender,
count(age) as age,
count(balance) as balance,
count(estimatedsalary) as estimated_salary
from churn_modelling;

-------------- check duplicate customer ids ---------------

select customerid,
count(*) as total
from churn_modelling
group by customerid
having count(*) > 1;

-------------- display available countries ---------------

select distinct geography
from churn_modelling;

-------------- display available genders ---------------

select distinct gender
from churn_modelling;

-------------- display churn status values ---------------

select distinct exited
from churn_modelling;

-------------- find minimum and maximum customer age ---------------

select min(age) as minimum_age,
max(age) as maximum_age
from churn_modelling;

-------------- find minimum and maximum account balance ---------------

select min(balance) as minimum_balance,
max(balance) as maximum_balance
from churn_modelling;

-------------- find minimum and maximum estimated salary ---------------

select min(estimatedsalary) as minimum_salary,
max(estimatedsalary) as maximum_salary
from churn_modelling;

-------------- find minimum and maximum credit score ---------------

select min(creditscore) as minimum_credit_score,
max(creditscore) as maximum_credit_score
from churn_modelling;

-------------- count customers by country ---------------

select geography,
count(*) as total_customers
from churn_modelling
group by geography
order by total_customers desc;

-------------- count customers by gender ---------------

select gender,
count(*) as total_customers
from churn_modelling
group by gender;

-------------- count customers by number of products ---------------

select numofproducts,
count(*) as total_customers
from churn_modelling
group by numofproducts
order by numofproducts;

-------------- count active and inactive customers ---------------

select isactivemember,
count(*) as total_customers
from churn_modelling
group by isactivemember;

-------------- count customers with and without credit card ---------------

select hascrcard,
count(*) as total_customers
from churn_modelling
group by hascrcard;

-------------- balance summary statistics ---------------

select min(balance) as minimum_balance,
max(balance) as maximum_balance,
avg(balance) as average_balance,
sum(balance) as total_balance
from churn_modelling;

-------------- estimated salary summary statistics ---------------

select min(estimatedsalary) as minimum_salary,
max(estimatedsalary) as maximum_salary,
avg(estimatedsalary) as average_salary
from churn_modelling;

-------------- credit score summary statistics ---------------

select min(creditscore) as minimum_credit_score,
max(creditscore) as maximum_credit_score,
avg(creditscore) as average_credit_score
from churn_modelling;

-------------- customer distribution by age ---------------

select age,
count(*) as total_customers
from churn_modelling
group by age
order by age;

-------------- customer distribution by tenure ---------------

select tenure,
count(*) as total_customers
from churn_modelling
group by tenure
order by tenure;


-------------- power bi dashboard queries ---------------

-------------- kpi - total customers ---------------

select count(*) as total_customers
from churn_modelling;


-------------- kpi - exited customers ---------------

select count(*) as exited_customers
from churn_modelling
where exited = 1;


-------------- kpi - active customers ---------------

select count(*) as active_customers
from churn_modelling
where exited = 0;


-------------- kpi - churn rate ---------------

select
round(100.0 * sum(exited) / count(*), 2) as churn_rate
from churn_modelling;


-------------- kpi - average customer age ---------------

select
round(avg(age), 2) as average_age
from churn_modelling;


-------------- kpi - average balance ---------------

select
round(avg(balance), 2) as average_balance
from churn_modelling;


-------------- kpi - average salary ---------------

select
round(avg(estimatedsalary), 2) as average_salary
from churn_modelling;


-------------- kpi - average credit score ---------------

select
round(avg(creditscore), 2) as average_credit_score
from churn_modelling;


-------------- customers by country ---------------

select
geography,
count(*) as total_customers
from churn_modelling
group by geography
order by total_customers desc;


-------------- churn by country ---------------

select
geography,
count(*) as total_customers,
sum(exited) as exited_customers,
round(100.0 * sum(exited) / count(*), 2) as churn_rate
from churn_modelling
group by geography
order by churn_rate desc;


-------------- customers and churn by gender ---------------

select
gender,
count(*) as total_customers,
sum(exited) as exited_customers,
round(100.0 * sum(exited) / count(*), 2) as churn_rate
from churn_modelling
group by gender;


-------------- customers and churn by age ---------------

select
age,
count(*) as total_customers,
sum(exited) as exited_customers,
round(100.0 * sum(exited) / count(*), 2) as churn_rate
from churn_modelling
group by age
order by age;


-------------- customers and churn by tenure ---------------

select
tenure,
count(*) as total_customers,
sum(exited) as exited_customers,
round(100.0 * sum(exited) / count(*), 2) as churn_rate
from churn_modelling
group by tenure
order by tenure;


-------------- customers and churn by number of products ---------------

select
numofproducts,
count(*) as total_customers,
sum(exited) as exited_customers,
round(100.0 * sum(exited) / count(*), 2) as churn_rate
from churn_modelling
group by numofproducts
order by numofproducts;


-------------- customers and churn by credit card ---------------

select
hascrcard,
count(*) as total_customers,
sum(exited) as exited_customers,
round(100.0 * sum(exited) / count(*), 2) as churn_rate
from churn_modelling
group by hascrcard;


-------------- customers and churn by active status ---------------

select
isactivemember,
count(*) as total_customers,
sum(exited) as exited_customers,
round(100.0 * sum(exited) / count(*), 2) as churn_rate
from churn_modelling
group by isactivemember;


-------------- credit score analysis ---------------

select
geography,
round(avg(creditscore), 2) as average_credit_score,
min(creditscore) as minimum_credit_score,
max(creditscore) as maximum_credit_score
from churn_modelling
group by geography;


-------------- balance analysis by country ---------------

select
geography,
round(avg(balance), 2) as average_balance,
min(balance) as minimum_balance,
max(balance) as maximum_balance
from churn_modelling
group by geography;


-------------- salary analysis by country ---------------

select
geography,
round(avg(estimatedsalary), 2) as average_salary,
min(estimatedsalary) as minimum_salary,
max(estimatedsalary) as maximum_salary
from churn_modelling
group by geography;


-------------- age group analysis ---------------

select
case
    when age < 30 then 'under 30'
    when age between 30 and 39 then '30-39'
    when age between 40 and 49 then '40-49'
    when age between 50 and 59 then '50-59'
    else '60+'
end as age_group,

count(*) as total_customers,

sum(exited) as exited_customers,

round(100.0 * sum(exited) / count(*), 2) as churn_rate

from churn_modelling

group by
case
    when age < 30 then 'under 30'
    when age between 30 and 39 then '30-39'
    when age between 40 and 49 then '40-49'
    when age between 50 and 59 then '50-59'
    else '60+'
end;


-------------- credit score group analysis ---------------

select
case
    when creditscore < 500 then 'poor'
    when creditscore between 500 and 599 then 'fair'
    when creditscore between 600 and 699 then 'good'
    when creditscore between 700 and 799 then 'very good'
    else 'excellent'
end as credit_score_group,

count(*) as total_customers,

sum(exited) as exited_customers,

round(100.0 * sum(exited) / count(*), 2) as churn_rate

from churn_modelling

group by
case
    when creditscore < 500 then 'poor'
    when creditscore between 500 and 599 then 'fair'
    when creditscore between 600 and 699 then 'good'
    when creditscore between 700 and 799 then 'very good'
    else 'excellent'
end;


-------------- balance group analysis ---------------

select
case
    when balance = 0 then 'zero balance'
    when balance < 50000 then 'low balance'
    when balance between 50000 and 100000 then 'medium balance'
    else 'high balance'
end as balance_group,

count(*) as total_customers,

sum(exited) as exited_customers,

round(100.0 * sum(exited) / count(*), 2) as churn_rate

from churn_modelling

group by
case
    when balance = 0 then 'zero balance'
    when balance < 50000 then 'low balance'
    when balance between 50000 and 100000 then 'medium balance'
    else 'high balance'
end;


-------------- high risk customers ---------------

select
customerid,
surname,
geography,
gender,
age,
creditscore,
balance,
numofproducts,
isactivemember,
exited
from churn_modelling
where exited = 1
and isactivemember = 0
order by balance desc;


-------------- high value churned customers ---------------

select top 20
customerid,
surname,
geography,
age,
balance,
estimatedsalary,
creditscore
from churn_modelling
where exited = 1
order by balance desc;


-------------- customer segmentation for power bi ---------------

select
customerid,
surname,
geography,
gender,
age,
creditscore,
tenure,
balance,
numofproducts,
hascrcard,
isactivemember,
estimatedsalary,
exited,

case
    when exited = 1 then 'churned'
    else 'active'
end as customer_status,

case
    when age < 30 then 'under 30'
    when age between 30 and 39 then '30-39'
    when age between 40 and 49 then '40-49'
    when age between 50 and 59 then '50-59'
    else '60+'
end as age_group,

case
    when balance = 0 then 'zero balance'
    when balance < 50000 then 'low balance'
    when balance between 50000 and 100000 then 'medium balance'
    else 'high balance'
end as balance_group,

case
    when creditscore < 500 then 'poor'
    when creditscore between 500 and 599 then 'fair'
    when creditscore between 600 and 699 then 'good'
    when creditscore between 700 and 799 then 'very good'
    else 'excellent'
end as credit_score_group

from churn_modelling;