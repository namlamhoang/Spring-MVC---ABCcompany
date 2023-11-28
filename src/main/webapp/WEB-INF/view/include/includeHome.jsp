<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>    
        <main class="content-wrapper">
        
          <div class="mdc-layout-grid">
            <div class="mdc-layout-grid__inner">

              <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-3-desktop mdc-layout-grid__cell--span-4-tablet">
                <div class="mdc-card info-card info-card--success">
                  <div class="card-inner">
                    <h5 class="card-title"><s:message code="data.totalStaff"/></h5>
                    <h5 class="font-weight-light pb-2 mb-1 border-bottom">
                    <f:formatNumber value="${totalStaff}"  type="number" minFractionDigits = "0" ></f:formatNumber></h5>
                 
                    <div class="card-icon-wrapper">
                     <i class="fas fa-users"></i>
                    </div>
                  </div>
                </div>
              </div>
              <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-3-desktop mdc-layout-grid__cell--span-4-tablet">
                <div class="mdc-card info-card info-card--danger">
                  <div class="card-inner">
                    <h5 class="card-title"><s:message code="data.totalSalary"/></h5>
                    <h5 class="font-weight-light pb-2 mb-1 border-bottom">
                    <f:formatNumber value=" ${totalSalary}"  type="number" minFractionDigits = "0" /> VNĐ</h5>
                    <p class="tx-12 text-muted"><f:formatNumber value="${totalSalary/totalStaff}"  type="number" maxFractionDigits="0" /> VNĐ / PEOPLE</p>
                    <div class="card-icon-wrapper">
                     <i class="fas fa-dollar-sign"></i>
                    </div>
                  </div>
                </div>
              </div>
              <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-3-desktop mdc-layout-grid__cell--span-4-tablet">
                <div class="mdc-card info-card info-card--primary">
                  <div class="card-inner">
                    <h5 class="card-title"><s:message code="data.totalAchieve"/></h5>
                    <h5 class="font-weight-light pb-2 mb-1 border-bottom">${totalAchievement}</h5>
                    <p class="tx-12 text-muted">
                    <f:formatNumber value="${percentAchievement}" type="percent"></f:formatNumber>  <s:message code="data.topRecord"/></p>
                    <div class="card-icon-wrapper">
                   	 <i class="fas fa-user-check"></i>
                      
                    </div>
                  </div>
                </div>
              </div>
              <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-3-desktop mdc-layout-grid__cell--span-4-tablet">
              
                <div class="mdc-card info-card info-card--info">
                  <div class="card-inner">
                    <h5 class="card-title"><s:message code="data.totalDiscipline"/></h5>
                    <h5 class="font-weight-light pb-2 mb-1 border-bottom">${totalDiscipline}</h5>
                    <p class="tx-12 text-muted">
                    <f:formatNumber value="${percentDiscipline}" type="percent"></f:formatNumber> <s:message code="data.topRecord"/></p>
                    <div class="card-icon-wrapper">
                      <i class="fas fa-user-times"></i>
                    </div>
                  </div>
                </div>
              </div>
              <!-- statistical -->
              <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
              
                <div class="mdc-card">
                
                  <div class="d-flex justify-content-between">
                    
                    <div>
                        <i class="material-icons refresh-icon">refresh</i>
                        <i class="material-icons options-icon ml-2">more_vert</i>
                    </div>
                  </div>
                  
                  
                  
                  
                  
                  <div id="charttable" class="mdc-layout-grid__inner mt-2">
                  
                  	 <div class="mdc-layout-grid__cell mdc-layout-grid__cell--span-4 mdc-layout-grid__cell--span-8-tablet mdc-layout-grid__cell--span-8-desktop">
                <div class="mdc-card"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                  <h6 class=" text-primary"><i class="fas fa-chart-line" style='font-size:30px;'></i>&nbsp;&nbsp; <span id="titlechart" class="card-title "></span></h6>
                 
                  <canvas id="areaChart" width="465" height="231" class="chartjs-render-monitor" style="display: block; height: 185px; width: 372px;"></canvas>
                </div>
              </div>
              
             
              
              <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-4 mdc-layout-grid__cell--span-8-tablet">
                <div class="mdc-card"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                 <div class="row"> <h1 class="text-warning"><i class="fas fa-info-circle"></i></h1> &nbsp;<h6 id="titlepiechart" class="card-title text-info mt-2"></h6> </div>
                  <canvas id="pieChart" width="422" height="211" class="chartjs-render-monitor" style="display: block; height: 250px; width: 500px;"></canvas>
                </div>
              </div>
                  	
                  
                    <div class="mdc-layout-grid__cell mdc-layout-grid__cell--span-12 mdc-layout-grid__cell--span-12-tablet">
                    	<div class="card">
								<div class="card-header bg-primary text-white">
									<h5 class="card-title" > <i class="fas fa-thumbs-up"></i><s:message code="data.topTable"/></h5>
								</div>
	                    		<div class="card-body">
			                        <div class="table-responsive">
			                        
			                          <table class="table dashboard-table">
			                          	<thead>
											<tr class="table-primary">
												<td class="text-center text-danger"><s:message code="data.statistical"/></td>
												<td class="text-left"><s:message code="data.fullname"/></td>
												<td class="text-left"><s:message code="data.images"/></td>
												<td class="text-left text-success"><s:message code="data.topAchieve"/></td>
												<td class="text-left text-danger"><s:message code="data.topDiscipline"/></td>
												<td class="text-left text-primary"><s:message code="data.topRecord"/></td>
												<td class="text-left"><s:message code="data.departName"/></td>
											</tr>
										</thead>
			                            <tbody>
			                      
			                            <c:forEach var="rank" items="${listTop10}" varStatus="loop" begin="0" end ="9">
			                            		<tr>
			                            			<td class="text-center">${loop.index+1}</td>
					                                <td class="text-left"> ${rank[1]}</td>
													<td class="text-left"><img src= "data:image/png;base64,${Base64.getEncoder().encodeToString(rank[2])}" style="width:35px;height:40px"/></td>
													<td class="text-left"> ${rank[4]}</td>
													<td class="text-left"> ${rank[5]}</td>
													<td class="text-left"> ${rank[6]}</td>
													<c:forEach var="depart" items="${listDepart}" >
														<c:if test="${rank[7] == depart.depart_id}">
															<td class="text-left">${depart.name}</td>
														</c:if>
													</c:forEach>
					                             </tr>
			                            </c:forEach> 
			                            </tbody>
			                          </table>
			                        </div>	
			                	</div>
                        </div>
                    </div>

              
              </div>
				</div>
          </div>
          </div>
         
        </main>
        
 				<script type="text/javascript">
 				
 					$(function () {
 						
 					  /* ChartJS
 					   * -------
 					   * Data and config for chartjs
 					   */
 					  
 					  var data = {
 					    labels: [],
 					    datasets: [{
 					      label: 'Achievement - Discipline ',
 					      data: [],
 					      backgroundColor: [
 					        'rgba(255, 66, 15, 0.7)',
 					        'rgba(0, 187, 221, 0.7)',
 					        'rgba(255, 193, 7, 0.7)',
 					        'rgba(0, 182, 122, 0.7)',
 					        'rgba(153, 102, 255, 0.7)',
 					        'rgba(255, 159, 64, 0.7)'
 					      ],
 					      borderColor: [
 					        'rgba(255, 66, 15,1)',
 					        'rgba(0, 187, 221, 1)',
 					        'rgba(255, 193, 7, 1)',
 					        'rgba(0, 182, 122, 1)',
 					        'rgba(153, 102, 255, 1)',
 					        'rgba(255, 159, 64, 1)'
 					      ],
 					      borderWidth: 1,
 					      fill: false
 					    }]
 					  };
 						
 					 
 					 
 					  var dataDark = {
 					    labels: ["2012", "2013", "2014", "2015", "2016", "2017"],
 					    datasets: [{
 					      label: '# of Votes',
 					      data: [10, 19, 3, 5, 2, 3],
 					      backgroundColor: [
 					        'rgba(255, 66, 15, 0.7)',
 					        'rgba(0, 187, 221, 0.7)',
 					        'rgba(255, 193, 7, 0.7)',
 					        'rgba(0, 182, 122, 0.7)',
 					        'rgba(153, 102, 255, 0.7)',
 					        'rgba(255, 159, 64, 0.7)'
 					      ],
 					      borderColor: [
 					        'rgba(255, 66, 15,1)',
 					        'rgba(0, 187, 221, 1)',
 					        'rgba(255, 193, 7, 1)',
 					        'rgba(0, 182, 122, 1)',
 					        'rgba(153, 102, 255, 1)',
 					        'rgba(255, 159, 64, 1)'
 					      ],
 					      borderWidth: 1,
 					      fill: false
 					    }]
 					  };
 					 
 					  var options = {
 					    scales: {
 					      yAxes: [{
 					        ticks: {
 					          beginAtZero: true
 					        }
 					      }]
 					    },
 					    legend: {
 					      display: false
 					    },
 					    elements: {
 					      point: {
 					        radius: 0
 					      }
 					    }

 					  };
 					  var optionsDark = {
 					    scales: {
 					      yAxes: [{
 					        ticks: {
 					          beginAtZero: true
 					        },
 					        gridLines: {
 					          color: '#322f2f',
 					          zeroLineColor: '#322f2f'
 					        }
 					      }],
 					      xAxes: [{
 					        ticks: {
 					          beginAtZero: true
 					        },
 					        gridLines: {
 					          color: '#322f2f',
 					        }
 					      }],
 					    },
 					    legend: {
 					      display: false
 					    },
 					    elements: {
 					      point: {
 					        radius: 0
 					      }
 					    }

 					  };
 					  var doughnutPieData = {
 					    datasets: [{
 					      data: [],
 					      backgroundColor: [
 					    	 'rgba(0, 187, 221, 0.8)',
 					        'rgba(255, 66, 15, 0.8)',
 					       'rgba(0, 182, 122, 0.8)',
 					        'rgba(255, 193, 7, 0.8)',
 					        'rgba(153, 102, 255, 0.8)',
 					        'rgba(255, 159, 64, 0.8)'
 					      ],
 					      borderColor: [
 					    	 'rgba(0, 187, 221, 1)',
 					        'rgba(255, 66, 15,1)',
 					       'rgba(0, 182, 122, 1)',
 					        'rgba(255, 193, 7, 1)',
 					        'rgba(153, 102, 255, 1)',
 					        'rgba(255, 159, 64, 1)'
 					      ],
 					    }],

 					    // These labels appear in the legend and in the tooltips when hovering different arcs
 					    labels: [
 					      'Achievement',
 					      'Discipline',
 					    ]
 					  };
 					  
 					
					
					
 					  var doughnutPieOptions = {
 					    responsive: true,
 					    animation: {
 					      animateScale: true,
 					      animateRotate: true
 					    }
 					  };
 					 
 					 var areaData = {
 	 					    labels: [],
 	 					    datasets: [{
 	 					      label: " <s:message code="data.topRecord"/> ",
 	 					      data: [],
 	 					      backgroundColor: [
 	 					        'rgba(66,255, 15, 0.4)',
 	 					        'rgba(0, 187, 221, 0.4)',
 	 					        'rgba(255, 193, 7, 0.4)',
 	 					        'rgba(0, 182, 122, 0.4)',
 	 					        'rgba(153, 102, 255, 0.4)',
 	 					        'rgba(255, 159, 64, 0.4)'
 	 					      ],
 	 					      borderColor: [
 	 					        'rgba(66,255, 15,1)',
 	 					        'rgba(0, 187, 221, 1)',
 	 					        'rgba(255, 193, 7, 1)',
 	 					        'rgba(0, 182, 122, 1)',
 	 					        'rgba(153, 102, 255, 1)',
 	 					        'rgba(255, 159, 64, 1)'
 	 					      ],
 	 					      borderWidth: 1,
 	 					      fill: true, // 3: no fill
 	 					    },
 						    
 						  	{
 		 					      label: " <s:message code="data.recordAchieve"/> ",
 		 					      data: [],
 		 					   backgroundColor: [
 		 					        'rgba(15, 66, 255, 0.4)',
 		 					        'rgba(0, 187, 221, 0.4)',
 		 					        'rgba(255, 193, 7, 0.4)',
 		 					        'rgba(0, 182, 122, 0.4)',
 		 					        'rgba(153, 102, 255, 0.4)',
 		 					        'rgba(255, 159, 64, 0.4)'
 		 					      ],
 		 					      borderColor: [
 		 					        'rgba(15, 66, 255,1)',
 		 					        'rgba(0, 187, 221, 1)',
 		 					        'rgba(255, 193, 7, 1)',
 		 					        'rgba(0, 182, 122, 1)',
 		 					        'rgba(153, 102, 255, 1)',
 		 					        'rgba(255, 159, 64, 1)'
 		 					      ],
 		 					      borderWidth: 1,
 		 					      fill: true, // 3: no fill
 		 					},
 		 						
 		 					{
 		 					      label: " <s:message code="data.recordDiscipline"/> ",
 		 					      data: [],
 		 					   backgroundColor: [
 		 					        'rgba(255, 66, 15, 0.4)',
 		 					        'rgba(0, 187, 221, 0.4)',
 		 					        'rgba(255, 193, 7, 0.4)',
 		 					        'rgba(0, 182, 122, 0.4)',
 		 					        'rgba(153, 102, 255, 0.4)',
 		 					        'rgba(255, 159, 64, 0.4)'
 		 					      ],
 		 					      borderColor: [
 		 					        'rgba(255, 66, 15,1)',
 		 					        'rgba(0, 187, 221, 1)',
 		 					        'rgba(255, 193, 7, 1)',
 		 					        'rgba(0, 182, 122, 1)',
 		 					        'rgba(153, 102, 255, 1)',
 		 					        'rgba(255, 159, 64, 1)'
 		 					      ],
 		 					      borderWidth: 1,
 		 					      fill: true, // 3: no fill
 		 					}
 	 					    ]
 	 					  };
 				 		
 					 
 				
				 	
 					  var areaDataDark = {
 					    labels: ["2013", "2014", "2015", "2016", "2017"],
 					    datasets: [{
 					      label: '# of Votes',
 					      data: [12, 19, 3, 5, 2, 3],
 					      backgroundColor: [
 					        'rgba(255, 66, 15, 0.4)',
 					        'rgba(0, 187, 221, 0.4)',
 					        'rgba(255, 193, 7, 0.4)',
 					        'rgba(0, 182, 122, 0.4)',
 					        'rgba(153, 102, 255, 0.4)',
 					        'rgba(255, 159, 64, 0.4)'
 					      ],
 					      borderColor: [
 					        'rgba(255, 66, 15,1)',
 					        'rgba(0, 187, 221, 1)',
 					        'rgba(255, 193, 7, 1)',
 					        'rgba(0, 182, 122, 1)',
 					        'rgba(153, 102, 255, 1)',
 					        'rgba(255, 159, 64, 1)'
 					      ],
 					      borderWidth: 1,
 					      fill: true, // 3: no fill
 					    }]
 					  };

 					  var areaOptions = {
 					    plugins: {
 					      filler: {
 					        propagate: true
 					      }
 					    }
 					  }

 					  var areaOptionsDark = {
 					    scales: {
 					      yAxes: [{
 					        ticks: {
 					          beginAtZero: true
 					        },
 					        gridLines: {
 					          color: '#322f2f',
 					          zeroLineColor: '#322f2f'
 					        }
 					      }],
 					      xAxes: [{
 					        ticks: {
 					          beginAtZero: true
 					        },
 					        gridLines: {
 					          color: '#322f2f',
 					        }
 					      }],
 					    },
 					    plugins: {
 					      filler: {
 					        propagate: true
 					      }
 					    }
 					  }
						
 					 
 					  var multiAreaData = {
 					    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
 					    datasets: [{
 					      label: 'Facebook',
 					      data: [8, 11, 13, 15, 12, 13, 16, 15, 13, 19, 11, 14],
 					      borderColor: ['rgba(255, 66, 15, 0.5)'],
 					      backgroundColor: ['rgba(255, 66, 15, 0.5)'],
 					      borderWidth: 1,
 					      fill: true
 					    },
 					    {
 					      label: 'Twitter',
 					      data: [7, 17, 12, 16, 14, 18, 16, 12, 15, 11, 13, 9],
 					      borderColor: ['rgba(0, 187, 221, 0.5)'],
 					      backgroundColor: ['rgba(0, 187, 221, 0.5)'],
 					      borderWidth: 1,
 					      fill: true
 					    },
 					    {
 					      label: 'Linkedin',
 					      data: [6, 14, 16, 20, 12, 18, 15, 12, 17, 19, 15, 11],
 					      borderColor: ['rgba(255, 193, 7, 0.5)'],
 					      backgroundColor: ['rgba(255, 193, 7, 0.5)'],
 					      borderWidth: 1,
 					      fill: true
 					    }
 					    ]
 					  };

 					  var multiAreaOptions = {
 					    plugins: {
 					      filler: {
 					        propagate: true
 					      }
 					    },
 					    elements: {
 					      point: {
 					        radius: 0
 					      }
 					    },
 					    scales: {
 					      xAxes: [{
 					        gridLines: {
 					          display: false
 					        }
 					      }],
 					      yAxes: [{
 					        gridLines: {
 					          display: false
 					        }
 					      }]
 					    }
 					  }

 					  var scatterChartData = {
 					    datasets: [{
 					      label: 'First Dataset',
 					      data: [{
 					        x: -10,
 					        y: 0
 					      },
 					      {
 					        x: 0,
 					        y: 3
 					      },
 					      {
 					        x: -25,
 					        y: 5
 					      },
 					      {
 					        x: 40,
 					        y: 5
 					      }
 					      ],
 					      backgroundColor: [
 					        'rgba(255, 66, 15, 0.7)'
 					      ],
 					      borderColor: [
 					        'rgba(255, 66, 15,1)'
 					      ],
 					      borderWidth: 1
 					    },
 					    {
 					      label: 'Second Dataset',
 					      data: [{
 					        x: 10,
 					        y: 5
 					      },
 					      {
 					        x: 20,
 					        y: -30
 					      },
 					      {
 					        x: -25,
 					        y: 15
 					      },
 					      {
 					        x: -10,
 					        y: 5
 					      }
 					      ],
 					      backgroundColor: [
 					        'rgba(0, 187, 221, 0.7)',
 					      ],
 					      borderColor: [
 					        'rgba(0, 187, 221, 1)',
 					      ],
 					      borderWidth: 1
 					    }
 					    ]
 					  }

 					  var scatterChartDataDark = {
 					    datasets: [{
 					      label: 'First Dataset',
 					      data: [{
 					        x: -10,
 					        y: 0
 					      },
 					      {
 					        x: 0,
 					        y: 3
 					      },
 					      {
 					        x: -25,
 					        y: 5
 					      },
 					      {
 					        x: 40,
 					        y: 5
 					      }
 					      ],
 					      backgroundColor: [
 					        'rgba(255, 66, 15, 0.7)'
 					      ],
 					      borderColor: [
 					        'rgba(255, 66, 15,1)'
 					      ],
 					      borderWidth: 1
 					    },
 					    {
 					      label: 'Second Dataset',
 					      data: [{
 					        x: 10,
 					        y: 5
 					      },
 					      {
 					        x: 20,
 					        y: -30
 					      },
 					      {
 					        x: -25,
 					        y: 15
 					      },
 					      {
 					        x: -10,
 					        y: 5
 					      }
 					      ],
 					      backgroundColor: [
 					        'rgba(0, 187, 221, 0.7)',
 					      ],
 					      borderColor: [
 					        'rgba(0, 187, 221, 1)',
 					      ],
 					      borderWidth: 1
 					    }
 					    ]
 					  }

 					  var scatterChartOptions = {
 					    scales: {
 					      xAxes: [{
 					        type: 'linear',
 					        position: 'bottom'
 					      }]
 					    }
 					  }

 					  var scatterChartOptionsDark = {
 					    scales: {
 					      xAxes: [{
 					        type: 'linear',
 					        position: 'bottom',
 					        gridLines: {
 					          color: '#322f2f',
 					          zeroLineColor: '#322f2f'
 					        }
 					      }],
 					      yAxes: [{
 					        gridLines: {
 					          color: '#322f2f',
 					          zeroLineColor: '#322f2f'
 					        }
 					      }]
 					    }
 					  }
 					  
 					  
 					  
 					  
 					  
 					  
 					  // Get context with jQuery - using jQuery's .get() method.
 					  if ($("#barChart").length) {
 					    var barChartCanvas = $("#barChart").get(0).getContext("2d");
 					    // This will get the first returned node in the jQuery collection.
 					    var barChart = new Chart(barChartCanvas, {
 					      type: 'bar',
 					      data: data,
 					      options: options
 					    });
 					  }

 					  if ($("#barChartDark").length) {
 					    var barChartCanvasDark = $("#barChartDark").get(0).getContext("2d");
 					    // This will get the first returned node in the jQuery collection.
 					    var barChartDark = new Chart(barChartCanvasDark, {
 					      type: 'bar',
 					      data: dataDark,
 					      options: optionsDark
 					    });
 					  }

 					  if ($("#lineChart").length) {
 					    var lineChartCanvas = $("#lineChart").get(0).getContext("2d");
 					    var lineChart = new Chart(lineChartCanvas, {
 					      type: 'line',
 					      data: data,
 					      options: options
 					    });
 					  }

 					  if ($("#lineChartDark").length) {
 					    var lineChartCanvasDark = $("#lineChartDark").get(0).getContext("2d");
 					    var lineChartDark = new Chart(lineChartCanvasDark, {
 					      type: 'line',
 					      data: dataDark,
 					      options: optionsDark
 					    });
 					  }

 					  if ($("#linechart-multi").length) {
 					    var multiLineCanvas = $("#linechart-multi").get(0).getContext("2d");
 					    var lineChart = new Chart(multiLineCanvas, {
 					      type: 'line',
 					      data: multiLineData,
 					      options: options
 					    });
 					  }

 					  if ($("#areachart-multi").length) {
 					    var multiAreaCanvas = $("#areachart-multi").get(0).getContext("2d");
 					    var multiAreaChart = new Chart(multiAreaCanvas, {
 					      type: 'line',
 					      data: multiAreaData,
 					      options: multiAreaOptions
 					    });
 					  }

 					  if ($("#doughnutChart").length) {
 					    var doughnutChartCanvas = $("#doughnutChart").get(0).getContext("2d");
 					    var doughnutChart = new Chart(doughnutChartCanvas, {
 					      type: 'doughnut',
 					      data: doughnutPieData,
 					      options: doughnutPieOptions
 					    });
 					  }

 					  if ($("#pieChart").length) {
 					    var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
 					    var pieChart = new Chart(pieChartCanvas, {
 					      type: 'pie',
 					      data: doughnutPieData,
 					      options: doughnutPieOptions
 					    });
 					  }
						
 					  function areachart() {
 						 if ($("#areaChart").length) {
 	 					    var areaChartCanvas = $("#areaChart").get(0).getContext("2d");
 	 					    var areaChart = new Chart(areaChartCanvas, {
 	 					      type: 'line',
 	 					      data: areaData,
 	 					      options: areaOptions
 	 					    });
 	 					  }
 					  }
 					  
 					  

 					  if ($("#areaChartDark").length) {
 					    var areaChartCanvas = $("#areaChartDark").get(0).getContext("2d");
 					    var areaChart = new Chart(areaChartCanvas, {
 					      type: 'line',
 					      data: areaDataDark,
 					      options: areaOptionsDark
 					    });
 					  }

 					  if ($("#scatterChart").length) {
 					    var scatterChartCanvas = $("#scatterChart").get(0).getContext("2d");
 					    var scatterChart = new Chart(scatterChartCanvas, {
 					      type: 'scatter',
 					      data: scatterChartData,
 					      options: scatterChartOptions
 					    });
 					  }

 					  if ($("#scatterChartDark").length) {
 					    var scatterChartCanvas = $("#scatterChartDark").get(0).getContext("2d");
 					    var scatterChart = new Chart(scatterChartCanvas, {
 					      type: 'scatter',
 					      data: scatterChartDataDark,
 					      options: scatterChartOptionsDark
 					    });
 					  }

 					  if ($("#browserTrafficChart").length) {
 					    var doughnutChartCanvas = $("#browserTrafficChart").get(0).getContext("2d");
 					    var doughnutChart = new Chart(doughnutChartCanvas, {
 					      type: 'doughnut',
 					      data: browserTrafficData,
 					      options: doughnutPieOptions
 					    });
 					  }
 					 	
 					  // custom script
 					  
 					  var getUrlParameter = function getUrlParameter(sParam) {
 						    var sPageURL = window.location.search.substring(1),
 						        sURLVariables = sPageURL.split('&'),
 						        sParameterName,
 						        i;

 						    for (i = 0; i < sURLVariables.length; i++) {
 						        sParameterName = sURLVariables[i].split('=');

 						        if (sParameterName[0] === sParam) {
 						            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
 						        }
 						    }
 						};
 					  
 	 					function loadpiechart() {
 	 						var m =new Date().getMonth();
 		  						<c:forEach var="chart" items="${listthisyear}" varStatus="loop" >
 		 					 	doughnutPieData.datasets[0].data[0] = ${chart[2]};	
 		 					 	doughnutPieData.datasets[0].data[1] = ${chart[1]};
 		 						</c:forEach>   
 		 						var titlepiechart = document.getElementById('titlepiechart');
 		 						titlepiechart.innerHTML = '<s:message code ="data.pieChart"/> ('+ m + "-"+ new Date().getFullYear() +" )" ;
 		  				  }
 		  			 		 
 						 loadpiechart();
 		 					
 						
 						 function refresh(){
 							 	areaData.labels.length = 0;
 								areaData.datasets[0].data.length = 0;
 								areaData.datasets[1].data.length = 0;
 								areaData.datasets[2].data.length = 0;
 						 }
 						
 						function loadyearchart(){
 							refresh();
 							<c:forEach var="chart" items="${listallyear}" varStatus="loop" >
 		 					areaData.labels[${loop.index}] = ${chart[0]};	
 		 					areaData.datasets[0].data[${loop.index}] = ${chart[3]};
 		 			 		areaData.datasets[1].data[${loop.index}] = ${chart[2]};
 		 					areaData.datasets[2].data[${loop.index}] = ${chart[1]}; 
 						</c:forEach> 
 							areachart();
 							var titilechart = document.getElementById("titlechart");
 							titlechart.innerHTML = '<s:message code ="data.yearChart"/> ('+areaData.labels[0]+'-'+areaData.labels[areaData.labels.length-1]+')';
 						}
 						
 	 					
 						function loadmonthchart(){
 							refresh();
 							for (var i = 1; i <= 12; i++) {
 								areaData.labels[i-1] = i;
 								areaData.datasets[0].data[i-1] = 0;
 			 			 		areaData.datasets[1].data[i-1] = 0;
 			 					areaData.datasets[2].data[i-1] = 0; 
 							}
 						 	<c:forEach var="chart" items="${listallmonth}" varStatus="loop" >
 		 					areaData.datasets[0].data[${chart[0]}-1] = ${chart[3]};
 		 			 		areaData.datasets[1].data[${chart[0]}-1] = ${chart[2]};
 		 					areaData.datasets[2].data[${chart[0]}-1] = ${chart[1]}; 
 						</c:forEach>   
 							areachart();
 							var titilechart = document.getElementById("titlechart");
 							titlechart.innerHTML = '<s:message code ="data.monthChart"/> ( ' +new Date().getFullYear() +')';
 						}
 						
 						function scrollMonth(){
 							if($(location).attr('pathname').includes("index")){
 					 			$('html, body').animate({scrollTop:$("#charttable").position().top - 75} , 'slow');
 					 			
 					 		}
 						}
 						
 						function scrollYear(){
 							if($(location).attr('pathname').includes("index")){
 					 			$('html, body').animate({scrollTop:$("#charttable").position().top - 75}, 'slow');
 					 			
 					 		}
 						}
 						
 					 	$('aside').delegate('#monthstatistic','click',function(){
 					 		scrollMonth();
 							loadmonthchart();
 						}); 
 					 	
 					 	$('aside').delegate('#yearstatistic','click',function(){
 					 		scrollYear();
 					 		loadyearchart();
 						}); 
 					 	
 					 	
 					 	
 					 	$.urlParam = function(name){
 					 	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
 					 	    return results[1] || 0;
 					 	}
 					 	
 					 	function loadPage(){
 					 		console.log(getUrlParameter('s'))
 					 		if(getUrlParameter('s') == null){
 					 			loadyearchart();
 					 		}else if(getUrlParameter('s')==="y"){
 								scrollYear();
 								loadyearchart();
 							}else if(getUrlParameter('s')==="m" || getUrlParameter('s') != null){
 								scrollMonth();
 								loadmonthchart();
 							}
 						}

 						loadPage();	
 					
 					});
					</script>