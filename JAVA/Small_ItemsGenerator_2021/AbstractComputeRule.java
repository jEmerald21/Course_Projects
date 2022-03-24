/** TABA - application source code by Joanna Goch, student ID: x21137641. */

package Generator;

// This is to allow to insert different item generation rules in to the ItemGenerator
// This approach was chosen in order to demonstrate the usage of abstract classes / inheritance of super class where we declare methods which must be used by subclasses.
public abstract class AbstractComputeRule {

    // Setter method for the string that should be used for the computation
    public abstract void SetInputString(String input); 
    // computation method that will take the input string and create a resulting item based
    public abstract void ComputeResult(); 
    // Getter method for the results to be a string type. As needed for Q1
    public abstract String GetResultAsString(); 
    // Getter method for the results in int format. As needed for Q2
    public abstract int GetResultAsInt(); 
} // End of abstract class
