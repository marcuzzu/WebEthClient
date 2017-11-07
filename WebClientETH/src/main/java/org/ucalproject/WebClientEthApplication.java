package org.ucalproject;

import java.security.InvalidAlgorithmParameterException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.web3j.crypto.ECKeyPair;
import org.web3j.crypto.Keys;

@SpringBootApplication
public class WebClientEthApplication {

	public static void main(String[] args) {
		
		SpringApplication.run(WebClientEthApplication.class, args);
		
	}
}
