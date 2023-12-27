SELECT * FROM EMP;
SELECT * FROM DEPT;

/* ASSIGNMENT 7: QUERIES ON SUBQUERY CASE*/
/*1.WRITE A QUERY TO DISPLAY THE EMPLOYEE NAMES WHO ARE EARNING MORE THAN SMITH.*/
SELECT ENAME
FROM EMP
WHERE SAL > (SELECT SAL
             FROM EMP
			 WHERE ENAME = 'SMITH');
/*2.WRITE A QUERY TO DISPLAY ALL THE EMPLOYEES WHO’S DEPT NUMBER IS SAME AS SCOTT.*/
SELECT *
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
				WHERE ENAME = 'SCOTT');
/*3.LIST THE EMPLOYEES WHO HAS SALARY GREATER THAN MILLER.*/
SELECT *
FROM EMP
WHERE SAL > (SELECT SAL
             FROM EMP 
             WHERE ENAME = 'MILLER');
/*4.WRITE A QUERY TO DISPLAY ALL THE EMPLOYEE WHOSE JOB IS NOT SAME AS ALLEN AND SALARY IS GREATER THAN MARTIN.*/
SELECT *
FROM EMP 
WHERE JOB != (SELECT JOB
			  FROM EMP
              WHERE ENAME = 'ALLEN') AND
	  SAL > (SELECT SAL
             FROM EMP
             WHERE ENAME = 'MARTIN');
/*5.LIST ALL THE EMPLOYEES WHOSE JOB IS SAME AS JONES AND THEIR SALARY LESSER THAN SCOTT.*/
SELECT *
FROM EMP
WHERE JOB = (SELECT JOB
             FROM EMP
             WHERE ENAME = 'JONES') AND
	  SAL < (SELECT SAL 
             FROM EMP
             WHERE ENAME = 'SCOTT');
/*6.DISPLAY ALL THE EMPLOYEES WHO ARE JOINED AFTER BLAKE.*/
SELECT * 
FROM EMP
WHERE HIREDATE > (SELECT HIREDATE
				FROM EMP
                WHERE ENAME = 'BLAKE');
/*7.WRITE A QUERY TO DISPLAY THE EMPLOYEE INFORMATION WHO IS NOT TAKING COMMISSION AND JOINED COMPANY AFTER ALLEN.*/
SELECT *
FROM EMP
WHERE COMM IS NULL AND
      HIREDATE > (SELECT HIREDATE
                  FROM EMP
                  WHERE ENAME = 'ALLEN');
/*8.DISPLAY DETAILS OF EMPLOYEES ALONG WITH HIKE OF 35% IN SALARY WORKING AS PRESIDENT AND EARNING MORE THAN SMITH.*/
SELECT *, SAL+SAL*0.35
FROM EMP
WHERE JOB = 'PRESIDENT' AND 
      SAL > (SELECT SAL
			 FROM EMP
             WHERE ENAME = 'SMITH');
/*9.DISPLAY NAMES OF EMPLOYEES WHOSE COMMISSION IS MORE THAN SALARY AND HIRED BEFORE KING.*/
SELECT ENAME
FROM ENAME
WHERE COMM > SAL AND
      HIREDATE < (SELECT HIREDATE
                  FROM EMP
                  WHERE ENAME = 'KING');
/*10.LIST THE EMPLOYEES WHOSE DAILY SALARY IS GREATER THAN ALLEN AND WHO ARE JOINED BEFORE MILLER ONLY.*/
SELECT *
FROM EMP
WHERE SAL/31 > (SELECT SAL/31
                FROM EMP
                WHERE ENAME = 'ALLEN') AND
	  HIREDATE < (SELECT HIREDATE
                  FROM EMP
                  WHERE ENAME = 'MILLER');
/*11.DISPLAY NUMBER OF EMPLOYEES WHOSE COMMISSION IS MORE THAN SALARY AND EARNING MORE THAN SMITH.*/
SELECT COUNT(*)
FROM EMP
WHERE COMM > SAL AND
	  SAL > (SELECT SAL
             FROM EMP
             WHERE ENAME = 'SMITH');
/*12.DISPLAY ALL THE EMPLOYEES WHOSE NAME START WITH 'S' AND HAVING SALARY MORE THAN 'ALLEN' AND LESS THAN ‘FORD’.*/
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%' AND
      SAL > (SELECT SAL
			 FROM EMP
             WHERE ENAME = ' ALLEN') AND
	  SAL < (SELECT SAL
             FROM EMP
             WHERE ENAME = 'FORD');
/*13.DISPLAY THE DEPARTMENT NAMES THAT ARE HAVING ATLEAST ONE L IN IT.*/
SELECT DNAME
FROM DEPT
WHERE DNAME LIKE '%A%';
/*14.DISPLAY THE MANAGER REPORTING , JOB AND DEPARTMENT NUMBER FOR THOSE WHO DON'T HAVE COMMISSION.*/
SELECT MGR, JOB, DEPTNO
FROM EMP
WHERE COMM IS NULL;
/*15.WAQTD THE DETAILS OF ALL THE EMPLOYEES WHO ARE HIRED AFTER FORD AND DEPARTMENT IS SAME AS ADAMS.*/
SELECT *
FROM EMP
WHERE HIREDATE > (SELECT HIREDATE
                  FROM EMP
                  WHERE ENAME = 'FORD') AND
	  DEPTNO = (SELECT DEPTNO 
                FROM EMP
                WHERE ENAME = 'ADAMS');
/*16.WAQTD ALL THE DETAILS OF THE EMPLOYEES WHOSE SALARY IS GREATER THAN OR EQUAL TO 2000 AND LESS THAN 4000 AND IS WORKING AS MANAGER,CLERK,SALESMAN AND THEY ARE HIRED AFTER ADAMS.*/
SELECT * 
FROM EMP
WHERE SAL BETWEEN 2000 AND 3999 AND
      JOB IN ('MANAGER', 'CLERK','SALESMAN') AND
      HIREDATE > (SELECT HIREDATE 
                  FROM EMP
                  WHERE ENAME = 'ADAMS');
/*17.WAQTD ALL THE DETAILS OF ALL THE EMPLOYEES WHO ARE GETTING SOME COMMISSION AND THERE SALARY IS LESS THAN KING AND SAME DEPARTMENT AS SMITH.*/
SELECT * 
FROM EMP
WHERE COMM IS NOT NULL AND 
      SAL < (SELECT SAL
             FROM EMP
             WHERE ENAME = 'KING') AND 
	  DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'SMITH');
/*18.WAQTD ALL THE DETAILS OF ALL THE EMPLOYEE WHOSE DEPARTMENT IS 10,20 AND DESIGNATION IS SAME AS ADAMS AND SALARY IS MORE THAN ALLEN AND LESS THAN KING.*/
SELECT *
FROM EMP
WHERE DEPTNO IN (10,20) AND
	  JOB = (SELECT JOB 
             FROM EMP
             WHERE ENAME = 'ADAMS') AND 
	  SAL > (SELECT SAL
             FROM EMP
             WHERE ENAME = 'ALLEN') AND
	  SAL < (SELECT SAL
             FROM EMP
             WHERE ENAME = 'KING');
/*19.WAQTD ALL THE DETAILS OF THE EMPLOYEES WHOSE NAME HAS EXACTLY ONE S IN HIS NAME AND SALARY IS MORE THAN SMITH AND ARE HIRED AFTER ADAMS.*/
SELECT * 
FROM EMP
WHERE ENAME LIKE '%S%' AND ENAME NOT LIKE '%S%S%' AND
      SAL > (SELECT SAL
             FROM EMP
             WHERE ENAME = 'SMITH') AND
	  HIREDATE > (SELECT HIREDATE
                  FROM EMP
                  WHERE ENAME = 'ADAMS');
/*20.WAQTD ALL THE DETAILS OF THE EMPLOYESS WHOSE DAILY SALARY IS GRETAER THAN ALLEN AND WHO ARE JOINED BEFORE MILLER.*/
SELECT * 
FROM EMP
WHERE SAL/31 > (SELECT SAL/31
                FROM EMP
                WHERE ENAME = 'ALLEN') AND
	  HIREDATE < (SELECT HIREDATE
                  FROM EMP
                  WHERE ENAME = 'MILLER');

/*WAQTD DETAILS OF EMPLOYEES WHOSE SALARY LESS THAN ADAMS AND GREATER THAN ALLEN USING SPECIAL OPERATORS.*/
SELECT *
FROM EMP
WHERE SAL NOT BETWEEN (SELECT SAL
                       FROM EMP
					   WHERE ENAME = 'ADAMS') AND
	                  (SELECT SAL
					   FROM EMP
                       WHERE ENAME = 'ALLEN');
