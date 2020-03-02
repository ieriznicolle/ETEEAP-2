package eteeap.connection;

import java.sql.Connection;
import java.sql.DriverManager;
 
public class DBConnection
{
	public static Connection createConnection()
	{
		Connection con = null;
		//String url = "jdbc:mysql://127.0.0.1:3306/eteeap";
		//String username = "IerizNicolle";
		//String password = "Onetwothree45!";

		try 
		{
			try 
			{
				Class.forName("com.mysql.jdbc.Driver"); 
			} 

			catch (ClassNotFoundException e)
			{
				e.printStackTrace();
			} 

			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/eteeap?user=IerizNicolle&password=Onetwothree45!&useSSL=false");
			
			//System.out.println("\nPrinting connection object: " + con);
			
			Class.forName("com.mysql.jdbc.Driver"); 
		} 

		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return con; 
	}
}
