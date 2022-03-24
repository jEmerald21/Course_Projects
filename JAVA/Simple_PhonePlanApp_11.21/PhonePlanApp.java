/** 
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
        int age;
        Scanner sc = new Scanner(System.in);
        System.out.println("Please enter your name: ");
        name = sc.nextLine(); // Method that returns the next line as a String (text).
        System.out.println("Please enter your age: ");
        age = sc.nextInt(); // Method that returns input as int.
        System.out.println("Hello " + name + " you are " + age + " years old");

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

// method declaration
// <modifier> <returnDataType> <methodName>(<parameters>){}




//
// *************************************
// TEST App



import java.util.Scanner;
public class PhonePlanApp{

    System.out.println("1 – Provide the details of an item
    \n2 – Display the details of the last entered item: ");
    System.out.println("Enter your choice: ");
    System.out.println("Enter your choice: ");
    System.out.println("Enter your choice: ");
    System.out.println("Enter your choice: ");
    System.out.println("Enter your choice: ");
    The MENU OF THE APPLICATION:
    1 – Provide the details of an item
    2 – Display the details of the last entered item
    3 – Display the item according to metric M1 assigned to you in Table 2
    4 – Display the item according to metric M2 assigned to you in Table 2
    5 – Display the value corresponding to metric M3 assigned to you in Table 2
    6 – Exit application
    Enter your choice:

    System.out.println("Enter your choice: ");

	// declare data members -- instance variables
	// declare an instance variable named game of data type PlanNumber
	private PlanType plan;
	
	// instance variable to store the number of times a user is allowed to plan the secret number
	private int rounds;

	// declare constructors
	/* declare a constructor with one parameter that provides the number of attempts a user 
		is given to guess the secret number
	*/
	public PickNumberPlan(int numberOfAttempts){
		rounds = numberOfAttempts;
		// game instance variable is initialized with null (i.e. default value)
	}

	/* declare a method which enables a user to guess the secret number multiple times
		the number of times a user can guess the secret number is given by the instance variable rounds
	*/

  

	public void pickPlan(){
		
		int guess;
		// create an object of data type PlanNumber
		plan = new PlanNumber();
		
		// we use a loop statement because the user can guess a secret number multiple times, in this example rounds times
		// we use a counter-controlled loop (i.e. either a for or a while or a do while loop) because at the time JVM starts executing the loop statement the number of iterations (i.e. repetitions) is known, namely the value stored in the rounds instance variable
		// declare and initialize the loop control variable / the counter
		int i = 0;
		while (i < rounds){
			// input
			/* call the method takeUserInput() to take in a number from the user, 
				and store the result in the local variable named guess
			*/
			pick = takeUserInput();
			/* use the setter method setGuessNumber() to pass in to the object game the number provided by the
				user (and stored in the variable guess)
			*/
			plan.setPlanNumber(pick);
			
			// processing
			/* call/invoke/use the method checkNumbers() on the object game, 
				and store the returned value in the local variable secretIsGuessed
			*/
			boolean secretIsGuessed = plan.checkNumbers();
			
			// output
			/* retrieve the message to find out whether the user guessed the number, 
				and save it in the variable message
			*/
			String message = plan.getMessage();
			// display the message
			System.out.println(message);
			
			// progression to next iteration
			i++;
		}
		
		// display to the user the secret number -- i.e. the number he/she was trying to guess
		// call/invoke/use the getter method getSecretNumber() to retrieve the secret number, and store it in the variable secret
		int minutes = plan.getPlanNumber();
		// display the secret number
		System.out.println("the plan number is " + minutes);
	}
	

	/** declare a method to take in a number from the user
		returns the number provided by the user
        1 – Provide the details of an item
        2 – Display the details of the last entered item
	*/
	public int UserInput(){
		// the method takes in a number from the user
		// declare a local variable named myInput of data type Scanner, AND create an object of data type Scanner
		Scanner myInput = new Scanner(System.in);
		// input
		// prompt the user to input a number
		System.out.println("Put amount of minutes you want in your Phone Plan: ");
		int userChoice = myInput.nextInt();
		return userChoice;
	}
	

    /**
 * Java Program - Average of Numbers
 */
 
public class Average {
 
    public static void main(String[] args) {
        //numbers
        int[] nums = {1, 2, 3, 4, 5, 6};
        float sum = 0;
         
        //compute sum
        for(int num:nums)
            sum += num;
         
        //compute average
        float average = (sum / nums.length); 
         
        System.out.println("Average : "+average);
    }
}

   /**
 * Java Program - MIN and MAX of Numbers
 */
public class Minumum {

    public static void main(String args[]) {
       System.out.println(double.min[]);      
       System.out.println(double.min(23.12, 23.0));  
    }
 }
// ????

 class MinMaxPlan { 
 
    public static void main(String args[]){
      int array[] = new int[]{10, 11, 88, 2, 12, 120};
      //or maybe:
      int array[] = new int[]{10, 11, 88, 2, 12, 120};
   
      // Calling getMax() method for getting max value
      int max = getMax(array);
      System.out.println("The Phone Plan with Maximum Minutes is: "+max);
   
      // Calling getMin() method for getting min value
      int min = getMin(array);
      System.out.println("The Phone Plan with minimum Minutes is: "+min);
    }
   
    // Method for getting the maximum value
    public static int getMax(int[] inputArray){ 
      int maxValue = inputArray[0]; 
      for(int i=1;i < inputArray.length;i++){ 
        if(inputArray[i] > maxValue){ 
           maxValue = inputArray[i]; 
        } 
      } 
      return maxValue; 
    }
   
    // Method for getting the minimum value
    public static int getMin(int[] inputArray){ 
      int minValue = inputArray[0]; 
      for(int i=1;i<inputArray.length;i++){ 
        if(inputArray[i] < minValue){ 
          minValue = inputArray[i]; 
        } 
      } 
      return minValue; 
    } 
  }

  // or?? 
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

    
} // ends the main class
