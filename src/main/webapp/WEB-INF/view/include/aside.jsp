<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <base href="${pageContext.servletContext.contextPath}/">
  
 </head>
 <body>
<aside class="mdc-drawer mdc-drawer--dismissible mdc-drawer--open">
      <div class="mdc-drawer__header">
        <a href="home/index" class="brand-logo">
          <img src="resources/assets/images/logoABC.png" alt="logo">
        </a>
      </div>
      <div class="mdc-drawer__content">
        <div class="user-info">
          <p class="name">${users.fullname}</p>
          <p class="email">${users.email}</p>
        </div>
        <div class="mdc-list-group" >
          <nav class="mdc-list mdc-drawer-menu">
            <div class="mdc-list-item mdc-drawer-item">
            
              <a class="mdc-drawer-link" href="home/index">
                <i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon" aria-hidden="true">home</i>
                  <s:message code ="aside.home"/>
              </a>
              
            </div>
            <div class="mdc-list-item mdc-drawer-item">
              <a class="mdc-drawer-link" href="record/viewrecord">
                <i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon" aria-hidden="true">track_changes</i>
               <s:message code ="aside.record"/>
              </a>
            </div>
            
            <div class="mdc-list-item mdc-drawer-item">
              <a class="mdc-drawer-link" href="staff/viewstaff">
                <i class="material-icons mdc-lưist-item__start-detail mdc-drawer-item-icon" aria-hidden="true">grid_on</i>
                <s:message code ="aside.staff"/>
              </a>
            </div>
            
            <div class="mdc-list-item mdc-drawer-item">
              <a class="mdc-drawer-link" href="depart/viewdepart">
                <i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon" aria-hidden="true">dashboard</i>
                <s:message code ="aside.depart"/>
              </a>
              
            </div>
            <div class="mdc-list-item mdc-drawer-item">
              <a class="mdc-expansion-panel-link expanded" href="javascript:void(0);" data-toggle="expansionPanel" data-target="chart-menu">
             	 <i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon" aria-hidden="true">pie_chart_outlined</i>
                 <s:message code ="aside.statistical"/>
                <i class="mdc-drawer-arrow material-icons">chevron_right</i>
              </a>
              <div class="mdc-expansion-panel" id="chart-menu">
                <nav class="mdc-list mdc-drawer-submenu">
                  <div class="mdc-list-item mdc-drawer-item">
                    <a class="mdc-drawer-link" href="javascript:void(0);"  id="monthstatistic">
                    <i class="fas fa-calendar-day"></i>&nbsp;
                      <s:message code ="aside.moth"/>
                    </a>
                  </div>
                  <%-- <div class="mdc-list-item mdc-drawer-item" tabindex="-1">
                    <a class="mdc-drawer-link" href="">
                    <i class="fas fa-calendar-week"></i>&nbsp;
                      <s:message code ="aside.quarter"/>
                    </a>
                  </div> --%>
                  <div class="mdc-list-item mdc-drawer-item" tabindex="-1">
                    <a class="mdc-drawer-link" href="javascript:void(0);" id="yearstatistic">                    
                    <i class="fas fa-calendar-alt"></i>&nbsp;
                      <s:message code ="aside.year"/>
                    </a>
                  </div>
                </nav>
              </div>
            </div>
            
            <div class="mdc-list-item mdc-drawer-item">
              <a class="mdc-drawer-link" href="resources/assets/images/anhcv.png" target="_blank">
                <i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon" aria-hidden="true">description</i>
                <s:message code ="aside.information"/>
              </a>
            </div>
          </nav>
        </div>
        
		<form:form action="logout"
					method="post">
				<div class="profile-actions">
                    <input type="submit"
						class="mdc-button mdc-button--raised filled-button--light mdc-ripple-upgraded"
						value=" <s:message code ="aside.logout"/> " />
				</div>
			</form:form>

      </div>
    </aside>
    </body>
    </html> 