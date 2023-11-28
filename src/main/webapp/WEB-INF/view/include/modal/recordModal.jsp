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
					<h5 class="modal-title text-danger" id="deleteModalLabel"><s:message code='data.recordDelete'/></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

					<div class="modal-body">
					
					<h5 class="modal-title font-weight-bold" id="warning" ><s:message code='data.questDelete'/></h5>
						<div class="card">
							<div class="card-body">
								<p id="idEntity" class="text-warning"></p>
								<p id="message"></p>
							</div>
						</div>
					
					</div>
					<input id="recordId" type="hidden" value=""/>
					<input id="staffName" type="hidden" value=""/>
					<input type = "hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal"><s:message code ="data.close"/></button>
						
					<button type="submit" id="delete" class="btn btn-danger"><s:message code ="data.delete"/></button>	
				</div>
				</form>	
			</div>
		</div>
	</div>
	
	
	
	<!-- recordSaveModalForm -->
	<div id="recordModalCenter" class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
			
				<div class="modal-header">
					<h5 class="modal-title text-danger" id="recordModalCenterTitle"><s:message code ="data.recordAdd"/></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
			<!-- 	novalidate form -->
				<div  style="position: relative;" >
					<form id="formRecord" class="saveRecord-validation" novalidate>
						<div class="modal-body row">

							<div class="col-12">

								<div class="card mt-2">
								
									<h5 class="card-header card-title bg-info text-white">
										<s:message code="data.staffTable" />
									</h5>
									
									<div class="card-body">
										<div class="row">
										
											<div class="col-12 col-sm-7 col-md-7 col-lg-8 col-xl-9 mt-2 h-auto">
											
													<div class="input-group h-auto">
														<div class="input-group-prepend">
															<span class="input-group-text" id="basic-addon1">
																<s:message code="data.list" /> &nbsp;&nbsp;
															</span>
															<div>
																<input id="validListRecord" type="text" hidden class="form-control" required>
																<div class="valid-tooltip"><i class="fas fa-check-circle"></i></div>
																<div class="invalid-tooltip"><s:message code="invalid.listRecordStaff"/></div>
															</div>
														</div>
													<div id="listRecordStaff"
															class="form-control row p-0 h-auto"></div>
													</div>

											</div>

											<div class="col-12 col-sm-5 col-md-5 col-lg-4 col-xl-3 mt-2">
												<div id="staffDepart">
													<select class="custom-select ">
														<option value="all"><s:message
																code="data.staffSelect" /></option>
														<c:forEach items="${departList}" var="depart">
															<option value="${depart.depart_id}">${depart.name}</option>
														</c:forEach>
													</select>
												</div>
											</div>

										</div>


										<div class="row p-3"> 
											<div class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon search-text-field d-md-flex">
												<i class="material-icons mdc-text-field__icon">search</i> 
												<input class="mdc-text-field__input" id="text-field-hero-input">
												<div class="mdc-notched-outline">
													<div class="mdc-notched-outline__leading"></div>
													<div class="mdc-notched-outline__notch">
														<label for="text-field-hero-input" class="mdc-floating-label">
															<s:message code="data.search" /></label>
													</div>
													<div class="mdc-notched-outline__trailing"></div>
												</div>
											</div>
										</div>

										<div class="table-responsive">
											<table class="table table-hoverable">
												<thead>
													<tr class="table-primary">
														<th class="text-center"><s:message code="data.add" /></th>
														<td class="text-center"><s:message code="data.fullname" /></td>
														<td class="text-left"><s:message code="data.gender" /></td>
														<td class="text-left"><s:message code="data.birthday" /></td>
														<td class="text-left"><s:message code="data.images" /></td>
														<td class="text-left"><s:message code="data.email" /></td>
														<td class="text-left"><s:message code="data.phone" /></td>
														<td class="text-left"><s:message code="data.salary" /></td>
														<td class="text-left"><s:message code="data.level" /></td>
													</tr>
												</thead>
												<tbody id="staffTable">

												</tbody>
											</table>
										</div>
									</div>
								</div>

							</div>

							<div class="col-12">

								<div class="card mt-2 p-3">

									<div class="form-group col-12">
										<label><s:message code="data.type" /></label> <select
											class="custom-select" id="selectDepart" required>
											<option value=""><s:message code="data.recordChoose" /></option>
											<option value="1"><s:message code="data.recordAchieve" /></option>
											<option value="0"><s:message code="data.recordDiscipline" /></option>
										</select>
										<div class="invalid-tooltip"><s:message code="invalid.recordType" /></div>
									</div>


									<div class="form-group col-12">
										<label for="staffNote"><s:message code="data.reason" /></label>
										<textarea class="form-control" id="recordNote" rows="3"	required></textarea>
										<div class="invalid-tooltip"><s:message code="invalid.recordNote"/></div>
									</div>


									<input type="hidden" id="recordId" value="" /> <input
										type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />

								</div>
							</div>
							
						</div>
						<!--  end card body -->

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">
								<s:message code="data.close" />
							</button>
							<input type="submit" id="excute" class="btn btn-success"
								value="&nbsp;<s:message code ="data.save"/>&nbsp;" />

						</div>
					</form>
				</div>
			<!-- 	end form -->
				
			</div>
		</div>
	</div>
	
	
	
	<!-- recordUpdateModalForm -->
	<div class="modal fade" id="recordUpdateModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content" style="position:relative;">
				<div class="modal-header">
					<h5 class="modal-title text-danger" id="recordUpdateModalCenterTitle"><s:message code="data.recordUpdate"/></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<form id="formUpdateRecord" class="updateRecord-validation" novalidate >
					<div class="modal-body">
						
						<div class="form-group col-12">
								<label><s:message code="data.type"/></label> 
								<select class="custom-select" id="selectRecord" required>
									<option value=""><s:message code="data.recordChoose"/></option>
									<option value="1"><s:message code ="data.recordAchieve"/></option>
									<option value="0"><s:message code ="data.recordDiscipline"/></option>
								</select>
								<div class="invalid-tooltip"><s:message code="invalid.recordType"/></div>
						</div>
						
						<div class="form-group col-12">
							<label for="staffNote"><s:message code="data.reason"/></label>
							<textarea class="form-control" id="recordNote"
								rows="3" required></textarea>
								<div class="invalid-tooltip"><s:message code="invalid.recordNote"/></div>
						</div>
	
						
						<input type="hidden" id="recordId" value=""/>
						<input type = "hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal" ><s:message code ="data.close"/></button>
						<input type="submit" id="excute"  class="btn btn-success" value="&nbsp;<s:message code ="data.edit"/>&nbsp;"/>
					</div>
				
				</form>
				
			</div>
			
		</div>
	</div>
	
	
	
	<!-- messageModal -->
		<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
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
							data-dismiss="modal"><s:message code ="data.close"/></button>
					</div>
				</div>
			</div>
		</div>
	
	
	
		</div>
		</body>
		
		
</html> 
