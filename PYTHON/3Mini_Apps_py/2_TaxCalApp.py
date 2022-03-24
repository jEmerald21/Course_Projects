#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Feb 28 16:11:54 2021

@author: JO
"""

# QUESTION 2: Tax Application
# ------------------------------


# // NOTES: 11000.00 are rated at 20%, amounts above 11000.01 and below 25000.00 are rated at 30%, all other amounts are rated at 40% //
# ------------------------------


#created a function that takes min and max tax range, taxation percentage, amount and returns tax liability by checking in range and tax applies:
def get_tax(min_value, max_value, amount, rate):
    if amount >= min_value and amount <= max_value:
        # depending if the entered amount is in the defined range the amount is calculated using the given rate
        return amount * rate
    # or if the amount if out of the range then it has no tax applied (returning 0)
    else:
        return 0


# below global variables:
# special name to be able to control the main application loop because another nested loop is used
main_loop = True
# defining variables with upfront assigned value
count = 0
# the 3 below are variables for 3 tax rates with upfront assigned value: 
# p20 = tax rate 20%
p20 = 0
# p30 = tax rate 30%
p30 = 0
# p40 = tax rate 40%
p40 = 0



#this is print message to welcome the user:
print("\nWelcome to the Tax Application")

#this is first and main loop where running the application:
while main_loop:

    #this is first element of the loop to get the user input:     
    x = input("Enter Amount: ")
    # this exception handling for trying to convert the user input to a number    
    try:
        # converting input (here amount) to be a number  
        amount = float(x)
        # here in order to get value of the 4 below variable and its calculations (tax rate of entered by user amounts) application uses upfront defined function from above named get_tax:    
        # first is calculation for amounts below 11000.00 taxed at 20%      
        p20 = p20 + get_tax(0, 11000.00, amount, 0.2)
        # second calculation is for amounts above 11000.01 and below 25000.00 using the rate of 30%
        p30 = p30 + get_tax(11000.01, 25000.00, amount, 0.3)
        # third calculation is for all amounts above 25000.01 (to infinity) with the rate at 40%
        p40 = p40 + get_tax(25000.01, float('inf'), amount, 0.4)
        # total tax laibility of all entered amounts
        total = p20 + p30 + p40
         
        # assigning variable needed for displayed in a goodbye message number of amounts that were enter into the application
        count = count + 1 
        
    # handling the exeption that if input is not a number then error msg pops and asking user to enter only number      
    except: 
       # print statement for the above exception - tells user to enter only a number:      
       print("ERROR! Please enter numbers only ")
       # statement returns the control to the beginning of the current loop and again asks user to enter an amount     
       continue

    # second loop defined inside of the first main loop to do 3 things: asking user if wants to continue or not and spotting the error     
    while True:
        # defining input message (question here) to the user which will keep going or stop using application
        answer = input("Do you want to continue? (y/n): ") 
        # defining first condition for the user's answer - if answer is 'no' (n) then app stops  
        if answer == "n":
            # following the 'no' answer case setting false to stop the main loop - stopping entering amounts and to finilize    
            main_loop = False
            # break statement terminates this question loop  
            break
        # second condition inside the same question loop determines when answer is 'yes' (y) then user will continue entering amounts     
        elif answer == "y":
            # here break statement terminates only the second loop (question) and not the main one so the user can continue     
            break
        # last, third statement else - considering option if user types anything else than yes or no, then it will display the error message (it doesn't break the loop only showing an alert)
        else:
            # print statement of the error message from the wrong input by user         
            print("ERROR! Please enter n or y only")
    
# this is print statement - line for better visualization of the summary tax calculations   
print("\n---------------------------- ") 
# this is print statement - line with message of tax liability for each tax rate
print("Your Tax Liability is: ")
# this is print statement of tax liability for all amount entered at rate 20% (the number appears rounded to 3 characters after the decimal point)
print("20% tax rate: ", round(p20, 3))
# this is print statement of tax liability for all amount entered at rate 30% (the number appears rounded to 3 characters after the decimal point)
print("30% tax rate: ", round(p30, 3))
# this is print statement of tax liability for all amount entered at rate 40% (the number appears rounded to 3 characters after the decimal point)
print("40% tax rate: ", round(p40, 3))
# this is print statement of total tax liability for all amounts entered (the number appears rounded to 3 characters after the decimal point)
print("\nTotal Tax Liability is: ", round(total, 3))
# this is print statements - line for better visualization of the farewell text starting from a new line 
print("\n===========================") 
# Final print displaying goodbye to the user with the number of amounts (entered by user) that were created by the application     
print("Goodbye, you entered:",count, "amount(s)")  


