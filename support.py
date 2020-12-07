'''print("Hello Python World!")

message = "Hello Python World!"
print(message)

message = "Hello Python Crash Course World!"
print(message)

message = "I love you 3000 times."
print(message)

name = "ada lovelace"
print(name.title())
print(name.upper())
print(name.lower())

first_name = "ada"
last_name = "lovelace"
full_name = first_name + " " + last_name
print("Hello,"+full_name.title()+"!")

first_name = "albert"
last_name = "einstein"
full_name = first_name+"·"+last_name
message = "A person who never made a mistake never tried anything new."
print(full_name.title()+" once said,"+'"'+message+'"')
name1 = " Albert Einstein "
name2 = " David Lee"
name3 = "Leslie Chuang "
print('\t'+name1.strip()+'\n\t'+name2.lstrip()+'\n\t'+name3.rstrip()+'\n')

#Python Program by akira on 25th Aug
age = 23
print("Happy " + str(age) + "rd Birthday!")

bicycles = ['track','cannondale','redline','specialized']
for i in range(0,3):
    print(bicycles[i].title(),end=' ')
print('\n')

names = ['nairag','sorgog','hargui','aylguu']
for i in range(0,4):
    print(names[i].title(),end=' ')
print('\n')

transportations = ['bus','bike','car','subway','walk']
weekdays = ['monday','tuesday','wednesday','thursday','friday']
for i in range(0,5):
    message = "I would like to go to work by "+transportations[i]+" on "+weekdays[i].title()
    print(message)

wanted_guests = ['leslie','andy','jennie','lisa','rose','jisoo']
for  i in range(0,6):
    print("I want to invite "+wanted_guests[i].title()+" to my party!")
cannot_come_guest = 'andy'
wanted_guests.remove(cannot_come_guest)
print("Unfortunately,"+cannot_come_guest.title()+" cannot come. What a pity!")
for  i in range(0,5):
    print("So I have "+wanted_guests[i].title()+" to be my guests.")
wanted_guests.insert(1,'jacky')
print(wanted_guests)
for  i in range(0,6):
    print("I want to invite "+wanted_guests[i].title()+" to my party!")
print("I have found a bigger table to have dinner.")
wanted_guests.insert(0,'rebecca')
wanted_guests.insert(2,'camile')
wanted_guests.append('july')
for  i in range(0,9):
    print("I want to invite "+wanted_guests[i].title()+" to my party!")
print("Because the table cannot be taken on time, I could only invite 2 guests.")
for i in range(0,7):
    poped_guest = wanted_guests.pop()
    print("Dear "+poped_guest.title()+", I am so sorry that I cannot invite you this time.")
for i in range(0,2):
    print("Dear "+wanted_guests[i].title()+", I am glad to invite you to my party.")
del wanted_guests[0]
del wanted_guests[1]
print(wanted_guests)

places = ['kyoto','oosaka','tokyo','america','london','toronto']
print(places)
print(sorted(places))
print(places)
print(sorted(places,reverse=True))
places.reverse()
print(places)
places.reverse()
print(places)
places.sort()
print(places)
print(len(places))


class Complex:
    def __init__(self,realpart,imagpart):
        self.r=realpart
        self.i=imagpart

x=Complex(3.0,-4.5)
print(x.r,x.i)

#!/usr/bin/python3

#类定义
class people:
    #定义基本属性
    name = ''
    age = 0
    #定义私有属性,私有属性在类外部无法直接进行访问
    __weight = 0
    #定义构造方法
    def __init__(self,n,a,w):
        self.name = n
        self.age = a
        self.__weight = w
    def say(self):
        print("%s 说: 我 %d 岁。" %(self.name,self.age))

#单继承示例
class student(people):
    grade = ''
    def __init__(self,n,a,w,g):
        #调用父类的构函
        people.__init__(self,n,a,w)
        self.grade = g
    #覆写父类的方法
    def say(self):
        print("%s 说: 我 %d 岁了，我在读 %d 年级"%(self.name,self.age,self.grade))

s = student('ken',10,60,3)
s.say()

#另一个类，多重继承之前的准备
class speaker():
    topic = ''
    name = ''
    def __init__(self,n,t):
        self.name = n
        self.topic = t
    def speak(self):
        print("我叫 %s，我是一个演说家，我演讲的主题是 %s"%(self.name,self.topic))

#多重继承
class sample(student,speaker):
    a =''
    def __init__(self,n,a,w,g,t):
        student.__init__(self,n,a,w,g)
        speaker.__init__(self,n,t)

test = sample("Tim",25,80,4,"Python")
test.speak()   #方法名同，默认调用的是在括号中排前地父类的方法
test.say()

num1 = input('输入第一个数字：')
num2 = input('输入第二个数字：')
# 求和
sum = float(num1) + float(num2)

# 显示计算结果
print("数字 %0.1f 和 %0.1f 相加结果为：%0.1f"%(num1, num2, sum))


# 二次方程式 ax**2 + bx + c = 0
# a、b、c 用户提供

# 导入 cmath(复杂数学运算) 模块
import cmath

a = float(input('输入 a: '))
b = float(input('输入 b: '))
c = float(input('输入 c: '))

# 计算
d = (b**2) - (4*a*c)

# 两种求解方式
sol1 = (-b-cmath.sqrt(d))/(2*a)
sol2 = (-b+cmath.sqrt(d))/(2*a)

print('结果为 {0} 和 {1}'.format(sol1,sol2))


kub = [value**3 for value in range(1,11)]
print(kub)

print("①The first three items in the list are: ")
print(kub[0:3])
print("\n②The last three items in the list are: ")
print(kub[-3:])
print("\nThree items from the middle of the list are: ")
print(kub[3:6])

menu = ('pizza','rice','noddle','chicken','salad')
for meal in menu:
    print(meal)
menu = ('pizza','rice','noddle','beef','fruits')
for meal in menu:
    print(meal)



users = ['admin','andy','brian','top','gd','jennie']

if users:
    for user in users:
        if user == 'admin':
            print("Hello " + user.title() + ", would you like to see a status report?")
        else:
            if user == 'gd':
                print("Hello " + user.upper() + ", thank you for logging in again.")
            else:
                print("Hello " + user.title() + ", thank you for logging in again.")
else:
    print("We need to find some users!")



alien_0 = {'color':'green','point':5}
print(alien_0)
alien_0['x_position'] = 0
alien_0['y_position'] = 25
print(alien_0)
alien_0['speed'] = 'medium'
print("Original x_position: "+str(alien_0['x_position']))
if alien_0['speed'] == 'slow':
    x_increment = 1
elif alien_0['speed'] == 'medium':
    x_increment = 2
else:
    x_increment = 3

alien_0['x_position'] = alien_0['x_position'] + x_increment
print("New x_position: "+str(alien_0['x_position']))

programming_language = {'C':'most basic',
                        'C++':'medium',
                        'Python':'most useful',
                        'Matlab':'model',
                        'java':'application',
                        'C#':'medium'
                        }
for key in programming_language:
    print(key+" : "+programming_language[key])
for value in set(programming_language.values()):
    print("We have " + value +" mentioned.")


favorite_languages = {'andy':['c','c++','python'],
                      'amy':['c'],
                      'lucy':['java','matlab'],
                      'leslie':['python','c#']
                      }
for name,languages in favorite_languages.items():
    if len(languages) == 1:
        print(name.title()+"'s favorite language is "+languages[0].title())
    else:
        print(name.title()+"'s favorite languages are:")
        for language in languages:
            print("\t"+language.title())

pet_1 = {'name':'popi','owner':'andy'}
pet_2 = {'name':'cati','owner':'lucy'}
pet_3 = {'name':'dogy','owner':'leslie'}

pets = [pet_1,pet_2,pet_3]
for pet in pets:
    print("The pet "+pet['name'].title()+"'s owner is:")
    print("\tMr."+pet['owner'].title())


responses = {}
polling_active = True
while polling_active:
    name = input("\nWhat's your name? ")
    response = input("Which mountain do you like to climb? ")
    responses[name] = response
    repeat = input("Is there any one to repond?(Yes/No) ")
    if repeat == 'No':
        polling_active = False
print("\n---poll results---")
for name,response in responses.items():
    print(name+" would like to climb "+response+".")


sandwich_orders = ['tuna','fish','chicken','beef','vegetable','pastrami','pastrami','pastrami']
finished_sanwiches = []
for sandwich_order in sandwich_orders:
    print("We have "+sandwich_order+" in order.")
print("The pastrami has been sold out.")
while 'pastrami' in sandwich_orders:
    sandwich_orders.remove('pastrami')
while sandwich_orders:
    current_sandwich = sandwich_orders.pop()
    print("I made your " + current_sandwich + " sandwich.")
    finished_sanwiches.append(current_sandwich)
for finished_sanwich in finished_sanwiches:
    print(finished_sanwich)


def make_album(singer_name,album_name,songs_number=0):
    album = {'s_n':singer_name,'a_n':album_name}
    if songs_number:
        album['num']=songs_number
    return album
album1=make_album('Leslie','Monica')
album2=make_album('Eason','Fuji',3)
print(album1)
print(album2)

def print_models(unprinted_designs,completed_designs):
    while unprinted_designs:
        current_design = unprinted_designs.pop()
        print("Printing model: "+current_design)
        completed_designs.append(current_design)
def show_completed_designs(completed_designs):
    for completed_design in completed_designs:
        print(completed_design)

unprinted_model = ['iphone case','robot pendant','dodecahedron']
completed_model = []
print_models(unprinted_model,completed_model)
show_completed_designs(completed_model)

def show_magicians(magicians):
    for magician in magicians:
        print(magician.title())
def make_great(magicians,new_magicians=[]):
    for magician in magicians:
        new_magician = 'The Great '+magician
        new_magicians.append(new_magician)
    return new_magicians
magicians = ['li','chen','cai']
new_magicians = make_great(magicians)
show_magicians(magicians)
show_magicians(new_magicians)


def orders(*toppings):
    print("\nMaking a sanwich with the following toppings:")
    for topping in toppings:
        print("-"+topping)
'''

with open('pi_digits.txt') as file_object:
    '''contents = file_object.read()
    print(contents.rstrip())
    for line in file_object:
        print(line.rstrip())'''
    lines = file_object.readlines()
pi = ''
for line in lines:
    pi += line.strip()
print(pi)
print(len(pi))

with open('programming.txt','w') as file_object:
    file_object.write("I love programming!\n")
    file_object.write(pi)

try:
    with open('novel.txt') as file_object:
        contents = file_object.read()
except FileNotFoundError:
    msg = 'sorry,the file novel.txt does not exist.'
    print(msg)
else:
    words = contents.split()
    num_words = len(words)
    print("the file novel.txt has about "+str(num_words)+" words.")

