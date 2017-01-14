package com.gadeksystems.banking.providers;


import java.net.*;

import org.springframework.stereotype.Component;

import java.io.*;

/**
 *
 * @author gadoo
 */
 
 
public class SmsProvider {

	public String sms(String message,String phone_number) throws Exception {
		String API_key = "bcb86ecbc1a058663a07";
		 
		String sender_id = "MicroBank"; // 11 characters

		/******************* API URL FOR SENDING MESSAGES ********/
		URL url = new URL("https://apps.mnotify.net/api/smsapi?key=" + API_key + "&to=" + phone_number + "&msg="
				+ message + "&sender_id=" + sender_id);

		/**************** API URL TO CHECK BALANCE ****************/
		//URL url = new URL("https://apps.mnotify.net/api/smsapibalance?key=" + API_key);
		String result=null;
		URLConnection connection = url.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		String inputLine;
		inputLine = in.readLine().trim();
		if (inputLine.equals("1000")) {
			result="Message sent";
		} else if (inputLine.equals("1002")) {
			result="Message not sent" ;
		} else if (inputLine.equals("1003")) {
			result="You don't have enough balance" ;
		} else if (inputLine.equals("1004")) {
			result="Invalid API Key" ;
		} else if (inputLine.equals("1005")) {
			result="Phone number not valid" ;
		} else if (inputLine.equals("1006")) {
			result="Invalid Sender ID" ;
		} else if (inputLine.equals("1008")) {
			result="Empty message" ;
		}
		in.close();
		 return result;
	}
	
}