package eteeap.controller;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eteeap.bean.LoginBean;
import eteeap.connection.DBConnection;
import eteeap.dao.LoginDao;
import eteeap.dao.RandomPwDao;
import eteeap.dao.SendEmailDao;

public class ETEEAPLI extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public ETEEAPLI() {}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException
	{
		String action = req.getParameter("action");
		String user = req.getParameter("username");
		String pass = req.getParameter("password");
		String eadd = req.getParameter("email");

		LoginBean loginBean = new LoginBean();
		LoginDao loginDao = new LoginDao(); 

		loginBean.setAction(action);
		loginBean.setUserName(user); 
		loginBean.setPassword(pass);
		loginBean.setEmail(eadd);
		
		String userValidate = loginDao.authenticateUser(loginBean); 

		if (userValidate.equals("SUCCESSLOGIN"))
		{
			String name = loginBean.getName();
			String role = loginBean.getRole();
			String age = loginBean.getAge();
			
			req.setAttribute("name", name); 

			HttpSession sessionuname = req.getSession();
			sessionuname.setAttribute("username", user);
			
			HttpSession sessionname = req.getSession();
			sessionname.setAttribute("user", name);
			
			HttpSession sessionage = req.getSession();
			sessionage.setAttribute("age", age);

			HttpSession sessionrole = req.getSession();
			sessionrole.setAttribute("role", role);
			
			if (role.contentEquals("Admin"))
			{
				System.out.println("\nLogin: " + role + " " + name);
			}
			
			else if (role.contentEquals("User"))
			{
				System.out.println("\nLogin: " + role + " " + name);
			}

			req.getRequestDispatcher("/si_home.jsp").forward(req, res);
		}
		
		else if (userValidate.equals("SUCCESSFORGOTPW"))
		{
			String name = loginBean.getName();
			
			req.setAttribute("email", eadd);
			HttpSession session = req.getSession();
			session.setAttribute("email", eadd);
			
			System.out.println("\nForgot Password: " + user + "; " + eadd);
			
			//generate random password
			int n = 8;
			String random = RandomPwDao.getAlphaNumericString(n); 
			
			//update database 
			Connection con = null;
			Statement statement = null;
				
			try
			{
				con = DBConnection.createConnection();
				statement = con.createStatement();

				statement.executeUpdate("UPDATE users set pword='"+ random + "' where uname='" + user + "'");

				System.out.println("\nChange password of: " + user + "; " + eadd);
				System.out.println("Changing password: " + random);
				System.out.println("Password Updated Successfully.");

				//req.getRequestDispatcher("/f_login.jsp").forward(req, res);
				//statement.close();         
				//con.close();
			}
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			//email the random pw
			String fpwsend = SendEmailDao.ForgotPW(eadd, name, user, random);
			
			//forward to login page
			if(fpwsend.equals("EMAIL SENT"))
			{
				System.out.println("\nEmail sent!");
				req.getRequestDispatcher("/f_login.jsp").forward(req, res);
			}
		}
	
		else
		{
			if (user != null && eadd != null) //for forgot password
			{
				req.setAttribute("errMessage", userValidate);
				req.getRequestDispatcher("/f_forgotpw.jsp").forward(req, res);
			}
			
			else if (user != null && pass != null) //for login
			{
				req.setAttribute("errMessage", userValidate);
				req.getRequestDispatcher("/f_login.jsp").forward(req, res);
			}		
		}
	}
}