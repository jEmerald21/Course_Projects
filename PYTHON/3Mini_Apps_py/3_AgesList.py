#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Feb 28 11:35:18 2021

@author: JO
"""

# QUESTION 3: List of Ages
# -----------------------------------------------------------------

# // NOTE: we may not use the python functions SORT, SORTED, MAX, MIN //
# -----------------------------------------------------------------


# Application has 2 new defined funtions below to interract with user , spot errors and inerract with each other:
# first function (named ask_for_age with object 'request') defined for age input(number) by user which will become a specified value of an integer number (full number) and app considers also error in case of wrong input
def ask_for_age(request):
    # this is the loop that runs this function
    while True:
        # requests from user an input (number) under ("Enter an age: ")
        x = input(request)
        # this exception handling for trying to convert the user input to a number 
        try:
            #here I am initializing variable x to be converted to an integer to hold input value of a full number (ages are full numbers)
            number = int(x)
            # defining return of an input 
            return number
        # handling the exeption in case the input is not a number then error msg pops and asks user to enter only number       
        except:
            # print statement of else - message to user
            print("*** ERROR! Full numbers only. ***")
        
# second function (named ask_continue with object 'question') defined to ask user if wants to continue with application (with entering the ages) 
def ask_continue(question):
    # this True statement opens the loop that runs this function
    while True:
        # To answer our question ("Continue (y/n): ") user can decide if wants to continue with inputs
        answer = input(question)
        # first condition inside the above question - determines when answer is 'yes' (y) then user will continue entering amounts   
        if answer == "y" or answer == "yes":
            # it returns to beginning and user will continue again entering ages
            return True
        # defining second condition/option for the user - if answer is 'no' (n) then function stops  
        elif answer == "n" or answer == "no":
            #following the 'no' answer case setting false to stop the funtion loop   
            return False
        # handling the exeption in case the input is not y or n then error msg pops and asking user to enter correct input       
        else:
            # print statement of else - message to user
            print("*** ERROR! Please enter n or y only! ***")
    

#defining global variable (list of ages and other values needed for future calculations)
ages = []
average = None
count = 0
minimum = None
maximum = None
summary = 0    
# special variable to be able to control the main application loop
do_main_loop = True


# START of the application:
# this is print message with name of the application starting from a new line (\n)
print("\n____LIST OF AGES____")

# this is the main loop that runs the whole application and contains 2 defined above new functions
while do_main_loop:
    # first created function (ask_for_age) asking for user input and reacts on errors (as described above)
    age = ask_for_age("\nEnter an age: ")
    # the second created above function (ask_continue) interracts with user to let decides is want to continue with application or not + spotting errors as described before above
    do_main_loop = ask_continue("Continue? (y/n): ")
    # a method to process the list called 'ages'- from all entered age values (user's inputs)
    ages.append(age)

# using loop to process search for minimum and maximum values from the list of entered ages by comparing numbers 
for x in ages:
    if minimum == None or minimum > x:
       minimum = x
    if maximum == None or maximum < x:
       maximum = x 
    # summary is used to track the total value of all ages entered
    summary = summary + x
    # count is used to track how many values (here ages) the user entered
    count = count + 1
    # average is used to track what is the average value of all ages entered
    average = summary / count
 
# loop to create the sorted list without build-in function  
# declaration of variable for the sorted list
sorted_ages = []
# using 'for' to loop each entered age (from the list 'ages' created first   
for age in ages:
    # starting from position zero in the list
    position = 0
    # going through each element of the already sorted list of ages to find insertion position for the next age to be added
    for element in sorted_ages:
        # comparing age from sorted list with age to be inserted
        if element > age:
            # age of sorted list is bigger than the one to be inserted, therefore is using this position for insertion
            break
        # otherwise if age is smaller or equal = position is not right for insertion
        else:
            # moving the list insertion position forward by one
            position = position + 1
    # New created sorted list will sort the position of each age in loop -that many times as many age inputs is in application (and elements on the list)        
    sorted_ages.insert(position, age)
  
# this is print statement - line for better visualization before the farewell text starting from next line       
print("\n---------------------")  
#Final print statement (in 2 lines for easier code reading) with summary of 5 elements: list, sorted list, maximum age, minimum age and average age 
print("List of Ages: ", ages, "\nSorted List of Ages: ", sorted_ages)
# only average number appears rounded to 2 characters after the decimal point - because the rest were declared as an integer input
print("Min age: ", minimum, "\nMax age: ", maximum, "\nAverage age: ", round(average,1))
#Visual separation for easier reading
print("===================") 
# Final print displaying goodbye to the user with the number of ages (entered by user) in the application 
print("Goodbye, you entered:",count, "age(s)")  



