package eteeap.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eteeap.dao.CoursesDao;
import eteeap.dao.StudentsDao;

public class ETEEAPHP extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public ETEEAPHP() {}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		String eteeap = req.getParameter("epage");
		
		if ("sign-in".equals(eteeap))
		{
			System.out.println("\nHomepage: Sign-in");
			req.getRequestDispatcher("/f_login.jsp").forward(req, res);
		}
		
		else if ("apply".equals(eteeap))
		{
			System.out.println("\nHomepage: Apply");
			req.getRequestDispatcher("/f_apply.jsp").forward(req, res);
		}
		
		else if ("offerings".equals(eteeap))
		{
			System.out.println("\nHomepage: Offerings");
			req.getRequestDispatcher("/f_offerings.jsp").forward(req, res);
		}
		
		else if ("home".equals(eteeap))
		{
			System.out.println("\nHomepage: Home");
			req.getRequestDispatcher("/f_index.jsp").forward(req, res);
		}
		
		else if ("forgotpw".equals(eteeap))
		{
			System.out.println("\nHomepage: Forgot Password");
			req.getRequestDispatcher("/f_forgotpw.jsp").forward(req, res);
		}
		
		else if ("studentapply".equals(eteeap))
		{			
			String fname = req.getParameter("fname");
			String mname = req.getParameter("mname");
			String sname = req.getParameter("sname");
			String course = req.getParameter("course");
			String pnum = req.getParameter("pnum");
			String mnum = req.getParameter("mnum");
			String email = req.getParameter("email");
			String degree = req.getParameter("degree");
			String school = req.getParameter("school");
			String year = req.getParameter("year");
				
			String cou = CoursesDao.getCourseCode(course);
			String V = StudentsDao.addStudent (fname, mname, sname, course, pnum, mnum, email, degree, school, year, cou);
				
			if (V.equals("DONE"))
			{
				System.out.println("\nStudent application submitted successfully.");
				req.setAttribute("errMessage", "Application submitted successfully.");
			}
			
			else if (V.equals("KEME"))
			{
				System.out.println("\nStudent application not submitted successfully.");
				req.setAttribute("errMessage", "Application not submitted successfully.");
			}

			req.getRequestDispatcher("/f_apply.jsp").forward(req, res);
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		String eteeap = req.getParameter("epage");
		
		if ("sign-in".equals(eteeap))
		{
			System.out.println("\nHomepage: Sign-in");
			req.getRequestDispatcher("/f_login.jsp").forward(req, res);
		}
		
		else if ("apply".equals(eteeap))
		{
			System.out.println("\nHomepage: Apply");
			req.getRequestDispatcher("/f_apply.jsp").forward(req, res);
		}
		
		else if ("offerings".equals(eteeap))
		{
			System.out.println("\nHomepage: Offerings");
			req.getRequestDispatcher("/f_offerings.jsp").forward(req, res);
		}
		
		else if ("home".equals(eteeap))
		{
			System.out.println("\nHomepage: Home");
			req.getRequestDispatcher("/f_index.jsp").forward(req, res);
		}
		
		else if ("forgotpw".equals(eteeap))
		{
			System.out.println("\nHomepage: Forgot Password");
			req.getRequestDispatcher("/f_forgotpw.jsp").forward(req, res);
		}
		
		else if ("studentapply".equals(eteeap))
		{			
			String fname = req.getParameter("fname");
			String mname = req.getParameter("mname");
			String sname = req.getParameter("sname");
			String course = req.getParameter("course");
			String pnum = req.getParameter("pnum");
			String mnum = req.getParameter("mnum");
			String email = req.getParameter("email");
			String degree = req.getParameter("degree");
			String school = req.getParameter("school");
			String year = req.getParameter("year");
				
			String cou = CoursesDao.getCourseCode(course);
			String V = StudentsDao.addStudent (fname, mname, sname, course, pnum, mnum, email, degree, school, year, cou);
				
			if (V.equals("DONE"))
			{
				System.out.println("\nStudent application submitted successfully.");
				req.setAttribute("errMessage", "Application submitted successfully.");
			}
			
			else if (V.equals("KEME"))
			{
				System.out.println("\nStudent application not submitted successfully.");
				req.setAttribute("errMessage", "Application not submitted successfully.");
			}

			req.getRequestDispatcher("/f_apply.jsp").forward(req, res);
		}
	}
}
