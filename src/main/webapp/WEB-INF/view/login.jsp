<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <base href="${pageContext.servletContext.contextPath}/">
  
  <title>ABC Company</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="resources/assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="resources/assets/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

        
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- Layout styles -->
  <link rel="stylesheet" href="resources/assets/css/demo/style.css">
  <!-- End layout styles -->
  <link rel="shortcut icon" href="resources/assets/images/abc.png" />
</head>
<body>
<script src="resources/assets/js/preloader.js"></script>
  <div class="body-wrapper">
    <div class="main-wrapper">
      <div class="page-wrapper full-page-wrapper d-flex align-items-center justify-content-center">
        <main class="auth-page">
          <div class="mdc-layout-grid">
            <div class="mdc-layout-grid__inner">
              <div class="stretch-card mdc-layout-grid__cell--span-4-desktop mdc-layout-grid__cell--span-1-tablet"></div>
              <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-4-desktop mdc-layout-grid__cell--span-6-tablet">
                <div class="mdc-card">
           
                  <form:form method="POST" action="pagelogin/loging" modelAttribute="user">
                  <h3 class="text-uppercase text-center">
                  		Welcome
                  </h3>
                  	<!-- check login error -->
                  	${param.error}
                  <c:if test="${param.error != null}">
                  <div class="alert alert-danger">
                  		<h4 class="alert-heading">Login Fail!</h4>
					  	Invilid Name and Password.
					</div>
                  </c:if>
          			<!-- check logout -->
                  <c:if test="${param.logout != null}">
                  <div class="alert alert-success">
                  		<h4 class="alert-heading">Login Out Success</h4>
					  	You have been logged out.
					</div>
                  </c:if>
                  
                    <div class="mdc-layout-grid">
                      <div class="mdc-layout-grid__inner">
                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
                          <div class="mdc-text-field w-100">
                          
                          <!-- username -->
                            <input name="username" class="mdc-text-field__input" id="text-field-hero-input" />
                            <div class="mdc-line-ripple"></div>
                            <label for="text-field-hero-input" class="mdc-floating-label">Username</label>
                          </div>
                        </div>
                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
                          <div class="mdc-text-field w-100">
                          
                           <!-- password -->
                            <input name="password" class="mdc-text-field__input" type="password" id="text-field-hero-input"  />
                            <div class="mdc-line-ripple"></div>
                            <label for="text-field-hero-input" class="mdc-floating-label">Password</label>
                          </div>
                        </div>
       <!--                  <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                          <div class="mdc-form-field">
                            <div class="mdc-checkbox">
                            
                              <input type="checkbox"
                                      class="mdc-checkbox__native-control"
                                      id="checkbox"
                                      name="remember-me"/>
                              <div class="mdc-checkbox__background">
                                <svg class="mdc-checkbox__checkmark"
                                      viewBox="0 0 24 24">
                                  <path class="mdc-checkbox__checkmark-path"
                                        fill="none"
                                        d="M1.73,12.91 8.1,19.28 22.79,4.59"/>
                                </svg>
                                <div class="mdc-checkbox__mixedmark"></div>
                              </div>
                            </div>
                            <label for="checkbox">Remember me</label>
                            
                          </div>
                        </div>
                        
                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop d-flex align-items-center justify-content-end">
                          <a href="#">Forgot Password</a>
                        </div> -->
                        
                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
                          <input type="submit" value="Login" class="mdc-button mdc-button--raised w-100"/>
                        </div>
                      </div>
                    </div>
                  </form:form>
                </div>
              </div>
              <div class="stretch-card mdc-layout-grid__cell--span-4-desktop mdc-layout-grid__cell--span-1-tablet"></div>
            </div>
          </div>
        </main>
      </div>
    </div>
  </div>
  <!-- plugins:js -->
  <script src="resources/assets/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="resources/assets/js/material.js"></script>
  <script src="resources/assets/js/misc.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <!-- End custom js for this page-->
</body>
</html>