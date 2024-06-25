CREATE DATABASE LAB
USE LAB

--LAB1
--DEPOSIT TABLE
create table deposit(ActNo int,CName varchar(50),BName varchar(50),Amount decimal(8,2),ADate datetime)

INSERT INTO deposit values(101,'ANIL','VRCE',10000,'1995-03-01')
INSERT INTO deposit values(102,'SUNIL','AJNI',5000,'1996-01-04')
INSERT INTO deposit values(103,'MEHUL','KAROLBAGH',3500,'1995-11-17')
INSERT INTO deposit values(104,'MADHURI','CHANDI',1200,'1995-12-17')
INSERT INTO deposit values(105,'PRMOD','M.G.ROAD',3000,'1996-03-27')
INSERT INTO deposit values(106,'SANDIP','ANDHERI',2000,'1996-03-31')
INSERT INTO deposit values(107,'SHIVANI','VIRAR',1000,'1995-09-05')
INSERT INTO deposit values(108,'KRANTI','NEHRU PLACE',5000,'1995-07-02')
INSERT INTO deposit values(109,'MINU','POWAI',7000,'1995-08-10')

select * From deposit
select ActNo,CName,BName,Amount,ADate From deposit

--BRANCH TABLE
create table branch(BName varchar(50),City varchar(50))

INSERT INTO branch values('VRCE','NAGPUR')
INSERT INTO branch values('AJNI','NAGPUR')
INSERT INTO branch values('KAROLBAGH','DELHI')
INSERT INTO branch values('CHANDI','DELHI')
INSERT INTO branch values('DHARAMPETH','NAGPUR')
INSERT INTO branch values('M.G.ROAD','BANGLORE')
INSERT INTO branch values('ANDHERI','BOMBAY')
INSERT INTO branch values('VIRAR','BOMBAY')
INSERT INTO branch values('NEHRU PLACE','DELHI')
INSERT INTO branch values('POWAI','BOMBAY')

select * From branch
select BName,City From branch

--CUSTOMERS TABLE
create table customers(CName varchar(50),City varchar(50))

INSERT INTO customers values('ANIL','CALCUTTA')
INSERT INTO customers values('SUNIL','DELHI')
INSERT INTO customers values('MEHUL','BARODA')
INSERT INTO customers values('MANDAR','PATNA')
INSERT INTO customers values('MADHURI','NAGPUR')
INSERT INTO customers values('PRAMOD','NAGPUR')
INSERT INTO customers values('SANDIP','SURAT')
INSERT INTO customers values('SHIVANI','BOMBAY')
INSERT INTO customers values('KRANTI','BOMBAY')
INSERT INTO customers values('NAREN','BOMBAY')

select * From customers
select CName,City From customers

--BORROW TABLE
create table borrow(Loanno int,CName varchar(50),BName varchar(50),Amount decimal(8,2))

INSERT INTO borrow
values(201,'ANIL','VRCE',1000),
	  (206,'MEHUL','AJNI',5000),
	  (311,'SUNIL','DHARAMPETH',3000),
	  (321,'MADHURI','ANDHERI',2000),
	  (375,'PRAMOD','VIRAR',8000),
	  (481,'KRANTI','NEHRU PALACE',3000)

SELECT * FROM borrow


--LAB2
--Retrieve all data from table DEPOSIT.
SELECT * FROM DEPOSIT

--Retrieve all data from table BORROW.
SELECT * FROM BORROW

--Retrieve all data from table CUSTOMERS.
SELECT * FROM CUSTOMERS

--Display Account No, Customer Name & Amount from DEPOSIT.
SELECT ACTNO,CNAME,AMOUNT FROM DEPOSIT

--Display Loan No, Amount from BORROW.
SELECT LOANNO,AMOUNT FROM BORROW

--Display loan details of all customers who belongs to ‘ANDHERI’ branch from borrow table.
SELECT * FROM BORROW WHERE BNAME='ANDHERI'

--Give account no and amount of depositor, whose account no is equals to 106 from deposit table.
SELECT ACTNO,AMOUNT FROM DEPOSIT WHERE ACTNO=106

--Give name of borrowers having amount greater than 5000 from borrow table.
SELECT CNAME FROM BORROW WHERE AMOUNT > 5000

--Give name of customers who opened account after date '1-12-96' from deposit table.
SELECT CNAME FROM DEPOSIT WHERE ADATE > '1996-12-1'

--Display name of customers whose account no is less than 105 from deposit table.
SELECT CNAME FROM DEPOSIT WHERE ACTNO<105

--Display name of customer who belongs to either ‘NAGPUR’ or ‘DELHI’ from customer table. (OR & IN)
SELECT CNAME FROM CUSTOMERS WHERE CITY IN('NAGPUR','DELHI')
SELECT CNAME FROM CUSTOMERS WHERE CITY='NAGPUR' OR CITY='DELHI'

--Display name of customers with branch whose amount is greater than 4000 and account no is less than 105 from deposit table.
SELECT CNAME FROM DEPOSIT WHERE AMOUNT>4000 AND ACTNO<105 

--Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000 from borrow table. (AND & BETWEEN)
SELECT * FROM BORROW WHERE AMOUNT >= 3000 AND AMOUNT <=8000
SELECT * FROM BORROW WHERE AMOUNT BETWEEN 3000 AND 8000

--Find all depositors who do not belongs to ‘ANDHERI’ branch from deposit table.
SELECT * FROM DEPOSIT WHERE BNAME != 'ANDHERI'

--Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’ Or ‘M.G.ROAD’ and Account No is less than 104 from deposit table.
SELECT ACTNO,CNAME,AMOUNT FROM DEPOSIT WHERE BNAME IN('AJNI','KAROLBAGH','M.G.ROAD') AND ACTNO<104

--PART B
--Display all the details of first five customers from deposit table.
SELECT * FROM DEPOSIT WHERE ACTNO BETWEEN 101 AND 105

--Display all the details of first three depositors whose amount is greater than 1000.
SELECT * FROM DEPOSIT WHERE ACTNO BETWEEN 101 AND 103 AND AMOUNT > 1000

--Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to ‘ANDHERI’ from borrow table.
SELECT TOP 5 LOANNO,CNAME FROM BORROW WHERE BNAME!='ANDHERI' 

--Retrieve all unique cities using DISTINCT. (Use Customers Table)
SELECT DISTINCT CITY FROM CUSTOMERS

--Retrieve all unique branches using DISTINCT. (Use Branch Table)
SELECT DISTINCT BNAME FROM BRANCH

--PART C
--Retrieve top 50% record from table BORROW.
SELECT TOP 50 PERCENT * FROM BORROW

--Display top 10% amount from table DEPOSIT.
SELECT TOP 10 PERCENT * FROM DEPOSIT

--Display top 25% customer who deposited more than 5000.
SELECT TOP 25 PERCENT CNAME FROM DEPOSIT WHERE AMOUNT > 5000 

--Retrieve first 10% Loan Amounts.
SELECT TOP 10 PERCENT AMOUNT FROM BORROW

--Retrieve all unique customer names with city.
SELECT DISTINCT CNAME,CITY FROM CUSTOMERS

--Retrieve all Loan records with one more column in Loan Amount as 10% extra amount.
SELECT * , AMOUNT+(AMOUNT/10)  FROM BORROW 

--Retrieve all odd/even value loan number from Borrow table.