
                                  ------A small IT firm designing business software -------


Create Table Clients
(ClientID Int Primary Key, ClientName Varchar (50), Address Varchar (50), Email Varchar (50), PhoneNO Varchar (11), Business Varchar (50))

Insert Into Clients Values 
(1001, 'ACME Utilities', 'Noida', 'contact@acmetutil.com', 9567880032,'Manufacturing')
Insert Into Clients Values 
(1002, 'Tracton Consultants', 'Mumbai', 'consult@trackon.com', 8734210090,'Consultant'),
(1003, 'Moneysaver distributors', 'Kolkata', 'save@moneysaver.com', 77886655, 'Reseller'),
(1004, 'Lawful Corp', 'Chennai', 'justice@lawful.com', 9210342219, 'Professional')
Select * From Clients 

Create Table Employees
(EmpNo Int Primary key , EmpName Varchar (50), Job Varchar (50), Salary Int, DeptNo Int )
Insert Into Employees Values
(7001,'Rajesh', 'Analyst',20000,10)
Insert Into Employees Values
(7002,'Mahadev', 'Desinger',30000,10),
(7003,'Sandeep', 'Developer', 40000,20),
(7004, 'Manoj', 'Developer', 40000, 20),
(7005,'Abhay', 'Desinger', 35000, 10),
(7006, 'Uma', 'Tester', 30000,30),
(7007, 'Geeta', 'Tech Writer', 30000, 40),
(7008,'Priya', 'Tester', 35000,30),
(7009,'Nutan', 'Developer', 45000,20),
(7010,'Smitha', 'Analyst', 20000,10),
(7011,'Anand', 'Project Manager', 65000,10)
Select * From Employees 


Create Table Projects
(ProjectID Int Primary Key, Deser Varchar (30), StartDate Date, PlannedDate Date,Actual_Enddate Date, Budget Int, ClientID Int)

Insert Into Projects Values 
(401,'Inventory','01-Apr-11','01-Oct-11','31-Oct-11',150000,1001)
Select* From Projects

Insert Into Projects Values 
(402,'Accounting','01-Apr-11','01-Jan-12','1-Aug-12',500000,1002),
(403,'Payroll', '01-Oct-11','31-Dec-11','3-Mar-12',75000,1003),
(404,'Contact Mngmt','1-Nov-11','1-Dec-11','5-May-12',50000,1004)

Create Table EmpProjectTasks
(ProjectID Int primary Key, EmpNo int, Start_Date Date, End_Date Date, Task Varchar (50), Status Varchar (50) )

Insert Into EmpProjectTasks Values
(401,7001,'01-Apr-11','20-Apr-11','System Analysis','Completed')

Insert Into EmpProjectTasks Values
(402,7002,'21-Apr-11','31-May-11','System Designing','Completed')

Insert Into EmpProjectTasks Values
(403,7003,'01-Jun-11','15-Jul-11','Coding','Completed'),
(404,7004,'18-Jul-11','01-Sep-11','Coding','Completed'),
(405,7006,'03-Sep-11','15-Sep-11','Testing','Completed'),
(406,7009,'18-Sep-11','05-Oct-11','Code Change','Completed'),
(407,7008,'06-Oct-11','16-Oct-11','Testing','Completed'),
(408,7007,'06-Oct-11','22-Oct-11','Documentation','Completed'),
(409,7011,'22-Oct-11','31-Oct-11','Sign off','Completed'),
(410,7010,'01-Aug-11','20-Aug-11','System Analysis','Completed'),
(411,7002,'22-Aug-11','30-Sep-11','System Design','Completed'),
(412,7004,'01-Oct-11','03-May-12','Coding','In Progress')

Create Table Departments 
(Deptno Int Primary Key,DName Varchar (50), Loc Varchar (50) )

Insert Into Departments Values
(10, 'Design', 'Pune'),
(20,'Development','Pune'),
(30,'Testing','Mumbai'),
(40,'Document','Mumbai')
Select *From Departments 

Select* From EmpProjectTasks


--Objective Intermediate---

1.
Select* From Clients
Where Business= 'Consultant'

2.
Select*From Employees
Where Job  Not IN ('Developer ')

3.
Select*From Projects
Where Budget > ('100000')

4.

SELECT *
FROM EmpProjectTasks
WHERE Status is Not Null;


5.
Select*From Employees
Where EmpName LIKE 'M%'

6.
Select*From Employees
Where EmpName LIKE '%a'

7.

SELECT DATEDIFF(month, StartDate, Actual_Enddate) AS months_to_complete
FROM projects
WHERE Deser = 'Inventory';


8.
Select * From EmpProjectTasks
Where Status='In Progress'

9.
Select Deptno, DName
From Departments 
Where Loc = 'Pune'

10 .

Select * From Clients 
SELECT Email, INSTR(Email, '@') FROM clients


11.

Select End_Date, Task  From EmpProjectTasks
Order by Task ASC

12.

Select Upper (EmpName)
From Employees

13.

Select Distinct Job
From Employees

14.

SELECT EmpName, salary, salary * 0.25 AS bonus
FROM employees


15.

Select CONCAT ( EmpName, 'Works as', Job) As Employees
From Employees

16.

SELECT StartDate, DATEPART(WEEKDAY, StartDate) AS day_of_week
FROM projects

17.

SELECT Email, CHARINDEX('@', Email) AS position_of_at_symbol
FROM clients;

18.

Select Left (ClientName,3) As Firstthree from Clients

19.

SELECT Actual_Enddate, DATEADD(MONTH, 3, Actual_Enddate) AS review_date
FROM projects;

--Intermediate--

1.

Select Count (*) As 'CountClients'
From Clients 

2.

SELECT COUNT(*) AS number_of_employees, SUM(Salary) AS total_salary
FROM Employees;


3.

Select Job, Max (Salary)
From Employees Group BY Job 

4.

Select DeptNo, Min (Salary)
From Employees Group by DeptNo

5.


Select EmpNo, Avg (Salary)
as Average_Salary
From Employees 
Group by EmpNo

6.

Select Sum (Budget)
From Projects 

7.

Select Count ('Coding')
From EmpProjectTasks 

8.

Select Employees. EmpName, Departments.Deptno, Employees.Salary
From Employees
Inner Join Departments ON Employees.DeptNo= Departments.DeptNo

9.

Select Clients.ClientName, Projects.ProjectID,Projects.StartDate,Projects.Budget
From Clients
Inner Join Projects On Clients. ClientID=Projects.ClientID

10.

Select Employees. EmpName, Departments.DName, Employees.Job
From Employees
Inner Join Departments ON Employees.DeptNo= Departments.DeptNo

11.

Select Employees.EmpName, EmpProjectTasks.Project_ID, EmpProjectTasks.Task
From Employees as Employees
Join EmpProjectTasks as EmpProjectTasks 
On Employees.EmpNo = EmpProjectTasks.EmpNo
Where Task In ('System Analysis')

12.

SELECT Job, COUNT(*) AS number_of_employees
FROM Employees
GROUP BY Job;


13.

Select E.EmpNo
From Employees as E 
Except
Select E.EmpNo
From EmpProjectTasks as E 

14.

Select E.EmpNo
From Employees as E 
Union 
Select E.EmpNo
From EmpProjectTasks as E


15.

Select E.EmpNo
From Employees as E 
Union all 
Select E.EmpNo
From EmpProjectTasks as E


---Advance---

1.

Select*From Projects
Where Budget > ('100000')

2.

Select*From Employees
Where Job   IN ('Desinger ')


3.

Select Employees. EmpName, Employees. Job, Employees. EmpNo, EmpProjectTasks. Task
From Employees as Employees
Join EmpProjectTasks as EmpProjectTasks
On Employees.EmpNo= EmpProjectTasks.EmpNo
Where Task In ('Code Change')


4.

Select Employees. EmpName, Employees. Job, Employees. EmpNo, EmpProjectTasks. Task, EmpProjectTasks.Status
From Employees as Employees
Join EmpProjectTasks as EmpProjectTasks
On Employees.EmpNo= EmpProjectTasks.EmpNo
Where Status In ('In Progress')


5.

Select EmpName, Job, Max (Salary), DeptNo
From Employees 
Inner Join Departments  
On Employees.DeptNo=Departments.Deptno 
GROUP by Job 


6.
Create Procedure CLIENTS_PROJECTS 
AS
Drop Table IF EXISTS  #CLIENTS_PROJECTS
Create Table #CLIENTS_PROJECTS
(ClientID Int Primary Key, CName Varchar (50), Address Varchar (70), Business Varchar (50), Descr Varchar (50), Budget Int )

Insert Into #CLIENTS_PROJECTS
Select Clients. ClientID, Clients.ClientName, Clients.Address, Clients. Business, Projects.Deser, Projects.Budget
From Clients as Clients 
Join Projects as Projects 
On Clients. ClientID= Projects.ClientID 


Select*
From #CLIENTS_PROJECTS 
GO;

Drop Procedure CLIENTS_PROJECTS 



7.

Select EmpName, DeptNo, Task, Salary,
CASE
    When Task= 'Testing' Then Salary+(Salary*.15)
    Else Salary+(Salary*.1)
    END AS SalaryRaise
    From Employees
    Join EmpProjectTasks
    On Employees.EmpNo= EmpProjectTasks.EmpNo 

8.

Create Procedure DEPT_EMP 
As
Drop table If Exists #DEPT_EMP
Create Table #DEPT_EMP
(DeptNo Int Primary key, DName varchar (50), Loc Varchar (50), EmpName Varchar (50),Job Varchar (50), Salary Int)

Insert Into #DEPT_EMP
Select Employees.EmpName, Employees.Job, Employees.Salary, Departments. Deptno,Departments.DName,Departments. Loc
From Employees as Employees
Join Departments as Departments
On Employees.DeptNo=Departments.Deptno 

Select*
From #DEPT_EMP
Go;


Drop Procedure  DEPT_EMP 

9.

CREATE SYNONYM EPT FOR EmpProjectTasks;



