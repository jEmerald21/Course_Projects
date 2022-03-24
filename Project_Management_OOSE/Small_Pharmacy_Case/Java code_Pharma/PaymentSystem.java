/**
 * Payment system that is responsible to validate a payment type/method (read the credit or debit card), as well as approving or canceling payment itself, 
 * and confirms if payment was received.
 *  
 */
public class PaymentSystem
{

	/**
	 * 
	 * @param amount
	 */
	public void startPaymentProcess(float amount)
	{
		// TODO - implement PaymentSystem.startPaymentProcess
		throw new UnsupportedOperationException();
	}

	/**
	 * Use value of 0 for cash payment and use value of 1 for payment by card.
	 * Returns false if the card system is offline
	 * @param paymentMethod
	 */
	public boolean selectPaymentMethod(int paymentMethod)
	{
		// TODO - implement PaymentSystem.selectPaymentMethod
		throw new UnsupportedOperationException();
	}

	/**
	 * returns the difference between price to pay and received amount of customer
	 * @param amount
	 */
	public float setReceivedCashAmount(float amount)
	{
		// TODO - implement PaymentSystem.setReceivedCashAmount
		throw new UnsupportedOperationException();
	}

	public boolean validatePayment()
	{
		// TODO - implement PaymentSystem.validatePayment
		throw new UnsupportedOperationException();
	}

}