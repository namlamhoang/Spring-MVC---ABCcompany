<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
	
	
	
			<!-- recordmodal -->
	<jsp:include page="modal/recordModal.jsp"></jsp:include>	
	
        <main class="content-wrapper">
		
	
	<div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
		
		
		<div class="mdc-card p-2">
			<div class="card">
				<h1 class="card-header card-title bg-info text-white"><s:message code="data.recordTable"/></h1>
				<div class="card-body">
					<div class="row">
						<div class="col-12 col-sm-7 col-md-7 col-lg-8 col-xl-9">
							<div class="row">
								
								<div id="departRecord" class="col-12 mt-2">
									<select class="custom-select">
										<option value="all"><s:message code ="data.recordSelect"/></option>
										<c:forEach items="${departList}" var="depart">
											<option value="${depart.depart_id}">${depart.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="col-12 col-sm-5 col-md-5 col-lg-4 col-xl-3 mt-2">
							<button type="button" id="saveRecord" class="btn btn-primary col-12" data-toggle='modal' data-target='#recordModalCenter' >
								<i class="fas fa-plus-circle"></i>
								<s:message code="data.recordAdd"/>
							</button>
						</div>
					</div>
					
					
					<div class="row p-3" id="searchRecord">
				<!-- 	<span class="mdc-top-app-bar__title">Welcome!</span> -->
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
					<table id="departRecord" class="table table-hoverable">
						<thead>
							<tr class="table-primary">
								<td class="text-center"><s:message code ="data.fullname"/></td>
								<td class="text-left"><s:message code ="data.gender"/></td>
								<td class="text-left"><s:message code ="data.record"/></td>
								<td class="text-left"><s:message code ="data.reason"/></td>
								<td class="text-left"><s:message code ="data.date"/></td>
								<th class="text-left"><s:message code ="data.edit"/></th>
								<th class="text-left"><s:message code ="data.delete"/></th>
								
							</tr>
						</thead>
						<tbody >
						
						
								
								 
						</tbody>
					</table>
					</div>	
				</div>
			</div>
		</div>
		
		<div class="row"><div><div><div><div>
			<script type="text/javascript">
			
			
								   $(document).ready(function(){
									   
									   var allId = []; /* list staff add to record */
									   
									   
									   
									   $("#recordModalCenter #text-field-hero-input").keyup(function () {
										    var value = this.value.toLowerCase().trim();
										    $("#recordModalCenter table tr").each(function (index) {
										        if (!index) return;
										        $(this).find("td").each(function () {
										            var id = $(this).text().toLowerCase().trim();
										            var not_found = (id.indexOf(value) == -1);
										            $(this).closest('tr').toggle(!not_found);
										            return not_found;
										        });
										    });
										}); 
									   
									   $("#searchRecord #text-field-hero-input").keyup(function () {
										    var value = this.value.toLowerCase().trim();
										    $("#departRecord tr").each(function (index) {
										        if (!index) return;
										        $(this).find("td").each(function () {
										            var id = $(this).text().toLowerCase().trim();
										            var not_found = (id.indexOf(value) == -1);
										            $(this).closest('tr').toggle(!not_found);
										            return not_found;
										        });
										    });
										}); 
									   
									   $('#staffDepart').delegate('select.custom-select','change',function(){
											loadTable();
										}); 
										
										$('#listRecordStaff').delegate('#closereturn','click',function(){
											
											$(this).parent().remove();
											var id = $(this).parent().find('#staff_id').val();
											$('table #staffTable :input[value='+id+']').parent().find('#addStaff').prop('disabled', false);
											getListRecordStaff();
											if(allId.length < 1){
												$('#validListRecord').val(""); 
											}
										}); 
										
										function getAllValues() {
											var formData = new FormData();
											var type = $("#formRecord #selectDepart").val() == 1 ? true:false;
										    formData.append('type',type);
										    formData.append('reason',$("#formRecord #recordNote").val());
										    formData.append('date',new Date());
										    formData.append('staff_id',allId);
										    return formData;
										}
									  
										function getListRecordStaff(){
											allId = [];
											$('#listRecordStaff #staff_id').map(function() {
										    	allId.push($(this).val());
										    }); 
										}
									   	
									  /*  list staff to add record */
									   function loadTableRecord(){
								 	    	  var selected = $('#departRecord select.custom-select').children("option:selected").val();
												if(selected===""){
													selected = "all";
												}
												$.ajax({
													type: 'GET',
													url: '${pageContext.request.contextPath}/record/listrecord',
													dataType: "json",
													success: function(listRecord){
														$('#departRecord tbody').html("");
														listRecord.forEach(function(record, index, listRecord) {
															if(selected === "all" |selected == record.staff.depart_id){
																var tr = $('<tr />');
																tr.append($('<td />').attr({'class' : 'text-center'}).append(record.staff.name));
																var img = new Image(35,40);
																/* var img = $('<img />').attr("src","${pageContext.request.contextPath}/staff/getphoto?img="+record.staff.photo+"&ml="+record.staff.email);
																img.attr({'width': '35px','height': '40px'}); */
																img.src = "data:image/png;base64,"+ record.staff.photo;
																var imgtd =  $('<td />').attr({'class' : 'text-left'});
																tr.append(imgtd.append(img));
																var type = record.type == 1 ? "<s:message code='data.recordAchieve'/>" : "<s:message code='data.recordDiscipline'/>";
																var typecolor = record.type == 1 ?  'text-left text-primary font-weight-bold' : 'text-left text-danger font-weight-bold';
																tr.append($('<td />').attr({'class' : typecolor }).append(type));
																tr.append($('<td />').attr({'class' : 'text-left'}).append(record.reason));
																tr.append( $("<input />").attr({'id':'record_id','type':'hidden','value':record.record_id}) );
																tr.append( $("<input />").attr({'id':'staff_name','type':'hidden','value':record.staff.name}));
																tr.append($('<td />').attr({'class' : 'text-left'}).append($.datepicker.formatDate('dd-mm-yy',new Date(record.date))));
																tr.append($('<td />').attr({'class' : 'text-left'}).append("<a href='javascript:void()' id='updateRecord' class='btn btn-warning text-left' data-toggle='modal' data-target='#recordUpdateModalCenter'><i class='fas fa-edit'></i></a>"));
																tr.append($('<td />').attr({'class' : 'text-left'}).append("<a href='javascript:void()' id='deleteRecord' class='btn btn-danger text-left' data-toggle='modal' data-target='#deleteModal'><i class='fas fa-trash-alt'></i></a>"));
																$('#departRecord tbody').append(tr);
															}
														});
													},
													error : function(e) 
										           {  
										          	  alert('Error: ' + e); 
										           }
												});	
									       	} 
								 	       
								 	      	loadTableRecord();
								        
							 			$('#departRecord select.custom-select').change(function () {
							 				loadTableRecord();
										});	
							 			
										
							 			
							 			
										
										$('table').delegate('#addStaff','click',function(){
											$(this).prop('disabled', true);
											$('#validListRecord').val("yes");
											var id = $(this).parent().parent().find('#staff_id').val();
											var name = $(this).parent().parent().find('#staff_name').val();
											var div = $('<div />');
											div.attr({'class' : 'btn btn-outline-warning btn-sm m-1','style' : 'position: relative;top: 0;'});
											var btn = $('<button />').attr({'id':'closereturn','class' : 'close','style' : 'position: absolute; top: 0; right: 0;'});
											btn.append('<span aria-hidden="true">&times;</span>')
											div.append(btn);
											div.append("<input type='hidden' id='staff_id' value= '"+id+"'>");
											div.append('<span class="mr-2 ml-2">'+name+'</span>');
											$('#listRecordStaff').append(div);
											getListRecordStaff();
											
										});
										
										$( "#saveRecord" ).click(function() {
											$("#formRecord").removeClass("was-validated");
											$("#listRecordStaff").empty();
											$('table #staffTable :button').prop('disabled', false);
											$("#selectDepart").val("");
											$("#recordNote").val("");
											allId = [];
											$('#validListRecord').val(""); 
										});
										
										
										
										$('table').delegate('#updateRecord','click',function(){
											var id = $(this).parent().parent().find('#record_id').val();
											var name = $(this).parent().parent().find('#staff_name').val();
											$.ajax({
												type: 'GET',
												url: '${pageContext.request.contextPath}/record/getrecord/'+id,
												success: function(record){
													var type = record.type == true ? 1 : 0;
													$('#recordUpdateModalCenter #selectRecord').val(type);
													$('#recordUpdateModalCenter #recordNote').val(record.reason);
													$('#recordUpdateModalCenter #recordId').val(record.record_id);
												}
											});	
										});   
										
										$('table').delegate('#deleteRecord','click',function(){
											var id = $(this).parent().parent().find('#record_id').val();
											var name = $(this).parent().parent().find('#staff_name').val();
											$('#deleteModal #recordId').val(id);
											$('#deleteModal #staffName').val(name);
											$('#deleteModal #idEntity').text("<s:message code='data.recordId'/> : "+id); 
											$('#deleteModal #message').text("<s:message code='data.fullname'/> : "+name); 
										});   
										
										
										
										$("#formRecord").submit(function(e) {
											e.preventDefault();
											 var forms = document.getElementsByClassName('saveRecord-validation');
												var validation = Array.prototype.filter.call(forms, function(form) {
												     if (form.checkValidity() === false) {
												        	event.stopPropagation();
												     } else if (form.checkValidity() === true) {
												    	 $.ajax({
																type : "POST",
																headers: {"X-CSRF-TOKEN": $("input[name=_csrf]").val()},
																url : "${pageContext.request.contextPath}/record/excutesave",
																data : getAllValues(),
																processData: false,
													            contentType: false,	
																success : function(messages) {
																	$('#recordModalCenter').modal('hide');
																	$('#messageModal #messTitleModalLabel').text("<s:message code = 'data.recordAdd'/>");
																	$('#messageModal #messtype').text("<s:message code = 'data.success'/>");
																	$('#messageModal').modal('show');
																	loadTableRecord();
																},
																error : function(e) {  
																	
														        }
															});  
											     	 }
												     form.classList.add('was-validated');
												}, false);
											
										});
										
										
										$("#formUpdateRecord").submit(function(e) {
											e.preventDefault();
											var forms = document.getElementsByClassName('updateRecord-validation');
											
											var validation = Array.prototype.filter.call(forms, function(form) {
											     if (form.checkValidity() === false) {
											        	event.stopPropagation();
											     } else if (form.checkValidity() === true) {
											    	 var formData = new FormData();
														formData.append('record_id',$('#recordUpdateModalCenter #recordId').val());
														formData.append('type',$('#recordUpdateModalCenter #selectRecord').val());
														formData.append('reason',$('#recordUpdateModalCenter #recordNote').val());
														$.ajax({
															type : "POST",
															headers: {"X-CSRF-TOKEN": $("input[name=_csrf]").val()},
															url : "${pageContext.request.contextPath}/record/update",
															data : formData,
															processData: false,
												            contentType: false,	
															success : function(messages) {
																$('#recordUpdateModalCenter').modal('hide');
																$('#messageModal #messTitleModalLabel').text("<s:message code = 'data.recordUpdate'/>");
																$('#messageModal #messtype').text("<s:message code = 'data.success'/>");
																$('#messageModal').modal('show');
																loadTableRecord();
															},
															error : function(e) {  
																
													        }
														});  
											     }
											     form.classList.add('was-validated');
											}, false);
										
										});
										
										
										$("#formDelete").submit(function(e) {
										    e.preventDefault();
										    var id = $('#deleteModal #recordId').val();
										     $.ajax({
												type : "DELETE",
												headers: {"X-CSRF-TOKEN": $("input[name=_csrf]").val()},
												contentType : "application/json",
												url : "${pageContext.request.contextPath}/record/delete/"+id,
												success : function(messages) {
													$('#deleteModal').modal('hide');
													$('#messageModal #messTitleModalLabel').text("<s:message code = 'data.recordDelete'/>");
													$('#messageModal #messtype').text("<s:message code = 'data.success'/>");
													$('#messageModal').modal('show');
													loadTableRecord();
												}
											});    
										});
										
										
										

										   
									    function loadTable() {
									    	var selected = $('#staffDepart select.custom-select').children("option:selected").val();
											if(selected===""){
												selected = "all";
											}
											
											$.ajax({
												type: 'GET',
												url: '${pageContext.request.contextPath}/staff/liststaff/'+selected,
												dataType: "json",
												success: function(listStaff){
													$('table #staffTable').html("");
													listStaff.forEach(function(staff, index, listStaff) {
														
														var tr = $('<tr />');
												 		var checkdis = '';
														$('#listRecordStaff #staff_id').map(function() {
															if(staff.staff_id==$(this).val()) checkdis = 'disabled';
													    });  
												 		tr.append($('<td />').attr({'class' : 'text-left'}).append("<button id='addStaff' "+checkdis+" class='btn btn-success text-left'><i class='fas fa-plus-circle'></i></button>"));
														
														tr.append($('<td />').attr({'class' : 'text-left'}).append(staff.name));
														var gender = staff.gender == 1 ? 'Nam' : 'Nữ';
													    tr.append($('<td />').attr({'class' : 'text-left'}).append(gender));
													    var formattedDate = new Date(staff.birthday);
														var d = (formattedDate.getDate() < 10 ? '0' : '') + formattedDate.getDate();
														var m = (formattedDate.getMonth() < 10 ? '0' : '') + formattedDate.getMonth();
														var y = formattedDate.getFullYear();
													    tr.append($('<td />').attr({'class' : 'text-left'}).append(y + "-" + m + "-" + d));
													    var img = new Image(35,40);
													    img.src = "data:image/png;base64,"+staff.photo;
													/*     var img = $("<img id= 'photo'/>");
												 	    img.attr('src',"${pageContext.request.contextPath}/staff/getphoto?img="+staff.photo+"&ml="+staff.email); 
												 	    img.attr({'width': '35px','height': '40px'});*/
													    tr.append( $('<td />').attr({'class' : 'text-center'}).append(img) );
													    tr.append($('<td />').attr({'class' : 'text-left'}).append(staff.email));
													    tr.append($('<td />').attr({'class' : 'text-left'}).append(staff.phone));
													    tr.append($('<td />').attr({'class' : 'text-left'}).append(staff.salary));
													    tr.append($('<td />').attr({'class' : 'text-center'}).append(staff.level));
													    tr.append("<input type='hidden' id='staff_id' value= '"+ staff.staff_id +"'/>");
													    tr.append("<input type='hidden' id='staff_name' value= '"+ staff.name +"' />"); 
														$('table #staffTable').append(tr);
													});
												},
												error : function(e) 
									            {  
									            }
											});	
											
										}
										
									    loadTable();
										
										
										
								});  
								
							</script>
		</div></div></div></div></div>
	</div>

 	
</main>
