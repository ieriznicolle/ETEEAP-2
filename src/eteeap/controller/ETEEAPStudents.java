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

public class ETEEAPStudents extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public ETEEAPStudents() {}
	
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
		
		String student = req.getParameter("act");
		loginBean.setAction(student);
		
		if ("addstudent".equals(student))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
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
					System.out.println("\nStudent Added Successfully.");
					req.setAttribute("errMessage", "Student Added Successfully.");
				}
				
				else if (V.equals("KEME"))
				{
					System.out.println("\nAdding student not successful.");
					req.setAttribute("errMessage", "Adding student not successful.");
				}

				req.getRequestDispatcher("/si_students.jsp").forward(req, res);
			}
		}
		
		else if ("editstudenta".equals(student))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				String appnum = req.getParameter("appnum_");

				req.setAttribute("appnum", appnum);
				req.getRequestDispatcher("/si_students_a.jsp").forward(req, res);
			}
		}
		
		else if ("editstudent".equals(student))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
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
				String appnum = req.getParameter("appnumber");
				String cou = CoursesDao.getCourseCode(course);
				String V = StudentsDao.editStudent (appnum, fname, mname, sname, course, pnum, mnum, email, degree, school, year, cou);
	
				if (V.equals("DONE"))
				{
					System.out.println("\nStudent Edited Successfully.");
					req.setAttribute("errMessage", "Student details edited successfully.");
				}
				
				else if (V.equals("KEME"))
				{
					System.out.println("\nEditing student details not successful.");
					req.setAttribute("errMessage", "Editing student details not successful.");
				}

				req.getRequestDispatcher("/si_students.jsp").forward(req, res);
			}
		}
		
		else if ("deletestudent".equals(student))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				String appnum = req.getParameter("appnum");
				
				String V = StudentsDao.deleteStudent(appnum);

				
				if (V.equals("DONE"))
				{
					System.out.println("\nStudent Deleted Successfully.");
					req.setAttribute("errMessage", "Student Deleted Successfully.");
				}
				
				else if (V.equals("KEME"))
				{
					System.out.println("\nDeleting student not successful.");
					req.setAttribute("errMessage", "Deleting student not successful.");
				}

				req.getRequestDispatcher("/si_students.jsp").forward(req, res);
			}
		}
		
		else if ("checklist".equals(student))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				System.out.println("\nStudent Checklist");
				
				String a_appnum = req.getParameter("appnumber");
				String c_intent = req.getParameter("c_intent");
				String c_bcert = req.getParameter("c_bcert");
				String c_appform = req.getParameter("c_appform");
				String c_lsheet = req.getParameter("c_lsheet");
				String c_receipt = req.getParameter("c_receipt");
				String c_tor = req.getParameter("c_tor");
				String c_dismissal = req.getParameter("c_dismissal");
				String c_vitae = req.getParameter("c_vitae");
				String c_trainings = req.getParameter("c_trainings");
				String c_employment = req.getParameter("c_employment");
				String c_spa = req.getParameter("c_spa");
				String r_intent = req.getParameter("r_intent");
				String r_bcert = req.getParameter("r_bcert");
				String r_appform = req.getParameter("r_appform");
				String r_lsheet = req.getParameter("r_lsheet");
				String r_receipt = req.getParameter("r_receipt");
				String r_tor = req.getParameter("r_tor");
				String r_dismissal = req.getParameter("r_dismissal");
				String r_vitae = req.getParameter("r_vitae");
				String r_trainings = req.getParameter("r_trainings");
				String r_employment = req.getParameter("r_employment");
				String r_spa = req.getParameter("r_spa");
				
				String V = StudentsDao.checklist(a_appnum, c_intent, c_bcert, c_appform, c_lsheet, c_receipt, c_tor, c_dismissal,
											c_vitae, c_trainings, c_employment, c_spa, r_intent, r_bcert, r_appform,
											r_lsheet, r_receipt, r_tor, r_dismissal, r_vitae, r_trainings, r_employment, r_spa);

				if (V.equals("COMPLETED"))
				{
					req.setAttribute("appnum", a_appnum);
					System.out.println("\nStudent Checklist Completed Successfully.");
					req.setAttribute("errMessage", "Student Checklist Completed Successfully.");
				}
				
				else if (V.equals("NOT YET COMPLETE"))
				{
					req.setAttribute("appnum", a_appnum);
					System.out.println("\nStudent checklist not yet complete.");
					req.setAttribute("errMessage", "Student checklist not yet complete.");
				}
				
				else if (V.equals("KEME"))
				{
					req.setAttribute("appnum", a_appnum);
					req.setAttribute("errMessage", "Error saving student checklist.");
				}
				
				req.getRequestDispatcher("/si_students_cl.jsp").forward(req, res);
			}
		}
		
		else if ("viewlist".equals(student))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Student View List.");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Student View List.");
				}
				
				req.getRequestDispatcher("/si_students_vl.jsp").forward(req, res);
			}
		}
		
		else if ("curriculum".equals(student))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				System.out.println("\nStudent Equivalency and Accreditation Form");
				
				int length = Integer.parseInt(req.getParameter("length"));
				String appnum = req.getParameter("appnum");
				String pcode = req.getParameter("pcode");
				
				Connection con = null;
				Statement statement = null;
				ResultSet resultSet = null;
				
				try
				{
					con = DBConnection.createConnection();
					statement = con.createStatement();

					resultSet = statement.executeQuery("select * from grades where g_appnum = " + appnum);
					
					if (resultSet.first())
					{
						//UPDATE
						for (int i=0; i < length; i++)
						{
							String cd = "cd" + i;
							String evidence = "evidence" + i;
							String cct = "cct" + i;
							String grade = "grade" + i;
							String units = "units" + i;
							String remarks = "remarks" + i;
							
							cd = req.getParameter(cd);
							evidence = req.getParameter(evidence);
							cct = req.getParameter(cct);
							grade = req.getParameter(grade);
							units = req.getParameter(units);
							remarks = req.getParameter(remarks);		
						
							statement.executeUpdate("UPDATE grades set g_compet ='" +cd+ "' where g_appnum =" +appnum+ " and g_num =" + i);
							statement.executeUpdate("UPDATE grades set g_evidence ='" +evidence+ "' where g_appnum =" +appnum+ " and g_num =" + i);
							statement.executeUpdate("UPDATE grades set g_cct ='" +cct+ "' where g_appnum =" +appnum+ " and g_num =" + i);
							statement.executeUpdate("UPDATE grades set g_grade ='" +grade+ "' where g_appnum =" +appnum+ " and g_num =" + i);
							statement.executeUpdate("UPDATE grades set g_units ='" +units+ "' where g_appnum =" +appnum+ " and g_num =" + i);
							statement.executeUpdate("UPDATE grades set g_remarks ='" +remarks+ "' where g_appnum =" +appnum+ " and g_num =" + i);
						}
										
						for (int o=0; o < 3; o++)
						{
							String assessor = "assessor" + o;
							String assessed = "assessed" + o;
							
							assessor = req.getParameter(assessor);
							assessed = req.getParameter(assessed);
							
							int a = 1;
							if (assessed.length() > a)
							{
								assessed = "'" + assessed + "'";
							}
							
							else if (assessed.length() < a)
							{
								assessed = null;
							}
							
							statement.executeUpdate("UPDATE assess set assessor ='" +assessor+ "' where appnum = " + appnum+ " and g_num =" + o);
							statement.executeUpdate("UPDATE assess set date =" +assessed+ " where appnum = " + appnum+ " and g_num =" + o);
						}
					}
					
					else
					{
						//INSERT
						for (int i=0; i < length; i++)
						{
							String cd = "cd" + i;
							String evidence = "evidence" + i;
							String cct = "cct" + i;
							String grade = "grade" + i;
							String units = "units" + i;
							String remarks = "remarks" + i;
							
							cd = req.getParameter(cd);
							evidence = req.getParameter(evidence);
							cct = req.getParameter(cct);
							grade = req.getParameter(grade);
							units = req.getParameter(units);
							remarks = req.getParameter(remarks);
							
							statement.executeUpdate("INSERT INTO grades (g_appnum, g_pcode, g_compet, g_evidence, g_cct, g_grade, g_units, g_remarks, g_num)"
									+ "VALUES ('" +appnum+ "', '" +pcode+ "', '" +cd+ "', '" +evidence+ "', '" +cct+ "', '" +grade+ "', '" +units+ "', '" +remarks+ "', '" +i+ "');"); 
						}
						
						for (int o=0; o < 3; o++)
						{
							String assessor = "assessor" + o;
							String assessed = "assessed" + o;
							
							assessor = req.getParameter(assessor);
							assessed = req.getParameter(assessed);
							
							int a = 1;
							if (assessed.length() > a)
							{
								assessed = "'" + assessed + "'";
							}
							
							else if (assessed.length() < a)
							{
								assessed = null;
							}
							
							statement.executeUpdate("INSERT INTO assess (assessor, date, appnum, g_num)"
									+ "VALUES ('" +assessor+ "', '" +assessed+ "', '" +appnum+ "', '" +o+ ");"); 	
						}
					}
				}
				
				catch(SQLException e)
				{
					e.printStackTrace();
				}	

				req.setAttribute("appnum", appnum);
				req.setAttribute("course", pcode);
				req.getRequestDispatcher("/si_students_curr_a.jsp").forward(req, res);
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
		
		String student = req.getParameter("act");
		loginBean.setAction(student);
		
		if ("addstudent".equals(student))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
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
					System.out.println("\nStudent Added Successfully.");
					req.setAttribute("errMessage", "Application submitted successfully.");
				}
				
				else if (V.equals("KEME"))
				{
					System.out.println("\nAdding student not successful.");
					req.setAttribute("errMessage", "Application not submitted successfully.");
				}

				req.getRequestDispatcher("/si_students.jsp").forward(req, res);
			}
		}
		
		else if ("editstudenta".equals(student))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				String appnum = req.getParameter("appnum_");

				req.setAttribute("appnum", appnum);
				req.getRequestDispatcher("/si_students_a.jsp").forward(req, res);
			}
		}
		
		else if ("editstudent".equals(student))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
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
				String appnum = req.getParameter("appnumber");
				String cou = CoursesDao.getCourseCode(course);
				String V = StudentsDao.editStudent (appnum, fname, mname, sname, course, pnum, mnum, email, degree, school, year, cou);
	
				if (V.equals("DONE"))
				{
					System.out.println("\nStudent Edited Successfully.");
					req.setAttribute("errMessage", "Student details edited successfully.");
				}
				
				else if (V.equals("KEME"))
				{
					System.out.println("\nEditing student details not successful.");
					req.setAttribute("errMessage", "Editing student details not successful.");
				}

				req.getRequestDispatcher("/si_students.jsp").forward(req, res);
			}
		}
		
		else if ("deletestudent".equals(student))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				String appnum = req.getParameter("appnum");
				
				String V = StudentsDao.deleteStudent(appnum);

				
				if (V.equals("DONE"))
				{
					System.out.println("\nStudent Deleted Successfully.");
					req.setAttribute("errMessage", "Student Deleted Successfully.");
				}
				
				else if (V.equals("KEME"))
				{
					System.out.println("\nDeleting student not successful.");
					req.setAttribute("errMessage", "Deleting student not successful.");
				}

				req.getRequestDispatcher("/si_students.jsp").forward(req, res);
			}
		}
		
		else if ("checklist".equals(student))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				System.out.println("\nStudent Checklist");
				
				String a_appnum = req.getParameter("appnumber");
				String c_intent = req.getParameter("c_intent");
				String c_bcert = req.getParameter("c_bcert");
				String c_appform = req.getParameter("c_appform");
				String c_lsheet = req.getParameter("c_lsheet");
				String c_receipt = req.getParameter("c_receipt");
				String c_tor = req.getParameter("c_tor");
				String c_dismissal = req.getParameter("c_dismissal");
				String c_vitae = req.getParameter("c_vitae");
				String c_trainings = req.getParameter("c_trainings");
				String c_employment = req.getParameter("c_employment");
				String c_spa = req.getParameter("c_spa");
				String r_intent = req.getParameter("r_intent");
				String r_bcert = req.getParameter("r_bcert");
				String r_appform = req.getParameter("r_appform");
				String r_lsheet = req.getParameter("r_lsheet");
				String r_receipt = req.getParameter("r_receipt");
				String r_tor = req.getParameter("r_tor");
				String r_dismissal = req.getParameter("r_dismissal");
				String r_vitae = req.getParameter("r_vitae");
				String r_trainings = req.getParameter("r_trainings");
				String r_employment = req.getParameter("r_employment");
				String r_spa = req.getParameter("r_spa");
				
				String V = StudentsDao.checklist(a_appnum, c_intent, c_bcert, c_appform, c_lsheet, c_receipt, c_tor, c_dismissal,
											c_vitae, c_trainings, c_employment, c_spa, r_intent, r_bcert, r_appform,
											r_lsheet, r_receipt, r_tor, r_dismissal, r_vitae, r_trainings, r_employment, r_spa);

				if (V.equals("COMPLETED"))
				{
					req.setAttribute("appnum", a_appnum);
					System.out.println("\nStudent Checklist Completed Successfully.");
					req.setAttribute("errMessage", "Student Checklist Completed Successfully.");
				}
				
				else if (V.equals("NOT YET COMPLETE"))
				{
					req.setAttribute("appnum", a_appnum);
					System.out.println("\nStudent checklist not yet complete.");
					req.setAttribute("errMessage", "Student checklist not yet complete.");
				}
				
				else if (V.equals("KEME"))
				{
					req.setAttribute("appnum", a_appnum);
					req.setAttribute("errMessage", "Error saving student checklist.");
				}
				
				req.getRequestDispatcher("/si_students_cl.jsp").forward(req, res);
			}
		}
		
		else if ("viewlist".equals(student))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				if (r.equals("Admin"))
				{
					System.out.println("\nAdmin: Student View List.");
				}
				
				else if (r.equals("User"))
				{
					System.out.println("\nUser: Student View List.");
				}
				
				req.getRequestDispatcher("/si_students_vl.jsp").forward(req, res);
			}
		}
		
		else if ("curriculum".equals(student))
		{
			if (name == null || name == "")
			{
				res.sendRedirect("f_login.jsp");
			}
			
			else
			{
				System.out.println("\nStudent Equivalency and Accreditation Form");
				
				int length = Integer.parseInt(req.getParameter("length"));
				String appnum = req.getParameter("appnum");
				String pcode = req.getParameter("pcode");
				
				Connection con = null;
				Statement statement = null;
				ResultSet resultSet = null;
				
				try
				{
					con = DBConnection.createConnection();
					statement = con.createStatement();

					resultSet = statement.executeQuery("select * from grades where g_appnum = " + appnum);
					
					if (resultSet.first())
					{
						//UPDATE
						for (int i=0; i < length; i++)
						{
							String cd = "cd" + i;
							String evidence = "evidence" + i;
							String cct = "cct" + i;
							String grade = "grade" + i;
							String units = "units" + i;
							String remarks = "remarks" + i;
							
							cd = req.getParameter(cd);
							evidence = req.getParameter(evidence);
							cct = req.getParameter(cct);
							grade = req.getParameter(grade);
							units = req.getParameter(units);
							remarks = req.getParameter(remarks);		
						
							statement.executeUpdate("UPDATE grades set g_compet ='" +cd+ "' where g_appnum =" +appnum+ " and g_num =" + i);
							statement.executeUpdate("UPDATE grades set g_evidence ='" +evidence+ "' where g_appnum =" +appnum+ " and g_num =" + i);
							statement.executeUpdate("UPDATE grades set g_cct ='" +cct+ "' where g_appnum =" +appnum+ " and g_num =" + i);
							statement.executeUpdate("UPDATE grades set g_grade ='" +grade+ "' where g_appnum =" +appnum+ " and g_num =" + i);
							statement.executeUpdate("UPDATE grades set g_units ='" +units+ "' where g_appnum =" +appnum+ " and g_num =" + i);
							statement.executeUpdate("UPDATE grades set g_remarks ='" +remarks+ "' where g_appnum =" +appnum+ " and g_num =" + i);
						}
										
						for (int o=0; o < 3; o++)
						{
							String assessor = "assessor" + o;
							String assessed = "assessed" + o;
							
							assessor = req.getParameter(assessor);
							assessed = req.getParameter(assessed);
							
							int a = 1;
							if (assessed.length() > a)
							{
								assessed = "'" + assessed + "'";
								System.out.println(assessed);
							}
							
							else if (assessed.length() < a)
							{
								assessed = null;
							}
							
							statement.executeUpdate("UPDATE assess set assessor ='" +assessor+ "' where appnum = " + appnum+ " and g_num =" + o);
							statement.executeUpdate("UPDATE assess set date =" +assessed+ " where appnum = " + appnum+ " and g_num =" + o);
						}
					}
					
					else
					{
						//INSERT
						for (int i=0; i < length; i++)
						{
							String cd = "cd" + i;
							String evidence = "evidence" + i;
							String cct = "cct" + i;
							String grade = "grade" + i;
							String units = "units" + i;
							String remarks = "remarks" + i;
							
							cd = req.getParameter(cd);
							evidence = req.getParameter(evidence);
							cct = req.getParameter(cct);
							grade = req.getParameter(grade);
							units = req.getParameter(units);
							remarks = req.getParameter(remarks);
							
							statement.executeUpdate("INSERT INTO grades (g_appnum, g_pcode, g_compet, g_evidence, g_cct, g_grade, g_units, g_remarks, g_num)"
									+ "VALUES ('" +appnum+ "', '" +pcode+ "', '" +cd+ "', '" +evidence+ "', '" +cct+ "', '" +grade+ "', '" +units+ "', '" +remarks+ "', '" +i+ "');"); 
						}
						
						for (int o=0; o < 3; o++)
						{
							String assessor = "assessor" + o;
							String assessed = "assessed" + o;
							
							assessor = req.getParameter(assessor);
							assessed = req.getParameter(assessed);
							
							int a = 1;
							if (assessed.length() > a)
							{
								assessed = "'" + assessed + "'";
							}
							
							else if (assessed.length() < a)
							{
								assessed = null;
							}
							
							statement.executeUpdate("INSERT INTO assess (assessor, date, appnum, g_num)"
									+ "VALUES ('" +assessor+ "', '" +assessed+ "', '" +appnum+ "', '" +o+ ");"); 	
						}
					}
				}
				
				catch(SQLException e)
				{
					e.printStackTrace();
				}	

				req.setAttribute("appnum", appnum);
				req.setAttribute("course", pcode);
				req.getRequestDispatcher("/si_students_curr_a.jsp").forward(req, res);
			}
		}
	}
}