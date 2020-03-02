package eteeap.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eteeap.bean.LoginBean;
import eteeap.dao.SettingsDao;

public class ETEEAPSettings extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public ETEEAPSettings() {}
	
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
		
		LoginBean loginBean = new LoginBean();
		
		String settings = req.getParameter("act");
		loginBean.setAction(settings);
		
		if ("adminsettings".equals(settings))
		{
			if (name == null || name == "" || r == "User")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				System.out.println("\nAdmin: Admin Settings");
				req.getRequestDispatcher("/settings_admin_a.jsp").forward(req, res);
			}
		}
		
		else if ("accountsettings".equals(settings))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Account Settings");
					req.getRequestDispatcher("/settings_account_a.jsp").forward(req, res);
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Account Settings");
					req.getRequestDispatcher("/settings_account_u.jsp").forward(req, res);
				}
			}
		}
		
		else if ("editprofile".equals(settings))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				String pname = req.getParameter("pname");
				String fname = req.getParameter("fname");
				String mname = req.getParameter("mname");
				String sname = req.getParameter("sname");
				String bday = req.getParameter("bday");
				String contact = req.getParameter("contact");
				String address = req.getParameter("address");
				String email = req.getParameter("email");
				
				System.out.println("\nProfile Details");
				System.out.println(fname + "\n" + mname + "\n" + sname + "\n" + bday + "\n" + contact + "\n" + address + "\n" + email);
				
				String V = SettingsDao.editProfile(pname, uname, fname, mname, sname, bday, contact, address, email);
				
				if (V.equals("Edit Profile Successful"))
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
				
				else if (V.equals("Edit Profile Not Successful"))
				{
					req.setAttribute("errMessage", V);
					
					if (r.equals("Admin"))
					{
						System.out.println("\nAdmin: Wrong Profile");
						req.getRequestDispatcher("/settings_account_a.jsp").forward(req, res);
					}
					
					else if (r.equals("User"))
					{
						System.out.println("\nUser: Wrong Profile");
						req.getRequestDispatcher("/settings_account_u.jsp").forward(req, res);
					}
				}
			}
		}
		
		else if ("changepw".equals(settings))
		{
			if (name == null || name == "" || r == "User")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				loginBean.setUserName(uname);
				String password = req.getParameter("password");
				loginBean.setPassword(password);
				String npw = req.getParameter("npw");
				String rpw = req.getParameter("rpw");
				
				System.out.println("Admin Password Change Request");
				System.out.println(password + "\n" + npw + "\n" + rpw);
				
				String V = SettingsDao.changePassword(password, npw, rpw, name, uname, settings);

				if (V.equals("OLDPW"))
				{
					System.out.println("\nOld password and new password are the same!");
					req.setAttribute("errMessage", "Old password and new password are the same!");
					
					if (r.equals("Admin"))
					{
						System.out.println("\nAdmin: Old Password");
						req.getRequestDispatcher("/settings_account_a.jsp").forward(req, res);
					}
					
					else if (r.equals("User"))
					{
						System.out.println("\nUser: Old Password");
						req.getRequestDispatcher("/settings_account_u.jsp").forward(req, res);
					}
				}
				
				else if (V.equals("CHANGEDPW"))
				{
					System.out.println("\nPassword Updated Successfully.");
					sessionname.invalidate(); 
					req.getRequestDispatcher("/f_login.jsp").forward(req, res);
				}
				
				else if (V.equals("WRONG"))
				{
					System.out.println("\nWrong User Credentials!");
					req.setAttribute("errMessage", "Wrong User Credentials!");
					
					if (r.equals("Admin"))
					{
						System.out.println("\nAdmin: Wrong Password");
						req.getRequestDispatcher("/settings_account_a.jsp").forward(req, res);
					}
					
					else if (r.equals("User"))
					{
						System.out.println("\nUser: Wrong Password");
						req.getRequestDispatcher("/settings_account_u.jsp").forward(req, res);
					}
				}
			}
		}
		
		else if ("adduser".equals(settings))
		{
			if (name == null || name == "" || r == "User")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				String empnum = req.getParameter("empnum");
				String pname = req.getParameter("pname");
				String fname = req.getParameter("fname");
				String mname = req.getParameter("mname");
				String sname = req.getParameter("sname");
				String username = req.getParameter("username");
				String position = req.getParameter("position");
				String role = req.getParameter("role");
				String email = req.getParameter("email");
				String bday = req.getParameter("bday");
				String contact = req.getParameter("contact");
				String address = req.getParameter("address");
				
				String V = SettingsDao.addUser(empnum, pname, fname, mname, sname, username, position, role, email, bday, contact, address);

				if (V.equals("DONE"))
				{
					System.out.println("\nEmployee Added Successfully.");
					req.setAttribute("errMessage", "Employee Added Successfully.");
					req.getRequestDispatcher("/settings_admin_a.jsp").forward(req, res);
				}
				
				else if (V.equals("KEME"))
				{
					if (r.equals("Admin"))
					{
						System.out.println("\nEmployee Is Not Added Successfully.");
						req.setAttribute("errMessage", "Duplicate Credentials");
						req.getRequestDispatcher("/settings_admin_a.jsp").forward(req, res);
					}
					
					else if (r.equals("User"))
					{
						res.sendRedirect("f_login.jsp");
					}
				}
			}
		}
		
		else if ("edituser".equals(settings))
		{
			if (name == null || name == "" || r == "User")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				String empname = req.getParameter("name");
				String empnum = req.getParameter("empnum");
				String username = req.getParameter("username");
				String position = req.getParameter("position");
				String role = req.getParameter("role");
				
				String V = SettingsDao.editUser(empname, empnum, username, position, role);

				if (V.equals("DONE"))
				{
					System.out.println("\nEmployee details edited successfully.");
					req.setAttribute("errMessage", "Employee details edited successfully.");
					req.getRequestDispatcher("/settings_admin_a.jsp").forward(req, res);
				}
				
				else if (V.equals("KEME"))
				{
					System.out.println("\nEmployee details not edited successfully.");
					req.setAttribute("errMessage", "Employee details not edited successfully.");
					req.getRequestDispatcher("/settings_admin_a.jsp").forward(req, res);
				}
			}
		}
		
		else if ("editusera".equals(settings))
		{
			if (name == null || name == "" || r == "User")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				String empnum = req.getParameter("empnum_");

				req.setAttribute("emp", empnum);
				req.getRequestDispatcher("/settings_admin_aa.jsp").forward(req, res);
			}
		}
		
		else if ("deleteuser".equals(settings))
		{
			if (name == null || name == "" || r == "User")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				String empnum = req.getParameter("empnum");
				
				String V = SettingsDao.deleteUser(empnum);

				if (V.equals("DONE"))
				{
					System.out.println("\nEmployee details deleted successfully.");
					req.setAttribute("errMessage", "Employee details deleted successfully.");
					req.getRequestDispatcher("/settings_admin_a.jsp").forward(req, res);
				}
				
				else if (V.equals("KEME"))
				{
					System.out.println("\nEmployee details not deleted successfully.");
					req.setAttribute("errMessage", "Employee details not deleted successfully.");
					req.getRequestDispatcher("/settings_admin_a.jsp").forward(req, res);
				}
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
		
		LoginBean loginBean = new LoginBean();
		
		String settings = req.getParameter("act");
		loginBean.setAction(settings);
		
		if ("adminsettings".equals(settings))
		{
			if (name == null || name == "" || r == "User")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				System.out.println("\nAdmin: Admin Settings");
				req.getRequestDispatcher("/settings_admin_a.jsp").forward(req, res);
			}
		}
		
		else if ("accountsettings".equals(settings))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Account Settings");
					req.getRequestDispatcher("/settings_account_a.jsp").forward(req, res);
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Account Settings");
					req.getRequestDispatcher("/settings_account_u.jsp").forward(req, res);
				}
			}
		}
		
		else if ("editprofile".equals(settings))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				String pname = req.getParameter("pname");
				String fname = req.getParameter("fname");
				String mname = req.getParameter("mname");
				String sname = req.getParameter("sname");
				String bday = req.getParameter("bday");
				String contact = req.getParameter("contact");
				String address = req.getParameter("address");
				String email = req.getParameter("email");
				
				System.out.println("\nProfile Details");
				System.out.println(fname + "\n" + mname + "\n" + sname + "\n" + bday + "\n" + contact + "\n" + address + "\n" + email);
				
				String V = SettingsDao.editProfile(pname, uname, fname, mname, sname, bday, contact, address, email);
				
				if (V.equals("Edit Profile Successful"))
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
				
				else if (V.equals("Edit Profile Not Successful"))
				{
					req.setAttribute("errMessage", V);
					
					if (r.equals("Admin"))
					{
						System.out.println("\nAdmin: Wrong Profile");
						req.getRequestDispatcher("/settings_account_a.jsp").forward(req, res);
					}
					
					else if (r.equals("User"))
					{
						System.out.println("\nUser: Wrong Profile");
						req.getRequestDispatcher("/settings_account_u.jsp").forward(req, res);
					}
				}
			}
		}
		
		else if ("changepw".equals(settings))
		{
			if (name == null || name == "" || r == "User")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				loginBean.setUserName(uname);
				String password = req.getParameter("password");
				loginBean.setPassword(password);
				String npw = req.getParameter("npw");
				String rpw = req.getParameter("rpw");
				
				System.out.println("Admin Password Change Request");
				System.out.println(password + "\n" + npw + "\n" + rpw);
				
				String V = SettingsDao.changePassword(password, npw, rpw, name, uname, settings);

				if (V.equals("OLDPW"))
				{
					System.out.println("\nOld password and new password are the same!");
					req.setAttribute("errMessage", "Old password and new password are the same!");
					
					if (r.equals("Admin"))
					{
						System.out.println("\nAdmin: Old Password");
						req.getRequestDispatcher("/settings_account_a.jsp").forward(req, res);
					}
					
					else if (r.equals("User"))
					{
						System.out.println("\nUser: Old Password");
						req.getRequestDispatcher("/settings_account_u.jsp").forward(req, res);
					}
				}
				
				else if (V.equals("CHANGEDPW"))
				{
					System.out.println("\nPassword Updated Successfully.");
					sessionname.invalidate(); 
					req.getRequestDispatcher("/f_login.jsp").forward(req, res);
				}
				
				else if (V.equals("WRONG"))
				{
					System.out.println("\nWrong User Credentials!");
					req.setAttribute("errMessage", "Wrong User Credentials!");
					
					if (r.equals("Admin"))
					{
						System.out.println("\nAdmin: Wrong Password");
						req.getRequestDispatcher("/settings_account_a.jsp").forward(req, res);
					}
					
					else if (r.equals("User"))
					{
						System.out.println("\nUser: Wrong Password");
						req.getRequestDispatcher("/settings_account_u.jsp").forward(req, res);
					}
				}
			}
		}
		
		else if ("adduser".equals(settings))
		{
			if (name == null || name == "" || r == "User")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				String empnum = req.getParameter("empnum");
				String pname = req.getParameter("pname");
				String fname = req.getParameter("fname");
				String mname = req.getParameter("mname");
				String sname = req.getParameter("sname");
				String username = req.getParameter("username");
				String position = req.getParameter("position");
				String role = req.getParameter("role");
				String email = req.getParameter("email");
				String bday = req.getParameter("bday");
				String contact = req.getParameter("contact");
				String address = req.getParameter("address");
				
				String V = SettingsDao.addUser(empnum, pname, fname, mname, sname, username, position, role, email, bday, contact, address);

				if (V.equals("DONE"))
				{
					System.out.println("\nEmployee Added Successfully.");
					req.setAttribute("errMessage", "Employee Added Successfully.");
					req.getRequestDispatcher("/settings_admin_a.jsp").forward(req, res);
				}
				
				else if (V.equals("KEME"))
				{
					if (r.equals("Admin"))
					{
						System.out.println("\nEmployee Is Not Added Successfully.");
						req.setAttribute("errMessage", "Duplicate Credentials");
						req.getRequestDispatcher("/settings_admin_a.jsp").forward(req, res);
					}
					
					else if (r.equals("User"))
					{
						res.sendRedirect("f_login.jsp");
					}
				}
			}
		}
		
		else if ("edituser".equals(settings))
		{
			if (name == null || name == "" || r == "User")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				String empname = req.getParameter("name");
				String empnum = req.getParameter("empnum");
				String username = req.getParameter("username");
				String position = req.getParameter("position");
				String role = req.getParameter("role");
				
				String V = SettingsDao.editUser(empname, empnum, username, position, role);

				if (V.equals("DONE"))
				{
					System.out.println("\nEmployee details edited successfully.");
					req.setAttribute("errMessage", "Employee details edited successfully.");
					req.getRequestDispatcher("/settings_admin_a.jsp").forward(req, res);
				}
				
				else if (V.equals("KEME"))
				{
					System.out.println("\nEmployee details not edited successfully.");
					req.setAttribute("errMessage", "Employee details not edited successfully.");
					req.getRequestDispatcher("/settings_admin_a.jsp").forward(req, res);
				}
			}
		}
		
		else if ("editusera".equals(settings))
		{
			if (name == null || name == "" || r == "User")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				String empnum = req.getParameter("empnum_");

				req.setAttribute("emp", empnum);
				req.getRequestDispatcher("/settings_admin_aa.jsp").forward(req, res);
			}
		}
		
		else if ("deleteuser".equals(settings))
		{
			if (name == null || name == "" || r == "User")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				String empnum = req.getParameter("empnum");
				
				String V = SettingsDao.deleteUser(empnum);

				if (V.equals("DONE"))
				{
					System.out.println("\nEmployee details deleted successfully.");
					req.setAttribute("errMessage", "Employee details deleted successfully.");
					req.getRequestDispatcher("/settings_admin_a.jsp").forward(req, res);
				}
				
				else if (V.equals("KEME"))
				{
					System.out.println("\nEmployee details not deleted successfully.");
					req.setAttribute("errMessage", "Employee details not deleted successfully.");
					req.getRequestDispatcher("/settings_admin_a.jsp").forward(req, res);
				}
			}
		}
	}
}