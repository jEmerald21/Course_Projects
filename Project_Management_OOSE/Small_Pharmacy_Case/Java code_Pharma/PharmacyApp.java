/**
 * Main class in the app that in control of the medicine purchase flow
 */
public class PharmacyApp
{

	private StockInventory stock;
	private Item displayedItem;
	private ShoppingCart activePurchaseCart;
	private BarcodeScanner barcodeScanner;
	private PaymentSystem paymentSystem;

	/**
	 * Creates a new shopping cart instance. 
	 * First step to be done by a pharmacist in order to track items that a customer wants to buyy
	 */
	public ShoppingCart startNewCart()
	{
		// TODO - implement PharmacyApp.startNewCart
		throw new UnsupportedOperationException();
	}

	/**
	 * Cancels and removes the current cart. To be used if the customer doesn't want to buy the item(s)
	 */
	public void cancelCurrentCart()
	{
		// TODO - implement PharmacyApp.cancelCurrentCart
		throw new UnsupportedOperationException();
	}

	/**
	 * Uses the barcode scanner to find the item details and displays it in the app UI
	 */
	public Item displayItemFromScan()
	{
		// TODO - implement PharmacyApp.displayItemFromScan
		throw new UnsupportedOperationException();
	}

	/**
	 * Uses an input form to getting a search string that is then used to find the right item in the stock inventory
	 * @param name
	 */
	public Item displayItemFromName(string name)
	{
		// TODO - implement PharmacyApp.displayItemFromName
		throw new UnsupportedOperationException();
	}

	/**
	 * Adds the currently in the UI displayed item to the cart
	 */
	public void addDisplayedItemToCart()
	{
		// TODO - implement PharmacyApp.addDisplayedItemToCart
		throw new UnsupportedOperationException();
	}

	/**
	 * Displays the current cart details in the app's UI
	 */
	public void displayCurrentCart()
	{
		// TODO - implement PharmacyApp.displayCurrentCart
		throw new UnsupportedOperationException();
	}

	/**
	 * Kicks off the purchase process that is using the purchase system. Allowing for card payments
	 * @param amount
	 */
	public void doPurchase(float amount)
	{
		// TODO - implement PharmacyApp.doPurchase
		throw new UnsupportedOperationException();
	}

	/**
	 * Displays a customer info form that is then added to the cart
	 */
	public CustomerInfo enterCustomerInfo()
	{
		// TODO - implement PharmacyApp.enterCustomerInfo
		throw new UnsupportedOperationException();
	}

}