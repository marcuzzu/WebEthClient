package org.ucalproject.core.eth.utils;

import org.springframework.stereotype.Service;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.ECKeyPair;
import org.web3j.crypto.Keys;
import org.web3j.crypto.Wallet;
import org.web3j.crypto.WalletFile;
import org.web3j.crypto.WalletUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class MyWalletUtils {
	
	
	
	
	public Credentials getCredentialsFromPrivateKey() {
		return null;
	}
	
	
	public Credentials checkValidKeystoreFile(String password,String keystore) {
		try {
			ObjectMapper mapper = new ObjectMapper();
        	WalletFile obj = mapper.readValue(keystore, WalletFile.class);        	
        	ECKeyPair decrypt = Wallet.decrypt(password, obj);
        	Credentials create = Credentials.create(decrypt);
			return create;
		}catch (Exception e) {
			return null;		
		}
	}
	
	public boolean checkAddress(String address) {
		return WalletUtils.isValidAddress(address);
	}
	
	
	public WalletFile createWallet(String password) throws Exception{
		ECKeyPair ecKeyPair = Keys.createEcKeyPair();
//		WalletUtils.generateFullNewWalletFile(password, destinationDirectory)
		return Wallet.createStandard(password, ecKeyPair);
		
	}
	
	
}
