#进阶5：分组查询

#引入：查询每个部门的平均工资
SELECT AVG(salary) FROM employees;

/*

可以使用 group by 子句将表中的数据分成若干组
语法：
	select column，group_function(column要求出现在group by后面)
	from table
	【where condition】
	group by group_by_expression分组条件
	【order by column】;
注意：
	查询列表必须特殊，要求是分组函数和group by 后面出现的字段
特点：
	1、分组查询中的筛选条件分为两类
			数据源		位置		     关键字
	分组前筛选	原始表		group by子句前面     where
	分组后筛选 	分组后的结果集 	group by子句后面     having
	
	①分组函数做条件肯定是放在having子句中
	②能用分组前筛选的优先考虑使用分组前筛选
	
	2、group by子句支持单个字段分组、多个字段分组（多个字段之间用逗号隔开没有顺序要求）、表达式或函数分组（用的较少）
	
	3、也可以添加排序（排序放在整个分组查询最后）
	
	
*/

#案例1：查询每个工种的最高工资 
SELECT job_id,MAX(salary)
FROM employees
GROUP BY job_id;
	
#案例2：查询每个位置上的部门个数
SELECT location_id,COUNT(*)
FROM departments
GROUP BY location_id;

#添加筛选条件

#案例3：查询邮箱中包含a字符的，每个部门的平均工资
SELECT department_id,AVG(salary)
FROM employees
WHERE email LIKE '%a%'
GROUP BY department_id;

#案例4：查询有奖金的每个领导手下员工的最高工资
SELECT manager_id,MAX(salary)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY manager_id;

#添加复杂(分组后)的筛选条件

#案例1：查询哪个部门的员工个数>2

#①查询每个部门的员工个数
SELECT COUNT(*),department_id
FROM employees
GROUP BY department_id;

#②根据①的结果进行筛选
SELECT COUNT(*),department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*)>2;

#案例2：查询每个工种有奖金的员工的最高工资>12000
SELECT job_id,MAX(salary)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY job_id
HAVING MAX(salary)>12000;

#案例3：查询领导编号>102的每个领导手下的最低工资>5000的领导编号，及其最低工资
SELECT manager_id,MIN(salary)
FROM employees
WHERE manager_id>102
GROUP BY manager_id
HAVING MIN(salary>5000);

#按表达式/函数分组

#案例1：按员工姓名的长度分组，查询每一组员工个数，筛选员工个数>5的有哪些
SELECT COUNT(last_name) c
FROM employees
GROUP BY LENGTH(last_name)
HAVING c>5;

#group by、having 子句后支持别名

#按多个字段分组
#案例1：查询每个部门每个工种的员工的平均工资
SELECT department_id,job_id,AVG(salary)
FROM employees
GROUP BY department_id,job_id;

#添加排序
#案例1：查询每个部门每个工种的员工的平均工资，并按平均工资高低显示
SELECT department_id,job_id,AVG(salary)
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id,job_id
HAVING AVG(salary)>10000
ORDER BY AVG(salary) DESC;









