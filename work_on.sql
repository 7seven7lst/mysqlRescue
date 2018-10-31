CREATE DATABASE IF NOT EXISTS work;

DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS works_on;

CREATE TABLE IF NOT EXISTS department (
  dept_no varchar(255) NOT NULL,
  dept_name varchar(255) NOT NULL,
  location varchar(255) NOT NULL,
  PRIMARY KEY (dept_no)
);

CREATE TABLE IF NOT EXISTS employee (
  emp_no varchar(255) NOT NULL,
  emp_fname varchar(255) NOT NULL,
  emp_lname varchar(255) NOT NULL,
  dept_no varchar(255) NOT NULL,
  PRIMARY KEY (emp_no),
  FOREIGN KEY (dept_no)
        REFERENCES department(dept_no)
);

CREATE TABLE IF NOT EXISTS project (
  project_no varchar(255) NOT NULL,
  project_name varchar(255) NOT NULL,
  budget float NULL,
  PRIMARY KEY (project_no)
);

CREATE TABLE IF NOT EXISTS works_on (
  emp_no varchar(255) NOT NULL,
  project_no varchar(255) NOT NULL,
  job varchar(255) NULL,
  enter_date Date NOT NULL,
  PRIMARY KEY (emp_no, project_no),
  FOREIGN KEY (emp_no)
        REFERENCES employee(emp_no),
  FOREIGN KEY (project_no)
        REFERENCES project(project_no)
);

INSERT INTO department (dept_no, dept_name, location) VALUES
('d1', 'Research', 'Dallas'), ('d2', 'Accounting', 'Seattle'), ('d3', 'Marketing', 'Dallas');

INSERT INTO employee (emp_no, emp_fname, emp_lname, dept_no) VALUES
('25348','Matthew', 'Smith', 'd3'),
('10102','Ann', 'Jones', 'd3'),
('18316','John', 'Barrimore', 'd1'),
('29346','James', 'James', 'd2'),
('9031','Elke', 'Hansel', 'd2'),
('2581','Elsa', 'Bartoni', 'd2'),
('28559','Sybill', 'Moser', 'd1');

INSERT INTO project (project_no, project_name, budget) VALUES
('p1','Apollo', 120000),
('p2','Gemini', 95000),
('p3','Mercury', 186500);

INSERT INTO works_on (emp_no, project_no, job, enter_date) VALUES
('10102', 'p1', 'Analyst', '2006-10-01'),
('10102', 'p3', 'Manager', '2008-01-01'),
('25348', 'p2', 'Clerk', '2007-02-15'),
('18316', 'p2', NULL, '2007-06-01'),
('29346', 'p2', NULL, '2006-12-15'),
('2581', 'p3', 'Analyst', '2007-10-15'),
('9031', 'p1', 'Manager', '2007-04-15'),
('28559', 'p1', NULL, '2007-08-01'),
('28559', 'p2', 'Clerk', '2008-02-01'),
('9031', 'p3', 'Clerk', '2006-11-15'),
('29346', 'p1', 'Clerk', '2007-01-04');
