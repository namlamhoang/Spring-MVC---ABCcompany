<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>	

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
		<!--Modal -->
	<div>

		<!-- deleteModal -->
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form id="formDelete">
						<div class="modal-header">
							<h5 class="modal-title text-danger" id="deleteModalLabel"><s:message code='data.departDelete'/></h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<div class="modal-body">

							<h5 class="modal-title font-weight-bold" id="warning"></h5>
							<div class="card">
								<div class="card-body">
									<p id="idEntity" class="text-warning"></p>
									<p id="message"></p>
								</div>
							</div>

						</div>
						
						<input id="departId" type="hidden" value=""/>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

							<button type="submit" id="delete" class="btn btn-danger">
								Delete</button>
						</div>
					</form>
				</div>
			</div>
		</div>


		<!-- departModalForm -->
	<div class="modal fade" id="departModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-danger" id="departModalCenterTitle">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<form id ="formDepart">
				<div class="modal-body">
					
						<div class="form-group row" id ="idTitle">
							<label for="colFormLabelSm"
								class="col-sm-3 col-form-label col-form-label-sm"><h5><s:message code="data.departId"/></h5></label>
							<div class="col-sm-8">
								<input type="text" class="form-control form-control-sm"
									id="departId" readonly>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="colFormLabelSm"
								class="col-sm-3 col-form-label col-form-label-sm"><h5><s:message code="data.departName"/></h5></label>
							<div class="col-sm-8">
								<input type="text" class="form-control form-control-sm"
									id="departName" required="true">
							</div>
						</div>
						
						<input type = "hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" >Close</button>
					<input type="submit" id="excute"  class="btn btn-success" value="save"/>
				</div>
			</form>
			</div>
		</div>
	</div>
	
	<!-- messageModal -->
		<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title text-primary" id="messTitleModalLabel">Modal title</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="card">
							<div class="card-body">
								<h5 id="messtype" class="text-danger"></h5>
								<p id="mess"></p>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		</div>
		</body>
		
</html> 
