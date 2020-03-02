package eteeap.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;


import eteeap.connection.DBConnection;


public class ETEEAPALI extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public ETEEAPALI() {}
					
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException
	{
		HttpSession sessionuname = req.getSession();
		String uname = (String) sessionuname.getAttribute("username");
		sessionuname.setAttribute("username", uname);

		HttpSession sessionrole = req.getSession();
		String r = (String) sessionrole.getAttribute("role");
		sessionrole.setAttribute("role", r);
		
		HttpSession sessionname = req.getSession();
		String name = (String) sessionname.getAttribute("user");
		sessionname.setAttribute("user", name);
		
		HttpSession sessionage = req.getSession();
		String e_age = (String) sessionage.getAttribute("age");
		sessionage.setAttribute("age", e_age);	
		
		String account = req.getParameter("page");

		if ("signout".equals(account))
		{
			if(sessionname != null) //If session is not null
			{
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern ("yyyy/MM/dd HH:mm:ss");
				LocalDateTime now = LocalDateTime.now();
				String time = dtf.format(now);
				
				try
				{
					Connection con = DBConnection.createConnection();
					Statement statement = con.createStatement();
					
					statement.executeUpdate("update users set time='" + time + "' where uname='" + uname + "'");
				}
				
				catch (SQLException e)
				{					
					e.printStackTrace();
				}
			
				sessionname.invalidate(); //removes all session attributes bound to the session
				
				req.getRequestDispatcher("/f_index.jsp").forward(req, res);
				
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin " + name + " will log out");
					System.out.println("\nAdmin " + name + " logged out at " + time);
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser " + name + " will log out");
					System.out.println("\nUser " + name + " logged out at " + time);
				}
			}
		}
		
		else if ("settings".equals(account))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Settings");
					req.getRequestDispatcher("/sia_settings.jsp").forward(req, res);
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Settings");
					req.getRequestDispatcher("/siu_settings.jsp").forward(req, res);
				}	
			}
		}
		
		else if ("profile".equals(account))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Profile");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Profile");
				}

				req.getRequestDispatcher("/si_profile.jsp").forward(req, res);
			}
		}
		
		else if ("students".equals(account))
		{
			if (name == null || name == "" || r == "User")
			{
				System.out.println(name + "\nAdmin: Students");
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Students");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Students");
				}
				
				req.getRequestDispatcher("/si_students.jsp").forward(req, res);
			}
		}
		
		else if ("home".equals(account))
		{
			if (name == null || name == "" || r == "User")
			{
				System.out.println(name + "\nAdmin: Home");
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Home");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Home");
				}
				
				req.getRequestDispatcher("/si_home.jsp").forward(req, res);
			}
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException
	{
		HttpSession sessionuname = req.getSession();
		String uname = (String) sessionuname.getAttribute("username");
		sessionuname.setAttribute("username", uname);

		HttpSession sessionrole = req.getSession();
		String r = (String) sessionrole.getAttribute("role");
		sessionrole.setAttribute("role", r);
		
		HttpSession sessionname = req.getSession();
		String name = (String) sessionname.getAttribute("user");
		sessionname.setAttribute("user", name);
		
		HttpSession sessionage = req.getSession();
		String e_age = (String) sessionage.getAttribute("age");
		sessionage.setAttribute("age", e_age);	
		
		String account = req.getParameter("page");

		if ("signout".equals(account))
		{
			if(sessionname != null) //If session is not null
			{
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern ("yyyy/MM/dd HH:mm:ss");
				LocalDateTime now = LocalDateTime.now();
				String time = dtf.format(now);
				
				try
				{
					Connection con = DBConnection.createConnection();
					Statement statement = con.createStatement();
					
					statement.executeUpdate("update users set time='" + time + "' where uname='" + uname + "'");
				}
				
				catch (SQLException e)
				{					
					e.printStackTrace();
				}
			
				sessionname.invalidate(); //removes all session attributes bound to the session
				
				req.getRequestDispatcher("/f_index.jsp").forward(req, res);
				
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin " + name + " will log out");
					System.out.println("\nAdmin " + name + " logged out at " + time);
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser " + name + " will log out");
					System.out.println("\nUser " + name + " logged out at " + time);
				}
			}
		}
		
		else if ("settings".equals(account))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Settings");
					req.getRequestDispatcher("/sia_settings.jsp").forward(req, res);
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Settings");
					req.getRequestDispatcher("/siu_settings.jsp").forward(req, res);
				}	
			}
		}
		
		else if ("profile".equals(account))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Profile");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Profile");
				}

				req.getRequestDispatcher("/si_profile.jsp").forward(req, res);
			}
		}
		
		else if ("students".equals(account))
		{
			if (name == null || name == "" || r == "User")
			{
				System.out.println(name + "\nAdmin: Students");
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Students");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Students");
				}
				
				req.getRequestDispatcher("/si_students.jsp").forward(req, res);
			}
		}
		
		else if ("home".equals(account))
		{
			if (name == null || name == "" || r == "User")
			{
				System.out.println(name + "\nAdmin: Home");
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Home");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Home");
				}
				
				req.getRequestDispatcher("/si_home.jsp").forward(req, res);
			}
		}
	}
}