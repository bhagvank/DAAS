<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*" %>
    <%@ page import="org.daas.ai.platform.esb.*" %>
    <%@ page import="org.daas.ai.platform.businessdelegate.*" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>DAAS</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Architect Corner" />
	<meta name="keywords" content="Mobility,IOT,SmartCities" />
	<meta name="author" content="Architect Corner" />


  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

  	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
  	<link rel="shortcut icon" href="favicon.ico">

  	<!-- Google Webfont -->
	<!-- <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,700' rel='stylesheet' type='text/css'> -->
	<!-- Themify Icons -->
	<link rel="stylesheet" href="css/themify-icons.css">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="css/superfish.css">
	<!-- Easy Responsive Tabs -->
	<link rel="stylesheet" href="css/easy-responsive-tabs.css">
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Theme Style -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>

		<!-- START #fh5co-header -->
		<header id="fh5co-header-section" role="header" class="" >
			<div class="container">

				

				<!-- <div id="fh5co-menu-logo"> -->
					<!-- START #fh5co-logo -->
					<h1 id="fh5co-logo" class="pull-left"><a href="index.html"><img src="images/logo.png" alt="DAAS" width=50 height=50></a></h1>
					
					<!-- START #fh5co-menu-wrap -->
					<nav id="fh5co-menu-wrap" role="navigation">
							<ul class="sf-menu" id="fh5co-primary-menu">
								<li>
									<a href="index.jsp" >Home</a>
								</li>
								
								<li><a href="right-sidebar.html" class="active">Data As a Service</a>
									 		<ul class="fh5co-sub-menu">
												 <li><A HREF="Paas.jsp">Data Application</A> </li>                                              
                                                 <li><A HREF="Entities.jsp">Entities</A></li>
                                                 <li><a href="DataUpload.jsp">Data Upload</a></li>
                                                 
											</ul>
								</li>
							   <li>
											<a href="Logout.jsp">Log Out</a>
							   </li>			
									</ul>
					</nav>
				<!-- </div> -->

			</div>
		</header>
		
		<div id="fh5co-main">
			
			<div class="fh5co-cards">
				<div class="container-fluid">
					<div class="row">
					
					  <div class="col-md-6 col-md-push-6">
							<h3 class="section-title">&nbsp</h3>
							<p>&nbsp</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
						<%
						
						ServletContext context = pageContext.getServletContext();
						
						String uploadContentType = request.getContentType();
						
						
						List<List<String>> rows = null;
						List<String> header = null;
						if((uploadContentType.indexOf("multipart/form-data") >=0))
						{
								 BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
								 
								 CsvParser parser = new CsvParser();
								  rows = parser.parse(reader);
								  session.setAttribute("data", rows);
								//  BigDataDelegate dataDelegate = new BigDataDelegate();
								  
								 String fileName = uploadContentType;
								 
								// request.getParameter("uploadDataFile");
								  
								  
								  
								  header = rows.get(0);
								  session.setAttribute("header", header);
								  
								 // dataDelegate.storeData("Staging",rows, header, fileName);
						}
						
						%>
						<form action="GenerateGraph.jsp" method="get">
						<table>
						<%
						int i=0;
						for(String value: header)
						{
						out.println("<tr>");
						out.println("<td border=1>"+value);
						out.println("&nbsp</td>");
						out.println("<td border=1>");
						out.println("<select name=type"+i+">");
						out.println("<option value=date>Date</option>");
						out.println("<option value=year>Year</otion>");
						out.println("<option value=month>Month</option>");
						out.println("<option value=day>Day</option>");
						out.println("<option value=number>Number</option>");
						out.println("<option value=email>Email</option>");
						out.println("</select>");
						out.println("</td>");
						out.println("</tr>");
						i++;
						}
						%>
						</table>
                    </div>
                   </div> 
					<div class="row">
					    <div class="col-md-6 col-md-push-6">
							<p> </p>
						</div>
						<div class="col-md-6 col-md-pull-6">
							<div class="row">						   
								<div class="col-md-12">
									<div class="form-group">
										<input type="submit" value="Validate" class="btn btn-primary">
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
              </div>
            </div>  
				</div>
			</div>

			<!-- END container -->


		
		</div>
		<!-- END fhtco-main -->


		<footer role="contentinfo" id="fh5co-footer">
			<a href="#" class="fh5co-arrow fh5co-gotop footer-box"><i class="ti-angle-up"></i></a>
			<div class="container">
				<div class="row">
					
					<div class="col-md-12 footer-box text-center">
						<div class="fh5co-copyright">
						<p>DAAS</p>
						</div>
					</div>
					
				</div>
				<!-- END row -->
				<div class="fh5co-spacer fh5co-spacer-md"></div>
			</div>
		</footer>
			
			
		<!-- jQuery -->
		<script src="js/jquery-1.10.2.min.js"></script>
		<!-- jQuery Easing -->
		<script src="js/jquery.easing.1.3.js"></script>
		<!-- Bootstrap -->
		<script src="js/bootstrap.js"></script>
		<!-- Owl carousel -->
		<script src="js/owl.carousel.min.js"></script>
		<!-- Magnific Popup -->
		<script src="js/jquery.magnific-popup.min.js"></script>
		<!-- Superfish -->
		<script src="js/hoverIntent.js"></script>
		<script src="js/superfish.js"></script>
		<!-- Easy Responsive Tabs -->
		<script src="js/easyResponsiveTabs.js"></script>
		<!-- FastClick for Mobile/Tablets -->
		<script src="js/fastclick.js"></script>
		<!-- Parallax -->
		<script src="js/jquery.parallax-scroll.min.js"></script>
		<!-- Waypoints -->
		<script src="js/jquery.waypoints.min.js"></script>
		<!-- Main JS -->
		<script src="js/main.js"></script>

	</body>
</html>
