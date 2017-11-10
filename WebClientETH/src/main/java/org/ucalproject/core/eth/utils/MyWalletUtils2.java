package org.ucalproject.core.eth.utils;

import java.math.BigDecimal;
import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.ECKeyPair;
import org.web3j.crypto.Keys;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameterName;
import org.web3j.protocol.core.methods.response.EthGetBalance;
import org.web3j.utils.Convert;
import org.web3j.utils.Numeric;

@Service
public class MyWalletUtils2 {
	
	@Autowired
	private Web3j web3j;
	
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
	
	
	public Credentials getWalletFromEncryptedPrivKey(String encryptedPrivateKey) throws Exception{
		 String decryptString = MyEncryptionUtils.decryptString(encryptedPrivateKey);
		 System.out.println(decryptString);
		 BigInteger bigInt = Numeric.toBigInt(decryptString);
		 Credentials restoreWalletFromPrivateKey = new MyWalletUtils2().restoreWalletFromPrivateKey(bigInt);
		 return restoreWalletFromPrivateKey;
	}
	
	public String getBalance(String address) throws Exception{
		EthGetBalance ethGetBalance = web3j
				  .ethGetBalance(address, DefaultBlockParameterName.LATEST).send();
	       BigDecimal fromWei = Convert.fromWei(ethGetBalance.getBalance().toString(), Convert.Unit.ETHER) ;
		return fromWei.toString();
	}
	
}
