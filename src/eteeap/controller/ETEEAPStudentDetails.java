package eteeap.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eteeap.bean.LoginBean;
import eteeap.connection.DBConnection;
import eteeap.dao.CoursesDao;
import eteeap.dao.StudentsDao;

public class ETEEAPStudentDetails extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public ETEEAPStudentDetails() {}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException
	{	
		HttpSession sessionname = req.getSession();
		String name = (String) sessionname.getAttribute("user");
		sessionname.setAttribute("user", name);
		
		HttpSession sessionrole = req.getSession();
		String r = (String) sessionrole.getAttribute("role");
		sessionrole.setAttribute("role", r);
		
		LoginBean loginBean = new LoginBean();
		
		String appnum = req.getParameter("appnum");
		String course = req.getParameter("course");
		String page = req.getParameter("page");
		loginBean.setAction(page);
		
		if ("front".equals(page))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{		
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Student Front.");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Student Front.");
				}
				req.setAttribute("course", course);
				req.setAttribute("appnum", appnum);
				req.getRequestDispatcher("/si_students_f.jsp").forward(req, res);
			}
		}
		
		else if ("personal".equals(page))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Student Personal Details.");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Student Personal Details.");
				}
				
				req.setAttribute("course", course);
				req.setAttribute("appnum", appnum);
				req.getRequestDispatcher("/si_students_pd.jsp").forward(req, res);
			}
		}
		
		else if ("checklist".equals(page))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Student Checklist.");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Student Checklist.");
				}
				
				req.setAttribute("course", course);
				req.setAttribute("appnum", appnum);
				req.getRequestDispatcher("/si_students_cl.jsp").forward(req, res);
			}
		}
		
		else if ("form".equals(page))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Student Accreditation Form.");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Student Accreditation Form.");
				}
				
				Connection con = null;
				Statement statement = null;
				ResultSet resultSet = null;
				
				try
				{
					con = DBConnection.createConnection();
					statement = con.createStatement();
					resultSet = statement.executeQuery("select * from checklist where a_appnum ='" +appnum+ "'");

					while(resultSet.next())
					{
						String c_intent = resultSet.getString("c_intent");
						String c_bcert = resultSet.getString("c_bcert");
						String c_appform = resultSet.getString("c_appform");
						String c_lsheet = resultSet.getString("c_lsheet");
						String c_receipt = resultSet.getString("c_receipt");
						String c_tor = resultSet.getString("c_tor");
						String c_dismissal = resultSet.getString("c_dismissal");
						String c_vitae = resultSet.getString("c_vitae");
						String c_trainings = resultSet.getString("c_trainings");
						String c_employment = resultSet.getString("c_employment");
						String c_spa = resultSet.getString("c_spa");
						String c = resultSet.getString("a_papplied");
						
						if(c_intent != null && c_bcert != null && c_appform != null && c_lsheet != null && c_receipt != null && c_tor != null 
							&& c_dismissal != null && c_vitae != null && c_trainings != null && c_employment != null && c_spa != null)
						{
							if(c_intent.equals("on") && c_bcert.equals("on") && c_appform.equals("on") && c_lsheet.equals("on") && c_receipt.equals("on") && c_tor.equals("on") 
									&& c_dismissal.equals("on") && c_vitae.equals("on") && c_trainings.equals("on") && c_employment.equals("on") && c_spa.equals("on"))
							{
								String V = CoursesDao.getCourseCode(c);
								String a = StudentsDao.check(appnum, V);
								
								if (a.equals("EXIST"))
								{
									req.setAttribute("appnum", appnum);
									req.setAttribute("course", V);
									req.getRequestDispatcher("/si_students_curr_a.jsp").forward(req, res);
								}
									
								else
								{
									req.setAttribute("appnum", appnum);
									req.setAttribute("course", V);
									req.getRequestDispatcher("/si_students_curr.jsp").forward(req, res);
								}
							}
							
							else
							{
								req.setAttribute("appnum", appnum);
								req.setAttribute("errMessage", "All requirements should be accomplished before proceeding to the Equivalency and Accreditaiton page.");
								req.getRequestDispatcher("/si_students_f.jsp").forward(req, res);
							}
						}
						
						else
						{
							req.setAttribute("appnum", appnum);
							req.getRequestDispatcher("/si_students_f.jsp").forward(req, res);
						}
					}
				}
				
				catch(SQLException e)
				{
					e.printStackTrace();
				}
			}
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException
	{
		HttpSession sessionname = req.getSession();
		String name = (String) sessionname.getAttribute("user");
		sessionname.setAttribute("user", name);
		
		HttpSession sessionrole = req.getSession();
		String r = (String) sessionrole.getAttribute("role");
		sessionrole.setAttribute("role", r);
		
		LoginBean loginBean = new LoginBean();
		
		String appnum = req.getParameter("appnum");
		String course = req.getParameter("course");
		String page = req.getParameter("page");
		loginBean.setAction(page);
		
		if ("front".equals(page))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{		
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Student Front.");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Student Front.");
				}
				req.setAttribute("course", course);
				req.setAttribute("appnum", appnum);
				req.getRequestDispatcher("/si_students_f.jsp").forward(req, res);
			}
		}
		
		else if ("personal".equals(page))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Student Personal Details.");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Student Personal Details.");
				}
				
				req.setAttribute("course", course);
				req.setAttribute("appnum", appnum);
				req.getRequestDispatcher("/si_students_pd.jsp").forward(req, res);
			}
		}
		
		else if ("checklist".equals(page))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Student Checklist.");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Student Checklist.");
				}
				
				req.setAttribute("course", course);
				req.setAttribute("appnum", appnum);
				req.getRequestDispatcher("/si_students_cl.jsp").forward(req, res);
			}
		}
		
		else if ("form".equals(page))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Student Accreditation Form.");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Student Accreditation Form.");
				}
				
				Connection con = null;
				Statement statement = null;
				ResultSet resultSet = null;
				
				try
				{
					con = DBConnection.createConnection();
					statement = con.createStatement();
					resultSet = statement.executeQuery("select * from checklist where a_appnum ='" +appnum+ "'");

					while(resultSet.next())
					{
						String c_intent = resultSet.getString("c_intent");
						String c_bcert = resultSet.getString("c_bcert");
						String c_appform = resultSet.getString("c_appform");
						String c_lsheet = resultSet.getString("c_lsheet");
						String c_receipt = resultSet.getString("c_receipt");
						String c_tor = resultSet.getString("c_tor");
						String c_dismissal = resultSet.getString("c_dismissal");
						String c_vitae = resultSet.getString("c_vitae");
						String c_trainings = resultSet.getString("c_trainings");
						String c_employment = resultSet.getString("c_employment");
						String c_spa = resultSet.getString("c_spa");
						String c = resultSet.getString("a_papplied");
						
						if(c_intent != null && c_bcert != null && c_appform != null && c_lsheet != null && c_receipt != null && c_tor != null 
							&& c_dismissal != null && c_vitae != null && c_trainings != null && c_employment != null && c_spa != null)
						{
							if(c_intent.equals("on") && c_bcert.equals("on") && c_appform.equals("on") && c_lsheet.equals("on") && c_receipt.equals("on") && c_tor.equals("on") 
									&& c_dismissal.equals("on") && c_vitae.equals("on") && c_trainings.equals("on") && c_employment.equals("on") && c_spa.equals("on"))
							{
								String V = CoursesDao.getCourseCode(c);
								String a = StudentsDao.check(appnum, V);
								
								if (a.equals("EXIST"))
								{
									req.setAttribute("appnum", appnum);
									req.setAttribute("course", V);
									req.getRequestDispatcher("/si_students_curr_a.jsp").forward(req, res);
								}
									
								else
								{
									req.setAttribute("appnum", appnum);
									req.setAttribute("course", V);
									req.getRequestDispatcher("/si_students_curr.jsp").forward(req, res);
								}
							}
							
							else
							{
								req.setAttribute("appnum", appnum);
								req.setAttribute("errMessage", "All requirements should be accomplished before proceeding to the Equivalency and Accreditaiton page.");
								req.getRequestDispatcher("/si_students_f.jsp").forward(req, res);
							}
						}
						
						else
						{
							req.setAttribute("appnum", appnum);
							req.getRequestDispatcher("/si_students_f.jsp").forward(req, res);
						}
					}
				}
				
				catch(SQLException e)
				{
					e.printStackTrace();
				}
			}
		}
	}
}