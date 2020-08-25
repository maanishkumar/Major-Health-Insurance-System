package com.manish.utils;

import org.springframework.stereotype.Component;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Component
public class SmsUtils {
	private final static String ACCOUNT_SID = "AC96db782debe8ff08a7487a1988ab029e";
	private final static String AUTH_ID = "a7236a888299e48c99a410148a82fa40";
	static {
		Twilio.init(ACCOUNT_SID, AUTH_ID);
	}

	public void sendUserSmsOtp(String password) {
		 Message.creator(new PhoneNumber("+919931765210"),
					             new PhoneNumber("+15046080926"),
					             "Your user app login pwd sent by manish="+password)
				                 .create();
		
	}

}
