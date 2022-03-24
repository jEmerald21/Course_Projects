/** TABA - application source code by Joanna Goch, student ID: x21137641 (in use tables tasks assigned under no.4 & 1).
* APPLICATION to generate items for employees accounts & counts vowles in paragrahps. */

package Generator;
import java.util.Arrays;
import java.util.Scanner; 

// This is the main class and the main routine of the application
public class ItemGeneratorApp {

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // START of the application which is also the main program logic and main method of the class
    public static void main(String args[]) {
        
        //instantiation of the ItemGenerator class, as asked in the assignment, for later use
        ItemGenerator generator = new ItemGenerator();

        // Displaying the app startup welcome message
        System.out.println(" "); 
        System.out.println("------------------------------------------------------------------------------");
        System.out.println("|                     ~ WELCOME to the ItemGenerator App ~                   |");
        System.out.println("------------------------------------------------------------------------------ \n ");

        // Core loop of the application as a menu is provided to allow to run Question 1 or Question 2 repeatedly
        Boolean repeat = true;
        while(repeat) {
            // Display the menu options
            System.out.println("\n=========================================== ");
            System.out.println("                    Menu");
            System.out.println("===========================================");
            System.out.println("Please enter the number for one of the following menu options and press ENTER key:");
            System.out.println("Number 1 for running Question 1: Password Item Generation");
            System.out.println("Number 2 for running Question 2: Vowel Counter Item Generation");
            System.out.println("Number 3 for exiting the application\n");

            // get the input from the user using a custom method as this is needed multiple times
            int userChoice = AskForIntInput("Your choice?");

            // we need execute the choise
            if(userChoice == 1) {
                /////////////////////////////
                // Starting with Q1
                // Print out message to a user
                System.out.println("\n------------------------------- ");
                System.out.println(" Running Question 1");
                System.out.println("--------------------------------\n ");

                //  Getting the input count from the user
                int passwordCount = AskForIntInput("For how many employees do you want to generate passwords?");
                // Instantiating the specialised ComputeRule needed for this assignment which will be responsible for processing. In this case: generating the password from the given input
                PasswordComputeRule passwordComputeRule = new PasswordComputeRule();
                // repeating the password generation for the amount of times requested by the user
                for(int i = 0; i < passwordCount; i++) {
                    // getting a single string input from the user
                    String name = AskForStringInput((i+1) + ") Please enter full name (first name and last name) of an employee: ");
                    // using the ItemGenerator with the compute behaviour we need by giving the correct compute rule as parameter
                    String result = generator.CreateStringItem(name, passwordComputeRule);
                    // displaying the result from the item generating using the password compute rule
                    System.out.println("\nPassword is: " + result + "\n");
                }
            }
            else if(userChoice == 2) {
                /////////////////////////////
                // Starting Q2
                // Print out message to a user
                System.out.println("\n------------------------------- ");
                System.out.println(" Running Question 2 ");
                System.out.println("--------------------------------\n");

                //  Getting the input count from the user
                int paragraphCount = AskForIntInput("For how many paragraphs do you want the vowels to be counted for?");
                // Feedback to the user
                System.out.println("The amount of paragraphs you will have to enter is: " + paragraphCount + "\n");
                // Getting multiple string inputs from the user right away before computing the results
                String[] paragraphs = AskForStringInput(paragraphCount, "Please enter the paragraph: ");
                // Instantiating the specialised ComputeRule needed for this assignment which will be responsible for processing. In this case: generating the vowel counts from the given input
                VowelCountComputeRule vowelCountComputeRule = new VowelCountComputeRule();
                // using the other method from the ItemGenerator that allows for an string array as input and returns an array of result items
                int[] counterResults = generator.CreateIntItems(paragraphs, vowelCountComputeRule);
                // displaying the array data from the returned result
                System.out.println("\nThe content of the array is: " + Arrays.toString(counterResults)+ "\n");
                // displaying the array data in a more readable way to the user as well
                for(int i = 0; i < counterResults.length; i++) {
                    System.out.println("For paragraph " + (i+1) + "'' the count of vowles is: " + String.valueOf(counterResults[i]));
                }
            }
            else if(userChoice == 3) {
                // this is to exit the loop which will lead to exiting the app as well
                repeat = false;
            }            
        } // end of while loop

        /////////////////////////////
        //  Display application exits message
        System.out.println(" =========================================== ");
        System.out.println("            You exited The App.     ");
        System.out.println("    ____________________________________     ");
        System.out.println("              *  Bye bye  *  ");
        System.out.println(" =========================================== ");
        System.out.println(" ");

    } // main end

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //// Section with reusable static methods that are used by the main part in various places
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Method to ask the user for an int based input
    private static int AskForIntInput(String message) {
        // display the text message as received via the input parameter 
        System.out.println("~~ " + message + " ~~");
        // create Scanner instance for reading the user input
        Scanner sc = new Scanner(System.in, "UTF-8");
        // creating a variable to store the user interger input
        int result = 0;
        // loop to handle the input type with an exceptions of potential errors from user input
        do {
            // Trying to read an integer from the input
            try {
                result = sc.nextInt(); // Calls method from the object that returns input as int.
            }
            // Condition to handle an exeption when it is not the correct type. Validation of data type
            catch(Exception exceptionInfo) {
                // Display error message to the user and tells to input correctly a number.
                System.out.println(" \n!!! ERROR!!! \nPlease enter a valid number ");
                sc.nextLine(); // clear the scanner by reading the user input as string so it is ready to receive integer input
            }
        } while (result == 0); // Loop as long as the input us not an integer other than 0 (the initial value)
        // returning the user int input
        return result;
    }

    // reusable method to ask a single times for string based input
    private static String AskForStringInput(String message) {
        // display the message to the user
        System.out.println(message);
        //  Creating a scanner instance that is used for retrieving user input
        Scanner sc = new Scanner(System.in, "UTF-8");
        // read the string input and return it
        return sc.nextLine();
    }

    // reusable method to ask multiple times for string based input
    private static String[] AskForStringInput(int count, String message) {
        //  Declaring an array of strings that can hold all the string inputs from the user
        String[] results = new String[count];
        // crating the input scanner instance
        Scanner sc = new Scanner(System.in, "UTF-8");
        // repeating the display of message and the reading of the user input for the given count
        for(int i = 0; i < count; i++) {
            // display message
            System.out.println((i + 1) +  ") " + message);
            // read input and store it into the correct array slow
            results[i] = sc.nextLine();
        }
        // returning all the results as an array
        return results;
    }
} // End of ItemGeneratorApp class
