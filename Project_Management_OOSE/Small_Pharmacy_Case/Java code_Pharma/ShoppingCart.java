public class ShoppingCart
{

	private boolean purchaseCompleted = false;
	private Item items;
	private CustomerInfo customerInfo;

	/**
	 * 
	 * @param item
	 * @param quantity
	 */
	public void addItem(Item item, int quantity)
	{
		// TODO - implement ShoppingCart.addItem
		throw new UnsupportedOperationException();
	}

	/**
	 * 
	 * @param item
	 */
	public void removeItem(Item item)
	{
		// TODO - implement ShoppingCart.removeItem
		throw new UnsupportedOperationException();
	}

	public float getTotalPrice()
	{
		// TODO - implement ShoppingCart.getTotalPrice
		throw new UnsupportedOperationException();
	}

	public boolean checkForRequiredPrescriptions()
	{
		// TODO - implement ShoppingCart.checkForRequiredPrescriptions
		throw new UnsupportedOperationException();
	}

	public boolean getPurchaseCompleted()
	{
		return this.purchaseCompleted;
	}

	/**
	 * 
	 * @param purchaseCompleted
	 */
	public void setPurchaseCompleted(boolean purchaseCompleted)
	{
		this.purchaseCompleted = purchaseCompleted;
	}

	/**
	 * 
	 * @param customerInfo
	 */
	public void updateCustomerInfo(CustomerInfo customerInfo)
	{
		// TODO - implement ShoppingCart.updateCustomerInfo
		throw new UnsupportedOperationException();
	}

}