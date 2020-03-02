<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
	<title>ETEEAP Accreditation PDF File</title>
    
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 	<link href="css/index_w.css" rel="stylesheet">  
 	
 	<%@ taglib prefix = "c"  uri = "http://java.sun.com/jsp/jstl/core" %>
 	<%@ taglib prefix = "sql"  uri = "http://java.sun.com/jsp/jstl/sql" %>
 	
 	<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	
	<script>
 	function generatePDF() {
 	var doc = new jsPDF({
 	    orientation: 'landscape'
 	});
 	
 	var elementHTML = $('#content').html();
 	var specialElementHandlers = {
 	    '#elementH': function (element, renderer) {
 	        return true;
 	    }
 	};
 	doc.fromHTML(elementHTML, 15, 15, {
 	    'width': 170,
 	    'elementHandlers': specialElementHandlers
 	});

 	// Save the PDF
 	doc.save('sample-document.pdf'); }
    </script>
    <style>
    .print-wrap {
        width: 500px;
    }
    </style>
</head>
 
<body>
<sql:setDataSource
	var="myDS"
	driver="com.mysql.jdbc.Driver"
	url = "jdbc:mysql://127.0.0.1:3306/eteeap?user=IerizNicolle&password=Onetwothree45!&useSSL=false"
/>

<!-- DISPLAY NUNG DETAILS NG FORM -->
<sql:query var="grades" dataSource="${myDS}"> 
	SELECT code, title, units, tuition, course, g_compet, g_evidence, g_cct, g_grade, g_units, g_remarks
	FROM eteeap.courses
	INNER JOIN eteeap.grades
	ON eteeap.grades.g_num=eteeap.courses.g_num
	AND eteeap.grades.g_pcode=eteeap.courses.course
	WHERE eteeap.grades.g_appnum= 1;
</sql:query>

<!-- ASSESS -->
<sql:query var="assess" dataSource="${myDS}"> 
	select * from assess where appnum = 1;
</sql:query>

	<button onclick="generatePDF();" id="pdf-download-link" title="Download PDF File">Download PDF file</button>
    <div id="content">
    <!-- HTML contnet goes here -->
		<h1>Equivalency and Accreditation Form</h1>
		<br>
		
		<c:forEach var="user" items="${applicant.rows}">
		<table class="pda">
			<tr>
				<td style="font-size: 14px; color: #233185;">Program Applied</td>
				<td colspan=3><b><c:out value="${user.a_papplied}"/></b></td>
				<td style="font-size: 14px; color: #233185;">Application Date</td>
				<td><b><c:out value="${user.a_date}"/></b></td>
			</tr>
			<tr>
				<td style="font-size: 14px; color: #233185;">Applicant's Name</td>
				<td colspan=5><b><c:out value="${user.a_name}"/></b></td>
			</tr>
			<tr>
				<td style="font-size: 14px; color: #233185;">Contact Details</td>
				<td><b><c:out value="${user.a_pnumber}"/></b></td>
				<td><b><c:out value="${user.a_mnumber}"/></b></td>
				<td colspan=3><b><c:out value="${user.a_email}"/></b></td>
			</tr>
			<tr>
				<td style="font-size: 14px; color: #233185;">Highest Earned Degree</td>
				<td><b><c:out value="${user.a_hdegree}"/></b></td>
				<td style="font-size: 14px; color: #233185;">Last School Attended</td>
				<td><b><c:out value="${user.a_lastschool}"/></b></td>
				<td style="font-size: 14px; color: #233185;">Year</td>
				<td><b><c:out value="${user.a_year}"/></b></td>
			</tr>
		</table>
		</c:forEach>
		<br><br>

		<table>
			<tr>
				<th colspan=3>CURRICULUM</th>
				<th colspan=3>EQUIVALENCY</th>
				<th colspan=3>ACCREDITATION OF FORMAL LEARNING</th>
				<th colspan=2>REMARKS</th>
			</tr>
			<tr>
				<th width="75px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Code</th>
				<th width="200px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Course Title</th>
				<th width="40px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Units</th>
				<th width="40px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Tuition Hour</th>
				<th width="110px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Competency Demonstrated</th>
				<th width="90px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Evidence</th>
				<th width="100px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Code / Course Title</th>
				<th width="50px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Grade</th>
				<th width="50px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Units</th>
				<th width="45px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Credited</th>
				<th width="45px" style="text-decoration: none; padding: 5px; font-weight: normal">
					To be Taken</th>
			</tr>
			<c:forEach var="grades" items="${grades.rows}">
			<tr>
				<td style="text-align: left;"><c:out value="${grades.code}"/></td>
				<td style="text-align: left;"><c:out value="${grades.title}"/></td>
				<td class="c_units"><c:out value="${grades.units}"/></td>
				<td class="c_hours"><c:out value="${grades.tuition}"/></td>				
				<td><c:out value="${grades.g_compet}"/></td>
				<td><c:out value="${grades.g_evidence}"/></td>	
				<td><c:out value="${grades.g_cct}"/></td>
				<td><c:out value="${grades.g_grade}"/></td>
				<td><c:out value="${grades.g_units}"/></td>
				<td><input type="radio" class="credited" name="remarks" value="credited"/></td>
				<td><input type="radio" class="tbtaken" name="remarks" value="tbtaken"/></td>
			</tr>
			<input type="hidden" class="remark" name="remark" value="${grades.g_remarks}"/>
			</c:forEach>
				
			<tr>
				<td colspan=2 style="text-align: right;">Total number of units:</td>
				<td id="units"></td>
				<td id="hours"></td>
				<td colspan=7></td>
			</tr>
			<tr>
				<td colspan=9 style="text-align: right;">Total number of credited subjects:</td>
				<td id="cred"></td>
				<td></td>
			</tr>	
			<tr>
				<td colspan=9 style="text-align: right;">Total number of subjects to be taken:</td>
				<td></td>
				<td id="subj"></td>
			</tr>	
		</table>
		<br><br>
		<table class="assess" style="display: inline-block;">
			<c:forEach var="assess" items="${assess.rows}">
			<tr>
				<td>Assessed by:</td>
				<td><c:forEach var="a" items="${assessors.rows}">
							<c:out value="${a.name}"/>
						</c:forEach></td>
				<td>Signature:</td>
				<td>_____________________</td>
				<td>Date:</td>
				<td><c:out value="${assess.date}"/></td>
			</tr>
			<tr></tr>
			</c:forEach>
		</table>	
	</div>

<div id="elementH"></div>
</body>
 
</html>