package org.ucalproject.core.eth.utils;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.stereotype.Service;

@Service
public class MyEncryptionUtils {

	private static final String key = "Bar12345Bar12345"; // 128 bit key
	private static final String initVector = "RandomInitVector"; // 16 bytes IV
//	private static final byte[] key = "MyDifficultPassw".getBytes();
	private static final String transformation = "AES/ECB/PKCS5Padding";
	
	
	
	
	public static String encryptString(String string) {
		return encrypt(string);
	}
	
	public static String decryptString(String string) {
		return decrypt(key, initVector, string);
	}
	
	private static String encrypt(String value) {
        try {
            IvParameterSpec iv = new IvParameterSpec(initVector.getBytes("UTF-8"));
            SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");

            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);

            byte[] encrypted = cipher.doFinal(value.getBytes());
            return Base64.encodeBase64URLSafeString(encrypted);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return null;
    }

    private static String decrypt(String key, String initVector, String encrypted) {
        try {
            IvParameterSpec iv = new IvParameterSpec(initVector.getBytes("UTF-8"));
            SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");

            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);

            byte[] original = cipher.doFinal(Base64.decodeBase64(encrypted));

            return new String(original);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return null;
    }
	
	
	/*
	public static String encrypt(Serializable object) throws Exception{
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		encrypt( object, baos);
		return new String(baos.toByteArray());
	}
	
	
	public static void encrypt(Serializable object, OutputStream ostream) throws Exception{
	    try {
	        // Length is 16 byte
	        SecretKeySpec sks = new SecretKeySpec(key, transformation);

	        // Create cipher
	        Cipher cipher = Cipher.getInstance(transformation);
	        cipher.init(Cipher.ENCRYPT_MODE, sks);
	        SealedObject sealedObject = new SealedObject(object, cipher);

	        // Wrap the output stream
	        CipherOutputStream cos = new CipherOutputStream(ostream, cipher);
	        ObjectOutputStream outputStream = new ObjectOutputStream(cos);
	        outputStream.writeObject(sealedObject);
	        outputStream.close();
	    } catch (IllegalBlockSizeException e) {
	        e.printStackTrace();
	    }
	}
	
	
	

	public static Object decrypt(String stringTodecode) throws Exception{
		InputStream istream = new ByteArrayInputStream(stringTodecode.getBytes(StandardCharsets.UTF_8.name()));
		return decrypt(istream);
		
	}


	private static Object decrypt(InputStream istream) throws Exception{
	    SecretKeySpec sks = new SecretKeySpec(key, transformation);
	    Cipher cipher = Cipher.getInstance(transformation);
	    cipher.init(Cipher.DECRYPT_MODE, sks);

	    CipherInputStream cipherInputStream = new CipherInputStream(istream, cipher);
	    ObjectInputStream inputStream = new ObjectInputStream(cipherInputStream);
	    SealedObject sealedObject;
	    try {
	        sealedObject = (SealedObject) inputStream.readObject();
	        inputStream.close();
	        return sealedObject.getObject(cipher);
	    } catch (ClassNotFoundException | IllegalBlockSizeException | BadPaddingException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	*/
}
