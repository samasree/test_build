<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.chatak.pg.util.Constants"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ipsidy Acquirer Admin</title>
<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link href="../css/jquery.datetimepicker.css" rel="stylesheet"
	type="text/css" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!--Body Wrapper block Start -->
	<div id="wrapper">
		<!--Container block Start -->
		<div class="container-fluid">
			<!--Header Block Start -->
			<!--Header Block End -->
			<!--Navigation Block Start -->
			<%-- <jsp:include page="header.jsp"></jsp:include> --%>
			<%@include file="navigation-panel.jsp"%>
			<!--Navigation Block Start -->
			<!--Article Block Start-->
			<article>
				<div class="col-xs-12 content-wrapper">
					<!-- Breadcrumb start -->
					<div class="breadCrumb">
						<span class="breadcrumb-text"><spring:message code="reports.label.reports"/></span>
						<span class="glyphicon glyphicon-play icon-font-size"></span>
						<span class="breadcrumb-text">Global System Reports</span>
						<span class="glyphicon glyphicon-play icon-font-size"></span>
						<span class="breadcrumb-text">Virtual Account Fee Log</span>
					</div>
					<!-- Breadcrumb End -->
					<!-- Tab Buttons Start -->
					<!-- <div class="tab-header-container-first active-background">
						<a href="merchant-search">Specific User</a>
					</div> -->
					<!-- Tab Buttons End -->
					<!-- Content Block Start -->
					<div class="col-sm-12">
						<!--Success and Failure Message Start-->
						<div class="col-xs-12">
							<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
								<span class="red-error" style="font-size: 13px;">&nbsp;${error }</span>
								<span class="green-error">&nbsp;${sucess }</span>
							</div>
						</div>
						<form:form action="downloadVirtualFeeReport" name="downloadReport" method="post">
							<input type="hidden" id="downloadPageNumberId" name="downLoadPageNumber" /> 
							<input type="hidden" id="downloadTypeId" name="downloadType" /> 
							<input type="hidden" name="CSRFToken" value="${tokenval}">
							<!-- <input type="hidden" id="downloadAllRecords" name="downloadAllRecords" /> -->
						</form:form>
						<form:form action="showVirtualFeeLogReport" name="showVirtualFeeLogReport" method="post">
							<input type="hidden" id="fromDate" name="fromDate" />
							<input type="hidden" id="toDate" name="toDate" />
							<input type="hidden" name="CSRFToken" value="${tokenval}">
						</form:form>
						<!-- Content Block End -->
						<!-- Search Table Block Start -->
					<div id="showDates">
									<fieldset class="col-sm-12">
										<label data-toggle="tooltip" data-placement="top" title="">Select Date Range :</label>
									</fieldset>
									<fieldset class="col-sm-3">
										<label data-toggle="tooltip" data-placement="top" title="">From Date<span class="required-field">*</span></label>
										<div class="input-group focus-field">
											<input name="" id="transFromDate" onblur="return clientValidation('transFromDate', 'startDate','transFromDateErrorDiv');"
												class="form-control effectiveDate" />
											<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
										</div>
										<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
											<span class="red-error" id="transFromDateErrorDiv">&nbsp;</span>
										</div>
									</fieldset>
									
									<fieldset class="col-sm-3">
										<label data-toggle="tooltip" data-placement="top" title="">To Date<span class="required-field">*</span></label>
										<div class="input-group focus-field">
											<input name="" class="form-control effectiveDate" id="transToDate"
											onblur="return clientValidation('transToDate', 'endDate','transToDateErrorDiv');" />
											<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
										</div>
										<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
											<span class="red-error" id="transToDateErrorDiv">&nbsp;</span>
										</div>
									</fieldset>
									
									<div class="col-sm-10 form-action-buttons" style="width: 100%;">
								<div class="col-sm-5"></div>
								<div class="col-sm-7">
									<!-- <input type="button" class="form-control button pull-right"
										value="Search">  -->
										<a type="button" onclick="submitVirtualFeeLogDateRange()" class="form-control button pull-right"><spring:message code="reports.label.generatebutton"/></a>
										<a type="button" href="home" class="form-control button pull-right"><spring:message code="reports.label.backbutton"/></a>
								</div>
							</div>
					</div>

						<div class="search-results-table table-scroll" id="checkb" style="display: none;">
							<table id="serviceResults" class="table table-striped table-bordered table-responsive table-condensed tablesorter">
								<thead>
									<tr>
										<th style="width: 109px;"><spring:message code="reports.label.transactions.dateortime"/></th>
										<th style="width: 83px;"><spring:message code="reports.label.balancereports.manualtransactions.transactionID"/></th>
										<th style="width: 96px;"><spring:message code="show-dynamic-MDR-edit.label.transactiontype"/></th>
										<!-- <th style="width: 101px;">Merchant Code</th> -->
										<th style="width: 101px;"><spring:message code="pending-merchant-show-remaining.label.companyname"/></th>
										<th style="width: 72px;">Txn Amount</th>
										<th style="width: 79px;">Merchant Fee</th>
										<th style="width: 65px;">Chatak Fee</th>
										<th style="width: 108px;">Issuance Fee Txn ID</th>
										<th style="width: 100px;">Issuance Message</th>
										<th style="width: 89px;"><spring:message code="reports.label.transactions.status"/></th>
									</tr>
								</thead>
								<c:choose>
									<c:when test="${!(fn:length(virtualFeeLogReportList) eq 0) }">
										<c:forEach items="${virtualFeeLogReportList}" var="virtualFeeLog">
											<tr data-txn-obj='${virtualFeeLog.txnJsonString}'>
												<td>${virtualFeeLog.dateTime }</td>
												<td><span class="txn-id">${virtualFeeLog.transactionId }</span></td>
												<td>${virtualFeeLog.transactionType }</td>
												<%-- <td>${virtualFeeLog.merchantCode }</td> --%>
												<td>${virtualFeeLog.companyName }</td>
												<td>${virtualFeeLog.amount }</td>
												<td>${virtualFeeLog.fee }</td>
												<td>${virtualFeeLog.chatakFee }</td>
												<c:choose>
													<c:when test="${(virtualFeeLog.issuanceFeeTxnId) ne null}">
														<td>${virtualFeeLog.issuanceFeeTxnId }</td>
													</c:when>
													<c:otherwise>
														<td>NA</td>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${(virtualFeeLog.description) ne null}">
														<td><div class="feeDescDiv">${virtualFeeLog.description }</div></td>
													</c:when>
													<c:otherwise>
														<td>NA</td>
													</c:otherwise>
												</c:choose>
												<td>${virtualFeeLog.status }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="12" style="color: red;"><spring:message code="reports.label.balancereports.manualtransactions.notransactionsfound"/></td>
										</tr>
									</c:otherwise>
								</c:choose>
								</table>
								<table class="table table-striped table-bordered table-condensed">
								<c:if test="${ !(fn:length(virtualFeeLogReportList) eq 0)}">
									<tr class="table-footer-main">
										<td colspan="14" class="search-table-header-column">
											<div class="col-sm-12">
												<div class="col-sm-3">
													<div class="btn-toolbar" role="toolbar">
														<div class="btn-group custom-table-footer-button">
															<a href="javascript:downloadReport('${portalListPageNumber}', '<%=Constants.XLS_FILE_FORMAT%>')">
																<button type="button" class="btn btn-default">
																	<img src="../images/excel.png">
																</button>
															</a>
															<a href="javascript:downloadReport('${portalListPageNumber}', '<%=Constants.PDF_FILE_FORMAT%>')">
																<button type="button" class="btn btn-default">
																	<img src="../images/pdf.png">
																</button>
															</a>
															<!-- <a>
															<input type="checkbox" class="autoCheck check" id="totalRecordsDownload">
															Download All 
														</a> -->
														</div>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</c:if>
							</table>
							<div class="col-sm-8 form-action-buttons" style="width: 96%;">
								<div class="col-sm-5"></div>
								<div class="col-sm-7">
									<a type="button" href="showVirtualFeeLogReports" class="form-control button pull-right"><spring:message code="reports.label.backbutton"/></a>
								</div>
							</div>
						</div>
					</div>
					<!-- Search Table Block End -->
				</div>
				<div id="txn-popup" class="txn-popup"></div>
			</article>
			<!--Article Block End-->
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
		<!--Container block End -->
	</div>
	<!--Body Wrapper block End -->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../js/bootstrap.min.js"></script>
<script src="../js/utils.js"></script>
	<script src="../js/sortable.js"></script>
	<script src="../js/validation.js"></script>
	<script src="../js/jquery.datetimepicker.js"></script>
	<script src="../js/reports.js"></script>
	<script src="../js/jquery.popupoverlay.js"></script>
	<script type="text/javascript" src="../js/browser-close.js"></script>
	<script type="text/javascript" src="../js/backbutton.js"></script>
	<script>

	$(document).ready(function() {
		$(".focus-field").click(function() {
			$(this).children('.effectiveDate').focus();
		});

		$('.effectiveDate').datetimepicker({
			timepicker : false,
			format : 'm/d/Y',
			formatDate : 'Y/m/d',
		});
		
		  if ("${transactionDiv}" == "true"){
			 $('#checkb').show();
			 $('#transinfo').show();
			 $('#showDates').hide();
		   }  
	});
		/* Common Navigation Include Start */
		$(function() {
			//$("#main-navigation").load("main-navigation.html");
			highlightMainContent();
		});
		function highlightMainContent() {
			$("#navListId7").addClass("active-background");
		}
		/* Common Navigation Include End */
		/* Common Pagination Include Start */
		 
						$(function() {
							/*highlightMainContent('navListId1'); */
							var rowsShown = 20;
							var pageShown=10;
							var rowsTotal = $('#serviceResults tbody tr').length;
							var numPages = rowsTotal / rowsShown;
							var startPagePoint=1;
							var endPagePoint=startPagePoint+pageShown-1;
							$('#serviceResults')
							.after(
									'<table style="width: 100%; margin-top: -20px;"><tr class="table-footer-main"><td class="search-table-header-column" colspan="10"><div class="col-sm-12">	<div class="col-sm-3">&nbsp;</div><div class="col-sm-9"><ul class="pagination custom-table-footer-pagination"><li id="liIdLeft"><a href="#" rel="'+startPagePoint+'">&laquo;</a></li><li id="liId"></a></li><li id="liIdRight"><a href="#" rel="'+endPagePoint+'">&raquo;</a></li></ul></div></div></td></tr></table>');
							for (i = 0; i < numPages; i++) {
								var pageNum = i + 1;
								$('#liId').append(
										'<a href="#" rel="'+i+'" id="rel'+i+'">' + pageNum
												+ '</a> ');
							}
							if(numPages<=pageShown){
								$('#liIdRight a').hide();
								$('#liIdLeft a').hide();
								}
							$('#liIdLeft a').hide();
							$('#serviceResults tbody tr').hide();
							$('#serviceResults tbody tr').slice(0, rowsShown).show();
							$('#liId a:first').addClass('active');
							$('#liId a').hide(); 
							$('#liId a').slice(0, pageShown).show(); 
							$('#liId a').bind(
									'click',
									function() {
										$('#liId a').removeClass('active');
										$(this).addClass('active');
										var currPage = parseInt($(this).attr('rel'));
										var startItem = currPage * rowsShown;
										var endItem = startItem + rowsShown;
										$('#serviceResults tbody tr').css('opacity',
												'0.0').hide().slice(startItem,
												endItem).css('display',
												'table-row').animate({
											opacity : 1
										}, 300);
									});
							$('#liIdLeft a').bind(
									'click',
									function() {
										var currPage1 = parseInt($(this).attr('rel'));
										$('#liId a').hide();
										$('#liId a').slice(currPage1-pageShown,currPage1).show();
										if((currPage1-pageShown)<=0){
											startPagePoint=0;
											$('#liIdLeft a').hide();
											$(this).attr('rel',1);
											}
										else{
											startPagePoint=(currPage1-pageShown);
											$('#liIdLeft a').show();
											$(this).attr('rel',startPagePoint);
									     	}
										endPagePoint=startPagePoint+pageShown;
										$('#liIdRight a').attr('rel',endPagePoint);
										if(endPagePoint>=numPages){
											$('#liIdRight a').hide();
											}else{
												$('#liIdRight a').show();
												}
										if(startPagePoint>0&&startPagePoint<=(numPages)){
											$('#liIdLeft a').show();
											}else{
												$('#liIdLeft a').hide();
												}
										var t='rel'+(startPagePoint);
										$('#'+t).click();
									});
							$('#liIdRight a').bind(
									'click',
									function() {
										var currPage2 = parseInt($(this).attr('rel'));
										$('#liId a').slice(0,currPage2).hide();
										$('#liId a').slice(currPage2,currPage2+pageShown).show();
										startPagePoint=parseInt(currPage2);
										endPagePoint=parseInt(startPagePoint)+pageShown;
										$(this).attr('rel',endPagePoint);
										$('#liIdLeft a').attr('rel',startPagePoint);
										if(endPagePoint>=numPages){
											$('#liIdRight a').hide();
											}
										if(startPagePoint>0&&startPagePoint<=numPages){
											$('#liIdLeft a').show();
											}
										var t='rel'+(startPagePoint);
										$('#'+t).click();
									});
						});
		
				  /* Common Pagination Include End */
				  $(document).ready(function() {
							/* Table Sorter includes Start*/
							$(function() {
								
									  // call the tablesorter plugin
									  $('#serviceResults').sortable({
										
										 divBeforeTable: '#divbeforeid',
										divAfterTable: '#divafterid',
										initialSort: false,
										locale: 'th',
										//negativeSort: [1, 2]
									});
							});
							});
	</script>
</body>
</html>