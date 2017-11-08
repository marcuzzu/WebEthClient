package org.ucalproject.model.input;

public class CreateTransaction {

	private String addressTo;
	private String amount;
	
	public String getAddressTo() {
		return addressTo;
	}
	public void setAddressTo(String addressTo) {
		this.addressTo = addressTo;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	
	@Override
	public String toString() {
		return "CreateTransaction [addressTo=" + addressTo + ", amount=" + amount + "]";
	}
	
	
	
	
}
