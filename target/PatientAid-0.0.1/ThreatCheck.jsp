<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*" %>
    <%@ page import="com.architectcorner.ai.mediaresponse.manager.*" %>
    <%@ page import="org.daas.ai.network.analysis.*" %>
    <%@ page import="org.daas.ai.nlp.processing.*" %>
    <%@ page import="org.daas.ai.platform.esb.*" %>
    <%@ page import="org.daas.ai.platform.messagequeue.*" %>    
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Architect Corner</title>
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
					<h1 id="fh5co-logo" class="pull-left"><a href="index.html"><img src="images/logo.png" alt="Architect Corner" width=50 height=50></a></h1>
					
					<!-- START #fh5co-menu-wrap -->
					<nav id="fh5co-menu-wrap" role="navigation">
						<ul class="sf-menu" id="fh5co-primary-menu">
								<li>
									<a href="index.jsp">Home</a>
								</li>
								<li>
									<a href="right-sidebar.html">Dashboard</a>
									 		<ul class="fh5co-sub-menu">
												<li><A HREF="Dashboard.jsp"> Networking</A> </li>
												<li><a href="Finance.jsp">Finance</a></li>
											</ul>
								</li>
								<li>
									<a href="right-sidebar.html">Banking</a>
									 		<ul class="fh5co-sub-menu">
												<li><A HREF="Customers.jsp"> Customers</A> </li>
												<li><a href="Reference.jsp">Reference Data</a></li>
												<li><a href="OnBoarding.jsp">OnBoarding</a></li>
												<li><a href="Cards.jsp">Cards</a></li>
												<li><a href="MoneyMovement.jsp">Money Movement</a></li>
												<li><a href="PayWithPoints.jsp">PayWithPoints</a></li>
											</ul>
								</li>
								<li>
									<a href="right-sidebar.html">Compliance</a>
									 		<ul class="fh5co-sub-menu">
												<li><A HREF="nonspeech.jsp"> Risk Analysis</A> </li>
												<li><a href="Compliance_Upload.jsp">Compliance Data Upload</a></li>
											</ul>
								</li>
								<li><a href="right-sidebar.html" class="active">Threat Detection</a>
									 		<ul class="fh5co-sub-menu">                                              
                                                 <li><A HREF="socialmedianalysis.jsp">Social Media Analysis</A></li>
                                                 <li><a href="ThreatDetectionFeeds.jsp" class="active">Threat Detection Upload</a></li>
                                                 
											</ul>
								</li>
								<li><a href="right-sidebar.html">Data As a Service</a>
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
				  
				//  out.println(rows);
				  
		}
		
		 //String socialMediaURL = request.getParameter("socialmediaurl");
		
		 //String keyword = request.getParameter("keyword");
		
		  String[] urls = new String[rows.size()];
		  int j=0;
		 for(List<String> row: rows)
		 {
		
		   urls[j] = row.get(0);
		   j++;
		 }
		 
		 MessageProducer producer = new MessageProducer();
		 producer.initialize();
		 producer.publishMessage(urls[0]);
		 producer.close();
		 String[] keywords = new String[20];
		  
		  keywords[0] = "Commodities";
		  keywords[1] = "Credit";
		  keywords[2] = "Banking";
		  keywords[3] = "Internet";
		  keywords[4] = "Savings";
		  keywords[5] = "Interest";
		  keywords[6] = "Stocks";
		  keywords[7] = "Trading";
		  keywords[8] = "Call";
		  keywords[9] = "Put";
		  keywords[10] = "Futures";
		  keywords[11] = "Loan";
		  keywords[12] = "Trade";
		  keywords[13] = "investment";
		  keywords[14] = "Currency";
		  keywords[15] = "monopoly";
		  keywords[16] = "spending";
		  keywords[17] = "Gold";
		  keywords[18] = "cash";
		  keywords[19] = "rate";
		  
		  
		  String[] sentiment = new String[27];
		  sentiment[0] = "good";
		  sentiment[1] = "bad";
		  sentiment[2] = "poor";
		  sentiment[3] = "spectacular";
		  sentiment[4] = "terrible";
		  sentiment[5] = "loss";
		  sentiment[6] = "fantastic";
		  sentiment[7] = "excellent";
		  sentiment[8] = "down";
		  sentiment[9] = "working";
		  sentiment[10] = "loss";
		  sentiment[11] = "live";
		  sentiment[12] = "problem";
		  sentiment[13] = "issue";
		  sentiment[14] = "crisis";
		  sentiment[15] = "credit card";
		  sentiment[16] = "account number";
		  sentiment[17] = "credit card";
		  sentiment[18] = "social security";
		  sentiment[19] = "password";
		  sentiment[20] = "feeling";
		  sentiment[21] = "up";
		  sentiment[22] = "gain";
		  sentiment[23] = "drop";
		  sentiment[24] = "ban";
		  sentiment[25] = "scam";
		  sentiment[26] = "fraud";
		  
		  Network network = new Network();
			
			List<String> entityNames = new ArrayList();
			entityNames.add("Person");
			entityNames.add("Place");
			entityNames.add("Product");
			entityNames.add("Company");
			entityNames.add("Country");
			entityNames.add("State");
			
			network.setEntityNames(entityNames);
			
			HashMap<String,List<String>> entityList = new HashMap();
			
			List<String> persons = new ArrayList();
			persons.add("John Smith");
			persons.add("Donald Trump");
			persons.add("Hillary Clinton");
			
			List<String> places = new ArrayList();
			places.add("Atlanta");
			places.add("Washington D.C.");
			places.add("Chicago");
			places.add("Wisconsin");
			
			entityList.put("Person", persons);
			entityList.put("Place", places);
			
			network.setEntityList(entityList);
			
			POSDetector detector = new POSDetector();
			
			List<String> types = new ArrayList();
			
			types.add("Noun");
			types.add("Verb");
			types.add("Adjective");
			types.add("Adverb");
			types.add("Preposition");
			types.add("Noun");
			
			detector.setTypes(types);
			
			List<String> nouns = new ArrayList();
			nouns.add("John Smith");
			nouns.add("Cow");
			nouns.add("Chair");
			nouns.add("Video");
			
			List<String> verbs = new ArrayList();
			verbs.add("did");
			verbs.add("spoke");
			verbs.add("wrote");
			verbs.add("broke");
			
			
		    HashMap<String,List<String>> posInstances = new HashMap();
		    posInstances.put("Noun", nouns);
		    posInstances.put("Verb", verbs);
		    
		    detector.setPosInstances(posInstances);
		    
		  MediaResponseManager manager = new MediaResponseManager();
		
		  manager.setNetwork(network);
		  manager.setDetector(detector);
		  
		  manager.init(urls, keywords, sentiment);
		  manager.analyzeAll();
		  manager.checkForSentiments();
		
		  
		  List<Map<String,List<String>>> foundSentiments = manager.getFoundSentimentArticles();
		  
		  String message = null;
		  if(foundSentiments.size() >0)
		  {
			  message = "Found Sentiments in: ";
			  //+  socialMediaURL+"'";
		  }
		%>
		
		<div id="fh5co-main">
			
			<div class="fh5co-cards">
				<div class="container-fluid">
					
			       <div class="row">
						<div class="col-md-3">
						 <p>
			              <%
			                if(foundSentiments.size() >0)
			    		     {
			    			   out.println(message);
			    		     }
			               %>
			               </p>
			            </div>
			       </div>
			        <div class="row">
						<div class="col-md-3">         
			               <table border=1>
			               <%  
			                 out.println("<tr>");
			                 out.println("<th>");
			                 out.println("KeyWord</th>");
			                 out.println("<th> Found Sentiment");
			                 out.println("</th>");
			                 out.println("<th> Occurrences");
			                 out.println("</th>");
			                 out.println("</tr>");
			                
			                 int i=0;
			               for(Map<String,List<String>> sentiments: foundSentiments)
			               {
			            	    
				               for(String senti:sentiment)
				               {
				            	   
				            	 List<String> occurrences = sentiments.get(senti);  
				                 out.println("<tr border=1>");
				                 out.println("<td border=1>");
				                 out.println(keywords[i]);
				                 out.println("</td>");
				                 out.println("<td border=1>");
				                 out.println(senti);
				                 out.println("</td>");
				                 out.println("<td border=1>");
				                 if(occurrences != null)
				                 {
				                  out.println(occurrences.size());
				                 }
				                 else
				                 {
				                   out.println(0);
				                 }
				                 out.println("</td>");
				                 out.println("</tr>");
				               }
				               
				               i++;
			               }
			              %>
			              </table>
			            </div>
				   </div>
			     </div>

			<!-- END container -->


		   </div>
		</div>
		<!-- END fhtco-main -->


		<footer role="contentinfo" id="fh5co-footer">
			<a href="#" class="fh5co-arrow fh5co-gotop footer-box"><i class="ti-angle-up"></i></a>
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-6 footer-box">
						<h3 class="fh5co-footer-heading">Architect Corner</h3>
						<ul class="fh5co-footer-links">
							<li><a href="#">About</a></li>
							<li><a href="#">Services</a></li>
							<li><a href="#">Our Products</a></li>
							<li><a href="#">Our Culture</a></li>
							<li><a href="#">Team</a></li>
						</ul>

					</div>
					<div class="col-md-4 col-sm-6 footer-box">
						<h3 class="fh5co-footer-heading">More Links</h3>
						<ul class="fh5co-footer-links">
							<li><a href="#">Terms &amp; Conditions</a></li>
							<li><a href="#">Our Careers</a></li>
							<li><a href="#">Support &amp; FAQ's</a></li>
							<li><a href="#">Sign up</a></li>
							<li><a href="#">Log in</a></li>
						</ul>
					</div>
					<div class="col-md-4 col-sm-12 footer-box">
						<h3 class="fh5co-footer-heading">Get in touch</h3>
						<ul class="fh5co-social-icons">
							
							<li><a href="#"><i class="ti-google"></i></a></li>
							<li><a href="#"><i class="ti-twitter-alt"></i></a></li>
							<li><a href="#"><i class="ti-facebook"></i></a></li>	
							<li><a href="#"><i class="ti-instagram"></i></a></li>
							<li><a href="#"><i class="ti-dribbble"></i></a></li>
						</ul>
					</div>
					<div class="col-md-12 footer-box text-center">
						<div class="fh5co-copyright">
						<p>&copy; 2016 Architect Corner All Rights Reserved. <br> <a href="http://www.architectconrer.com" target="_blank">ArchitectCorner</a></p>
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
