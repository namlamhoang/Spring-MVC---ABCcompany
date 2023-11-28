<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
        <main class="content-wrapper">
       
 <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
                <div class="mdc-card p-0">
                  <h6 class="card-title card-padding pb-0">Striped Table</h6>
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th class="text-left">Dessert (100g serving)</th>
                          <th>Calories</th>
                          <th>Fat (g)</th>
                          <th>Link</th>
                          <th>Carbs</th>
                          <th>Protein (g)</th>
                          <th>Sodium (mg)</th>
                          <th>Calcium (%)</th>
                          <th>Iron (%)</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="text-left">Frozen yogurt</td>
                          <td style="border-style: double;padding:0px;">
                          	<select style="width:100%;margin:0px;height:auto;">
                          		<option>1</option>
                          		<option>2</option>
                          		<option>3</option>
                          		<option>4</option>
                          	</select>
                          </td>
                          <td>6.0</td>
                          <td>50</td>
                          <td>4.0</td>
                          <td>87</td>
                          <td>20%</td>
                          <td>4%</td>
                          <td>6%</td>
                        </tr>
                        <tr>
                          <td class="text-left">Frozen yogurt</td>
                          <td>1.59</td>
                          <td>2.5</td>
                          <td>35</td>
                          <td>2.0</td>
                          <td>97</td>
                          <td>17%</td>
                          <td>2%</td>
                          <td>6%</td>
                        </tr>
                        <tr>
                          <td class="text-left">Ice crean sandwich</td>
                          <td>1.4</td>
                          <td>4.0</td>
                          <td>40</td>
                          <td>8.0</td>
                          <td>83</td>
                          <td>14%</td>
                          <td>7%</td>
                          <td>6%</td>
                        </tr>
                        <tr>
                          <td class="text-left">Eclair</td>
                          <td>1.7</td>
                          <td>3.0</td>
                          <td>34</td>
                          <td>6.0</td>
                          <td>67</td>
                          <td>17%</td>
                          <td>3%</td>
                          <td>6%</td>
                        </tr>
                        <tr>
                          <td class="text-left">Cupcake</td>
                          <td>2.49</td>
                          <td>4.0</td>
                          <td>45</td>
                          <td>3.05</td>
                          <td>83</td>
                          <td>20%</td>
                          <td>9%</td>
                          <td>6%</td>
                        </tr>
                        <tr>
                          <td class="text-left">Jellybean</td>
                          <td>0.78</td>
                          <td>5.2</td>
                          <td>35</td>
                          <td>2.0</td>
                          <td>27</td>
                          <td>18%</td>
                          <td>37%</td>
                          <td>6%</td>
                        </tr>
                        <tr>
                          <td class="text-left">Gingerbread</td>
                          <td>1.59</td>
                          <td>6.0</td>
                          <td>50</td>
                          <td>4.0</td>
                          <td>87</td>
                          <td>20%</td>
                          <td>4%</td>
                          <td>5.7%</td>
                        </tr>
                        <tr>
                          <td class="text-left">Lollipop</td>
                          <td>1.59</td>
                          <td>6.0</td>
                          <td>50</td>
                          <td>4.0</td>
                          <td>87</td>
                          <td>20%</td>
                          <td>4%</td>
                          <td>6.5%</td>
                        </tr>
                        <tr>
                          <td class="text-left">Honeycomb</td>
                          <td>0.45</td>
                          <td>5.0</td>
                          <td>45</td>
                          <td>3.5</td>
                          <td>45</td>
                          <td>19%</td>
                          <td>26%</td>
                          <td>9%</td>
                        </tr>
                        <tr>
                          <td class="text-left">Donut</td>
                          <td>0.67</td>
                          <td>5.0</td>
                          <td>56</td>
                          <td>3.34</td>
                          <td>67</td>
                          <td>23%</td>
                          <td>4%</td>
                          <td>1.8%</td>
                        </tr>
                        <tr>
                          <td class="text-left">Kitkat</td>
                          <td>0.59</td>
                          <td>8.34</td>
                          <td>43</td>
                          <td>1.97</td>
                          <td>34</td>
                          <td>18%</td>
                          <td>13%</td>
                          <td>1.5%</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
	
	

	 	<!-- departmodal -->
	<jsp:include page="modal/staffModal.jsp"></jsp:include>	
	
	<button id="testJson"> Test</button>
	
	<div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
		
		<div class="mdc-card p-2">
			<div class="card">
				<h1 class="card-header card-title bg-info text-white"><s:message code="data.staffTable"/></h1>
				<div class="card-body">
					<div class="row">
						<div class="col-12 col-sm-7 col-md-7 col-lg-8 col-xl-9">
							<div class="row">
							
								<div class="col-12 mt-2">
									<select class="custom-select">
										<option value="all"><s:message code ="data.staffSelect"/></option>
										<c:forEach items="${departList}" var="depart">
											<option value="${depart.depart_id}">${depart.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="col-12 col-sm-5 col-md-5 col-lg-4 col-xl-3 mt-2">
							<div class="save">
								<a href='javascript:void()' id='saveStaff' class='btn btn btn-primary col-12 text-white' data-toggle='modal' data-target='#saveModalCenter'>
								<i class="fas fa-plus-circle"></i>&nbsp;&nbsp;<s:message code="data.staffAdd"/></a>
							</div>
						</div>
					</div>
					
					
					<div class="row p-3">
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
					<table class="table table-hoverable">
						<thead>
							<tr class="table-primary">
								<td class="text-center"><s:message code ="data.fullname"/></td>
								<td class="text-left"><s:message code ="data.gender"/></td>
								<td class="text-left"><s:message code ="data.birthday"/></td>
								<td class="text-left"><s:message code ="data.images"/></td>
								<td class="text-left"><s:message code ="data.email"/></td>
								<td class="text-left"><s:message code ="data.phone"/></td>
								<td class="text-left"><s:message code ="data.salary"/></td>
								<td class="text-left"><s:message code ="data.level"/></td>
								<th class="text-left"><s:message code ="data.note"/></th>
								<th class="text-left"><s:message code ="data.edit"/></th>
								<th class="text-left"><s:message code ="data.delete"/></th>
							</tr>
						</thead>
						<tbody>
					 		
						</tbody>
					</table>
					</div>	
				</div>
			</div>
		</div>
		
		
							<script type="text/javascript">
							

							   // staff modal form
							   	var saveModal = $('#saveModalCenter');
							   	var updateModal = $('#updateModalCenter');
							    var saveForm = $("#saveStaffForm");
							    var updateForm = $("#updateStaffForm");
							    //save Form
							    var saveId = $("#saveStaffForm input[name='id']");
							    var saveName = $("#saveStaffForm input[name='name']");
							    var saveGender = $("#saveStaffForm select[name='gender']");
							    var saveBirthday = $("#saveStaffForm input[name='birthday']");
							    var saveImgFile = $('#saveStaffForm #staffImgFile1');
							    var saveImgDisplay =  $('#saveStaffForm #staffImgDisplay1');
							    var saveEmail = $("#saveStaffForm input[name='email']");
							    var savePhone =$("#saveStaffForm input[name='phone']");
							    var saveSalary = $("#saveStaffForm input[name='salary']");
							    var saveLevel = $("#saveStaffForm input[name='level']");
							    var saveNote = $("#saveStaffForm textarea[name='note']");
							    var saveDepart = $("#saveStaffForm select[name='depart']");
							    // update Form 
							    var updateId = $("#updateStaffForm input[name='id']");
							    var updateName = $("#updateStaffForm input[name='name']");
							    var updateGender = $("#updateStaffForm select[name='gender']");
							    var updateBirthday = $("#updateStaffForm input[name='birthday']");
							    var updateImgFile = $('#updateStaffForm #staffImgFile');
							    var updateImgDisplay =  $('#updateStaffForm #staffImgDisplay');
							    var updateEmail = $("#updateStaffForm input[name='email']");
							    var updatePhone =$("#updateStaffForm input[name='phone']");
							    var updateSalary = $("#updateStaffForm input[name='salary']");
							    var updateLevel = $("#updateStaffForm input[name='level']");
							    var updateNote = $("#updateStaffForm textarea[name='note']");
							    var updateDepart = $("#updateStaffForm select[name='departId']");
								// message board
								var messageModal = $('#messageModal');
								var messageTitle = $('#messageModal #messTitleModalLabel');
								
								var messageType = $('#messageModal #messtype');
								var message = $('#messageModal #mess');
								// to change image 
								
								function readURL(input) {
									if (input.files && input.files[0]) {
										var reader = new FileReader();
										reader.onload = function(e) {
											if(input.id.indexOf("1") != -1){
												$("#staffImgFile1 + label").remove();
												$("#staffImgDisplay1").attr('src', e.target.result);
											}else{
												$("#staffImgFile + label").remove();
												$("#staffImgDisplay").attr('src', e.target.result);
											}
										};
										reader.readAsDataURL(input.files[0]);
									}
								}
									
								   $(document).ready(function(){
									   
									 	var usedEmail = true;
										   
									   	updateEmail.keyup(function name() {
											usedEmail = true;
										});
									   	
										saveEmail.keyup(function name() {
											usedEmail = true;
										});
									   	
										// to validate
										$.validator.addMethod("extension", function(value, element) {
											var validExtensions = ['jpg','png'];
											var extension = value.substr( (value.lastIndexOf('.') +1) );
											if ($.inArray(extension, validExtensions) == -1){
												$('#staffImgDisplay').removeClass("border border-success");
												$(element).addClass("is-invalid");
												return false;
											}
											$('#staffImgDisplay').addClass("border border-success");
											return true;
										});
										
										$.validator.addMethod("yearold", function(value, element) {
											var date = new Date($(element).val());
											var yearold = new Date().getFullYear() - date.getFullYear();
											if(yearold < 18) return false;
											if(yearold > 60) return false
											return true;
										});
										
										$.validator.addMethod("tel", function(value, element) {
											var intRegex = /[0-9 -()+]+$/;
											if(intRegex.test(value)) return true;
										});
										
										$.validator.addMethod("usedEmail", function(value, element) {
											if(usedEmail) return true;
										});
										
										

										saveForm.validate({
											onfocusout : false,
											onkeyup : function(element) {
												$(element).valid()
											},
											onkeydown : function(element) {
												$(element).valid()
											},
											onclick : function(element) {
												$(element).valid()
											},
											ignore : "",
											rules : {
												"name" : {
													minlength :5,
													maxlength :44,
													required : true
												},
												"gender" : {
													required : true
												},
												"birthday" : {
													yearold : true,
													required : true
												},
												"email" : {
													required : true,
													usedEmail: true
												},
												"image" : {
													required : true,
													extension : true
												},
												"salary" : {
													min:1000000,
													max:50000000,
													required : true
												},
												"level" : {
													required : true
												},
												"phone" : {
													tel : true,
													minlength : 10,
													maxlength : 11,
													required : true
												}

											},
											messages : {
												"name" : {
													minlength :"Please enter at least 5 characters",
													maxlength :"Please enter no more than 44 characters",
													required : "Please enter your name"
												},
												"gender" : {
													required : "Please enter your gender"
												},
												"birthday" : {
													yearold : "Year old must be greater than 18 and les than 60",
													required : "Please enter your birthday"
												},
												"email" : {
													required : "Please enter a valid email",
													usedEmail : "Email already use"
												},
												"image" : {
													required : "Please choose your photo",	
													extension : "Photo extension must be jpg, png"
												},
												"salary" : {
													min: "Salary must be greater than 1000000 and les than 50000000",
													max: "Salary must be greater than 1000000 and les than 50000000",
													required : "Please enter Salary"
												},
												"level" : {
													min : "Level must be greater than 1 and less than 10",
													max : "Level must be greater than 1 and less than 10",
													required : "Please enter Level"
												},
												"phone" : {
													tel : "Please enter a phone number with 10-11 number character",
													minlength : "Please enter a phone number with 10-11 number character",
													maxlength : "Please enter a phone number with 10-11 number character",
													required : "Please enter your phone"
												}
											},
											errorPlacement : function(error, element) {
												error.attr({
													'class' : 'error invalid-tooltip'
												});
												error.insertAfter(element);
											},
											highlight : function(element) { // invalid element
												$(element).removeClass("is-valid");
												$(element).addClass("is-invalid");
											},
											unhighlight : function(element) {// valid element

												$(element).addClass("is-valid");
												$(element).removeClass("is-invalid");
											}
										});
										 
										// validate update form
										updateForm.validate({
											onfocusout : false,
											onkeyup : function(element) {
												$(element).valid()
											},
											onkeydown : function(element) {
												$(element).valid()
											},
											onclick : function(element) {
												$(element).valid()
											},
											ignore : "",
											rules : {
												"name" : {
													minlength :5,
													maxlength :44,
													required : true
												},
												"gender" : {
													required : true
												},
												"birthday" : {
													yearold : true,
													required : true
												},
												"email" : {
													required : true,
													usedEmail : "Email already use"
												},
												"image" : {
													required : true,
													extension : true
												},
												"salary" : {
													min:1000000,
													max:50000000,
													required : true
												},
												"level" : {
													required : true
												},
												"phone" : {
													tel : true,
													minlength : 10,
													maxlength : 11,
													required : true
												}

											},
											messages : {
												"name" : {
													minlength :"Please enter at least 5 characters",
													maxlength :"Please enter no more than 44 characters",
													required : "Please enter your name"
												},
												"gender" : {
													required : "Please enter your gender"
												},
												"birthday" : {
													yearold : "Year old must be greater than 18 and les than 60",
													required : "Please enter your birthday"
												},
												"email" : {
													required : "Please enter a valid email",
													usedEmail : "Email already use"
												},
												"image" : {
													required : "Please choose your photo",	
													extension : "Photo extension must be jpg, png"
												},
												"salary" : {
													min: "Salary must be greater than 1000000 and les than 50000000",
													max: "Salary must be greater than 1000000 and les than 50000000",
													required : "Please enter Salary"
												},
												"level" : {
													min : "Level must be greater than 1 and less than 10",
													max : "Level must be greater than 1 and less than 10",
													required : "Please enter Level"
												},
												"phone" : {
													tel : "Please enter a phone number with 10-11 number character",
													minlength : "Please enter a phone number with 10-11 number character",
													maxlength : "Please enter a phone number with 10-11 number character",
													required : "Please enter your phone"
												}
											},
											errorPlacement : function(error, element) {
												error.attr({
													'class' : 'error invalid-tooltip'
												});
												error.insertAfter(element);
											},
											highlight : function(element) { // invalid element
												$(element).removeClass("is-valid");
												$(element).addClass("is-invalid");
											},
											unhighlight : function(element) {// valid element

												$(element).addClass("is-valid");
												$(element).removeClass("is-invalid");
											}
										});
										// end validator
										
										
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
									   
									   
									   function loadTable() {
										   var selected = $('.card select.custom-select').children("option:selected").val();
											$.ajax({
												type: 'GET',
												url: '${pageContext.request.contextPath}/staff/liststaff/'+selected,
												dataType: "json",
												success: function(listStaff){
													$('table tbody').html("");
													listStaff.forEach(function(staff, index, listStaff) {
														var tr = $('<tr />');
														tr.append($('<td />').attr({'class' : 'text-left'}).append(staff.name));
														var gender = staff.gender == 1 ? 'Nam' : 'Nữ';
													    tr.append($('<td />').attr({'class' : 'text-left'}).append(gender));
													    var birthday = $.datepicker.formatDate('dd-mm-yy',new Date(staff.birthday))
													    tr.append($('<td />').attr({'class' : 'text-left'}).append(birthday));
													    var img = new Image(35,40);
														img.src = "data:image/png;base64,"+staff.photo;
													    tr.append($('<td />').attr({'class' : 'text-center'}).append(img));
													    tr.append($('<td />').attr({'class' : 'text-left'}).append(staff.email));
													    tr.append($('<td />').attr({'class' : 'text-left'}).append(staff.phone));
													    tr.append($('<td />').attr({'class' : 'text-left'}).append(staff.salary));
													    tr.append($('<td />').attr({'class' : 'text-center'}).append(staff.level));
														tr.append($('<td />').attr({'class' : 'text-left'}).append("<a href='javascript:void()' id='shownote' class='btn btn-info text-left' data-toggle='modal' data-target='#showNoteModal'><i class='fas fa-comment-dots'></i></a>"));
													    tr.append($('<td />').attr({'class' : 'text-left'}).append("<a href='javascript:void()' id='updateStaff' class='btn btn-warning text-left' data-toggle='modal' data-target='#updateModalCenter'><i class='fas fa-user-edit'></i></a>"));
													    tr.append($('<td />').attr({'class' : 'text-left'}).append("<a href='javascript:void()' id='deleteStaff' class='btn btn-danger text-left' data-toggle='modal' data-target='#deleteModal'><i class='fas fa-user-times'></i></a>"));
													    tr.append("<input type='hidden' id='staff_id' value= '"+ staff.staff_id +"'>");
													    tr.append("<input type='hidden' id='staff_note' value= '"+ staff.note +"' >");
													    tr.append("<input type='hidden' id='staff_name' value= '"+ staff.name +"' >"); 
														$('table tbody').append(tr);
													});
												}
											});	
										}
									   loadTable();
										
										$('.card select.custom-select').change(function () {
											loadTable();
										}); 	 
											 
										// action button
						 				$('.save').delegate('#saveStaff','click',function(){
											saveName.val("");
											saveBirthday.val("yyyy-MM-dd");
											saveImgFile.val("");
											saveImgDisplay.attr("src","${pageContext.request.contextPath}/resources/assets/images/exam.png");
											saveEmail.val("");
											savePhone.val("");
											saveSalary.val("");
											saveLevel.val("");
											saveNote.val("");
											saveDepart.val("");
											saveForm.find("input").removeClass("is-invalid");
											saveForm.find("select").removeClass("is-invalid");
											saveForm.find("input").removeClass("is-valid");
											saveForm.find("textarea").removeClass("is-valid");
											saveForm.find("select").removeClass("is-valid");
											usedEmail = true;
										}); 
											 
						 				
										$('table').delegate('#shownote','click',function(){
											var id = $(this).parent().parent().find('#staff_note').val();
											var name = $(this).parent().parent().find('#staff_name').val();
											$('#showNoteModal #note').text(id);
											$('#showNoteModal #name').text(name);
											$('#showNoteModal #noteName').text(" "); 
											$('#showNoteModal #deleteStaff').hide();
											
										});
										
										
										$('table').delegate('#updateStaff','click',function(){
											var id = $(this).parent().parent().find('#staff_id').val();
											updateForm.find("input").removeClass("is-invalid");
											updateForm.find("select").removeClass("is-invalid");
											updateForm.find("input").removeClass("is-valid");
											updateForm.find("textarea").removeClass("is-valid");
											updateForm.find("select").removeClass("is-valid");
											updateImgFile.val('');
											usedEmail = true;
											$.ajax({
												type: 'GET',
												url: '${pageContext.request.contextPath}/staff/update/'+id,
												success: function(staff){
													updateId.val(staff.staff_id);
													updateName.val(staff.name);
													updateGender.val(Number(staff.gender));
													updateBirthday.val($.datepicker.formatDate('yy-mm-dd',new Date(staff.birthday)));
													updateImgDisplay.attr("src","data:image/png;base64,"+staff.photo);
													updateEmail.val(staff.email);
													updatePhone.val(staff.phone);
													updateSalary.val(staff.salary);	
													updateLevel.val(staff.level);
													updateNote.val(staff.note);
													updateDepart.val(staff.depart_id);
												}
											});	
										});
										
										
										$('table').delegate('#deleteStaff','click',function(){
											var id = $(this).parent().parent().find('#staff_id').val();
											var name = $(this).parent().parent().find('#staff_name').val();
											$('#deleteModal #staffId').val(id);
											$('#deleteModal #staffName').val(name);
											$('#deleteModal #idEntity').text("<s:message code ='data.staffCode'/> :"+id); 
											$('#deleteModal #message').text("<s:message code ='data.fullname'/> : "+name);
										});   
										
										saveForm.submit(function(event) {
											    event.preventDefault();
											   	if(saveForm.valid()){
											   		var data = new FormData(saveForm[0]);
												    saveStaff(data);
											   	}
										});
										
										
										updateForm.submit(function(event) {
										    event.preventDefault();
										    if(updateForm.valid()){
											    var data = new FormData(updateForm[0]);
											    console.log(data);
											    updateStaff(data);
										    }
										});
										 
										
										function saveStaff(data){
											$.ajax({
												type : "POST",
												headers: {"X-CSRF-TOKEN": $("input[name=_csrf]").val()},
												url : "${pageContext.request.contextPath}/staff/save",
												data : data,
												enctype: 'multipart/form-data',
										        processData: false,
										        contentType: false,	
												success : function(data) {
													if(data.status==1){
														saveModal.modal('hide');
														messageTitle.text("<s:message code ='data.staffAdd'/>");
														messageType.text("<s:message code ='data.success'/>");
														message.text();
														messageModal.modal('show');
														loadTable();
													}else if(data.status==0) {
														usedEmail = false;
														saveForm.valid();
													} 
												}
											}); 
										}
										
										
										
										function updateStaff(data){
											console.log(data);
											$.ajax({
												type : "POST",
												headers: {"X-CSRF-TOKEN": $("input[name=_csrf]").val()},
												url : "${pageContext.request.contextPath}/staff/update",
												data : data,
												enctype: 'multipart/form-data',
										        processData: false,
										        contentType: false,	
												success : function(data) {
													if(data.status==1){
														updateModal.modal('hide');
														messageTitle.text("<s:message code ='data.staffUpdate'/>");
														messageType.text("<s:message code ='data.success'/>");
														message.text();
														messageModal.modal('show');
														loadTable();
													}else if(data.status==0) {
														usedEmail = false;
														updateForm.valid();
													} 
												},
												error: function(error) {//jqXHR, textStatus, errorThrown
													console.log(error.responseText);
													console.log(error.status);
											    } 
											}); 
										}
										 
										
										$("#formDelete").submit(function(e) {
										    e.preventDefault();
										    var Data = {};
										    Data["staff_id"] = $('#deleteModal #staffId').val();
										    $.ajax({
												type : "DELETE",
												headers: {"X-CSRF-TOKEN": $("input[name=_csrf]").val()},
												contentType : "application/json",
												url : "${pageContext.request.contextPath}/staff/delete",
												enctype: 'multipart/form-data',
												data : JSON.stringify(Data),
												dataType : 'json',
												success : function(data) {
													$('#deleteModal').modal('hide');
													messageTitle.text("<s:message code ='data.staffDelete'/>");
													if(data.status==1){
														messageType.text("<s:message code ='data.success'/>");
													}else{
														messageType.text("<s:message code ='data.fail'/>");
													}
													messageModal.modal('show');
													loadTable();
												}
											});   
										});
										
										$("#testJson").on("click",function(){
											
											var data = {
												"test1" : "1",
												"test2" : "2",
												"test3" : {
													"testObject" :"3",
													"testObject" :"2"
												},
												"test4" : [{
													"testObject1" :"1",
													"testObject2" :"2",
													"testObject3" :"3"
												}]
											}
											
											console.log(data);
											
											//var data = new FormData(updateForm[0]);
											
										/* 	 $.ajax({
													type : "POST",
													headers: {"X-CSRF-TOKEN": $("input[name=_csrf]").val()},
													contentType : "application/json",
													url : "${pageContext.request.contextPath}/staff/test",
													data : JSON.stringify(data),
													dataType : 'json',
											        processData: false,
													success : function(data) {
														console.log(data);
													}
												});   */
											 
											 $.ajax({ cache: false,
													 type : "POST",
													headers: {"X-CSRF-TOKEN": $("input[name=_csrf]").val()},
													contentType : "application/json",
													url : "${pageContext.request.contextPath}/staff/test",
													data : JSON.stringify(data),
													dataType : 'json',
											        processData: false,
												}).done(function (data) {
												    console.log(data)
												}).fail(function (jqXHR, textStatus) {
													console.log("fail");
												});
										});
		
									
								});
								   /* 	 function validateToSend(forms){ use for boostrap
								    var validation = Array.prototype.filter.call(forms, function(form) {
									     if (form.checkValidity() === false) {
									        	event.stopPropagation();
									        	 console.log(form);
									        	 form.find(".invalid-tooltip").show();
									     } else if (form.checkValidity() === true) {
								        	 sendData(forms[0]);	 
								     	 }
									     form.classList.add('was-validated'); 
									}, false);
							} */
							</script>
						
	</div>
	
				
</main>
