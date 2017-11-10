package org.ucalproject.core.eth;

import java.math.BigInteger;

import org.springframework.stereotype.Service;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.ECKeyPair;
import org.web3j.crypto.Keys;
import org.web3j.utils.Numeric;

@Service
public class MyWalletUtils2 {
	
	
	//create a new wallet totaly
	public Credentials createNewWallet() throws Exception{
		ECKeyPair ecKeyPair = Keys.createEcKeyPair();
		return Credentials.create(ecKeyPair);
	}
	
	//create  A new wallet from Private String;
	public Credentials restoreWalletFromPrivateKey(String privateKey) throws Exception{
		ECKeyPair ecKeyPair = ECKeyPair.create(Numeric.toBigInt(privateKey));
		return Credentials.create(ecKeyPair);
	}	
	
	public Credentials restoreWalletFromPrivateKey(BigInteger privKey) throws Exception{
		ECKeyPair ecKeyPair = ECKeyPair.create(privKey);
		return Credentials.create(ecKeyPair);
	}
	
	
}
