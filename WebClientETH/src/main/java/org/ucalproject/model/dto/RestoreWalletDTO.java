package org.ucalproject.model.dto;

public class RestoreWalletDTO {

	private String address;
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
	@Override
	public String toString() {
		return "RestoreWalletDTO [address=" + address + ", encryptedPrivateKey=" + encryptedPrivateKey + "]";
	}
	
	
	
}
