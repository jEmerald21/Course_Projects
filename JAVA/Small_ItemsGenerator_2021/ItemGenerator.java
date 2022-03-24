/** TABA - application source code by Joanna Goch, student ID: x21137641.
* APPLICATION */

package Generator;

// The instantiable class for for the item generation. It provides the two methods needed for the questions
public class ItemGenerator {
    
    // Q1 item generating method - to handle password item-generation based on a single string inputs
    public String CreateStringItem(String input, AbstractComputeRule rule) {
        // setting the input for the chosen compute rule
        rule.SetInputString(input);
        // executing the computation of he given rule
        rule.ComputeResult();
        // returning the result of the computation
        return rule.GetResultAsString();
    }

    // Q2 item generating method - to handle 'volwels count' item-generation for an array of string inputs
    public int[] CreateIntItems(String[] inputArray, AbstractComputeRule rule) {
        // The array declaration and creation: can store the amount from the results counted based on inputs (paragraphs) added by user, no upfront delaration of elements.
        int[] result = new int[inputArray.length];
        // generating the item for each input in the array
        for(int i = 0; i < inputArray.length; i++) {
            // setting the input for the chosen compute rule
            rule.SetInputString(inputArray[i]);
            // executing the computation of he given rule
            rule.ComputeResult();
            // storing the result of the computation
            result[i] = rule.GetResultAsInt();
        }
        // return an array with the generated items
        return result;
    }
}
