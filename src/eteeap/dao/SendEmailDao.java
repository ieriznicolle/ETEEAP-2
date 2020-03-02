package eteeap.dao;

import java.util.Properties;
import java.util.Date;
import javax.mail.*;
import javax.mail.internet.*;

public class SendEmailDao
{
	//for example, smtp.mailgun.org
	private static final String email_from = "pup.eteeap@gmail.com";
	private static final String from_password = "PUPETEEAP2019";
	private static String email_to = "";
	
	private static final String email_subject = "DO NOT REPLY TO THIS EMAIL (via PUP-ETEEAP)";
	private static String email_content = "";
	
	public static String ForgotPW (String email, String name, String user, String password)
	{
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		//props.put("mail.smtp.socketFactory.port", "465"); //gmail, 465 (ssl required) or 587 (tls required)
		//props.put("mail.smtp.socketFactort.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com"); //host
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587"); 
		
		//get session
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator()
		{
			protected PasswordAuthentication getPasswordAuthentication()
			{
				return new PasswordAuthentication(email_from, from_password);
			}
		});
		
		Message msg = new MimeMessage(session);
		
		email_to = email;
		email_content = "Hi " + name + " (" + user + "),\n\n"
					+ "You recently requested to reset your password for your PUP ETEEAP account.\n\n"
					+ "Use this temporary password enclosed in the parenthesis (" + password + ") to regain access on your account."
					+ "\n\nThanks,\nPUP-ETEEAP Dev Team";
		try
		{
			System.out.println("\nSending email from: " + email_from); // + "; " + from_password);
			System.out.println("Sending email to: " + email_to);
			
			//from
			msg.setFrom (new InternetAddress(email_from));
			
			//to
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email_to));
			
			//subject
			msg.setSubject(email_subject);
			
			//content
			msg.setText(email_content);
			
			msg.setSentDate(new Date());
			
			//send
			Transport.send(msg);

			return "EMAIL SENT";
		}
		
		catch (MessagingException e)
		{
			e.printStackTrace();
		}
		
		return "EMAIL NOT SENT";
	}
	
	public static String newAccount (String email, String name, String user)
	{
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		//props.put("mail.smtp.socketFactory.port", "465"); //gmail, 465 (ssl required) or 587 (tls required)
		//props.put("mail.smtp.socketFactort.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com"); //host
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587"); 
		
		//get session
		Session session = Session.getInstance(props, new javax.mail.Authenticator()
		{
			protected PasswordAuthentication getPasswordAuthentication()
			{
				return new PasswordAuthentication(email_from, from_password);
			}
		});
		
		Message msg = new MimeMessage(session);
		
		email_to = email;
		email_content = "Hi " + name + ",\n\n"
					+ "Welcome to PUP ETEEAP!\n\n"
					+ "Here are your account credentials:\n"
					+ "Username: " + user + "\nTemporary Password: PUP-ETEEAP\n\n"
					+ "We highly recommend you to change your password as soon as possible.\n\n"
					+ "Thanks,\nPUP-ETEEAP Dev Team";
		
		try
		{
			System.out.println("\nSending email from: " + email_from); // + "; " + from_password);
			System.out.println("Sending email to: " + email_to);
			
			//from
			msg.setFrom (new InternetAddress(email_from));
			
			//to
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email_to));
			
			//subject
			msg.setSubject(email_subject);
			
			//content
			msg.setText(email_content);
			
			msg.setSentDate(new Date());
			
			//send
			Transport.send(msg);

			return "EMAIL SENT";
		}
		
		catch (MessagingException e)
		{
			e.printStackTrace();
		}
		
		return "EMAIL NOT SENT";
	}	
}
