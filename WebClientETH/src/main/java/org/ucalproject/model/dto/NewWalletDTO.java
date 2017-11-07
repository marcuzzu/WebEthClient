package org.ucalproject.model.dto;

public class NewWalletDTO {

	private String address;
	private String privateKey;
	private String encryptedPrivateKey;
	
	public String getEncryptedPrivateKey() {
		return encryptedPrivateKey;
	}
	public void setEncryptedPrivateKey(String encryptedPrivateKey) {
		this.encryptedPrivateKey = encryptedPrivateKey;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPrivateKey() {
		return privateKey;
	}
	public void setPrivateKey(String privateKey) {
		this.privateKey = privateKey;
	}
	@Override
	public String toString() {
		return "NewWalletDTO [address=" + address + ", privateKey=" + privateKey + ", encryptedPrivateKey="
				+ encryptedPrivateKey + "]";
	}	
	
	
	
}
