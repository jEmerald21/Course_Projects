/** TABA - application source code by Joanna Goch, student ID: x21137641.
* APPLICATION  */

package Generator;

// This a subclass created to count amount of vowles in the paragraphs inputted by user in Q2.
public class VowelCountComputeRule extends AbstractComputeRule {

    // Declaring variables for the result and the input
    private int vowelCount;
    private String inputString;

    // constructor
    public VowelCountComputeRule()
    {
        // initialising the memebers with starting values
        this.vowelCount = 0;
        this.inputString = "";
    }

    // Setter method to set the input which also needs to reset the rest if the member variables
    @Override
    public void SetInputString(String input) {
        this.inputString = input;
        this.vowelCount = 0;
    }

     // The method that does the computation. Here counting the vowels for the given input string
    @Override
    public void ComputeResult() {
        // using lower case to make it easier to check
        String inputAsLower = inputString.toLowerCase();
        // the vowels to count, including y as vowel
        String charactersToCount = "aeiouy";
        // starting value for the caounter
        vowelCount = 0;
        // going through each character of the input, one by one
        for (int i = 0; i < inputAsLower.length(); i++) {
            // checking if the character is inside the string which the characters what we want to count
            if (charactersToCount.contains(Character.toString(inputAsLower.charAt(i)))) {
                // incrementing the counter
                vowelCount++;
            }
        }
    }

     // Getter method to resturn the result as string 
    @Override
    public String GetResultAsString() {
        return String.valueOf(vowelCount);
    }

     // Getter method to count an amount of vowels from each paragrahp where the result will show a number.
    @Override
    public int GetResultAsInt() {
        return vowelCount;
    }
    
}


