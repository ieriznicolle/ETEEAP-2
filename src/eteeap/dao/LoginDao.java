package eteeap.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import eteeap.bean.LoginBean;
import eteeap.connection.DBConnection;


public class LoginDao
{
	public String authenticateUser(LoginBean loginBean)
	{	

		String act = loginBean.getAction();
		String user = loginBean.getUserName();
		String pass = loginBean.getPassword();
		String email = loginBean.getEmail();
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		String unameDB = "";
		String pwordDB = "";
		String nameDB = "";
		String roleDB = "";
		String emailDB = "";
		String ageDB = "";
		
		
		try
		{
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT *, YEAR(CURDATE()) - YEAR(birthday) -\r\n" + 
					"IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '-', MONTH(birthday), '-', DAY(birthday)) ,'%Y-%c-%e') > CURDATE(), 1, 0)\r\n" + 
					"AS age FROM users");
			
			if ("login".equals(act))
			{
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern ("yyyy/MM/dd HH:mm:ss");
				LocalDateTime now = LocalDateTime.now();
				String time = dtf.format(now);
				
				while(resultSet.next())
				{
					unameDB = resultSet.getString("uname");
					pwordDB = resultSet.getString("pword");
					nameDB = resultSet.getString("employee_number");
					roleDB = resultSet.getString("role");
					ageDB = resultSet.getString("age");
					
					if(user.equals(unameDB) && pass.equals(pwordDB))
					{
						loginBean.setName(nameDB);
						loginBean.setRole(roleDB);
						loginBean.setAge(ageDB);
						
						statement.executeUpdate("update users set time='" + time + "' where uname='" + user + "' and pword='" + pass + "'");
						
						System.out.println("\nSUCCESSFUL LOGIN: " + roleDB + ", " + nameDB);
						System.out.print("Last login: " + time);
						return "SUCCESSLOGIN";
					}
				}
			}
			
			else if ("forgotpw".equals(act))
			{
				while(resultSet.next())
				{
					unameDB = resultSet.getString("uname");
					emailDB = resultSet.getString("email");
					nameDB = resultSet.getString("name");
					
					if(user.equals(unameDB) && email.equals(emailDB))
					{
						loginBean.setUserName(unameDB);
						loginBean.setName(nameDB);
						System.out.println("\nSUCCESSFUL FORGOTPW: " + email);
						return "SUCCESSFORGOTPW";
					}
				}
			}
			
			else if ("changepw".equals(act))
			{
				while(resultSet.next())
				{
					unameDB = resultSet.getString("uname");
					pwordDB = resultSet.getString("pword");
					
					if(user.equals(unameDB) && pass.equals(pwordDB))
					{
						System.out.println("\nSUCCESSFUL CHANGE PW: " + user);
						return "SUCCESSCHANGEPW";
					}
				}
			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return "Invalid user credentials!";
	}
}