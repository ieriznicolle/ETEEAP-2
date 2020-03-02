package eteeap.dao;

//import java.io.IOException;
//import java.io.InputStream;
//import javax.servlet.http.Part;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import eteeap.bean.LoginBean;
import eteeap.connection.DBConnection;

public class SettingsDao 
{
	public static String editProfile (String uname, String fname, String mname, String sname, String bday, String contact, String address, String email)
		//	throws IOException
	{
		Connection con = null;
		Statement statement = null;
		
		try
		{
			con = DBConnection.createConnection();
			statement = con.createStatement();
			
			String name;
			fname = fname.toUpperCase();
			sname = sname.toUpperCase();
			
			if (mname == null || mname == "")
			{
				name = fname + " " + sname;
			}
			
			else
			{
				mname = mname.toUpperCase();
				name = fname + " " + mname + " " + sname;
			}
			
			statement.executeUpdate("UPDATE users set fname ='"+ fname + "' where uname='" + uname + "'");
			statement.executeUpdate("UPDATE users set mname ='"+ mname + "' where uname='" + uname + "'");
			statement.executeUpdate("UPDATE users set sname ='"+ sname + "' where uname='" + uname + "'");
			statement.executeUpdate("UPDATE users set birthday ='"+ bday + "' where uname='" + uname + "'");
			statement.executeUpdate("UPDATE users set contactnum ='"+ contact + "' where uname='" + uname + "'");
			statement.executeUpdate("UPDATE users set address ='"+ address + "' where uname='" + uname + "'");
			statement.executeUpdate("UPDATE users set email ='"+ email + "' where uname='" + uname + "'");
			statement.executeUpdate("UPDATE users set name ='"+ name + "' where uname='" + uname + "'");

			System.out.println("\nEditing Profile Details");
			System.out.println(name + "\n" + fname + "\n" + mname + "\n" + sname + "\n"+ bday + "\n"+ contact + "\n"+ address + "\n"+ email);
			
			return "Edit Profile Successful";	
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}	
		
		return "Edit Profile Not Successful";
	}
	
	public static String changePassword (String password, String npw, String rpw, String name, String uname, String act)
	{
		LoginBean loginBean = new LoginBean();
		loginBean.setAction(act);
		loginBean.setUserName(uname);
		loginBean.setPassword(password);
		
		LoginDao loginDao = new LoginDao();
		String userValidate = loginDao.authenticateUser(loginBean); 

		if (userValidate.equals("SUCCESSCHANGEPW"))
		{
			Connection con = null;
			Statement statement = null;
			
			try
			{
				con = DBConnection.createConnection();
				statement = con.createStatement();
				
				if (password.equals(npw) && npw.equals(rpw))
				{
					return "OLDPW";
				}
				
				else if (npw.equals(rpw))
				{
					statement.executeUpdate("UPDATE users set pword='"+ rpw + "' where uname='" + uname + "'");

					System.out.println("\nChanging password for: " + name);
					System.out.println(npw + "\n" + rpw);
						
					DateTimeFormatter dtf = DateTimeFormatter.ofPattern ("yyyy/MM/dd HH:mm:ss");
					LocalDateTime now = LocalDateTime.now();
					String time = dtf.format(now);
						
					statement.executeUpdate("update users set time='" + time + "' where uname='" + uname + "'");
					System.out.println(name + " logged out at " + time);
					
					return "CHANGEDPW";
				}
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}	
		}
		return "WRONG";
	}
	
	public static String addUser (String empnum, String pname, String fname, String mname, String sname, String username, String position, String role, String email, String bday, String contact, String address)
	{
		System.out.println("\nAdd Employee");
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		String name;
		String password = "PUP-ETEEAP";
		fname = fname.toUpperCase();
		sname = sname.toUpperCase();
		
		if (mname == null || mname == "")
		{
			name = pname + " " + fname + " " + sname;
		}
		
		else
		{
			mname = mname.toUpperCase();
			name = pname + " " + fname + " " + mname + " " + sname;
		}
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern ("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String time = dtf.format(now);
	
		try
		{
			con = DBConnection.createConnection();
			statement = con.createStatement();
			
			resultSet = statement.executeQuery("select * from users");
				
			while(resultSet.next())
			{
				String empnumDB = resultSet.getString("employee_number");
				String unameDB = resultSet.getString("uname");
				String emailDB = resultSet.getString("email");
				
				if(empnum.equals(empnumDB))
				{
					return "Employee number already exist.";
				}
				
				else if(username.equals(unameDB))
				{
					return "Username already exist.";
				}
					
				else if(email.equals(emailDB))
				{
					return "Email already exist.";
				}
			}
			
			statement.executeUpdate("INSERT INTO users (employee_number, uname, pword, role, name, fname, mname, sname, position, birthday, contactnum, email, address, time)"
					+ "VALUES ('" +empnum+ "', '" +username+ "', '" +password+ "', '" +role+ "', '" +name+ "', '" +fname+ "', '" +mname+ "', '" +sname+ "', '"
					+position+ "', '" +bday+ "', '" +contact+ "', '" +email+ "', '" +address+ "', '" +time+ "')"); 

			System.out.println("\nAdding to Database");
			System.out.println(empnum + "\n" + name + "\n" + username);
			
			String fpwsend = SendEmailDao.newAccount (email, name, username);
			
			//forward to login page
			if(fpwsend.equals("EMAIL SENT"))
			{
				System.out.println("\nEmail sent!");
			}
			
			return "DONE";
		}
		
		catch(SQLException e)
		{
			System.out.println("SQL Exception: "+ e);
			e.printStackTrace();
		}	
		
		return "Employee is not added successfully.";
	}
	
	public static String deleteUser (String empnum)
	{
		System.out.println("\nDelete Employee");
		
		Connection con = null;
		Statement statement = null;
		
		try
		{
			con = DBConnection.createConnection();
			statement = con.createStatement();
			
			statement.executeUpdate("DELETE FROM users where employee_number = '" +empnum+ "'"); 
			
			System.out.println("\nDeleting");
			System.out.println(empnum);
			
			return "DONE";
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}	
		
		return "KEME";
	}
	
	public static String editUser(String empname, String empnum, String username, String position, String role)
	{
		System.out.println("\nEdit Employee Details");
		
		Connection con = null;
		Statement statement = null;
		
		try
		{
			con = DBConnection.createConnection();
			statement = con.createStatement();
			
			statement.executeUpdate("UPDATE users set employee_number ='" +empnum+ "' where name ='" +empname+ "'");
			statement.executeUpdate("UPDATE users set uname ='" +username+ "' where name ='" +empname+ "'");
			statement.executeUpdate("UPDATE users set position ='" +position+ "' where name ='" +empname+ "'");
			statement.executeUpdate("UPDATE users set role ='" +role+ "' where name ='" +empname+ "'");
		
			System.out.println("\nEditing details");
			System.out.println(empname + "\n" + empnum + "\n" + username + "\n" + position + "\n"+ role);
			
			return "DONE";
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}	
		
		return "KEME";
	}
}
