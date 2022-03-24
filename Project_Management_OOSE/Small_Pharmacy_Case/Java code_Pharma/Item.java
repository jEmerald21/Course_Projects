public class Item
{

	private string name;
	private int quantity;
	private float retailPrice;
	private string barCode;
	private boolean prescriptionRequired;

	public string getName()
	{
		return this.name;
	}

	/**
	 * 
	 * @param Name
	 */
	public void setName(int Name)
	{
		// TODO - implement Item.setName
		throw new UnsupportedOperationException();
	}

	public int getQuantity()
	{
		return this.quantity;
	}

	/**
	 * 
	 * @param QuantityInStock
	 */
	public void setQuantity(int QuantityInStock)
	{
		this.quantity = QuantityInStock;
	}

	public float getRetailPrice()
	{
		return this.retailPrice;
	}

	/**
	 * 
	 * @param RetailPrice
	 */
	public void setRetailPrice(float RetailPrice)
	{
		this.retailPrice = RetailPrice;
	}

	public boolean getPrescriptionRequired()
	{
		return this.prescriptionRequired;
	}

	/**
	 * 
	 * @param prescriptionRequired
	 */
	public void setPrescriptionRequired(boolean prescriptionRequired)
	{
		this.prescriptionRequired = prescriptionRequired;
	}

}