CREATE TABLE Title (
    ID varchar(5) NOT NULL PRIMARY KEY,
    Name varchar(20) NOT NULL
);

CREATE TABLE Employee (
	ID int NOT NULL PRIMARY KEY,
	TitleID varchar(5),
	FOREIGN KEY (TitleID) REFERENCES Title(ID),
	Birth_date date,
	First_name varchar(20) NOT NULL,
	Last_name varchar(20) NOT NULL,
	Sex varchar(3),
	Hire_date date
);

CREATE TABLE Department (
	ID varchar(5) NOT NULL PRIMARY KEY,
	Name varchar(20) NOT NULL
);

CREATE TABLE Salary (
	EmployeeID int PRIMARY KEY,
	FOREIGN KEY (EmployeeID) REFERENCES Employee(ID),
	Amount money
);

CREATE TABLE Dep_Manager (
	DepartmentID varchar(5),
	FOREIGN KEY (DepartmentID) REFERENCES Department(ID),
	EmployeeID int,
	FOREIGN KEY (EmployeeID) REFERENCES Employee(ID),
	PRIMARY KEY (EmployeeID)
);

CREATE TABLE Dep_Employee (
	EmployeeID int,
	FOREIGN KEY (EmployeeID) REFERENCES Employee(ID),
	DepartmentID varchar(5),
	FOREIGN KEY (DepartmentID) REFERENCES Department(ID),
	PRIMARY KEY (EmployeeID, DepartmentID)
);
