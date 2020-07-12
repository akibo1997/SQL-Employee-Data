-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employee" (
    "Employee_num" int   NOT NULL,
    "Employee_title" varchar   NOT NULL,
    "Birthday" date   NOT NULL,
    "First_Name" varchar   NOT NULL,
    "Last_Name" varchar   NOT NULL,
    "Sex" varchar   NOT NULL,
    "Hire_Date" date   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "Employee_num"
     )
);

CREATE TABLE "Salaries" (
    "Employee_num" int   NOT NULL,
    "Salary" int   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Employee_num"
     )
);

CREATE TABLE "Titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Department_Mgr" (
    "Dept_no" varchar   NOT NULL,
    "Employee_num" int   NOT NULL,
    CONSTRAINT "pk_Department_Mgr" PRIMARY KEY (
        "Dept_no","Employee_num"
     )
);

CREATE TABLE "Department_Employees" (
    "Employee_num" int   NOT NULL,
    "Departments" varchar   NOT NULL,
    CONSTRAINT "pk_Department_Employees" PRIMARY KEY (
        "Employee_num","Departments"
     )
);

CREATE TABLE "Departments" (
    "Department_no" varchar   NOT NULL,
    "Department_name" varchar   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Department_no"
     )
);

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Employee_num" FOREIGN KEY("Employee_num")
REFERENCES "Employee" ("Employee_num");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_title_id" FOREIGN KEY("title_id")
REFERENCES "Employee" ("Employee_title");

ALTER TABLE "Department_Mgr" ADD CONSTRAINT "fk_Department_Mgr_Employee_num" FOREIGN KEY("Employee_num")
REFERENCES "Employee" ("Employee_num");

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_Employee_num" FOREIGN KEY("Employee_num")
REFERENCES "Employee" ("Employee_num");

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_Departments" FOREIGN KEY("Departments")
REFERENCES "Departments" ("Department_no");

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_Department_no" FOREIGN KEY("Department_no")
REFERENCES "Department_Mgr" ("Dept_no");

