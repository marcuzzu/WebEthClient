package org.ucalproject.core.eth;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.concurrent.ExecutionException;

import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameterName;
import org.web3j.protocol.core.methods.response.EthGetTransactionCount;
import org.web3j.tx.Transfer;
import org.web3j.utils.Convert;

public class MyTransactionUtils {

	private static Convert.Unit DEFAULT_UINT=Convert.Unit.ETHER;
	
	
	public void createTransaction(Web3j web3j,Credentials credentials,String toAddress,String value) throws Exception{
		
		BigDecimal wei = Convert.toWei(value, Convert.Unit.ETHER);
		Transfer.sendFunds(web3j, credentials, toAddress, wei, DEFAULT_UINT);
	}
	

	private void sendCustomTransaction() {
//		RawTransaction rawTransaction  = RawTransaction.createEtherTransaction(
//        nonce, <gas price>, <gas limit>, <toAddress>, <value>);
	}
	
	
	private BigInteger createNonce(Web3j web3j,String address) throws InterruptedException, ExecutionException {
		EthGetTransactionCount ethGetTransactionCount = web3j.ethGetTransactionCount(
	             address, DefaultBlockParameterName.LATEST).sendAsync().get();
		
	     return ethGetTransactionCount.getTransactionCount();
	}
	
	
}
