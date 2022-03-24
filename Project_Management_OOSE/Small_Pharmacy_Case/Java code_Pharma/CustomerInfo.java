/**
 * Data class to store customer information that can be used e.g. inside a cart
 */
public class CustomerInfo
{

	private string firstName;
	private string lastName;
	private string address;
	/**
	 * Phone number allowing to store country code prefixes as well
	 */
	private string phone;
	private string prescriptionInfo;
	private string otherNotes;

	public string getFirstName()
	{
		return this.firstName;
	}

	/**
	 * 
	 * @param firstName
	 */
	public void setFirstName(string firstName)
	{
		this.firstName = firstName;
	}

	public string getLastName()
	{
		return this.lastName;
	}

	/**
	 * 
	 * @param lastName
	 */
	public void setLastName(string lastName)
	{
		this.lastName = lastName;
	}

	public string getAddress()
	{
		return this.address;
	}

	/**
	 * 
	 * @param address
	 */
	public void setAddress(string address)
	{
		this.address = address;
	}

	public string getPhone()
	{
		return this.phone;
	}

	/**
	 * 
	 * @param phone
	 */
	public void setPhone(string phone)
	{
		this.phone = phone;
	}

	public string getPrescriptionInfo()
	{
		return this.prescriptionInfo;
	}

	/**
	 * 
	 * @param prescriptionInfo
	 */
	public void setPrescriptionInfo(string prescriptionInfo)
	{
		this.prescriptionInfo = prescriptionInfo;
	}

	public string getOtherNotes()
	{
		return this.otherNotes;
	}

	/**
	 * 
	 * @param otherNotes
	 */
	public void setOtherNotes(string otherNotes)
	{
		this.otherNotes = otherNotes;
	}

}