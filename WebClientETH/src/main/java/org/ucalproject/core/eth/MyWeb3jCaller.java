package org.ucalproject.core.eth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.web3j.protocol.Web3j;

@Service
public class MyWeb3jCaller {

	
	@Autowired
	public Web3j web3j;
	
	
	public void test() {
		System.out.println(web3j);
	}
}
