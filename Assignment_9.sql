SELECT * FROM SCOTT.emp;
SELECT * FROM SCOTT.dept;
/*ASSIGNMENT 9: EMP AND MANAGER RELATION*/
/*1.WAQTD SCOTT’S REPORTING MANAGER'S NAME */
SELECT ENAME
FROM EMP
WHERE EMPNO = (SELECT MGR
               FROM EMP
               WHERE ENAME = 'SCOTT');
/*2.WAQTD ADAMS MANAGER'S MANAGER NAME */
SELECT ENAME
FROM EMP
WHERE EMPNO = (SELECT MGR
               FROM EMP
               WHERE EMPNO = (SELECT MGR
                              FROM EMP
                              WHERE ENAME = 'ADAMS'));
/*3.WAQTD DNAME OF JONES MANAGER*/
SELECT DNAME 
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
				WHERE EMPNO = (SELECT MGR
                               FROM EMP
                               WHERE ENAME = 'JONES'));
/*4.WAQTD MILLER'S MANAGER'S SALARY*/
SELECT SAL 
FROM EMP
WHERE EMPNO = (SELECT MGR
               FROM EMP
               WHERE ENAME = 'MILLER');
/*5.WAQTD LOC OF SMITH'S MANAGER'S MANAGER.*/
SELECT LOC
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO = (SELECT MGR
                               FROM EMP
                               WHERE ENAME = 'SMITH'));
/*6.WAQTD NAME OF THE EMPLOYEES REPORTING TO BLAKE*/
SELECT ENAME
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'BLAKE');
/*7.WAQTD NUMBER OF EMPLPOYEES REPORTING TO KING */
SELECT COUNT(*)
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'KING');
/*8.WAQTD DETAILS OF THE EMPLOYEES REPORTING TO JONES.*/
SELECT *
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'JONES');
/*9.WAQTD ENAMES OF THE EMPLOYEES REPORTING TO BLAKE'S MANAGER*/
SELECT ENAME
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE EMPNO = (SELECT MGR
                            FROM EMP
                            WHERE ENAME = 'BLAKE'));
/*10.WAQTD NUMBER OF EMPLOYEES REPORTING TO FORD'S MANAGER.*/
SELECT COUNT(*)
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE EMPNO = (SELECT MGR
							FROM EMP
                            WHERE ENAME = 'FORD'));
/*11) WAQTD dname of the employee reporting to President.*/
SELECT DNAME
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE JOB = 'PRESIDENT');
/*12) WAQTD Department details of the employees who are reporting to MILLER.*/
SELECT *
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE MGR = (SELECT EMPNO 
                             FROM EMP
                             WHERE ENAME = 'MILLER'));
/*13) WAQTD Location of Adams's manager's manager. */
SELECT LOC
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO = (SELECT MGR
							   FROM EMP
                               WHERE EMPNO = (SELECT MGR
                                              FROM EMP
                                              WHERE ENAME = 'ADAMS')));
/*14) WAQTD dname of King's Manager.*/
SELECT DNAME
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO = (SELECT MGR
                               FROM EMP
                               WHERE ENAME = 'KING'));
/*15) WAQTD Name and salary given to the employees reporting To James*/
SELECT ENAME, SAL
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'JAMES');

/*To find Manager :
Select MGR in Sub Q
To find Employees REPORTING: Select EMPNO in Sub Q.
*/