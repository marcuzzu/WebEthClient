package org.ucalproject;

import java.security.InvalidAlgorithmParameterException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.web3j.crypto.ECKeyPair;
import org.web3j.crypto.Keys;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.http.HttpService;

@SpringBootApplication
public class WebClientEthApplication {

	public static void main(String[] args) {
		
		SpringApplication.run(WebClientEthApplication.class, args);
		
	}
	
	
	@Bean
	public Web3j web3j() {
		return Web3j.build(new HttpService("http://192.168.56.101:8545")); 
	}
	
	
	/*
	 Your new address is:

	0xb91b8164a6b29c54ff37c6db4e92815f2f0fa1e7
	
	Store your private key in a secure place and don't lose it
	
	26e48e938ac62e6c72b0c098b53626ffe45428ef5bd714c4faa5873ada690791
	 */
	
	
}
