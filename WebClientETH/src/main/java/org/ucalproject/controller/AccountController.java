package org.ucalproject.controller;

import java.math.BigInteger;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;
import org.ucalproject.core.eth.MyEncryptionUtils;
import org.ucalproject.core.eth.MyTransactionUtils;
import org.ucalproject.core.eth.MyWalletUtils;
import org.ucalproject.core.eth.MyWalletUtils2;
import org.ucalproject.model.dto.NewWalletDTO;
import org.ucalproject.model.dto.RestoreWalletDTO;
import org.ucalproject.model.input.CreateTransaction;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.core.methods.response.Transaction;
import org.web3j.utils.Numeric;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AccountController {

	@Autowired
	private MyWalletUtils myWalletUtils;
	
	@Autowired
	private MyWalletUtils2 myWalletUtils2;
	
	@Autowired
	private MyTransactionUtils myTransactionUtils;
	

	/*
    @PostMapping("/uploadKey") 
    public ModelAndView singleFileUpload(@RequestParam("keystore") String keystore,
    		@RequestParam("password") String password,
    		HttpServletRequest request,HttpServletResponse response) throws Exception {
        	
        	Credentials credentials = myWalletUtils.checkValidKeystoreFile(password, keystore);
        	
        	if(credentials!=null) {
        		String encodeToUrlSafeString = Base64Utils.encodeToUrlSafeString(keystore.getBytes("UTF-8"));        		
        		response.addCookie(new Cookie("keystore", encodeToUrlSafeString));
        		response.addCookie(new Cookie("address", credentials.getAddress()));     
        		//remove request if exists...
        		Cookie cookie = WebUtils.getCookie(request,"failCredentials");
        		if(cookie!=null && cookie.getValue().equals("true")) {
        			Cookie tempC = new Cookie("failCredentials","false");
        			tempC.setMaxAge(0);
        			response.addCookie(tempC);
        		}
        	}else {
        		response.addCookie(new Cookie("failCredentials","true"));
                return new ModelAndView("accedi");
        	}
         return new ModelAndView("home");
    }
    */
    
	@RequestMapping("/api/createNewAccount" )
	public ResponseEntity<?> postCreateNewAccount() throws Exception{

		Credentials createNewWallet = myWalletUtils2.createNewWallet();
		BigInteger privateKey = createNewWallet.getEcKeyPair().getPrivateKey();
		
		String hexStringNoPrefix = Numeric.toHexStringNoPrefix(privateKey);
		
		NewWalletDTO newWalletDTO=new NewWalletDTO();
		newWalletDTO.setAddress(createNewWallet.getAddress());
		newWalletDTO.setPrivateKey(hexStringNoPrefix);
		newWalletDTO.setEncryptedPrivateKey(MyEncryptionUtils.encryptString(hexStringNoPrefix));

		
		return ResponseEntity.ok(newWalletDTO);
    }
	
	@RequestMapping("/api/restoreAccount")
	public ResponseEntity<?> postrestoreAccount(@RequestBody String privateKeyInput) throws Exception{

		System.out.println("privateKEy="+privateKeyInput);
		Credentials credentials = myWalletUtils2.restoreWalletFromPrivateKey(privateKeyInput);
				
		RestoreWalletDTO restored=new RestoreWalletDTO();
		restored.setAddress(credentials.getAddress());
		restored.setEncryptedPrivateKey(MyEncryptionUtils.encryptString(privateKeyInput));

		return ResponseEntity.ok(restored);
    }
	
	@RequestMapping("/api/getBalance")	
	public ResponseEntity<?> getBalance(@RequestBody String address) {

       System.out.println("string address="+address);
       
        return ResponseEntity.ok(new String ("3.78690"));

    }


	@CrossOrigin
	@RequestMapping(value="/api/sendTransaction", method = RequestMethod.POST, consumes="application/json")	
	public ResponseEntity<?> postExecuteTransaction(@RequestBody CreateTransaction transaction) throws Exception {

		
		System.out.println(transaction);
//	myTransactionUtils.createTransaction(web3j, credentials, toAddress, value);
       
        return ResponseEntity.ok(new String ("3.78690"));

    }
	

	
}
