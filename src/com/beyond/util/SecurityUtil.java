package com.beyond.util;

import java.io.ByteArrayInputStream;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

import org.jasen.JasenScanner;
import org.jasen.core.engine.Jasen;
import org.jasen.error.EmptyErrorHandler;
import org.jasen.error.ErrorHandlerBroker;
import org.jasen.interfaces.JasenTestResult;
import org.jasen.plugins.KeywordScanner;

import com.beyond.constants.ApplicationConstants;
 
public class SecurityUtil {
	
	public static sun.misc.BASE64Encoder encoder=new sun.misc.BASE64Encoder();
	public static sun.misc.BASE64Decoder decoder=new sun.misc.BASE64Decoder();
	
	public static boolean isCaptchaValid(HttpServletRequest request) throws Exception{
		   
		   String remoteAddr = request.getRemoteAddr();
	       ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
	       reCaptcha.setPrivateKey(ApplicationConstants.RECAPTCHA_PRIVATE_KEY);

	       String challenge = request.getParameter(ApplicationConstants.RECAPTCHA_CHALLANGE_FIELD);
	       String uresponse = request.getParameter(ApplicationConstants.RECAPTCHA_RESPONSE_FIELD);
	       ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

	       return reCaptchaResponse.isValid();
	}
	public static String isSpam(String message){
		String msg=null;
		try
        {
				
			    MimeMessage mm = new MimeMessage(null, new ByteArrayInputStream(message.getBytes()));

                System.out.println ("Initialising jASEN ...");

                // Initialise the scanner
                JasenScanner.getInstance().init();
				
                // Optionally specify an error handler
                ErrorHandlerBroker.getInstance().setErrorHandler(new EmptyErrorHandler());
                
                Jasen jasen= new Jasen();
                
                // Scan the message
                System.out.println ("Scannign message");
                
                KeywordScanner h =new KeywordScanner(); 
                JasenTestResult result =  h.test(jasen, mm, null, null, null);
                
                // Get the result
                System.out.println ("Result");
                System.out.println ("----------------------------------");

                // Get the probability of spam
                System.out.println (result.calculateProbability());

                System.out.println ("");
                System.out.println ("Judgement:");
                System.out.println ("");

                if(result.calculateProbability() >= 0.9) {
                   msg= "Most likely SPAM";
                }
                else if (result.calculateProbability() <= 0.1) {
                   msg="Most likely HAM";
                }
                else {
                  msg="Can't be sure.  Borderline case";
                } 
                
        }
		catch (Exception e)
        {
            e.printStackTrace ();
        }
        return msg;
	}
	
	public static void main(String a[]) throws Exception{ 
		System.out.println(SecurityUtil.isSpam("Money, Download"));
		System.out.println(SecurityUtil.isSpam("SPAM"));
	}
	
}
