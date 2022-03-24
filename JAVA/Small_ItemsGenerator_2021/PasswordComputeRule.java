/** TABA - application source code by Joanna Goch, student ID: x21137641.
* APPLICATION */

package Generator;

// This a subclass to create a passwords for each employee full name inputted by user in Q1.
public class PasswordComputeRule extends AbstractComputeRule {

    // Declaring a variables
    private String fullName;
    // creating a string buffer instance that will be used for to store the result of the processing
    private StringBuffer password;

    // as we will re-use the rule and provide an input setter method, we need to initialise this with empty values
    public PasswordComputeRule() {
        this.fullName = ""; // initialisation with empty string
        this.password = new StringBuffer(); // creation of the the string buffer object
    }

    // This is to set the full name input for processing
    @Override
    public void SetInputString(String input) {
        this.fullName = input; // setting the input
        this.password.delete(0, this.password.length()); // if a new name is given the buffer content needs to be deleted
    }

    // This is to process the full name input defined via the setter method
    @Override
    public void ComputeResult() {

        // variable to count the eliminated characters
        int eliminatedCharactersCount = 0;

        // these are the characters we want to count
        String charactersToCount = "aetAET";
        // going through the password and counting characters that are also inside our reference string: charactersToCount
        for (int i = 0; i < fullName.length(); i++) {
            if (charactersToCount.contains(Character.toString(fullName.charAt(i)))) {
                eliminatedCharactersCount++;
            }
        }

        // Eliminating and replacing characters in strings
        // By going through each characetr of the input string and translating it to the result
        for(int i = 0; i < fullName.length(); i = i + 1)
        {
            char currentChar = fullName.charAt(i);
            char currentCharAsLower = Character.toLowerCase(currentChar);
            if(currentCharAsLower == 'a' || currentCharAsLower == 'e' || currentCharAsLower == 't')
            {
                // Eliminating it by skipping, meaning not writing the character into the password string buffer
                continue;
            }
            else if(currentCharAsLower == ' ')
            {
                // Replacing space with a string sequence
                this.password.append("S&?");
            }
            else if(currentCharAsLower == 'o' || currentCharAsLower == 'i' || currentCharAsLower == 'u' || currentCharAsLower == 'y')
            {
                // appending the character twice
                this.password.append(currentChar + "" + currentChar);
            }
            else
            {
                // no replacement or skipping applies, therefore simply adding the character as it is
                this.password.append(currentChar);
            }
        }

        // appending the count of eliminated characters
        this.password.append(String.valueOf(eliminatedCharactersCount));
    }

    // this is to retrieve a string representation of the result
    @Override
    public String GetResultAsString() {
        return password.toString();
    }

    // this method is needed to provide all overides needed for inheriting from the abstract class
    @Override
    public int GetResultAsInt() {
        // returning a standard value as this is not needed.
        return 0;
    }
}
