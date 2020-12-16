#进阶7：子查询
/*
含义：
	出现在其他语句中的select语句，称为子查询或内查询
	外部的查询语句（内部嵌套其他select语句的查询），称为主查询或外查询

示例：
	select first_name from employees where department_id in (select department_id from departments
	where location_id = 1700)
	
分类：
	按子查询出现的位置：
		select 后面：
			只支持标量子查询
		from 后面：
			支持表子查询
		where或having后面：☆
			支持标量子查询（单行） ☆ 
			列子查询（多行） ☆ 
			行子查询（用的较少）
		exists后面（相关子查询）：
			支持表子查询
	按功能不同（结果集的行列数不同）：
		标量子查询（1行1列）
		列子查询/多行子查询（1列多行）
		行子查询（多行多列，其中1行多列居多）
		表子查询（一般为多行多列）
*/

#一、where 或 having 后面
/*
特点：
	①子查询放在小括号内
	②子查询一般放在条件的右侧
	③标量子查询，一般搭配单行操作符使用
	< > <= >= = <>
	列子查询，一般搭配多行操作符使用
	 in、any/some、all
	④子查询的执行优先于主查询执行，主查询的条件用到了子查询的结果 
*/
#1、标量子查询（单行子查询）

#案例1：谁的工资比 Abel 高
SELECT * FROM employees WHERE salary>
	(SELECT salary FROM employees WHERE last_name = 'Abel');
	
#案例2：返回job_id 与141号员工相同，salary 比143号员工多的员工姓名、job_id、salary
SELECT last_name,job_id,salary FROM employees 
	WHERE job_id = ( 
	SELECT job_id FROM employees WHERE employee_id = 141)
	AND salary > (
	SELECT salary FROM employees WHERE employee_id = 143);

#案例3：返回公司工资最少的员工的last_name,job_id,salary
SELECT last_name,job_id,salary FROM employees 
	WHERE salary = (
	SELECT MIN(salary) FROM employees);
	
#案例4：查询最低工资大于50号部门最低工资的部门id和其最低工资
SELECT department_id,MIN(salary) FROM employees 
	GROUP BY department_id
	HAVING MIN(salary) > (
	SELECT MIN(salary) FROM employees WHERE department_id = 50);

#非法使用标量子查询

#2、列子查询（多行子查询）
#3、行子查询（多行多列）