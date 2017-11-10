package org.ucalproject;

import java.math.BigInteger;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.ucalproject.controller.AccountController;
import org.ucalproject.core.eth.utils.MyEncryptionUtils;
import org.ucalproject.core.eth.utils.MyWalletUtils2;
import org.ucalproject.model.dto.NewWalletDTO;
import org.web3j.crypto.Credentials;
import org.web3j.utils.Numeric;

import junit.framework.Assert;

@RunWith(SpringRunner.class)
@SpringBootTest
public class WebClientEthApplicationTests {

	@Test
	public void contextLoads() {
	}
	
	@Test
	public void encruyptDecrypt() throws Exception{
		 NewWalletDTO createNewWallet = createNewWallet();
		 String encryptedPrivateKey = createNewWallet.getEncryptedPrivateKey();
		 System.out.println("encPrvKey"+encryptedPrivateKey);
		 String decryptString = MyEncryptionUtils.decryptString(encryptedPrivateKey);
		 System.out.println(decryptString);
		 BigInteger bigInt = Numeric.toBigInt(decryptString);
		 Credentials restoreWalletFromPrivateKey = new MyWalletUtils2().restoreWalletFromPrivateKey(bigInt);
		 String add=restoreWalletFromPrivateKey.getAddress();
		 
		 System.out.println(add);
		 Assert.assertEquals(add, createNewWallet.getAddress());
	}

	
	private NewWalletDTO createNewWallet() throws Exception {
		Credentials createNewWallet = new MyWalletUtils2().createNewWallet();
		BigInteger privateKey = createNewWallet.getEcKeyPair().getPrivateKey();
		String hexStringNoPrefix = Numeric.toHexStringNoPrefix(privateKey);
		
		NewWalletDTO newWalletDTO=new NewWalletDTO();
		newWalletDTO.setAddress(createNewWallet.getAddress());
		newWalletDTO.setPrivateKey(hexStringNoPrefix);
		newWalletDTO.setEncryptedPrivateKey(MyEncryptionUtils.encryptString(hexStringNoPrefix));
		
		return newWalletDTO;
	}
	
}
