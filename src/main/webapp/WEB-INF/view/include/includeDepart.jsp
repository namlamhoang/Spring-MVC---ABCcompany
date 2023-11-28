<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
        <main class="content-wrapper">
		
	<!-- departmodal -->
	<jsp:include page="modal/departModal.jsp"></jsp:include>	
	
	<div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
		
		<div class="mdc-card p-2">
			<div class="card">
				<h1 class="card-header card-title bg-info text-white"><s:message code="data.departTable"/></h1>
				<div class="card-body">
					<div class="row">
						<div class="col-12 col-sm-7 col-md-7 col-lg-8 col-xl-9 mt-2">
								
						</div>
					
						<div class="col-12 col-sm-5 col-md-5 col-lg-4 col-xl-3 mt-2">
							<div class="save">
								<a href='javascript:void()' id='saveDepart' class='btn btn btn-primary col-12 text-white' data-toggle='modal' data-target='#departModalCenter'>
								<i class="fas fa-plus-circle"></i>&nbsp;&nbsp;<s:message code="data.departAdd"/></a>
							</div>
						</div>
						
					</div>
					<div class="row p-3">
									<div
										class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon search-text-field d-md-flex">
										<i class="material-icons mdc-text-field__icon">search</i> 
										<input class="mdc-text-field__input" id="text-field-hero-input">
										<div class="mdc-notched-outline">
											<div class="mdc-notched-outline__leading"></div>
											<div class="mdc-notched-outline__notch">
												<label for="text-field-hero-input" class="mdc-floating-label"><s:message code="data.search"/></label>
											</div>
											<div class="mdc-notched-outline__trailing"></div>
										</div>
									</div>
								</div>
					
					<div class="table-responsive">
					<table class="table table-hoverable">
						<thead>
							<tr class="table-primary">
								<td class="text-left"><s:message code="data.departId"/></td>
								<td class="text-left"><s:message code="data.departName"/></td>
								<td class="text-left"><s:message code="data.departTheWriter"/></td>
								<td class="text-left"><s:message code="data.edit"/></td>
								<td class="text-left"><s:message code="data.delete"/></td>
							</tr>
						</thead>
						<tbody>
					 		
						</tbody>
					</table>
					</div>	
				</div>
			</div>
			
			<div class="row"><div><div><div><div>
			<script type="text/javascript">
			
								   $(document).ready(function(){
									   $("#text-field-hero-input").keyup(function () {
										    var value = this.value.toLowerCase().trim();
										    $("table tr").each(function (index) {
										        if (!index) return;
										        $(this).find("td").each(function () {
										            var id = $(this).text().toLowerCase().trim();
										            var not_found = (id.indexOf(value) == -1);
										            $(this).closest('tr').toggle(!not_found);
										            return not_found;
										        });
										    });
										}); 
									   
									   function loadtable(){
										   $.ajax({
												type: 'GET',
												url: '${pageContext.request.contextPath}/depart/listdepart',
												dataType: "json",
												success: function(listDepart){
													$('table tbody').html("");
													listDepart.forEach(function(depart, index, listDepart) {
														var tr = $('<tr />');
														tr.append($('<td />').attr({'class' : 'text-left'}).append(depart.depart_id));
													    tr.append($('<td />').attr({'class' : 'text-left'}).append(depart.name));
													    tr.append($('<td />').attr({'class' : 'text-left'}).append(depart.thewriter));
													    tr.append($('<td />').attr({'class' : 'text-left'}).append("<a href='javascript:void()' id='updateDepart' class='btn btn-warning text-left' data-toggle='modal' data-target='#departModalCenter'><i class='fas fa-user-edit'></i></a>"));
													    tr.append($('<td />').attr({'class' : 'text-left'}).append("<a href='javascript:void()' id='deleteDepart' class='btn btn-danger text-left' data-toggle='modal' data-target='#deleteModal'><i class='fas fa-user-times'></i></a>"));
													    tr.append("<input type='hidden' id='depart_id' value= '"+ depart.depart_id +"'>");
													    tr.append("<input type='hidden' id='depart_name' value= '"+ depart.name +"'>");
														$('table tbody').append(tr);
													});
												},
												error : function(e) 
									           {  
									          	  alert('Error: ' + e); 
									           }
											});		
									   }
									   loadtable();
									   
									   
								        
										
								       	$('.save').delegate('#saveDepart','click',function(){
										  	$('#departModalCenterTitle').text("<s:message code='data.departAdd'/>"); 
										  	$('#departModalCenter #idTitle').hide();
										  	$('#departModalCenter #excute').val("Save")
											$('#departModalCenter #departName').val("");
										});
								       	
								       	
								       	$('table').delegate('#updateDepart','click',function(){
											var id = $(this).parent().parent().find('#depart_id').val();
										  	$('#departModalCenterTitle').text("<s:message code='data.departUpdate'/>"); 
										  	$('#departModalCenter #idTitle').show();
										  	$('#departModalCenter #excute').val("Update")
											$.ajax({
												type: 'GET',
												url: '${pageContext.request.contextPath}/depart/update/'+id,
												success: function(depart){
													$('#departModalCenter #departId').val(depart.depart_id);
													$('#departModalCenter #departName').val(depart.name);
												}
											});	
										});
								       	
										$('table').delegate('#deleteDepart','click',function(){
											var id = $(this).parent().parent().find('#depart_id').val();
											var name = $(this).parent().parent().find('#depart_name').val();
											$('#deleteModal #departId').val(id);
											$('#deleteModal #warning').text("<s:message code='data.questDelete'/>");
											$('#deleteModal #idEntity').text("<s:message code='data.departId'/> : "+id); 
											$('#deleteModal #message').text("<s:message code='data.departName'/> : "+name);
										});
										
										
										$("#formDepart").submit(function(e) {
											
										    e.preventDefault();
										    var departData = {};
										    
									    	if($("#formDepart #excute").val()==="Save"){
												departData["depart_id"] = "";
									    	}else{
									    		departData["depart_id"] = $('#departModalCenter #departId').val();
											}
									    	
											departData["name"] = $("#departName").val();
											departData["thewriter"] = "${users.fullname}";
											
											$.ajax({
												type : "POST",
												headers: {"X-CSRF-TOKEN": $("input[name=_csrf]").val()},
												contentType : "application/json",
												url : "${pageContext.request.contextPath}/depart/excute",
												data : JSON.stringify(departData),
												success : function(messages) {
													console.log(messages);
													$('#departModalCenter').modal('hide');
													$('#messageModal #messTitleModalLabel').text(messages.title);
													$('#messageModal #messtype').text(messages.type);
													$('#messageModal #mess').text(messages.message);
													$('#messageModal').modal('show'); 
													loadtable();
												},
												error: function(error) {//jqXHR, textStatus, errorThrown
													console.log(error.responseText);
													console.log(error.status);
											    }
											}); 	
											
										});
										
										$("#formDelete").submit(function(e) {
										    e.preventDefault();
										    var Data = {};
										    Data["depart_id"] = $('#deleteModal #departId').val();
										    console.log("ok1");
										    $.ajax({
												type : "DELETE",
												headers: {"X-CSRF-TOKEN": $("input[name=_csrf]").val()},
												contentType : "application/json",
												url : "${pageContext.request.contextPath}/depart/delete",
												data : JSON.stringify(Data),
												success : function(messages) {						
													$('#deleteModal').modal('hide');
													$('#messageModal #messTitleModalLabel').text(messages.title);
													$('#messageModal #messtype').text(messages.type);
													$('#messageModal #mess').text(messages.message);
													$('#messageModal').modal('show'); 
													loadtable();
												},
												error: function(error) {//jqXHR, textStatus, errorThrown
													console.log(error.responseText);
													console.log(error.status);
											    }
											});  
										});
										
										
									});
								
							</script>
			</div></div></div></div></div>
		</div>
	</div>

 	
</main>
