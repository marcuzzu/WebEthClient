package org.ucalproject.core.eth.utils;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameterName;
import org.web3j.protocol.core.RemoteCall;
import org.web3j.protocol.core.methods.response.EthGetTransactionCount;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.tx.Transfer;
import org.web3j.utils.Convert;
import org.web3j.utils.Convert.Unit;

@Service
public class MyTransactionUtils {

	private static Convert.Unit DEFAULT_UINT=Convert.Unit.ETHER;
	
	@Autowired
	private Web3j web3j;
	
	public RemoteCall<TransactionReceipt> createTransaction(Credentials credentials,String toAddress,String value) throws Exception{
	
		System.out.println("limit="+Transfer.GAS_LIMIT);
		System.out.println("price="+Transfer.GAS_PRICE);
	    
		BigDecimal wei = Convert.toWei(value, Convert.Unit.ETHER);
		return Transfer.sendFunds(web3j, credentials, toAddress, wei, Unit.WEI);
		
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
