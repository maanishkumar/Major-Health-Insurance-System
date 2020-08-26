package com.manish.utils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.manish.admin.entity.CreateAccountEntity;


@Component
public class EmailUtils {

	@Autowired
	private JavaMailSender javaMailSender;

	public boolean sendUserUnlockAccEmail(CreateAccountEntity ca) {
		try {
			
			MimeMessage mimeMsg = javaMailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMsg);

			helper.setTo(ca.getEmail());
			helper.setSubject("Unlock your account");
			helper.setText(getUnlockAccEmailBody(ca) , true);

			javaMailSender.send(mimeMsg);

			return true;
		} catch (Exception e) {

		}
		return false;
	}

	private String getUnlockAccEmailBody(CreateAccountEntity ca) throws IOException {
		StringBuffer sb = new StringBuffer("");

		FileReader fr = new FileReader("UNLOCK-ACC-EMAIL-BODY-TEMPLATE.txt");
		BufferedReader br = new BufferedReader(fr);
		String line = br.readLine();

		while (line != null) {
			sb.append(line);
			line = br.readLine();
		}

		br.close();

		// format mail body
		String mailBody = sb.toString();
		mailBody = mailBody.replace("{FNAME}", ca.getFirstName());
		mailBody = mailBody.replace("{LNAME}", ca.getLastName());
		mailBody = mailBody.replace("{TEMP-PWD}",ca.getPassword() );
		mailBody = mailBody.replace("{EMAIL}", ca.getEmail());

		return mailBody;
	}

}
