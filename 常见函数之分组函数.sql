#二、分组函数
/*
功能：
	用做统计使用 又称为聚合函数或组函数
	
分类：
	sum 求和
	avg 平均值
	max 最大值
	min 最小值
	count 计算个数
	
特点：
	1、sum avg 一般用于处理数值类型
	   max min count 可以处理任何类型
	   
	2、以上分组函数都忽略null值
	
	3、可以和distinct搭配实现去重
	
	4、count函数的单独介绍
	   一般使用count(*)用做统计行数
	  
	5、和分组函数一同查询的字段要求是group by后的字段
*/

#1.简单使用
SELECT SUM(salary) FROM employees;
SELECT AVG(salary) FROM employees;
SELECT MAX(salary) FROM employees;
SELECT MIN(salary) FROM employees;
SELECT COUNT(salary) FROM employees;

SELECT SUM(salary) 和,ROUND(AVG(salary),2) 平均,MAX(salary) 最高,MIN(salary) 最低,COUNT(salary) 个数
FROM employees;

#2.参数支持哪些类型

SELECT SUM(last_name),AVG(last_name) FROM employees; #一般只支持数值型

SELECT MAX(last_name),MIN(last_name) FROM employees; #支持字符型、日期型（可比较大小）
SELECT MAX(hiredate),MIN(hiredate) FROM employees;

SELECT COUNT(commission_pct) FROM employees; #计算任何类型不为null的值

#3.忽略null

SELECT SUM(commission_pct),AVG(commission_pct),SUM(commission_pct)/35,SUM(commission_pct)/107 FROM employees; #忽略了null值

SELECT MAX(commission_pct),MIN(commission_pct) FROM employees; #忽略了null值
SELECT COUNT(commission_pct) FROM employees; #忽略了null值

#4.和distinct搭配
SELECT SUM(DISTINCT salary),SUM(salary) FROM employees;

SELECT COUNT(DISTINCT salary),COUNT(salary) FROM employees;

#5.count函数的详细介绍

SELECT COUNT(salary) FROM employees;

SELECT COUNT(*) FROM employees; #用于统计表格行数，用的较多

SELECT COUNT(1) FROM employees; #统计1的个数=相当于统计行数;1可以换成任意常量值2、''、a

/*
效率：
MYISAM 存储引擎下 count(*)效率最高
INNODB 存储引擎下 count(*)和count(1)的效率差不多，但比count(字段)要高一些，无需判断字段是否为null
*/

#6.和分组函数一同查询的字段有限制

SELECT AVG(salary),employee_id FROM employees;

