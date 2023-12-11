SELECT * FROM SCOTT.emp;
SELECT * FROM SCOTT.DEPT;
/*
ASSIGNMENT 2:QUERIES ON WHERE CLAUSE
Q1) WAQTD all the salary of employee if the salary is greater than 1500.
Q2) WAQTD all the details of the employee if designation is Manager.
Q3) WAQTD Employee name ,Department no., Date of joining if the date of joining is “01-JAN-1995”.
Q4) WAQTD all the details of employee only if they were hired after the year 1995.
Q5) WAQTD department name, department number for all the department which is located in NEW YORK.
Q6) WAQTD Department number along with location whose Department is Research.
Q7) WAQTD Salary ,Annual salary , Quarter salary of all the employees if salary is greater than commission.
Q8) WAQTD Employee name , Monthly salary , Job of all the employees who’s monthly salary is greater than 2000.
Q9) WAQTD all the details of employees if the department number is 20.
Q10) WAQTD Salary , Annual salary, 10% Hike in Quarter salary if and only if designation is Clerk.
Q11) WAQTD details of the employee who’s name is Ford.
Q12) WAQTD Annual salary , 1000 rs bonus in annual salary along with monthly salary if department number is 30.
Q13) WAQTD all the details of department if location is BOSTON.
Q14) WAQTD Salary , Quarter salary , 5% decrement in monthly salary if the job is Manager.
Q15) WAQTD all the details of all the employees whose commission is less than salary.
*/
SELECT SAL FROM EMP WHERE SAL>1500;
SELECT * FROM EMP WHERE JOB='MANAGER';
SELECT ENAME, DEPTNO, HIREDATE FROM EMP WHERE HIREDATE = 1995-01-01;
SELECT * FROM EMP WHERE HIREDATE>1995-12-31;
SELECT DNAME,DEPTNO FROM DEPT WHERE LOC = 'NEW YORK';
SELECT DEPTNO, LOC FROM DEPT WHERE DNAME='RESEARCH';
SELECT SAL, SAL*12, SAL*3 FROM EMP WHERE SAL>COMM;
SELECT ENAME, SAL, JOB FROM EMP WHERE SAL>2000;
SELECT * FROM EMP WHERE DEPTNO =20;
SELECT SAL, SAL*12, SAL*3+SAL*3*0.10 FROM EMP WHERE JOB='CLERK';
SELECT * FROM EMP WHERE ENAME='FORD';
SELECT SAL*12, SAL*12+1000, SAL+1000 FROM EMP WHERE DEPTNO=30;
SELECT * FROM DEPT WHERE LOC = 'BOSTON';
SELECT SAL, SAL*3, SAL-SAL*0.05 FROM EMP WHERE JOB = 'MANAGER';
SELECT * FROM EMP WHERE COMM<SAL;


