package org.ucalproject.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.ucalproject.core.eth.MyWalletUtils;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.ECKeyPair;
import org.web3j.crypto.Wallet;
import org.web3j.crypto.WalletFile;
import org.web3j.crypto.WalletUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AccountController {

	@Autowired
	private MyWalletUtils myWalletUtils;
	
	
    @PostMapping("/uploadKey") 
    public ModelAndView singleFileUpload(@RequestParam("keystore") String keystore,
    		@RequestParam("password") String password,
    		HttpServletRequest request,HttpServletResponse response) throws Exception {
        	
        	Credentials credentials = myWalletUtils.checkValidKeystoreFile(password, keystore);
        	
        	if(credentials!=null) {
        		String encodeToUrlSafeString = Base64Utils.encodeToUrlSafeString(keystore.getBytes("UTF-8"));        		
        		response.addCookie(new Cookie("keystore", encodeToUrlSafeString));
        		response.addCookie(new Cookie("address", credentials.getAddress()));        		
        	}else {
        		//TODO manage in some way an error...
        	}
         return new ModelAndView("home");
    }
	
}
