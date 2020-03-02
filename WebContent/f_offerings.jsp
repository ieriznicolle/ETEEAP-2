<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<title> ETEEAP </title>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 	<link href="css/index.css" rel="stylesheet"> 
 	
 	<style>
		.slide {
			display: none; }
			
		.left, .right, .slidebutton {
			cursor: pointer; }
			
		.slidebutton {
			height: 13px;
			width: 13px;
			padding: 0; }
	</style> 
</head>

<body>
<div id="page-container">
	<!-- TOP NAVIGATION -->
	<div id="mainnav" class="topnav">
		<form name="form" action="eteeap?epage=sign-in" method="post">
			<button type="submit" value="SIGN-IN">SIGN-IN</button>
		</form>
		<form name="form" action="eteeap?epage=apply" method="post">
			<button type="submit" value="APPLY">APPLY</button>
		</form>
		<form name="form" action="eteeap?epage=offerings" method="post">
			<button class="active" type="submit" value="OFFERINGS">OFFERINGS</button>
		</form>
		<form name="form" action="eteeap?epage=home" method="post">
			<button type="submit" value="HOME">HOME</button>
		</form>
	</div>
	<br><br><br><br>
	
	<div id="contentwrap">
		<div class="slide">
			<h3>Academic Program Offerings</h3>
			<h4>Undergraduate Programs</h4>
			<ul>
				<li>Bachelor in Broadcast Communication</li>
				<li>Bachelor in Cooperatives</li>
				<li>Bachelor in Office Administration</li>
				<li>Bachelor of Science in Business Administration Major in Marketing Management</li>
				<li>Bachelor of Science in Business Administration Major in Human Resource Development Management</li>
				<li>Bachelor in Political Science</li>
			</ul>

			<h4>Candidate's Minimum Qualifications</h4>
			<ul>
				<li>High school diploma or the PEPT placement equivalent to first year college</li>
				<li>Employed for an aggregate minimum of five (5) years in the industry relevant to the course applied</li>
				<li>Filipino citizen; 25 years of age</li>
				<li>For Applicants abroad, have someone with your issued Special Power of Attorney (SPA) to represent you here</li>
			</ul>
		</div>
		
		<div class="slide">
			<h4>Requirements for Admission</h4>
			<ul>
				<li>Letter of intent to avail of the program addressed to the University President (Dr. Emanuel C. de Guzman) through the Executive Vice President (Dr. Manuel M. Muhi) and Office Director (Dr. Remedios G. Ado)</li>
				<li>Accomplished ETEEAP application form</li>
				<li>Comprehensive curriculum vitae</li>
				<li>Most recent academic record (Form 137 or original transcript of records)</li>
				<li>Honorable dismissal and subject descriptions from the institution where applicant was last enrolled</li>
				<li>Service record or certificate of employment</li>
				<li>Appointment and duties, functions, and responsibilities (DFR) of each position held</li>
				<li>Latest 2x2 picture (2 pcs) white background</li>
				<li>Original birth certificate (NSO authenticated)</li>
				<li>Original marriage certificate for female applicant (NSO authenticated)</li>
				<li>Other documents, such as but not limited to: certificate of participation and/or attendance to seminars/trainings/conference/colloquium or forum attended, recognition or award/s received ; relevant licensure and other professional exams passed; copy of research and/or articles published; certificate of membership; and the like</li>
				<li></li>
			</ul>
		</div>
		
		<div class="slide">
			<h4>Admission Procedures</h4>
			<ol>
				<li>Submit the required documents to the Office of ETEEAP/NonTrad/TransNational Education at the 4th Floor, NALLRC, PUP Main Campus, Anonas St., Sta. Mesa, Manila</li>
				<li>Pay the required application and assessment fees</li>
				<li>Report for interview to the College or Graduate School Dean/Department or Chairperson and to the Office Director</li>
				<li>Secure a copy of the Program curriculum showing the results of your competency assessment and accreditation of formal and non-formal education</li>
				<li>Enroll the required academic subjects/courses</li>
			</ol>

			<h4>Graduation Requirements in the ETEEAP</h4>
			<ul>
				<li>Candidate must have satisfactorily earned the necessary credits based on competency standard;</li>
				<li>Payment of the full cost of the assessment program regardless of the amount of credits earned; and</li>
				<li>Candidate must have passed panel defense of a special research/production project.</li>
			</ul>
		</div>
		
		<div class="buttons" style="width:100%">
		    <div class="left" onclick="plusDivs(-1)">&#10094;</div>
		    <div class="right" onclick="plusDivs(1)">&#10095;</div>
		    <span class="slidebutton demo sba" onclick="currentDiv(1)"></span>
		    <span class="slidebutton demo sba" onclick="currentDiv(2)"></span>
		    <span class="slidebutton demo sba" onclick="currentDiv(3)"></span>
  		</div>
	</div>
	
	<footer id="footer"></footer>
</div>

<script>
	var slideIndex = 1;
	showDivs(slideIndex);
	
	function plusDivs(n) {
		showDivs(slideIndex += n); }
	
	function currentDiv(n) {
		showDivs(slideIndex = n); }
	
	function showDivs(n) {
		var i;
		var x = document.getElementsByClassName("slide");
		var dots = document.getElementsByClassName("demo");
	  
		if (n > x.length) {
			slideIndex = 1; }
	  
		if (n < 1) {
			slideIndex = x.length; }
	  
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none"; }
		
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" sbactive", ""); }
		
		x[slideIndex-1].style.display = "block";  
		dots[slideIndex-1].className += " sbactive";
	}
</script>
</body>

</html> 