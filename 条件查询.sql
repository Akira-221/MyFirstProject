#进阶2：条件查询
/*
语法：
       select 查询列表
       from 表名
       where  筛选条件;

分类：
①按条件表达式筛选

条件运算符：> < = !=/<> <= >=

②按逻辑表达式查询

逻辑运算符：&& || ！推荐使用：and or not
作用：用于连接条件表达式
&&和and：两个条件都为true，结果为true；反之为false
||和or：只要有一个条件为true，结果为true；反之为false
！和not：如果连接的条件本身为false，结果为true；反正为false

③模糊查询
like 
between and
in
is null

*/

#1.按条件表达式筛选

#案例一：查询工资>12000的员工信息

SELECT * FROM employees WHERE salary>12000;

#案例二：查询部门编号不等于90的员工名和部门编号

SELECT first_name,department_id FROM employees WHERE department_id<>90;

#2.按逻辑表达式筛选

#案例一：查询工资在10000到20000之间的员工名、工资及奖金

SELECT 	
	last_name,
	salary,
	commission_pct 
FROM 
	employees 
WHERE 
	salary>=10000 
AND 
	salary<=20000;
	
#案例二：查询部门编号不是在90到110之间，或者工资高于15000的员工信息

SELECT
	*
FROM
	employees
WHERE
	department_id<90 OR department_id>110 OR salary>15000;
	
#3.模糊查询

/*
like
特点：
①一般和通配符搭配使用
	通配符：
	% 任意多个字符（包含零个字符）
	_ 任意单个字符
between and 
in 
is null
*/

#一、like

#案例一：查询员工名中包含字符a的员工信息

SELECT * FROM employees WHERE last_name LIKE '%a%';
#% 表示通配符

#案例二：查询员工名中第三个字符为n，第五个字符为l的员工名和工资

SELECT last_name, salary FROM employees WHERE last_name LIKE '__n_l%';

#案例三：查询员工名中第二个字符为_的员工名

SELECT last_name FROM employees WHERE last_name LIKE '_\_%';
SELECT last_name FROM employees WHERE last_name LIKE '_$_%' ESCAPE '$';
#使用\转义字符或者（推荐）随意指定转义符号比如'$'











