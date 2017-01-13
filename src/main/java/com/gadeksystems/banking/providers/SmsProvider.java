package com.gadeksystems.banking.providers;


import java.net.*;

import org.springframework.stereotype.Component;

import java.io.*;

/**
 *
 * @author gadoo
 */
 
 
public class SmsProvider {

	public void sms(String message,String phone_number) throws Exception {
		String API_key = "bcb86ecbc1a058663a07";
		 
		String sender_id = "MicroBank"; // 11 characters

		/******************* API URL FOR SENDING MESSAGES ********/
		URL url = new URL("https://apps.mnotify.net/api/smsapi?key=" + API_key + "&to=" + phone_number + "&msg="
				+ message + "&sender_id=" + sender_id);

		/**************** API URL TO CHECK BALANCE ****************/
		//URL url = new URL("https://apps.mnotify.net/api/smsapibalance?key=" + API_key);

		URLConnection connection = url.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		String inputLine;
		inputLine = in.readLine().trim();
		if (inputLine.equals("1000")) {
			System.out.println("Message sent");
		} else if (inputLine.equals("1002")) {
			System.out.println("Message not sent");
		} else if (inputLine.equals("1003")) {
			System.out.println("You don't have enough balance");
		} else if (inputLine.equals("1004")) {
			System.out.println("Invalid API Key");
		} else if (inputLine.equals("1005")) {
			System.out.println("Phone number not valid");
		} else if (inputLine.equals("1006")) {
			System.out.println("Invalid Sender ID");
		} else if (inputLine.equals("1008")) {
			System.out.println("Empty message");
		}
		in.close();
	}
}