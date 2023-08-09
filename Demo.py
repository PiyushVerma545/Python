# Create first Python project
# Single line comment

"""
multi line comment
using quotes
"""

# variables
x= 4
x="Capgemini"

print(type(x))
print(x)

X,Y,Z= 10, 20, 30

print(X,Y,Z)

fruits= ["BERRY", "LITCHI", "MANGO"]

A,B,C = fruits

print(A,B,C)

name = "Piyush"

# Functions and reinitialize global member
def demo():
     a=22
     global name

     name ="Piyush"
     print("value of a", a)

demo()

def add(a,b):
  return a+b

res = add(10,20)

print("res of add = ", res)

print(x)

print("global name ", name)


if 7>2:
  print("Seven is greater than two")

#Operator

c, d = 20,30

print("Add c+d = ",c+d)
print("Sub d-c = ",d-c)
print("Multiply c*d =", c*d)
print("Divide d/c = ", d/c)


