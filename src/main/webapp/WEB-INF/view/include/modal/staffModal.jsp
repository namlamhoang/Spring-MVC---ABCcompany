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
	
	<!-- NoteModal -->
	<div class="modal fade" id="showNoteModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			
				<div class="modal-header">
					<h5 class="modal-title text-danger" id="noteModalLabel"><s:message code ='data.note'/></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

					<div class="modal-body">
					<form>
					<h5 class="modal-title font-weight-bold" id="name" ></h5>
						<div class="card">
							<div class="card-body">
								<p id="note" class="text-warning"></p>
								<p id="noteName"></p>
							</div>
						</div>
					</form>	
					</div>
					<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal"><s:message code ="data.close"/></button>
				</div>
	
			</div>
		</div>
	</div>
	
	<!-- deleteModal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form id="formDelete">
				<div class="modal-header">
					<h5 class="modal-title text-danger" id="deleteModalLabel"><s:message code ='data.staffDelete'/></h5>
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
					<input id="staffId" type="hidden" value=""/>
					<input id="staffName" type="hidden" value=""/>
					<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal"><s:message code ="data.close"/></button>
						
					<button type="submit" id="delete" class="btn btn-danger"><s:message code ="data.delete"/></button>	
				</div>
				</form>	
			</div>
		</div>
	</div>
	
	
	<!-- staffModalForm -->
	<!-- save -->
	<div class="modal fade" id="saveModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
		<!-- 	modal header -->
				<div class="modal-header">
					<h5 class="modal-title text-danger" ><s:message code ='data.staffAdd'/></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<!-- novalidate form -->
					<div style="position: relative;"> 
					
						<form id="saveStaffForm"  enctype="multipart/form-data"
							class="formStaff-validation" novalidate>
							
							<!-- form body -->
							<div class="modal-body">
								<div class="row">
								
									<div class="col-4">
										<div class="form-group">
											<div class="custom-file">
												<label for="staffImgFile1" > <img src="" alt=""
													width="120" height="160" id="staffImgDisplay1"  class="rounded" />
												</label>  
												<input type="file" style="display:none"
													class="custom-file-input" id="staffImgFile1" name="image" 
													value="Chosse Image" onchange="readURL(this);" />
											</div>
										</div>
									</div>

									<div class="col-8">
										<div class="form-group col-12">
											<label for="staffName"><s:message code ="data.fullname"/></label> <input type="text"
												maxlength="43" class="form-control" name="name" />
										</div>
				
										<div class="form-group col-12">
											<label><s:message code ="data.gender"/></label> <select class="custom-select"
												 name="gender" required>
												<option value=""><s:message code ="data.genderOp"/></label></option>
												<option value="1"><s:message code ="data.male"/></label></option>
												<option value="0"><s:message code ="data.female"/></label></option>
											</select>
										</div>
									</div>
								</div>

								<div class="form-group col-12">
									<label for="staffBirthday"><s:message code ="data.birthday"/></label> <input type="date" 
									 	 name="birthday" class="form-control" />
								</div>

								<div class="form-group col-12">
									<label for="staffEmail"><s:message code ="data.email"/></label> <input type ="email"
										class="form-control"  name="email" />
								</div>

								<div class="form-group col-12">
									<label for="staffPhone"><s:message code ="data.phone"/></label> <input type="text"
										maxlength="11" class="form-control" name="phone" />
								</div>

								<div class="form-group col-12">
									<label for="staffSalary"><s:message code ="data.salary"/></label> <input type="text"
										class="form-control" name="salary" />
								</div>

								<div class="form-group col-12">
									<label for="staffLevel"><s:message code ="data.level"/></label> <input type="number"
										min="1" max="10" class="form-control"  name ="level" />

								</div>
								

								<div class="form-group col-12">
									<label for="staffNote"><s:message code ="data.note"/></label>
									<textarea class="form-control"  name="note" maxlength ="200"></textarea>
								</div>

								<div class="form-group col-12">
									<label><s:message code ="data.departName"/></label> 
									<select class="custom-select"
										 name="departId" required>
										<option value=""><s:message code ="data.departChoose"/></option>
										<c:forEach items="${departList}" var="depart">
											<option value="${depart.depart_id}">${depart.name}</option>
										</c:forEach>
									</select>
								</div>

								<input type="hidden" name="id"  value="0" /> 
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</div>
			
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal"><s:message code ="data.close"/></button>
								<input type="submit" class="btn btn-success"
									value="&nbsp;Save&nbsp;" />
							</div>
						</form> 
						

					</div>
					<!-- end relative -->

				</div>
			
		</div>
	</div>
	
	<!-- update -->
	<div class="modal fade" id="updateModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
		<!-- 	modal header -->
				<div class="modal-header"> 
					<h5 class="modal-title text-danger" id="ModalCenterTitle"><s:message code ='data.staffUpdate'/></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<!-- novalidate form -->
					<div style="position: relative;"> 
					
						<form id="updateStaffForm"  enctype="multipart/form-data"
							class="formStaff-validation" novalidate>
							
							<!-- form body -->
							<div class="modal-body">
								<div class="row">
								
									<div class="col-4">
										<div class="form-group">
											<div class="custom-file">
												<label for="staffImgFile" > <img src="" alt=""
													width="120" height="160" id="staffImgDisplay"  class="rounded" />
												</label>  
												<input type="file" style="display:none"
													class="custom-file-input" id="staffImgFile" name="image" 
													value="Chosse Image"  onchange="readURL(this);" />  
											</div>
										</div>
									</div>

									<div class="col-8">
										<div class="form-group col-12">
											<label for="staffName"><s:message code ="data.fullname"/></label> <input type="text"
												maxlength="43" class="form-control" id="staffName" name="name" />
										</div>
				
										<div class="form-group col-12">
											<label><s:message code ="data.gender"/></label> <select class="custom-select"
												id="staffGender" name="gender" required>
												<option value=""><s:message code ="data.genderOp"/></label></option>
												<option value="1"><s:message code ="data.male"/></label></option>
												<option value="0"><s:message code ="data.female"/></label></option>
											</select>
										</div>
									</div>
								</div>

								<div class="form-group col-12">
									<label for="staffBirthday"><s:message code ="data.birthday"/></label> <input type="date" 
									 	id="staffBirthday" name="birthday" class="form-control" />
								</div>

								<div class="form-group col-12">
									<label for="staffEmail"><s:message code ="data.email"/></label> <input type ="email"
										class="form-control" id="staffEmail" name="email" />
								</div>

								<div class="form-group col-12">
									<label for="staffPhone"><s:message code ="data.phone"/></label> <input type="text"
										maxlength="11" class="form-control" id="staffPhone" name="phone" />
								</div>

								<div class="form-group col-12">
									<label for="staffSalary"><s:message code ="data.salary"/></label> <input type="text"
										class="form-control" id="staffSalary" name="salary" />
								</div>

								<div class="form-group col-12">
									<label for="staffLevel"><s:message code ="data.level"/></label> <input type="number"
										min="1" max="10" class="form-control" id="staffLevel" name ="level" />

								</div>
								
								

								<div class="form-group col-12">
									<label for="staffNote"><s:message code ="data.note"/></label>
									<textarea class="form-control" id="staffNote" name="note" maxlength ="200"></textarea>
								</div>

								<div class="form-group col-12">
									<label><s:message code ="data.departName"/></label> 
									<select class="custom-select"
										id="selectDepart" name="departId" required>
										<option value=""><s:message code ="data.departChoose"/></option>
										<c:forEach items="${departList}" var="depart">
											<option value="${depart.depart_id}">${depart.name}</option>
										</c:forEach>
									</select>
								</div>

								<input type="hidden" name="id" id="staffId" /> 
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</div>
			
							<div class="modal-footer">
							<div style="display: none;" ><input type="file" name="anh" id="photoFile" /></div>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal"><s:message code ="data.close"/></button>
								<input type="submit" id="excute" class="btn btn-success"
									value="&nbsp;Update&nbsp;" />
							</div>
						</form> 
						

					</div>
					<!-- end relative -->

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
