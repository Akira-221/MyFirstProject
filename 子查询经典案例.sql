#1、查询工资最低的员工信息：last_name salary

SELECT last_name,salary FROM employees
	WHERE salary = (SELECT MIN(salary) FROM employees);

#2、查询平均工资最低的部门信息

SELECT * FROM departments 
WHERE department_id = (SELECT department_id 
FROM employees 
GROUP BY department_id
HAVING AVG(salary)=
(SELECT MIN(ag)FROM
(SELECT AVG(salary) ag,department_id FROM employees GROUP BY department_id) ag_dep)
);

SELECT * FROM departments 
WHERE department_id=(SELECT department_id FROM employees GROUP BY department_id ORDER BY AVG(salary) LIMIT 1);

#3、查询平均工资最低的部门信息和该部门的平均工资

SELECT d.* ,ag FROM departments d
INNER JOIN (SELECT AVG(salary) ag,department_id FROM employees GROUP BY department_id ORDER BY AVG(salary) LIMIT 1) ag_dep
ON d.`department_id`=ag_dep.department_id
WHERE d.department_id=(SELECT department_id FROM employees GROUP BY department_id ORDER BY AVG(salary) LIMIT 1);

#4、查询平均工资最高的job 信息

SELECT * FROM jobs 
WHERE job_id = (SELECT job_id FROM employees GROUP BY department_id ORDER BY AVG(salary) DESC LIMIT 1);

#5、查询平均工资高于公司平均工资的部门有哪些

SELECT department_id,AVG(salary) FROM employees
GROUP BY department_id
HAVING AVG(salary)>(SELECT AVG(salary) FROM employees);

#6、查询出公司中所有manager  的详细信息

SELECT * FROM employees 
WHERE employee_id IN (SELECT DISTINCT manager_id FROM employees);

#7、各个部门中，最高工资中最低的那个部门，最低工资是多少

SELECT MIN(salary) FROM employees GROUP BY department_id
HAVING MAX(salary)<= ALL(SELECT department_id,MAX(salary) FROM employees GROUP BY department_id);


#8、查询平均工资最高的部门的manager的详细信息：last_name department_id email salary

SELECT last_name,department_id,email,salary FROM employees
WHERE employee_id = (SELECT manager_id FROM employees GROUP BY department_id ORDER BY AVG(salary) DESC LIMIT 1,1);


