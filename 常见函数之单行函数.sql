#进阶4：常见函数

/*
概念：
	类似于Java中的方法，将一组逻辑语句封装在方法体中，对外暴露方法名
好处：
	1、隐藏了实现细节
	2、提高代码的重用性
调用：
	select 函数名(实参列表)
	【from 表】; (函数参数用到表中字段时加）
特点：
	①叫什么（函数名）
	②干什么（函数功能）
分类：
	1、单行函数
	ex. concat、length、ifnull等
	2、分组函数
	功能：做统计使用，又称为统计函数\聚合函数\组函数
*/

#一、单行函数
/*
分类：
	字符函数
	数学函数
	日期函数
	其他函数【补充】
	流程控制函数【补充】
*/


#1、字符函数
#①length 获取参数值的字节个数
SELECT LENGTH('john');
SELECT LENGTH('张三丰hahaha');

SHOW VARIABLES LIKE '%char%';

#②concat 拼接字符串
SELECT CONCAT(last_name,'_',first_name) 姓名
FROM employees;

#③upper、lower
SELECT UPPER('john');
SELECT LOWER('JOHN');
#示例：将姓变大写，名变小写，然后拼接
SELECT CONCAT(UPPER(last_name),'_',LOWER(first_name))
FROM employees;
#函数可以嵌套

#④substr、substring 截取字符串
/*
注释：
	索引从1开始
	两个参数时，第一个参数为要进行操作的字符串，第二个为从指定索引处截取后面的所有字符
	三个参数时，第三个参数为从指定索引处截取指定字符长度的字符
*/
SELECT SUBSTR('李莫愁爱上了陆展元',7) out_put;
SELECT SUBSTR('李莫愁爱上了陆展元',1,3) out_put;

#案例：姓名中首字符大写，其他字符小写，用下划线拼接
SELECT CONCAT(UPPER(SUBSTR(last_name,1,1)),'_',LOWER(SUBSTR(last_name,2))) out_put
FROM employees;

#⑤instr 用于返回子串在字符串中第一次出现的起始索引，如果找不到返回0
SELECT INSTR('杨不悔爱上了殷六侠','殷六侠') AS out_put;

#⑥trim
SELECT LENGTH(TRIM('      张翠山     ')) AS out_put;

SELECT TRIM('a' FROM 'aaaaaaaa张aaaaa翠aaaaaaa山aaaaaa') AS out_put; #去前后

#⑦lpad 用指定的字符实现左填充指定长度
SELECT LPAD('殷素素',10,'*') out_put;

#⑧rpad 用指定的字符实现右填充指定长度
SELECT RPAD('殷素素',10,'ab') out_put;

#⑨replace 替换
SELECT REPLACE('周芷若张无忌爱上了周芷若','周芷若','赵敏') AS out_put;

#2.数学函数
#① round 四舍五入
SELECT ROUND(-1.45);
SELECT ROUND(1.567,2); #小数点后保留两位

#② ceil 向上取整 返回>=该参数的最小整数
SELECT CEIL(1.002);
SELECT CEIL(1.00);

#③ floor 向下取整 返回<=该参数的最大整数
SELECT FLOOR(1.00);

#④ truncate 截断
SELECT TRUNCATE(1.65,1); #小数点后保留一位

#⑤ mod 取余
/* MOD(a,b) : a-a/b*b 
mod(-10,-3) : -10-(-10/-3)*(-3) = -1
*/
SELECT MOD(10,3);
SELECT 10%3;

#3.日期函数
#① now 返回当前系统日期+时间
SELECT NOW();

#② curdate 返回当前系统日期 不包含时间
SELECT CURDATE();

#③ curtime 返回当前时间 不包含日期
SELECT CURTIME();

#④ 可以获取指定的部分 年、月、日、小时、分钟、秒
SELECT YEAR(NOW());
SELECT MONTH('1998-1-21');
SELECT MONTHNAME('1992-9-8');

SELECT YEAR(hiredate) FROM employees;

#⑤ str_to_date 将日期格式的字符转换成指定格式的日期
SELECT STR_TO_DATE('9-13-1999','%m-%d-%Y') AS out_put;

#案例：查询入职日期为1992-4-3的员工信息
SELECT * FROM employees WHERE hiredate = '1992-4-3';

SELECT * FROM employees WHERE hiredate = STR_TO_DATE('4-3 1992','%m-%d %Y');

#⑥ date_format 将日期转换成字符
SELECT DATE_FORMAT('1991-3-8','%Y年%m月%d日');

#案例：查询有奖金的员工名和入职日期（格式：xx月/xx日 xx年）
SELECT 
	first_name,DATE_FORMAT(hiredate,'%m月/%d日 %Y')
FROM 
	employees 
WHERE 
	commission_pct IS NOT NULL;
	
#4.其他函数

SELECT VERSION();
SELECT DATABASE();
SELECT USER();

#5.流程控制函数
#① if函数：实现if else的效果
SELECT IF(10>5,'大','小') AS out_put; #类似三元运算符：(a>b)?a:b

SELECT 
	last_name,commission_pct,IF(commission_pct IS NULL,'没奖金呵呵','有奖金嘻嘻') 备注
FROM
	employees;
	
#② case函数的使用一：switch case(等值判断）

/*
Java中：

switch(变量或表达式){
	case 常量1:语句1;break;
	...
	default:语句n;break;
	}
	
mysql中：

case 要判断的字段或表达式
when 常量1 then 要显示的值1或语句1;
when 常量2 then 要显示的值2或语句2;
...
else 要显示的值n或语句n;
end
*/

/*案例：查询员工的工资，要求

部门号=30 显示的工资为1.1倍 
部门号=40 显示的工资为1.2倍
部门号=50 显示的工资为1.3倍
其他部门 显示原工资

*/
SELECT salary 原始工资,department_id,

	CASE department_id
	WHEN 30 THEN salary*1.1
	WHEN 40 THEN salary*1.2
	WHEN 50 THEN salary*1.3
	ELSE salary
	END AS 新工资
FROM employees;

#③ case函数的使用二：类似于多重if(判断区间)
/*
java中：
if(条件1){
	语句1;
	}else if(条件2){
	语句2;
	}
	...
	else{
	语句n;
	}
	
mysql中：
case
when 条件1 then 要显示的值1或语句1;
when 条件2 then 要显示的值2或语句2：
...
else 要显示的值n或语句n;
end
*/

/*案例：查询员工的工资情况
如果工资>20000 显示A级别
如果工资>15000 显示B级别
如果工资>10000 显示C级别
否则 显示D级别
*/
SELECT last_name,salary,
	CASE
	WHEN salary>20000 THEN 'A'
	WHEN salary>15000 THEN 'B'
	WHEN salary>10000 THEN 'C'
	ELSE 'D'
	END AS 工资级别
FROM employees;








