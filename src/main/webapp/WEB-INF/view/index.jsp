<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix = "ex" uri="WEB-INF/tl/myTag.tld" %>


<!DOCTYPE html>
<html lang="vi" >
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <base href="${pageContext.servletContext.contextPath}/">
  <title>ABC Company</title>
  <!-- plugins:css -->
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
  <link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/assets/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
  <link rel="stylesheet" href="resources/assets/vendors/jvectormap/jquery-jvectormap.css">
   <link rel="stylesheet" href="resources/assets/css/test.css">
  
  <!-- End plugin css for this page -->
  
  <!-- Layout styles -->
  <link rel="stylesheet" href="resources/assets/css/demo/style.css">
  <!-- End layout styles -->
 <link rel="shortcut icon" href="resources/assets/images/abc.png" />	
  

   	  	<!-- plugins:js -->
   	<script src="resources/assets/vendors/js/vendor.bundle.base.js"></script>  	
   	
   	<script src="resources/assets/js/jquery-3.5.1.min.js"></script>	  	
   	
	<script src="resources/assets/js/popper.min.js"></script>
	
	<script src="resources/assets/js/bootstrap.min.js"></script>	  	
	
	<script src="resources/assets/js/bootstrap.js"></script>  
	
    <script src="resources/assets/js/jquery-ui.js"></script>
    
    <!-- var $jq1 = jQuery.noConflict(true); -->
    
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
	
	
	
	<style type="text/css">
		.mdc-top-app-bar{
			position: -webkit-sticky;
			position: sticky;
			top: 0;
		}
	</style>
</head>
<body  onScroll="scrolling();">
	<ex:Hello mess="something"/>
		
	<!-- allmodal -->
	
	<!-- body-wrapper -->
  <div class="body-wrapper" >
	
    <!-- partial:partials/_sidebar.html -->
    <jsp:include page="include/aside.jsp"></jsp:include>
    
    <!-- partial -->
    <div class="main-wrapper mdc-drawer-app-content" >
    
      <!-- partial:partials/_navbar.html -->
    <jsp:include page="include/header.jsp"></jsp:include>  
    
      <!-- partial -->
      <div class="page-wrapper mdc-toolbar-fixed-adjust" >
      
      	<!-- partial:partials/content.html -->
      	<jsp:include page="include/${param.v}"></jsp:include>
       <button id="back-to-top" class="mdc-button mdc-button--raised icon-button mdc-ripple-upgraded" style="--mdc-ripple-fg-size:21px; --mdc-ripple-fg-scale:2.90056; --mdc-ripple-fg-translate-start:9.89999px, 12.5px; --mdc-ripple-fg-translate-end:7.5px, 7.5px;" >
				<i class="fas fa-level-up-alt"></i></button>
      	<!-- partial:partials/_footer.html -->
      	<jsp:include page="include/footer.jsp"></jsp:include>
      </div>
      
    </div>
    <!-- partial -->
    
  </div>
  <!-- body-wrapper -->
    <script src="resources/assets/js/preloader.js"></script>
    <!-- language -->
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <script src="resources/assets/vendors/chartjs/Chart.min.js"></script>
  <script src="resources/assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
  <script src="resources/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="resources/assets/js/material.js"></script>
  <script src="resources/assets/js/misc.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="resources/assets/js/dashboard.js"></script>
  <!-- End custom js for this page-->
</body>

	<script>
	
		function scrolling() {
			 if($(window).scrollTop() > 300){
		    	 $('#back-to-top').first().fadeIn( "slow" );
		     }else{
		    	 $('#back-to-top').first().fadeOut( "slow" );
		     }
	    };
	    
	    $("#back-to-top").on("click", function() {
				$('html, body').animate({scrollTop:0}, 'slow');
		});
	    
	    $('aside').delegate('#monthstatistic','click',function(){
	    	if(window.location.pathname.indexOf("/home/index") == -1){
	    		window.location.replace('/home/index?s=m');
	    	}
	    	
		}); 
	 	
	 	$('aside').delegate('#yearstatistic','click',function(){
	 		if(window.location.pathname.indexOf("/home/index") == -1){
	    		window.location.replace('/home/index?s=y');
	    	}
		}); 
	 	 
		
	</script>
	
</html> 
