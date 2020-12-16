#进阶8 分页查询 ※
/*
应用场景：
	当要显示的数据一页显示不全，需要分页提交SQL请求
	
语法：
	select 查询列表
	from 表
	【join type join 表2
	on 连接条件
	where 筛选条件
	group by 分组字段
	having 分组后的筛选
	order by 排序的字段】
	limit 【offset,】size;
	
	offset 要显示条目的起始索引（起始索引从0开始）
	size 要显示的条目个数
	
特点：
	①limit 语句放在查询语句的最后（语法和执行顺序都最后）
	②公式
		要显示的页数 page
		每一页的条目数 size
		
		select 查询列表
		from 表
		limit （page-1）*size,size;
*/

#案例1：查询前五条员工信息
SELECT * FROM employees LIMIT 0,5;

#案例2：查询第11条到第25条
SELECT * FROM employees LIMIT 10,25;

#案例3：有奖金的员工信息，并且工资较高的前十名
SELECT * FROM employees WHERE commission_pct IS NOT NULL ORDER BY salary DESC LIMIT 10;








