package org.ucalproject.model.input;

public class CreateTransaction {

	private String myAddress;
	private String privKey;
	private String addressTo;
	private String amount;
	
	
	public String getMyAddress() {
		return myAddress;
	}
	public void setMyAddress(String myAddress) {
		this.myAddress = myAddress;
	}
	public String getPrivKey() {
		return privKey;
	}
	public void setPrivKey(String privKey) {
		this.privKey = privKey;
	}
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
		return "CreateTransaction [myAddress=" + myAddress + ", privKey=" + privKey + ", addressTo=" + addressTo
				+ ", amount=" + amount + "]";
	}
	
	
}
