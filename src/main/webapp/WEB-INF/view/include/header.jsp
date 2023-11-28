<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
 <base href="${pageContext.servletContext.contextPath}/">
<header class="mdc-top-app-bar">
        <div class="mdc-top-app-bar__row">
          <div class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
            <button class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button sidebar-toggler">menu</button>
            
          </div>
          <div class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end mdc-top-app-bar__section-right">
            <div class="menu-button-container menu-profile d-none d-md-block">
              <button class="mdc-button mdc-menu-button">
                <span class="d-flex align-items-center">
                  <span class="figure">
                    <img src="user/photo" alt="user" class="user">
                  </span>
                  <span class="user-name" id ="fullname">${users.fullname}</span>
                </span>
              </button>
              <div class="mdc-menu mdc-menu-surface" tabindex="-1">
                <ul class="mdc-list" role="menu" aria-hidden="true" aria-orientation="vertical">
                  <li class="mdc-list-item" role="menuitem">
                    <div class="item-thumbnail item-thumbnail-icon-only">
                      <i class="mdi mdi-account-edit-outline text-primary"></i>
                    </div>
                    <div class="item-content d-flex align-items-start flex-column justify-content-center">
                      <strike>  <h6 class="item-subject font-weight-normal"><s:message code ="header.editprofile"/></h6> </strike>
                    </div>
                  </li>
                  <li class="mdc-list-item" role="menuitem" >
                  
                    <div class="item-thumbnail item-thumbnail-icon-only">
                      <i class="mdi mdi-settings-outline text-primary"></i>                      
                    </div>
                    <div class="item-content d-flex align-items-start flex-column justify-content-center">
                     <strike> <h6 class="item-subject font-weight-normal"><s:message code ="aside.logout"/></h6> </strike>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
            <div class="divider d-none d-md-block"></div>
            
         	 
        	
           
            <div class="menu-button-container">
              <a class="mdc-button mdc-menu-button">
                <i class="<s:message code ="header.flag"/>"></i><s:message code ="header.flagname"/>
              </a>
              <div class="mdc-menu mdc-menu-surface" tabindex="-1">
                <ul class="mdc-list" role="menu" aria-hidden="true" aria-orientation="vertical">
             
                  <li id="en" class="mdc-list-item" role="menuitem" data-lang="en">
                  	
                    <div class="item-thumbnail item-thumbnail-icon-only">
                    
                      <i class="flag-icon flag-icon-us mr-2"></i> 
                      
                    </div>
                    
                    <div class="item-content d-flex align-items-start flex-column justify-content-center">
                   	 
                      <h6 class="item-subject font-weight-normal"><s:message code ="header.flageng"/></h6>
                    
                    </div>
                  
                  </li>
         
                  <li id="vi"  class="mdc-list-item" role="menuitem" data-lang="vi">
                    <div class="item-thumbnail item-thumbnail-icon-only">
                      <i class="flag-icon flag-icon-vn mr-2"></i> 
                    </div>
                    <div class="item-content d-flex align-items-start flex-column justify-content-center">
                      <h6 class="item-subject font-weight-normal"><s:message code ="header.flagvi"/></h6>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
            
          </div>
        </div>
      </header>
      	<script>
      
      	$(document).ready(function(){

			
      		$('header').delegate('#en','click',function(){
      			var lang = $(this).attr("data-lang");
      			var currenthref = $(location).attr('pathname');
      			var replacehref = currenthref.replace("/conLayout/","");
				$(location).attr('href',replacehref+"?lang="+lang);
      		});
      		$('header').delegate('#vi','click',function(){
      			var lang = $(this).attr("data-lang");
      			var currenthref = $(location).attr('pathname');
      			var replacehref = currenthref.replace("/conLayout/","");
				$(location).attr('href',replacehref+"?lang="+lang);
      		});
      		
      		
      		
      	});
	</script>