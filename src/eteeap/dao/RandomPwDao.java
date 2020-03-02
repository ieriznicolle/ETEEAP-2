package eteeap.dao;

public class RandomPwDao
{
	public static String getAlphaNumericString (int n)
	{
		//choose a random character from this string
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
									+ "abcdefghijklmnopqrstuvwxyz"
									+ "0123456789"
									+ "!@#$%^&*";
		
		//create string buffer size of alphanumeric string
		StringBuilder sb = new StringBuilder(n);
		
		for (int i = 0; i < n; i++)
		{
			//generate a random number between 0 to AlphaNumericString variable length
			int index = (int) (AlphaNumericString.length() * Math.random());
			
			//add character one by one in the end of sb
			sb.append(AlphaNumericString.charAt(index));
		}
		
		return sb.toString();
	}
}
