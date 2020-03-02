package eteeap.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	}
}
