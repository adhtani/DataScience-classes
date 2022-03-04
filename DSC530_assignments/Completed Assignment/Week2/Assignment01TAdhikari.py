# Taniya Adhikari
# DSC 530
# Assignment 2.1
# 9/13/2020

#Display the text “Hello World!
print("Hello world")

num1 = 25
num2 = 56
#Add two numbers together

add_nums = num1 + num2
print("The sum of numbers 25 and 56 is {}".format(add_nums))

#Subtract a number from another number
minus_nums = num2 - num1
print("The subtraction of 56 from 25 is {}".format(minus_nums))

#Multiply two numbers
multiply_nums = num1 * num2
print("25 times 56 is {}".format(multiply_nums))

#Divide between two numbers
divide_nums = num1/num2
print("25 divided by 56 is {:.2f}".format(divide_nums))

#Concatenate two strings together (any words)
string1 = "Python is"
string2 = " user friendly"
string3 = string1 + string2
print(string3)

#Create a list of 4 items (can be strings, numbers, both)
fruits = ["apples", "oranges", "grapes", "blueberries"]
print(fruits)
#Append an item to your list (again, can be a string, number)
fruits.append("bananas")
print(fruits)

#Create a tuple with 4 items (can be strings, numbers, both)
veggies = {"tomatoes", "potatoes", "asparagus", "bellpeppers"}
print(veggies)