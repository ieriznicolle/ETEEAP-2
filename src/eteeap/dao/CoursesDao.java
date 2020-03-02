package eteeap.dao;

public class CoursesDao {
	public static String getCourseCode (String course)
	{
		if (course.equals("Bachelor of Arts in Broadcast Communication"))
		{ return "BABRC"; }
		
		else if (course.equals("Bachelor in Advertising and Public Relations"))
		{ return "BADPR"; }

		else if (course.equals("Batsilyer ng Artes sa Filipinolohiya"))
		{ return "BAF"; }

		else if (course.equals("Bachelor of Arts in Journalism"))
		{ return "BAJ"; }	

		else if (course.equals("Bachelor in Banking and Finance"))
		{ return "BBF"; }	
		
		else if (course.equals("Bachelor in Public Administration"))
		{ return "BPA"; }	
		
		else if (course.equals("Bachelor in Political Science"))
		{ return "BPS"; }	
		
		else if (course.equals("Bachelor of Science in Business Administration major in Human Resource Development Management"))
		{ return "BSBAHRDM"; }	
		
		else if (course.equals("Bachelor of Science in Business Administration major in Marketing Management"))
		{ return "BSBAMM"; }	
		
		else if (course.equals("Bachelor of Science in Computer Engineering"))
		{ return "BSCOE"; }	
		
		else if (course.equals("Bachelor of Science in Computer Science"))
		{ return "BSCS"; }	

		else if (course.equals("Bachelor of Science in Entrepreneurship"))
		{ return "BSENTREP"; }

		else if (course.equals("Bachelor of Science in Hospitality Management"))
		{ return "BSHM"; }

		else if (course.equals("Bachelor of Science in Industrial Engineering"))
		{ return "BSIE"; }	

		else if (course.equals("Bachelor of Science in Information Technology"))
		{ return "BSIT"; }	
		
		else if (course.equals("Bachelor of Science in Office Administration major in Corporate Transcription"))
		{ return "BSOACT"; }	
		
		else if (course.equals("Bachelor of Science in Office Administration major in Legal Transcription"))
		{ return "BSOALT"; }	
		
		else if (course.equals("Bachelor of Science in Office Administration major in Medical Transcription"))
		{ return "BSOAMT"; }	
		
		else if (course.equals("Bachelor of Science in Sociology"))
		{ return "BSS"; }	
		
		else if (course.equals("Bachelor of Science in Tourism Management"))
		{ return "MSTM"; }	
		
		else if (course.equals("Master in Business Administration major in Financial Management"))
		{ return "MBAFINANCE"; }	

		else if (course.equals("Master in Business Administration major in Human Resource Management"))
		{ return "MBAHR"; }

		else if (course.equals("Master in Business Administration major in Marketing Management"))
		{ return "MBAMM"; }	

		else if (course.equals("Master in Communication"))
		{ return "MC"; }	
		
		else if (course.equals("Master in Educational Management"))
		{ return "MEM"; }	
		
		else if (course.equals("Master in Information Technology"))
		{ return "MIT"; }	
		
		else if (course.equals("Master in Public Administration"))
		{ return "MPA"; }	
		
		else if (course.equals("Master of Arts in English Language Teaching"))
		{ return "MAELT"; }	
		
		
		return "NONE";
	}
}
