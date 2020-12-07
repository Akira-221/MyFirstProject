'''import support

support.orders('carrot')
support.orders('pineapple','chocalate','banana')

from support import orders as mp

mp('a')
mp('a','b','c')

class Dog():
    def __init__(self,name,age):
        self.name = name
        self.age = age
    def sit(self):
        print(self.name.title()+" is now sitting.")
    def roll_over(self):
        print(self.name.title()+" rolled over.")

my_dog = Dog('willie',6)
print(my_dog.name.title())
my_dog.sit()
my_dog.roll_over()

class Restaurant():
    def __init__(self,restaurant_name,cuisine_type):
        self.name = restaurant_name
        self.type = cuisine_type
        self.number_served = 0
    def describe_restaurant(self):
        print(self.name.upper()+' '+self.type+' '+str(self.number_served))
    def open_restaurant(self):
        print("The restaurant now is opening.")
    def set_number_served(self,number):
        self.number_served = number
    def increment_number_served(self,num):
        self.number_served += num


r1 = Restaurant("chiga","aristocrat")
r1.describe_restaurant()
r1.open_restaurant()
r1.number_served = 2
r1.describe_restaurant()
r1.set_number_served(10)
r1.describe_restaurant()
r1.increment_number_served(2)
r1.describe_restaurant()

class IceCreamStand(Restaurant):
    def __init__(self,restaurant_name,cuisine_type):
        super().__init__(restaurant_name,cuisine_type)
        self.flavors = []
    def add_flavor(self,f):
        self.flavors.append(f)
    def describe_flavors(self):
        print(self.flavors)
i1 = IceCreamStand("DQ","teenagers")
i1.describe_restaurant()
i1.add_flavor("strawberry")
i1.describe_flavors()

from random import randint

class Die():
    def __init__(self,sides=6):
        self.sides = sides
    def roll_die(self):
        for i in range(0,10):
            print(randint(1,self.sides))
die = Die(10)
die.roll_die()
die = Die(20)
die.roll_die()

import json
numbers = [2,3,5,7,11,13]
filename = 'numbers.json'
with open(filename,'w')as f_obj:
    json.dump(numbers,f_obj)
with open(filename)as f_obj:
    num = json.load(f_obj)
print(num)


import re
print(re.match('www', 'www.w3cschool.cn').span())  # 在起始位置匹配
print(re.match('cn', 'www.w3cschool.cn'))         # 不在起始位置匹配

line = "Cats are smarter than dogs"

matchObj = re.match( r'(.*) are (.*?) .*', line, re.M|re.I)

if matchObj:
   print ("matchObj.group() : ", matchObj.group())
   print ("matchObj.group(1) : ", matchObj.group(1))
   print ("matchObj.group(2) : ", matchObj.group(2))
else:
   print ("No match!!")

print(re.search('www', 'www.w3cschool.cn').span())  # 在起始位置匹配 span以tuple形式返回范围
print(re.search('cn', 'www.w3cschool.cn').span())         # 不在起始位置匹配
'''

import re

line = "Cats are smarter than dogs";

matchObj = re.match( r'dogs', line, re.M|re.I) #re.M多行匹配 re.I不区分大小写
if matchObj:
   print ("match --> matchObj.group() : ", matchObj.group()) #以str形式返回匹配内容
else:
   print ("No match!!")

matchObj = re.search( r'dogs', line, re.M|re.I)
if matchObj:
   print ("search --> matchObj.group() : ", matchObj.group())
else:
   print ("No match!!")


phone = "2004-959-559 # 这是一个电话号码"

# 删除注释
num = re.sub(r'#.*$', "", phone)
print ("电话号码 : ", num)

# 移除非数字的内容
num = re.sub(r'\D', "", phone)
print ("电话号码 : ", num)
