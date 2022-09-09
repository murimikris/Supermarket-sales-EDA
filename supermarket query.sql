select branch, city, sum(grossincome) as total_grossincome, sum(cogs) as total_sales
from supermarket_sales
group by Branch;
-- Branch 'C' in Naypyitaw has the highest gross icome and the highest total sales.
-- The Yangon and Mandalay branches have very similar income and total sales.

select sum(grossincome) as total_grossincome, Customertype, sum(cogs) as total_sales, Branch, city
from supermarket_sales
group by Customertype, City
order by branch;

/* The total income from members is slightly higher than from normal buyers.
Members also make up more of the total sales than normal customers.
Naypyitaw has the highest member earnings followed by Mandalay then Yangon.
Naypyitaw also has the highest sales for normal customers followed by Yangon then Mandalay*/

select sum(grossincome), Gender, sum(cogs) as total_sales, count(gender) as order_count, city
from supermarket_sales
GROUP by city, gender;

-- Female customers spend more in total than male customers
-- Naypyitaw is the only branch with more female customers than male customers
-- Despite two branches having more male customers, female sales are higher in two of the branches. The exception is Mandalay

select sum(grossincome)as gross_income, sum(cogs)total_sales, Productline, Gender
from supermarket_sales
GROUP by Productline, Gender;

-- The highest overall income is from Food and Beverages, the lowest from Health and beauty
-- Men spend more on health and beauty and least on Food and beverages
-- Women spend more on Food and beverages and least on Health and Beauty
--Food and Beverages is the highest earning Product line for the supermarket_sales

select Payment, count(payment) as preferred, sum(cogs),City
from supermarket_sales
group by Payment,City;

-- Ewallet payments are the most common but cash payments make more income.
-- Credit cards are the least common payment method.
--Naypyitaw recieves the highest cash payments.
-- Mandalay has the highest credit card payments.
-- Yangon has the highest ewallet payments.

select Customertype, sum(total) as total_sales, Payment, count(payment) as orders
from supermarket_sales
group by Payment, Customertype;

-- members make more payments via credit cards
-- normal customers prefer E wallet payments.
-- Normal customers make more cash payments than members.

 
select Gender, sum(total) as total_sales, Payment, count(payment) as orders
from supermarket_sales
group by Payment, Gender;

-- Women prefer Cash payments while men prefer E-wallet payments.
-- Women use credit cards for purchases more than men.

select Productline, sum(total) as total_sales, Payment, count(payment) as orders
from supermarket_sales
group by Payment, Productline
order by Productline, orders DESC;
--Shows how much each paymet method transacted for each product line.

--Which product line has the highest income?
select Productline, sum(grossincome) as total_gross
from supermarket_sales
group by Productline
ORDER BY total_gross DESC;
-- Highest earner is Food and beverages
--Lowest earner is Health and Beauty

--Product line income by city:

select Productline, sum(grossincome) as total_gross
from supermarket_sales
Where Branch = 'A'
group by Productline
ORDER BY total_gross DESC;
--Shows earnings by product line in Yangon

select Productline, sum(grossincome) as total_gross
from supermarket_sales
Where Branch = 'B'
group by Productline
ORDER BY total_gross DESC;

--Shows earnings by product line in Mandalay

select Productline, sum(grossincome) as total_gross
from supermarket_sales
Where Branch = 'C'
group by Productline
ORDER BY total_gross DESC;

--Shows earnings by product line in Naypyitaw

--What is the most Popular product line by Gender?
SELECT Productline, count(gender) as orders, sum(total) as total_sales, Gender
from supermarket_sales
group by Productline, Gender
order by total_sales DESC;

--The most popular product line for women is Food and beverage while Health and beauty is popular for men
--The least popular product for women is Health and beauty while for men is Food and beverage


-- What are the most popular product lines for all the customer types?
SELECT Productline, count(Customertype) as orders, sum(total) as total_sales, Customertype
from supermarket_sales
group by Productline, Customertype
order by total_sales DESC;

--Ratings by Branch
Select Branch, City, count(city) as orders,round(avg(rating),2) as average_rating
from supermarket_sales
group by City
Order by Rating Desc;

--Highest rated branch is Branch 'c' followed by 'A' then 'B'

--Rating by Gender
SELECT Branch,City, Gender, count(gender) as orders, round(avg(rating),2) as average_rating
from supermarket_sales
group by City, Gender
Order by Branch ;
--Women tend to give higher ratings and rate branch 'C' highest
--Men give lower ratings and rate branch 'A' highest
--Branch 'B' is the lowest rated Branch

--Rating by Product line
Select Productline, count(productline) as orders, round( avg(rating),2) as avg_rating
from supermarket_sales
group by Productline
order by avg_rating Desc;
-- Food and Beverages have the highest average ratings
--Home and lifestyle have the lowest Rating
-- Number of orders does not impact the average rating