<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
	<title>ETEEAP Accreditation PDF File</title>
    
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 	<link href="css/form.css" rel="stylesheet">  
 	
 	<%@ taglib prefix = "c"  uri = "http://java.sun.com/jsp/jstl/core" %>
 	<%@ taglib prefix = "sql"  uri = "http://java.sun.com/jsp/jstl/sql" %>
 	
 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
	<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>

    <style>
    .print-wrap {
        width: 510px;
    }
    </style>
</head>
 
<body>
<% String appnum = request.getParameter("appnum"); %>

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
	WHERE eteeap.grades.g_appnum= <%=appnum%>;
</sql:query>

<!-- ASSESS -->
<sql:query var="assess" dataSource="${myDS}"> 
	select * from assess where appnum = <%=appnum%>;
</sql:query>

<!-- PERSONAL DETAILS -->
<sql:query var="applicant" dataSource="${myDS}"> 
	select * from applicants where a_appnum = <%=appnum%>;
</sql:query>
	<br><br>
	<div class="button">
		<button onclick="getPDF();">Download PDF file</button>
	</div>
	<br>
    <div class="canvas_div_pdf" id="content">
    <!-- HTML contnet goes here -->
    	<br>
    	<h1>Equivalency and Accreditation Form</h1>
		<br>
		
		<c:forEach var="user" items="${applicant.rows}">
		<table class="pda">
			<tr>
				<td colspan=5 style="font-size: 14px; color: #233185; text-align: right;">Application Number</td>
				<td><b><c:out value="<%=appnum%>"/></b></td>
			</tr>
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

		<table class="pd">
			<tr>
				<th colspan=3>CURRICULUM</th>
				<th colspan=3>EQUIVALENCY</th>
				<th colspan=3>ACCREDITATION OF FORMAL LEARNING</th>
				<th>REMARKS</th>
			</tr>
			<tr>
				<th width="100px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Code</th>
				<th width="250px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Course Title</th>
				<th width="40px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Units</th>
				<th width="40px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Tuition Hour</th>
				<th width="400px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Competency Demonstrated</th>
				<th width="90px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Evidence</th>
				<th width="100px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Code / Course Title</th>
				<th width="50px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Grade</th>
				<th width="50px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Units</th>
				<th width="90px" style="text-decoration: none; padding: 5px; font-weight: normal">
					Credited / To be Taken</th>
			</tr>
			<c:forEach var="grades" items="${grades.rows}">
				<tr>
					<td style="text-align: left;"><c:out value="${grades.code}"/></td>
					<td style="text-align: left;"><c:out value="${grades.title}"/></td>
					<td class="c_units"><c:out value="${grades.units}"/></td>
					<td class="c_hours"><c:out value="${grades.tuition}"/></td>				
					<td class="cd"><c:out value="${grades.g_compet}"/></td>
					<td class="evidence"><c:out value="${grades.g_evidence}"/></td>										
					<td class="cct"><c:out value="${grades.g_cct}"/></td>
					<td class="grade"><c:out value="${grades.g_grade}"/></td>
					<td class="units"><c:out value="${grades.g_units}"/></td>
					<td class="remark"><c:out value="${grades.g_remarks}"/></td>
				</tr>
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
			</tr>	
			<tr>
				<td colspan=9 style="text-align: right;">Total number of subjects to be taken:</td>
				<td id="subj"></td>
			</tr>	
		</table>
		<br><br>
		<table class="assess" style="display: inline-block; font-size: 12; font-family: 'Verdana';">
			<c:forEach var="assess" items="${assess.rows}">
			<tr>
				<td>Assessed by:</td>
				<td width="250px"><c:out value="${assess.assessor}"/></td>
				<td>Signature:</td>
				<td>_____________________</td>
				<td>Date:</td>
				<td><c:out value="${assess.date}"/></td>
			</tr>
			<tr></tr>
			</c:forEach>
		</table>	
	</div>
	<br><br>

<div id="elementH"></div>

<script>
	var cd = document.getElementsByClassName("cd");
	var evidence = document.getElementsByClassName("evidence");
	var rem = document.getElementsByClassName("remark");
	var c_units = document.getElementsByClassName("c_units");
	var c_hours = document.getElementsByClassName("c_hours");
	var i, r, o;
	var cu_units = 0;
	var ch_hours = 0;
	var cr = 0;
	var tb = 0;

	for (i = 0; i < cd.length; i++) {
		if (rem[i].innerHTML == "credited") {
			cr = cr + 1;
		}
			
		else if (rem[i].innerHTML == "to be taken") {
			tb = tb + 1;
		}
		
		else if (rem[i].innerHTML == "null") {
			rem[i].innerHTML = " ";
		}
		
		if(evidence[i].innerHTML == 'null') {
			evidence[i].innerHTML = '  ';
		}
		
		cu_units = cu_units + parseInt(c_units[i].innerHTML);
		ch_hours = ch_hours + parseInt(c_hours[i].innerHTML);
	}
	
	document.getElementById("units").innerHTML = cu_units;
	document.getElementById("hours").innerHTML = ch_hours;
	document.getElementById("cred").innerHTML = cr;
	document.getElementById("subj").innerHTML = tb;
	
	
	var assessor = document.getElementsByClassName("assessor");
	var assessed = document.getElementsByClassName("assessed");
	
	for (o = 0; o < 3; o++)
	{
		assessor[o].setAttribute("name", "assessor"+o);
		assessed[o].setAttribute("name", "assessed"+o);		
	}
	
	function getPDF(){
		 
		var HTML_Width = $(".canvas_div_pdf").width();
		var HTML_Height = $(".canvas_div_pdf").height();
		var top_left_margin = 15;
		var PDF_Width = HTML_Width+(top_left_margin*2);
		var PDF_Height = (PDF_Width*1.5)+(top_left_margin*2);
		var h = (HTML_Height*1.5);
		var w = (HTML_Width*1.5);
		
		
		var totalPDFPages = Math.ceil(h/PDF_Width)-1;
		
		html2canvas($(".canvas_div_pdf")[0],{allowTaint:true}).then(function(canvas) {
			canvas.getContext('2d');
			
			console.log(canvas.height+"  "+canvas.width);
			
			
			var imgData = canvas.toDataURL("image/png", 1.0);
			var pdf = new jsPDF('l', 'pt',  [PDF_Width, PDF_Height]);
			
			pdf.addImage(imgData, 'PNG', top_left_margin, top_left_margin, w, h);
			
			
			for (var i = 1; i <= totalPDFPages; i++) { 
				pdf.addPage(PDF_Height, PDF_Width);
				pdf.addImage(imgData, 'PNG', top_left_margin, -(PDF_Width*i)+(top_left_margin*4), w, h);
			}
			
		    pdf.save("Accreditation Form.pdf");
        });
	};
</script>

</body>
 
</html>