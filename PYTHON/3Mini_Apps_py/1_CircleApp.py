#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Feb 28 16:11:54 2021

@author: JO
"""

# QUESTION 1: Circle Application
# ------------------------------

# // only an additional notes to remember what has to be calculated in the code:
# Circumference of a circle: 2*(3.142*radius) & Area of a circle: 3.142 * (radius*radius) //
# ------------------------------


# 2 below global variables:
# count is used to track how many values (here radius) the user entered
count = 0
# special variable to be able to control the main application loop because another nested loop is used
do_main_loop = True

# this is print message to welcome the user
print("\nWelcome to the Circle App!")

# this is the first and main loop that runs the whole application
while do_main_loop:
    
    # this is first element of the loop engaging the user for input   
    x = input("Enter radius: ")
    # this exception handling for trying to convert the user input to a number 
    try:
        # converting  input (here radius) to be a number        
        radius = float(x)
    # handling the exeption in case the input is not a number then error msg pops and asking user to enter only number       
    except: 
        # print statement for the above exception - telling to user it has to be a number         
        print("ERROR! Please enter numbers only ")
        # statement returns the control to the beginning of the current loop = again asks user to enter a radius         
        continue
    
    # assigning variables needed for calculations displays in a goodbye message that indicates the number of circles that the application created
    count = count + 1
    # each time the user enters a valid radius (number), the application calculates and displays (print) the circumference and area of the circle
    # assigning variables needed for calculations the circumference for each radius entered (the number appears rounded to two characters after the decimal point)   
    circumference = round((2 * (3.142 * radius)),2)
    # assigning variables needed for calculations the area for each radius entered (the number appears rounded to two characters after the point)  
    area = round((3.142 * (radius * radius)),2)
    
    # below 2 print statements showing calculations of 2 variables after each round of radius entered:
    print("Circumference: ", circumference)
    print("Area: ", area)

    # second loop defined inside of the first main loop to do 3 things: asking user if wants to continue or not and spotting input errors  
    while True:
        # defining input message (question here) to the user which will keep going or stop using application       
        answer = input("Do you want to continue? (y/n): ") 
        # defining first condition check for user's answer - if answer is 'no' (n) then app stops        
        if answer == "n":
            # following the 'no' answer condition with setting false to the main loop condition - in order to stop entering radius and to finalise            
            do_main_loop = False
            # break statement terminates this question loop           
            break
        # second condition inside the same loop determines if answer is 'yes' (y) then user will continue entering numbers (for radius)      
        elif answer == "y":
            # here break statement terminates only the second loop (question) and not the main one so the user can still continue entering numbers             
            break
        # last, third statement else - considering option if user type anything else than yes or no then will display the error message (it doesn't break any loop only showing an alert)           
        else:
            # print statement of the error message from the wrong user's input          
            print("ERROR! Please enter n or y only")

# this is print statement - line for better visualization before the farewell text starting from next line      
print("\n===================") 
# Final print statement displaying goodbye to the user with the number of Circles (entered numbers by user) that were created by the application 
print("Goodbye. You created: ", count, "Circle(s)")  

