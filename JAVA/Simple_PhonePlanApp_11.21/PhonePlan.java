/** Part 1 - application source code by Joanna.
* DOMAIN = Phone Plan Catalogue */

/** CREATE A MENU OF THE APPLICATION AS BELOW:
1 – Provide the details of an item
2 – Display the details of the last entered item
3 – Display the item according to metric M1 assigned to you in Table 2
4 – Display the item according to metric M2 assigned to you in Table 2
5 – Display the value corresponding to metric M3 assigned to you in Table 2
6 – Exit application
Enter your choice:
 */

// The import statement to import a specific type into the current file;
import java.util.Scanner;

// First class - instantiable class to...- declare a class to define a new data type
class PhonePlan {
    // Main method
    public static void main(String args[]) {
        /*
         * int number_of_minutes; number_of_minutes = 100; // Don't add this if we want
         * use next.Int()
         */

        String name;
        int minutes;
        Scanner sc = new Scanner(System.in);
        System.out.println("Please enter the name or the plan: ");
        name = sc.nextLine(); // Method that returns the next line as a String (text).
        System.out.println("Please enter the amount of minutes you want: ");
        age = sc.nextInt(); // Method that returns input as int.
        System.out.println("The Plan is " + name + " and it has " + minutes + " available");

        // Display message for a User to help interact with an app.
        /*
         * System.out.println("Hello User!");
         * System.out.println("The maximum minutes available is: " + number_of_minutes);
         * System.out.println(“Enter number of minutes: ”); number_of_minutes =
         * sc.nextInt();
         */
    }
}

/*
 * WHICH ONE to declare 3 metrics of min, max , avg ● A data item is variable if
 * its value can be changed while the program is running – int <variableName>; –
 * int <firstMetric>; ● A data item is constant if its value cannot be changed
 * while the program is running -–> final <dataType> <CONSTANT_NAME> = <value>;
 * –> final int NUMBER_OF_MONTH_IN_A_YEAR = 12;
 */
// Operators Precedence: ?? Mini, Max, average

// double - data type we use to declare a real number e.g. double interestRate,
// myWage;

// ************************************************************************
// Second class - application class - to handle 3 metrics M1 + M2 + M3

/**
 * 1 - Ask the user for the Phone Plan: name + plan price + number of minutes. -
 * Asking input from user -> using System.in and Scanner class to parse
 * primitive data types (e.g. int, double) and String. - Use "while loop" for
 * user entering what is asked for. + Creating an object of type Scanner: sc =
 * new Scanner(System.in); + NEXT: Declaring a variable to refer to an object:
 * <ClassName> <name>; and Creating an object: name = new
 * <ClassName>(<arguments>); - PRICE: can be with: double planPrice; or double
 * myRealNumber = 100.23; -if we want specific
 */

/*
 * To import statement to import a specific type into the current file- must be
 * written before the class declaration: import java.util.Scanner; public class
 * Multiplier { ... }
 */

// 2 - Output = display the last item --> specify the type: displaying a String
// literal(text in ("") or a variable's value ()

/**
 * --> Declaring a variable to refer to an object: <ClassName><name>; Creating
 * an object: <name> =new<ClassName>(<arguments>);
 */

// Class declaration: <modifier> class <ClassName> {} / /=> public, protected,
// private or no modifier.
// Declaring Member Variables: <modifier> <dataType> <fieldName>; / <modifier>
// <dataType> <fieldName> = <value>;

// method declaration- need 3 M:
// <modifier> <returnDataType> <methodName>(<parameters>){}
// private double minmumPlan () or (int planOne){}
// public static void main(String[] args)
// default constructor, that is a constructor which has no parameters !!!!
public class Plan{ 
    private String name;
    private int minutes;
    private int price;
    public void calculate() {}
}
// If we want to create objects using the constructor without parameters, then we also have to declare a constructor which takes noarguments
Plan p1 = new Plan();
Plan p2 = new Plan();

// or we can use 'this'"
public Plan(String name, int minutes, int price){
    this.name= name;
    this.minutes = minutes;
    this.price = price;
}



nextInt() - returns input as integer
input.nextInt(); // ask the object input to provide the data entered from keyboard as an integer value

// Calling/Invoking a method on an object
<objectName>.<methodName>(<arguments>);


// Return a Value from a Method: usually is public modifier
public int addNumbers2(int a, int b)
    { int sum = a + b;
    return sum;}

// for phone plan calc// better int or public string if plan name???
// '' || ''  ->Conditional OR  // && -> Conditional AND
public int maxMinutes(int, int...) // some input by user- is unknown
    { int max = if ((numbers inserted by user) > ) ();
    return max;}
    System.out.println(“The plan with max number of minutes is ” + Plan(some calc from list?));
public int minMinutes(int) // some input by user- is unknown -arreys?
    { int min = min<();
    return min;}
public int averageMinutes(int)
    { int average = avg();
    return avg;}


    // getter and setter methods- getter method does not take in anyparameters
public double getResult(){
    return result;} //returns the value contained in the result instancevariable

    // default constructor, that is a constructor which has no parameters !!!!

// Java has three repetition/loop statements
    – while loops
    – for loops
    – do ... while loops

   // Person people[]; // can store multiple Person object
   int minutes[];  // can store multiple int values
   plan = new Plan[10]  // stores max 10 plans

int minutes[];
minutes = new int[10];


int i, n, sum = 0;
    n = 3; // usually, prompt the user to provide n
    i = 1; // i is called loop control variable initialisation of the counter
    while (i <= n) { // i <= n is the loop condition/ termination
        sum = sum + i;
        i = i + 1; // progression to the next iteration
    }
    System.out.println(“sum: “ + sum);

   // use a sentinel-controlled loop (indefinite loop) to determine when to stop entering the numbers
// use a sentinel-controlled loop to validate the user input



// *************************************
// TEST main


import java.util.Random;

public class PlanNumber{

	// declare data members -- instance variables
	// instance variable to store the random number generated by the computer
	private int secretNumber;
	// instance variable to store the number provided by the client/ user of this class
	private int planNumber;
	// instance variable to store the message whether the two numbers are equal or one is higher than the other
	private String message;
	// instance variable to store whether the user has guessed the secret number; true for correct guess, false for incorrect guess
	private boolean guessed;

	// declare constants for the different possible messages
	private final String MESSAGE_EQUAL="Congratulations, you guessed correctly!";
	private final String MESSAGE_TOO_HIGH ="You guessed too high, sorry!";
	private final String MESSAGE_TOO_LOW = "You guessed too low, sorry!";


	// declare constructors
	/* declare a constructor without parameters.
		In this example, the constructor generates a random number and stores it in the secretNumber instance variable.
		The other instance variables are initialized with their default values that are 0 for the guessNumber,
			null for the message and false for the guessed
	*/
	public PlanNumber(){
		// generate the secret number, a number between 1 and 20
		// generate a random number between 1 and 20, and save it in the secretNumber instance variable
		// declare a local variable of type Random, and create an object of type Random
		Random myRand = new Random();
		// call/invoke the method nextInt() on the object myRand to generate a random number
		// generates a random number between 0 inclusive and 20 exclusive, namely it can be either 0, 1, 2, ... , 17, 18 or 19
		secretNumber = myRand.nextInt(20); //0, 1, 2, ..., 17, 18, 19
		// [1, 20]
		// ensure the random number is between 1 inclusive and 20 inclusive by adding 1 to the currently stored number in the secretNumber
		secretNumber = secretNumber + 1; // now the number can be either 1, 2, 3, ...,18, 19, or 20
	}

	// setter method to update the guessNumber instance variable
	public void setPlanNumber(int guessNumber){
		this.planNumber = planNumber;
	}

	/** the method compares the guess and the secret numbers
		returns true if the numbers are the same, false otherwise
	*/
	public boolean checkNumbers(){
		if (planNumber == minutesNumber){ // the two numbers are equal
			message = MESSAGE_EQUAL;
			guessed = true;
		} else if(planNumber < minutesNumber){ // the guessNumber is lower than the secretNumber
			message = MESSAGE_TOO_LOW;
			guessed = false;
		} else { // the guessNumber is higher than the secretNumber
			message = MESSAGE_TOO_HIGH;
			guessed = false;
		}
		// returns the value of the instance variable guessed -- true if the two numbers are equal, false otherwise
		return guessed;
	}


	// getter method to retrieve the value of the secretNumber instance variable
	public int getMinutesNumber(){
		return MinutesNumber;
	}

	// getter method to retrieve the message
	public String getMessage(){
		return message;
	}





} // ends class

