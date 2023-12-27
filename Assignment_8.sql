SELECT * FROM SCOTT.dept;
SELECT * FROM SCOTT.EMP;
/*ASSIGNMENT 7: SUBQUERY (CASE_2)*/
/*1 DISPLAY ALL THE EMPLOYEES WHOSE DEPARTMENT NAMES ENDING 'S'.*/
SELECT *
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME LIKE '%S');
/*2 WRITE A QUERY TO DISPLAY ALL THE EMPLOYEES IN 'OPERATIONS’ AND ‘ACCOUNTING' DEPT.*/
SELECT *
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME IN ('OPERATIONS','ACCOUNTING'));
/*3 LIST EMPLOYEES WHO LOCATED IN CHICAGO AND THEIR COMMISSION IS ZERO.*/
SELECT *
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC = 'CHICAGO') AND 
                      COMM = 0;
/*4 LIST EMPLOYEES WHO ARE WORKING IN RESEARCH DEPARTMENT AND THEY ARE MANAGER.*/
SELECT *
FROM EMP
WHERE JOB = 'MANAGER' AND
      DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'RESEARCH');
/*5 DISPLAY DEPARTMENT NAME OF THE EMPLOYEES WHO EARN COMMISSION.*/
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP 
                WHERE COMM IS NOT NULL);
/*6 DISPLAY THE DEPARTMENT NUMBER WHO IS WORKING IN SALES DEPARTMENT AND THEY ARE MANAGER.*/
SELECT DEPTNO
FROM DEPT
WHERE DNAME = 'SALES' AND
      DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE JOB = 'MANAGER');
/*7 DISPLAY HIREDATE AND JOB OF ALL THE EMPLOYEES WORKING FOR SALES.*/
SELECT HIREDATE, JOB
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                 FROM DEPT
                 WHERE DNAME = 'SALES');
/*8 DISPLAY LOCATION AND DNAME OF EMPLOYEE WHO ARE WORKING AS PRESIDENT.*/
SELECT LOC, DNAME
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE JOB = 'PRESIDENT');
/*9 DISPLAY THE DNAME THAT ARE HAVING CLERK IN IT.*/
SELECT DNAME 
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE JOB = 'CLERK');
/*10 DISPLAY THE EMPLOYEES WHOSE DNAME IS HAVING AT LEAST TWO 'E' INIT.*/
SELECT *
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO 
                FROM DEPT
                WHERE DNAME LIKE '%E%E%');
/*11  DISPLAY ALL THE EMPLOYEES WHO ARE WORKING FOR CHICAGO.*/
SELECT *
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC = 'CHICAGO');
/*12 LIST THE DEPARTMENT NAMES THAT ARE HAVING SALESMAN.*/
SELECT DNAME 
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE JOB = 'SALESMAN');
/*13 DISPLAY THE LOCATION OF ALL THE DEAPRTMENTS WHICH HAVE EMPLOYEES JOINED IN THE YEAR 81.*/
SELECT LOC 
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
				FROM EMP
                WHERE HIREDATE LIKE '1981-%-%');
/*14 DISPLAY ALL THE EMPLOYEE INFORMATION WHO ARE LIVING IN A LOCATION WHICH IS HAVING AT LEAST 2 'O' IN IT.*/
SELECT *
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC LIKE '%O%O%');
/*15 LIST THE NUMBER OF EMPLOYEES WHOSE JOB IS SALESMAN WORKING FOR NEWYORK AND CHICAGO.*/
SELECT COUNT(*)
FROM EMP
WHERE JOB = 'SALESMAN' AND
	  DEPTNO IN (SELECT DEPTNO
                FROM DEPT
                WHERE LOC IN ('NEW YORK','CHICAGO'));
/*16 LIST THE DEPARTMENT NAMES IN WHICH THE EMPLOYEES ARE HIRED BETWEEN 1ST OF JAN 1981 AND 31ST DEC 1982 WITH SALARY MORE THAN 1800.*/
SELECT DNAME 
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM emp
                WHERE HIREDATE BETWEEN '1981-01-01' AND '1982-12-31' AND SAL > 1800);
/*17 DISPLAY LOCATION OF THE EMPLOYEE WHO EARN COMMISSION.*/
SELECT LOC 
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
				FROM EMP
                WHERE COMM IS NOT NULL);
/*18 DISPLAY EMPLOYEES LOCATION WHO HAS SOME COMMISSION.*/
SELECT LOC 
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
				FROM EMP
                WHERE COMM IS NOT NULL);
/*19 DISPLAY ALL THE EMPLOYEES WHOSE JOB SAME AS 'SMITH' AND DEPARTMENT SAME AS 'JONES' AND SALARY MORE THAN 'TURNER'.*/
SELECT *
FROM EMP
WHERE JOB = (SELECT JOB
             FROM EMP
             WHERE ENAME = 'SMITH') AND
	  DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'JONES') AND
	  SAL > (SELECT SAL
             FROM EMP
             WHERE ENAME = 'TURNER');
/*20 DISPLAY ALL THE EMPLOYEES WORKING FOR DALLAS.*/
SELECT *
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC = 'DALLAS');
/*21 DISPLAY THE LOCATION OF AN EMPLOYEE IN ACCOUNTING DEPARTMENT.*/
SELECT LOC 
FROM DEPT
WHERE DNAME = 'ACCOUNTING';
/*22 DISPLAY THE DEPARTMENT INFORMATION OF EMPLOYEE WHO IS WORKING FOR NEW YORK LOCATION.*/
SELECT *
FROM DEPT
WHERE LOC = 'NEW YORK';
/*23 DISPLAY ALL THE CLERKS AND ANALYST WHO ARE NOT WORKING FOR 'DALLAS'.*/
SELECT *
FROM EMP
WHERE JOB IN ('CLERK','ANALYST') AND 
      DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC = 'DALLAS');
/*24 WAQTD ALL THE DETAILS OF THE EMPLOYEES WHO ARE HIRED AFTER 1956 AND THEY ARE WORKING IN THE DEPARTMENT RESEARCH.*/
SELECT *
FROM EMP
WHERE HIREDATE > '1956-12-31' AND 
      DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'RESEARCH');
/* 25 WAQTD THE 5TH MAXIMUM SALARY.*/
SELECT MAX(SAL)
FROM EMP
WHERE SAL < (SELECT MAX(SAL)
             FROM EMP
             WHERE SAL < (SELECT MAX(SAL)
                          FROM EMP
                          WHERE SAL < (SELECT MAX(SAL)
                                       FROM EMP
                                       WHERE SAL < (SELECT MAX(SAL)
                                                    FROM EMP))));
/*26 WAQTD THE 5TH MINIMUM SALARY.*/
SELECT MIN(SAL)
FROM EMP
WHERE SAL > (SELECT MIN(SAL)
		     FROM EMP
             WHERE SAL > (SELECT MIN(SAL)
                                   FROM EMP
								   WHERE SAL > (SELECT MIN(SAL)
                                                FROM EMP
                                                WHERE SAL > (SELECT MIN(SAL)
                                                             FROM EMP))));
/*27 WAQTD THE 7TH MAXIMUM SALARY.*/
SELECT MAX(SAL)
FROM EMP
WHERE SAL < (SELECT MAX(SAL)
			 FROM EMP
             WHERE SAL < (SELECT MAX(SAL)
                          FROM EMP
                          WHERE SAL < (SELECT MAX(SAL)
                                       FROM EMP
                                       WHERE SAL < (SELECT MAX(SAL)
                                                    FROM EMP
                                                    WHERE SAL < (SELECT MAX(SAL)
                                                                 FROM EMP
                                                                 WHERE SAL < (SELECT MAX(SAL)
                                                                              FROM EMP))))));
/*28 WAQTD THE 7TH MINIMUM SALARY.*/
SELECT MIN(SAL)
FROM EMP 
WHERE SAL > (SELECT MIN(SAL)
             FROM EMP 
             WHERE SAL > (SELECT MIN(SAL)
                          FROM EMP 
                          WHERE SAL > (SELECT MIN(SAL)
                                       FROM EMP 
                                       WHERE SAL > (SELECT MIN(SAL)
                                                    FROM EMP 
                                                    WHERE SAL > (SELECT MIN(SAL)
																 FROM EMP 
																 WHERE SAL > (SELECT MIN(SAL)
                                                                              FROM EMP)))))); 
/*29 WAQTD THE 10TH MAXIMUM SALARY.*/
SELECT MAX(SAL)
FROM EMP
WHERE SAL < (SELECT MAX(SAL)
             FROM EMP
             WHERE SAL < (SELECT MAX(SAL)
                          FROM EMP
                          WHERE SAL < (SELECT MAX(SAL)
                                       FROM EMP
                                       WHERE SAL < (SELECT MAX(SAL)
                                                    FROM EMP
                                                    WHERE SAL < (SELECT MAX(SAL)
                                                                 FROM EMP
                                                                 WHERE SAL < (SELECT MAX(SAL)
																              FROM EMP
                                                                              WHERE SAL < (SELECT MAX(SAL)
                                                                                           FROM EMP
                                                                                           WHERE SAL < (SELECT MAX(SAL)
                                                                                                        FROM EMP
                                                                                                        WHERE SAL < (SELECT MAX(SAL)
                                                                                                                     FROM EMP)))))))));
/*30 WAQTD THE 10TH MINIMUM SALARY.*/
SELECT MIN(SAL)
FROM EMP
WHERE SAL > (SELECT MIN(SAL)
			 FROM EMP
             WHERE SAL > (SELECT MIN(SAL)
			              FROM EMP
                          WHERE SAL >(SELECT MIN(SAL)
			                          FROM EMP
									  WHERE SAL >(SELECT MIN(SAL)
			                                      FROM EMP
                                                  WHERE SAL >(SELECT MIN(SAL)
			                                                  FROM EMP
                                                              WHERE SAL >(SELECT MIN(SAL)
			                                                              FROM EMP
                                                                          WHERE SAL >(SELECT MIN(SAL)
																		              FROM EMP
                                                                                      WHERE SAL >(SELECT MIN(SAL)
			                                                                                      FROM EMP
                                                                                                  WHERE SAL >(SELECT MIN(SAL)
			                                                                                                  FROM EMP)))))))));