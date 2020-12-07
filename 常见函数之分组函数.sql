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

SELECT SUM(last_name),AVG(last_name) FROM employees;