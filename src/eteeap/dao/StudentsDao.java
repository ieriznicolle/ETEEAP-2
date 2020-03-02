package eteeap.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import eteeap.connection.DBConnection;

public class StudentsDao 
{
	public static String addStudent (String fname, String mname, String sname, String course, String pnum, String mnum, String email, String degree, String school, String year, String cou)
	{
		System.out.println("\nAdd Student");
		
		Connection con = null;
		Statement statement = null;
		
		String name = "";
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
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern ("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String time = dtf.format(now);
	
		System.out.println(name);
		System.out.println(time);
		
		try
		{
			con = DBConnection.createConnection();
			statement = con.createStatement();
			
			statement.executeUpdate("INSERT INTO applicants (a_name, a_fname, a_mname, a_sname, a_papplied, a_date, a_pnumber, a_mnumber, a_email, a_hdegree, a_lastschool, a_year, a_pcode)"
									+ "VALUES ('" +name+ "', '" +fname+ "', '" +mname+ "', '" +sname+ "', '" +course+ "', '" +time+ "', '" +pnum+ "', '" +mnum+ "', '"
									+email+ "', '" +degree+ "', '" +school+ "', '" +year+ "', '" +cou+ "');"); 
			
			statement.executeUpdate("INSERT INTO checklist (a_name, a_papplied)"
					+ "VALUES ('" +name+ "', '" +course+ "');"); 

			System.out.println("\nAdding to Database");
			System.out.println(name + "\n" + course);
			
			//email the random pw
			String sendEmail = SendEmailDao.newStudent (email, name, time);
			
			if(sendEmail.equals("EMAIL SENT"))
			{
				return "DONE";
			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}	
		
		return "KEME";
	}
	
	public static String deleteStudent (String appnum)
	{
		System.out.println("\nDelete Employee");
		
		Connection con = null;
		Statement statement = null;
		
		try
		{
			con = DBConnection.createConnection();
			statement = con.createStatement();
			
			statement.executeUpdate("DELETE FROM applicants where a_appnum = '" +appnum+ "'"); 
			statement.executeUpdate("DELETE FROM checklist where a_appnum = '" +appnum+ "'"); 
			statement.executeUpdate("DELETE FROM grades where g_appnum = '" +appnum+ "'"); 	
			
			System.out.println("\nDeleting");
			System.out.println(appnum);
			
			return "DONE";
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}	
		
		return "KEME";
	}
	
	public static String editStudent (String appnum, String fname, String mname, String sname, String course, String pnum, String mnum, String email, String degree, String school, String year, String cou)
	{
		System.out.println("\nEdit Student Details");
		
		Connection con = null;
		Statement statement = null;
		
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
		
		try
		{
			con = DBConnection.createConnection();
			statement = con.createStatement();
			
			statement.executeUpdate("UPDATE applicants set a_fname ='" +fname+ "' where a_appnum ='" +appnum+ "'");
			statement.executeUpdate("UPDATE applicants set a_mname ='" +mname+ "' where a_appnum ='" +appnum+ "'");
			statement.executeUpdate("UPDATE applicants set a_sname ='" +sname+ "' where a_appnum ='" +appnum+ "'");
			statement.executeUpdate("UPDATE applicants set a_name ='" +name+ "' where a_appnum ='" +appnum+ "'");
			statement.executeUpdate("UPDATE applicants set a_papplied ='" +course+ "' where a_appnum ='" +appnum+ "'");
			statement.executeUpdate("UPDATE applicants set a_pnumber ='" +pnum+ "' where a_appnum ='" +appnum+ "'");
			statement.executeUpdate("UPDATE applicants set a_mnumber ='" +mnum+ "' where a_appnum ='" +appnum+ "'");
			statement.executeUpdate("UPDATE applicants set a_email ='" +email+ "' where a_appnum ='" +appnum+ "'");
			statement.executeUpdate("UPDATE applicants set a_hdegree ='" +degree+ "' where a_appnum ='" +appnum+ "'");
			statement.executeUpdate("UPDATE applicants set a_lastschool ='" +school+ "' where a_appnum ='" +appnum+ "'");
			statement.executeUpdate("UPDATE applicants set a_year ='" +year+ "' where a_appnum ='" +appnum+ "'");
			statement.executeUpdate("UPDATE applicants set a_pcode ='" +cou+ "' where a_appnum ='" +appnum+ "'");
			
			statement.executeUpdate("UPDATE checklist set a_name ='" +name+ "' where a_appnum ='" +appnum+ "'");
			statement.executeUpdate("UPDATE checklist set a_papplied ='" +course+ "' where a_appnum ='" +appnum+ "'");
			
			System.out.println("\nEditing details");
			System.out.println(name + "\n" + course);
			
			return "DONE";
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}	
		
		return "KEME";
	}
	
	public static String checklist (String a_appnum, String c_intent, String c_bcert, String c_appform, String c_lsheet, String c_receipt, String c_tor, String c_dismissal,
			String c_vitae, String c_trainings, String c_employment, String c_spa, String r_intent, String r_bcert, String r_appform,
			String r_lsheet, String r_receipt, String r_tor, String r_dismissal, String r_vitae, String r_trainings, String r_employment, String r_spa)
	{
		System.out.println("\nEdit Checklist");
		
		Connection con = null;
		Statement statement = null;
		
		try
		{
			con = DBConnection.createConnection();
			statement = con.createStatement();

			statement.executeUpdate("UPDATE checklist set c_intent='" +c_intent+ "', c_bcert='" +c_bcert+ "', c_appform='" +c_appform+ 
					"', c_lsheet='" +c_lsheet+ "', c_receipt='" +c_receipt+ "', c_tor='" +c_tor+ "', c_dismissal='" +c_dismissal+ 
					"', c_vitae='" +c_vitae+ "', c_trainings='" +c_trainings+ "', c_employment='" +c_employment+ "', c_spa='" +c_spa+	
					"', r_intent='" +r_intent+ "', r_bcert='" +r_bcert+ "', r_appform='" +r_appform+ 
					"', r_lsheet='" +r_lsheet+ "', r_receipt='" +r_receipt+ "', r_tor='" +r_tor+ "', r_dismissal='" +r_dismissal+ 
					"', r_vitae='" +r_vitae+ "', r_trainings='" +r_trainings+ "', r_employment='" +r_employment+ "', r_spa='" +r_spa+
					"' where a_appnum ='" +a_appnum+ "'");

			System.out.println("\nEditing Checklist");
			System.out.println("Application Number: " + a_appnum);
			
			if(c_intent != null && c_bcert != null && c_appform != null && c_lsheet !=null && c_receipt != null && c_tor != null 
					&& c_dismissal != null && c_vitae != null && c_trainings != null && c_employment != null && c_spa != null)
			{
				return "COMPLETED";
			}
			
			else
			{
				return "NOT YET COMPLETE";
			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}	
		
		return "KEME";
	}
		
	public static String check (String appnum, String pcode)
	{
		System.out.println("\nCheck Student");
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try
		{
			con = DBConnection.createConnection();
			statement = con.createStatement();

			resultSet = statement.executeQuery("select * from grades where g_appnum = '" + appnum + "' and g_pcode ='" +pcode+ "'");
			int rc = 0;
			while (resultSet.next()) {
				rc = rc + 1;
			}
			
			if (rc > 0)
			{
				return "EXIST";
			}
				
			else
			{
				return "NONE";
			}
			
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}	
		
		return "KEME";
	}
}
