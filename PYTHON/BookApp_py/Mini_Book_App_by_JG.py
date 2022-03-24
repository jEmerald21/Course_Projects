#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Mar 18 18:13:02 2021

@author: JO
"""
# Please note I've made it simple by only following the instructions line by line. As I am very new with programming I wasn't sure how to make it more clear in one file (as requested). 
# I assmue, that in order the App to be useful and work - it should be created a bit more complex and perhaps on 2 sources (actual libary to play with, and class with methods to apply).
# I still believe that's a correct answer for requirements from CA2. I await your feedback. Thanks!


# CA2: Book Application in 3 parts a, b, c:

# a) class Book with attributes & methods:
# ------------------------------------

# defining class
class Book:
    # class attribute declared - initialized with 150(int type) - first added book will get that ref:
    nextBookRef = 150
    
    # first function/method is constructor for the class setting the attribute values, the first parameter is always a variable called self when working with classes and objects
    def __init__(self, title: str, price: float):
      # creates an instance attribute called title and assigns to it the value of the title parameter
      self.title = title
      # creates an instance attribute called price and assigns to it the value of the price parameter
      self.price = price  # * self.setPrice(price) # alternative way to define the price by disallowing free books right away
      # creates an attribute called bookRef and assigns the value from class (Book) attribute 'nextBookref'
      self.bookRef = Book.nextBookRef
      # incrementing the nextBookRef attribute of the class each time a new book is created (acting as counter)
      Book.nextBookRef = Book.nextBookRef + 1
      
    # In order to print/show details of book instances (title, price, ref) defining a special instance method called .__str__().
    def __str__(self):  
       # details of the string method to be returned - format to be printed. I added also book ref ID to make it more clear when showing nextBookRef number (this will vary depending on how many books are in the App).
       return f"The book title is '{self.title}' and the price is {self.price}. Book Ref ID is {self.bookRef}."
 
 
    # Another method in the class to set the price field to a new price value passed as a parameter(method to change price)
    # methods returns a string that can be used to print feedback
    def setPrice(self, price: float): 
        # first condition inside the setPrice method : the value must not be accepted if it is zero or negative
        if price > 0 :
            # when the above condition is met then assigns a new value to the instance attribute called price based on the price parameter
            self.price = price
            # It returns a string message containing the new price of the attribiute (here book) - can be printed
            return f"A new price for book '{self.title}' is {price}."
        # (price <= 0) handling the exeptional case where the value is zero or negative
        else: 
            # the error message is returned when the input parameter doesn't meet expectation
            return " E R R O R! Price should be higher than 0."


    # Another method in the class to increase the price by the amount, passed as a parameter  
    def increasePrice(self, extraPrice: float):
        # creates an instance attribute called extraPrice and assigns to it the value of the previous price with extra price added -returning increased price
        self.price = self.price + extraPrice
        # It returns the increased price of the attribiute - to be printed out in the format is given
        return f"Book '{self.title}' has a new higher price of {self.price}."
                     

    # Another method in the class to return the current value of nextBookRef (here is the last book + 1)        
    def getNextBookRef(self):  
        # It returns the next Book Ref number (starting from 150 as initialisation value for the class attribute) 
        return Book.nextBookRef

# ...................................    
# TEST for methods from 'a' part of Class 'Book' - using a arbitrary books details.

print("\na) -----------------------------")
# creating a new book with title "Green day" at price 20.00.
x = Book("Green day", 20.00)
#printing the book details - using the method for converting the object to string for getting a full description
print(x)

#x.setPrice(12.00) - when we change/add a new a price for the book "x"
print(x.setPrice(12.00))

#x.increasePrice(5.00) - when we increase a price of the book "x"
print(x.increasePrice(5.00))

# adding a new book "y" called "The Sea" at price 2.00.
y = Book("The Sea", 2.00)
#printing the book details
print(y)

# y.increasePrice(5.00) - to increase the price of a book "y"
print(y.increasePrice(5.00))

#y.setPrice(0.0) - when we change/add a new a price for a book "y"
print(y.setPrice(0.0))  # =>  Error feedback as string from method in case that the price is set at 0 or less.

# ...................................    



# b) Application with list and display:
# -------------------------------------
# To make it clearly visiable starts with print of requirement subsection 'b' and 'Book inventory'
print("\nb) -----------------------------")
print("Book inventory:")
#defining a variable - list of books called bookGroup - where all 3 requested books will be stored
bookGroup = []

# append method to create and add book objects to the bookGroup list using the constructor of class Book
bookGroup.append(Book("Dog Days", 18.00))
bookGroup.append(Book("Treasure Island", 7.50))              
bookGroup.append(Book("Python for All", 45.00))

# using 'for' statement to consider each entered book object (from the list 'bookGroup' created above)
for book in bookGroup:
    # display each's book detail coming from the list - print is in the string format - declared in method  __str__ inside class Book (subsection 'a'). I added also book ID to make it more clear when seeing nextBookRef number.
    print(book)

# prints out the Next Book Ref (to be used for the next new book) - from declared 'Book' class attribute that start initially at 150 and using it as counter variable  
print("\nNextBookRef will be: ", Book.nextBookRef)



# c) Search for price (using a list from subsection 'b'):
# -------------------------------------
#  To make a visible separation of a subsection 'c' using print
print("\nc) -----------------------------")
# declaring a variable searchPrice with value of 15.00
searchPrice = 15.00
# displays the searchPrice 
print("Books that cost more than", searchPrice,"are:")

# using 'for loop' statement to search through the bookGroup List for books whose price is greater than searchPrice
for book in bookGroup:
   # condition inside the loop: the book value must be greater than searchPrice (here 15)
   if book.price > searchPrice:
       # prints "Title" of book that meets the condition 
       print("Title:","'",book.title,"'")
       

# ====================================================== 
# ...................................     
