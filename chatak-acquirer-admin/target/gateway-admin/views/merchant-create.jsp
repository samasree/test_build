<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page pageEncoding="UTF-8"%>
<%
  int year = Calendar.getInstance().get(Calendar.YEAR);
%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><spring:message code="common.lable.title"/></title>
<!-- Bootstrap -->
<link rel="icon" href="../images/favicon.png" type="image/png">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link href="../css/jquery.datetimepicker.css" rel="stylesheet"
	type="text/css" />
	<script type="text/javascript">
	 var testData = 'USPROG, COP, USD';
	</script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
</head>
<body>
	<!--Body Wrapper block Start -->
	<div id="wrapper">
		<!--Container block Start -->
		<div class="container-fluid">
			<!--Header Block Start -->
			<!--Header Block End -->
			<!--Navigation Block Start -->
			<!-- <nav class="col-sm-12 nav-bar" id="main-navigation"> -->
			<%-- <jsp:include page="header.jsp"></jsp:include> --%>
			<%@include file="navigation-panel.jsp"%>
			<!-- </nav> -->
			<!--Navigation Block Start -->
			<!--Article Block Start-->
			<article>
				<div class="col-xs-12 content-wrapper">
					<!-- Breadcrumb start -->
					<div class="breadCrumb">
						<span class="breadcrumb-text"><spring:message code="manage.label.manage"/></span> <span
							class="glyphicon glyphicon-play icon-font-size"></span> <span
							class="breadcrumb-text"><spring:message code="merchant.label.merchant"/></span> <span
							class="glyphicon glyphicon-play icon-font-size"></span> <span
							class="breadcrumb-text"><spring:message code="common.label.create"/></span>
					</div>
					<!-- Breadcrumb End -->
					<!-- Tab Buttons Start -->
					<!-- <div class="tab-header-container-first">
						<a href="merchant-search">Search</a>
					</div> -->
					<c:if test="${fn:contains(existingFeatures,merchantView) || fn:contains(existingFeatures,merchantEdit) || fn:contains(existingFeatures,merchantDelete)||fn:contains(existingFeatures,merchantCreate)}">
					<div class="tab-header-container-first">
						<a href="merchant-search-page"><spring:message code="common.label.search"/></a>
					</div>
					</c:if>
					<c:if test="${fn:contains(existingFeatures,merchantCreate)}">
					<div class="tab-header-container active-background">
						<a href="#"><spring:message code="common.label.create"/></a>
					</div>
					</c:if>
					<!-- Tab Buttons End -->
					<!-- Content Block Start -->
					<div class="main-content-holder padding0">
						<!-- Page Menu Start -->
						<div class="col-sm-12 padding0">
							<div class="sub-nav">
								<ul>
									<li class="account-details-list">
										<div class="circle-div">
											<div class="hr"></div>
											<span class="merchant-circle-tab active-circle"></span>
										</div> <label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.basciinfo"/></label>
										<div class="arrow-down merchant-arrow"></div>
									</li>
									<li class="bank-list">
										<div class="circle-div">
											<div class="hr"></div>
											<span class="bank-info-circle-tab"></span>
										</div> <label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.bankinfo"/></label>
										<div class="arrow-down bank-info-arrow"></div>
									</li>
									<li class="legal-entiy-list">
										<div class="circle-div">
											<div class="hr"></div>
											<span class="legal-circle-tab"></span>
										</div> <label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.legalentityrep"/></label>
										<div class="arrow-down legal-arrow"></div>
									</li>
									<li class="legal-entiy-rep-list">
										<div class="circle-div">
											<div class="hr"></div>
											<span class="legal-circle-rep-tab"></span>
										</div> <label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.legalentity"/></label>
										<div class="arrow-down legal-rep-arrow"></div>
									</li>
									<li class="free-transactions-list">
										<div class="circle-div">
											<div class="hr"></div>
											<span class="contact-circle-tab"></span>
										</div> <label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.additonalinfo"/></label>
										<div class="arrow-down contact-arrow"></div>
									</li>
									<li class="pm-iso-carprogram-list">
										<div class="circle-div">
											<div class="hr"></div>
											<span class="pic-circle-tab"></span>
										</div> <label data-toggle="tooltip" data-placement="top" title=""><spring:message
												code="merchant.label.pmisoandcardprogram" /></label>
										<div class="arrow-down pic-arrow"></div>
									</li>
									<li class="atm-transactions-list">
										<div class="circle-div">
											<div class="hr"></div>
											<span class="bank-circle-tab"></span>
										</div> <label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.configuration"/></label>
										<div class="arrow-down configuration-arrow"></div>
									</li>
									<li class="pos-transactions-list">
										<div class="circle-div">
											<div class="hr"></div>
											<span class="final-circle-tab"></span>
										</div> <label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.confirmation"/></label>
										<div class="arrow-down final-arrow"></div>
									</li>
								</ul>
							</div>
						</div>
						<!-- Page Menu End -->
						<div class="row margin0">
							<div class="col-sm-12">
								<!--Success and Failure Message Start-->
								<div class="col-xs-12">
									<div class="descriptionMsg col-xs-12">
										<span class="red-error">&nbsp;${error }</span> <span
											class="green-error">&nbsp;${sucess }</span>
									</div>
								</div>
								<!--Success and Failure Message End-->
								<!-- Page Form Start -->
								<form:form action="createMerchant" commandName="merchant" name="merchant">
								<input type="hidden" id="currencyCode" name="currencyCode">
								<input type="hidden" id="cardProgramIds" name="cardProgramIds">
								<input type="hidden" id="entitiesId" name="entitiesId">
								<input type="hidden" name="CSRFToken" value="${tokenval}">
									<div class="col-sm-12 paddingT20">
										<div class="row">
											<!-- Account Details Content Start -->
											<jsp:include page="merchant-create-remaining.jsp"></jsp:include>
											<!-- Account Details Content End -->
											<!-- Bank Details Content Start -->
											<section class="field-element-row bank-info-details-content"
												style="display: none;">
												<fieldset class="col-sm-12">
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.name"/><span class="required-field">*</span></label>
														<form:input cssClass="form-control" path="bankAccountName"
															id="bankAccountName" maxlength="50"
															onblur="this.value=this.value.trim();return clientValidation('bankAccountName', 'first_name_SplChar','bankAccountNameErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="bankAccountNameErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>

													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.bankroutingnumber"/><span
															class="required-field">*</span></label>
														<form:input cssClass="form-control"
															path="bankRoutingNumber"
															onkeypress="return amountValidate(this,event)"
															id="bankRoutingNumber" maxlength="9"
															onblur="this.value=this.value.trim();return clientValidation('bankRoutingNumber', 'routing_number','bankRoutingNumberEr');" />
														<!-- onblur="return validRoutingNumber()"  -->
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="bankRoutingNumberEr" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.bankaccountnumber"/><span
															class="required-field">*</span></label>
														<form:input cssClass="form-control"
															path="bankAccountNumber" id="bankAccountNumber"
															maxlength="50"
															onblur="this.value=this.value.trim();return clientValidation('bankAccountNumber', 'account_numberBank','bankAccountNumberErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="bankAccountNumberErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.type"/><span class="required-field">*</span></label>
														<form:select cssClass="form-control"
															path="bankAccountType" id="bankAccountType"
															onblur="return clientValidation('bankAccountType', 'account_type','bankAccountTypeErrorDiv');">
															<form:option value=""><spring:message code="reports.option.select"/></form:option>
															<form:option value="S"><spring:message code="merchantaccount.label.savings"/></form:option>
															<form:option value="C"><spring:message code="merchantaccount.label.checking"/></form:option>
														</form:select>
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="bankAccountTypeErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="common.label.address1"/><!-- <span class="required-field">*</span> --></label>
														<form:input cssClass="form-control" path="bankAddress1"
															id="bankAddress1" maxlength="50"
															onblur="this.value=this.value.trim();return clientValidation('bankAddress1', 'bank_address2','bankAddress1ErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="bankAddress1ErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="common.label.address2"/></label>
														<form:input cssClass="form-control" path="bankAddress2"
															id="bankAddress2" maxlength="50"
															onblur="this.value=this.value.trim();return clientValidation('bankAddress2', 'bank_address2','bankAddress2ErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="bankAddress2ErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="common.label.city"/><!-- <span class="required-field">*</span> --></label>
														<form:input cssClass="form-control" path="bankCity"
															id="bankCity" maxlength="50"
															onblur="this.value=this.value.trim();return clientValidation('bankCity', 'bank_address2','bankCityErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="bankCityErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="common.label.country"/><span class="required-field">*</span></label>
														<form:select cssClass="form-control" path="bankCountry"
															id="bankCountry"
															onblur="return clientValidation('bankCountry', 'country','bankCountryErrorDiv');"
															onchange="fetchMerchantState(this.value, 'bankState')">
															<form:option value=""><spring:message code="reports.option.select"/></form:option>
															<c:forEach items="${countryList}" var="country">
																<form:option value="${country.label}">${country.label}</form:option>
															</c:forEach>
														</form:select>
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="bankCountryErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="common.label.state"/><span class="required-field">*</span></label>
														<form:select cssClass="form-control" path="bankState"
															id="bankState"
															onblur="return clientValidation('bankState', 'state','bankStateErrorDiv');">
															<form:option value=""><spring:message code="reports.option.select"/></form:option>
														</form:select>
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="bankStateErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="common.label.zipcode"/><span class="required-field">*</span></label>
														<form:input cssClass="form-control" path="bankPin"
															onkeypress="generalZipCode()" id="bankPin" maxlength="7"
															onblur="this.value=this.value.trim();return zipCodeNotEmpty(id)" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="bankPinEr" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.nameonaccount"/><span class="required-field">*</span></label>
														<form:input cssClass="form-control"
															path="bankNameOnAccount" id="bankNameOnAccount"
															onblur="this.value=this.value.trim();return clientValidation('bankNameOnAccount', 'first_name_SplChar','bankNameOnAccountErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="bankNameOnAccountErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label><spring:message code="merchant.label.currency"/><span class="required-field">*</span></label>
														<form:select cssClass="form-control" path="currencyId"
															id="currencyId" 
															onchange="fetchCurrency(this.value,'bankId')"
															onblur="clientValidation('currencyId', 'currencyValue','currencyEr');fetchAgentNames(this.value,'agentId');">
															<form:option value="">..:<spring:message code="reports.option.select"/>:..</form:option>
															<c:forEach items="${currencyCodeList}" var="currencyValue">
																<form:option value="${currencyValue.value}">${currencyValue.label}</form:option>
															</c:forEach>
														</form:select>
														<div class="discriptionErrorMsg">
															<span id="currencyEr" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
												</fieldset>
												<!--Panel Action Button Start -->
												<div class="col-sm-12 button-content">
													<fieldset class="col-sm-7 pull-right">
														<input type="button"
															class="form-control button pull-right bank-next"
															value='<spring:message code="common.label.continue"/>' onclick="return zipCodeNotEmpty('bankPin')"
															> <input type="button"
															value='<spring:message code="common.label.previous"/>' class="form-control button pull-right marginL10 bank-prev"
															> <input
															type="button"
															class="form-control button pull-right marginL10"
															value='<spring:message code="common.label.cancel"/>' onclick="openCancelConfirmationPopup()"><input type="button"
															class="form-control button pull-right marginL10"
															value='<spring:message code="common.label.reset"/>' onclick="resetBankInfo()"> 
													</fieldset>
												</div>
												<!--Panel Action Button End -->
											</section>
											<!-- Bank Details Content End -->
											<!-- Legal Entity Content Starts  -->
											<section class="field-element-row legal-details-content"
												style="display: none;">
												<fieldset class="col-sm-12">

													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.SSN"/><!-- <span class="required-field">*</span> --></label>
														<form:input cssClass="form-control" path="legalSSN"
															id="legalSSN" maxlength="11" onblur="ssnValidation()"/>
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalSSNErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.firstname"/><!-- <span class="required-field">*</span> --></label>
														<form:input cssClass="form-control" path="legalFirstName"
															id="legalFirstName" maxlength="50"
															onblur="this.value=this.value.trim();return clientValidation('legalFirstName', 'first_name_NotMand','legalFirstNameErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalFirstNameErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.lastname"/><!-- <span class="required-field">*</span> --></label>
														<form:input cssClass="form-control" path="legalLastName"
															id="legalLastName" maxlength="50"
															onblur="this.value=this.value.trim();return clientValidation('legalLastName', 'first_name_NotMand','legalLastNameErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalLastNameErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.mobilephone"/><!-- <span class="required-field">*</span> --></label>
														<form:input cssClass="form-control"
															path="legalMobilePhone" maxlength="10"
															id="legalMobilePhone"
															onblur="this.value=this.value.trim();return clientValidation('legalMobilePhone', 'mobile_optional','legalMobilePhoneErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalMobilePhoneErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""> <spring:message code="merchant.label.dateofbirth"/><!-- <span class="required-field">*</span> --></label>
														<div class="input-group focus-field">
															<form:input cssClass="form-control effectiveDate"
																path="legalDOB" id="legalDOB"
																onblur="validateLegalDOB()" />
															<span class="input-group-addon"><span
																class="glyphicon glyphicon-calendar"></span></span>
														</div>
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalDOBErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""> <spring:message code="merchant.label.passportnumber"/><!-- <span class="required-field">*</span> --></label>
														<form:input cssClass="form-control" path="legalPassport"
															id="legalPassport" maxlength="20"
															onblur="this.value=this.value.trim();return clientValidation('legalPassport', 'passport_number','legalPassportErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalPassportErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.countryresidence"/><!-- <span class="required-field">*</span> --></label>
														<form:input cssClass="form-control"
															path="legalCountryResidence" id="legalCountryResidence"
															maxlength="50" onblur="this.value=this.value.trim();" />
														<%-- onblur="return clientValidation('legalCountryResidence', 'bank_country','legalCountryResidenceErrorDiv');" --%>
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalCountryResidenceErrorDiv"
																class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.countrycitizenship"/><!-- <span class="required-field">*</span> --></label>
														<form:input cssClass="form-control" path="legalCitizen"
															maxlength="50" id="legalCitizen"
															onblur="this.value=this.value.trim();" />
														<%-- onblur="return clientValidation('legalCitizen', 'bank_country','legalCitizenErrorDiv');" --%>
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalCitizenErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.homephone"/><!-- <span class="required-field">*</span> --></label>
														<form:input cssClass="form-control" path="legalHomePhone"
															onkeypress="return amountValidate(this,event)"
															maxlength="12" id="legalHomePhone"
															onblur="this.value=this.value.trim();" />
														<%-- onblur="return clientValidation('legalHomePhone', 'contact_phone','legalHomePhoneErrorDiv');" --%>
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalHomePhoneErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
												</fieldset>
												<!--Panel Action Button Start -->
												<div class="col-sm-12 button-content">
													<fieldset class="col-sm-7 pull-right">
														<input type="button"
															value='<spring:message code="common.label.continue"/>' class="form-control button pull-right legal-next"
															> <input type="button"
															value='<spring:message code="common.label.previous"/>' class="form-control button pull-right marginL10 legal-prev"
															> <input
															type="button"
															class="form-control button pull-right marginL10"
															value='<spring:message code="common.label.cancel"/>' onclick="openCancelConfirmationPopup()"> <input type="button"
															class="form-control button pull-right marginL10"
															value='<spring:message code="common.label.reset"/>' onclick="resetLegalEntityInfo()"> 
													</fieldset>
												</div>
												<!--Panel Action Button End -->
											</section>
											<!--Legal Entity Content Ends  -->
											<!-- Legal Details Content Start -->
											<section class="field-element-row legal-details-rep-content"
												style="display: none;">
												<fieldset class="col-sm-12">
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.entityLegalName"/><span
															class="required-field">*</span></label>
														<form:input cssClass="form-control" path="legalName"
															id="legalName" maxlength="101"
															onblur="this.value=this.value.trim();return clientValidation('legalName', 'first_name_SplChar','legalNameErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalNameErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>

													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.EIN/TaxID"/><span class="required-field">*</span></label>
														<form:input cssClass="form-control" path="legalTaxId"
															id="legalTaxId" maxlength="50"
															onblur="this.value=this.value.trim();return clientValidation('legalTaxId', 'eIN_taxId','legalTaxIdErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalTaxIdErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.type"/><span class="required-field">*</span></label>
														<form:select cssClass="form-control" path="legalType"
															id="legalType"
															onblur="return clientValidation('legalType', 'state','legalTypeErrorDiv');">
															<form:option value=""><spring:message code="reports.option.select"/></form:option>
															<form:option value="1"><spring:message code="merchant.label.association"/></form:option>
															<form:option value="2"><spring:message code="merchant.label.corporation"/></form:option>
															<form:option value="3"><spring:message code="merchant.label.governmentagency"/></form:option>
															<form:option value="4"><spring:message code="merchant.label.individualsoleproprietorship"/></form:option>
															<form:option value="5"><spring:message code="merchant.label.internationalorginization"/></form:option>
															<form:option value="6"><spring:message code="merchant.label.limitedliabilitycompany(LLC)"/></form:option>
															<form:option value="7"><spring:message code="merchant.label.partnership"/></form:option>
															<form:option value="8"><spring:message code="merchant.label.taxexemptorganization(501C)"/></form:option>
															<form:option value="11"><spring:message code="merchant.label.testing"/></form:option>
														</form:select>

														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalTypeErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.expectedannualcardsales"/><span
															class="required-field">*</span></label>
														<form:input cssClass="form-control" path="legalAnnualCard"
															id="legalAnnualCard" maxlength="12"
															onblur="this.value=this.value.trim();appendDollarSymbol();return clientValidation('legalAnnualCard', 'dollar_amount','legalAnnualCardErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalAnnualCardErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>

													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="common.label.address1"/><span class="required-field">*</span></label>
														<form:input cssClass="form-control" path="legalAddress1"
															id="legalAddress1"
															onblur="this.value=this.value.trim();return clientValidation('legalAddress1', 'bank_address1','legalAddress1ErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalAddress1ErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="common.label.address2"/></label>
														<form:input cssClass="form-control" path="legalAddress2"
															id="legalAddress2"
															onblur="this.value=this.value.trim();return clientValidation('legalAddress2', 'bank_address2','legalAddress2ErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalAddress2ErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="common.label.city"/><span class="required-field">*</span></label>
														<form:input cssClass="form-control" path="legalCity"
															id="legalCity"
															onblur="this.value=this.value.trim();return clientValidation('legalCity', 'bank_city','legalCityErrorDiv');" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalCityErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="common.label.country"/><span class="required-field">*</span></label>
														<form:select cssClass="form-control" path="legalCountry"
															id="legalCountry"
															onblur="return clientValidation('legalCountry', 'country','legalCountryErrorDiv');"
															onchange="fetchMerchantState(this.value, 'legalState')">
															<form:option value=""><spring:message code="reports.option.select"/></form:option>
															<c:forEach items="${countryList}" var="country">
																<form:option value="${country.label}">${country.label}</form:option>
															</c:forEach>
														</form:select>
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalCountryErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="common.label.state"/><span class="required-field">*</span></label>
														<form:select cssClass="form-control" path="legalState"
															id="legalState"
															onblur="return clientValidation('legalState', 'state','legalStateErrorDiv');">
															<form:option value=""><spring:message code="reports.option.select"/></form:option>

														</form:select>
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalStateErrorDiv" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="common.label.zipcode"/><span class="required-field">*</span></label>
														<form:input cssClass="form-control" path="legalPin"
															onkeypress="generalZipCode()" id="legalPin" maxlength="7"
															onblur="this.value=this.value.trim();return zipCodeNotEmpty(id)" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="legalPinEr" class="red-error">&nbsp;</span>
														</div>
													</fieldset>
												</fieldset>
												<!--Panel Action Button Start -->
												<div class="col-sm-12 button-content">
													<fieldset class="col-sm-7 pull-right">
														<input type="button"
															class="form-control button pull-right legal-rep-next"
															value='<spring:message code="common.label.continue"/>' onclick="return zipCodeNotEmpty('legalPin')"
															> <input type="button"
															value='<spring:message code="common.label.previous"/>' class="form-control button pull-right marginL10 legal-rep-prev"
															> <input type="button"
															class="form-control button pull-right marginL10"
															value='<spring:message code="common.label.cancel"/>' onclick="openCancelConfirmationPopup()"> <input type="button"
															class="form-control button pull-right marginL10"
															value='<spring:message code="common.label.reset"/>' onclick="resetLegalEntityRepInfo()">
														
													</fieldset>
												</div>
												<!--Panel Action Button End -->
											</section>
											<!-- Legal Details Content End -->
											<!-- Free Transactions Content Start -->
											<section class="field-element-row free-transactions-content"
												style="display: none;">
												<fieldset class="col-sm-12">
													<fieldset class="col-sm-3">
														<label data-toggle="tooltip" data-placement="top" title=""><spring:message code="merchant.label.username"/><span class="required-field">*</span></label>
														<form:input cssClass="form-control" path="userName"
															id="userName" maxlength="50"
															onblur="this.value=this.value.trim();vlalidateUserName()" />
														<div class="discriptionErrorMsg" data-toggle="tooltip" data-placement="top" title="">
															<span id="userNameEr" class="red-error">&nbsp;</span> <span
																id="userNamegreenEr" class="green-error">&nbsp;</span>
														</div>
													</fieldset>
												</fieldset>
												<!--Panel Action Button Start -->
												<div class="col-sm-12 button-content">
													<fieldset class="col-sm-7 pull-right">
														<input type="button"
															value='<spring:message code="common.label.continue"/>' class="form-control button pull-right free-next"
															> <input type="button"
															value='<spring:message code="common.label.previous"/>' class="form-control button pull-right marginL10 free-prev"
															> <input
															type="button"
															class="form-control button pull-right marginL10"
															value='<spring:message code="common.label.cancel"/>' onclick="openCancelConfirmationPopup()"> <input type="button"
															class="form-control button pull-right marginL10"
															value='<spring:message code="common.label.reset"/>' onclick="resetAdditionalInfo()"> 
													</fieldset>
												</div>
												<!--Panel Action Button End -->
											</section>
											<!-- Free Transactions Content End -->
											<!-- ATM Transactions Content Start -->
											<!-- ATM Transactions Content End -->
											<!-- PM ISO CardProgram Content Start -->
											<jsp:include page="merchant-create-PmIsoCardProgram.jsp"></jsp:include>
											<!-- PM ISO CardProgram Content End -->
											<jsp:include page="merchant-create-confirmation.jsp"></jsp:include>
											<!-- POS Transactions Content End -->
										</div>
									</div>
								</form:form>
								<!-- Page Form End -->
							</div>
						</div>
					</div>
					<!-- Content Block End -->
				</div>
				<div id="my_popup1" class="popup-void-refund voidResult">
					<span class="glyphicon glyphicon-remove closePopupMes"
						onclick="closeCancelConfirmationPopup()"></span>
					<div class="fw-b-fs15" style="padding: 20px;">
						<spring:message code="cancle.conformation.lable.currency" />
					</div>
					<div class="col-sm-12">

						<input type="button"
							class="form-control button pull-right margin5 close-btn"
							value="<spring:message code="bin.label.no"/>"
							onclick="closeCancelConfirmationPopup()"> <input
							type="submit" class="form-control button pull-right margin5"
							value="<spring:message code="bin.label.yes"/>"
							onclick="cancelCreateMerchant()">
					</div>
				</div>
			</article>
			<!--Article Block End-->
			<div class="footer-container">
				<jsp:include page="footer.jsp"></jsp:include>
			</div>
		</div>
		<!--Container block End -->
	</div>
	<!--Body Wrapper block End -->
	<script src="../js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../js/bootstrap.min.js"></script>
<script src="../js/utils.js"></script>
	<script src="../js/jquery.datetimepicker.js"></script>
	<script src="../js/jquery.cookie.js"></script>
	<script src="../js/common-lib.js"></script>
	<script src="../js/validation.js"></script>
	<script src="../js/chatak-ajax.js"></script>
	<script src="../js/messages.js"></script>
	<script type="text/javascript" src="../js/merchant.js"></script>
	<script type="text/javascript" src="../js/backbutton.js"></script>
	<script src="../js/utils.js"></script>
	<script src="../js/jquery.popupoverlay.js"></script>
	<script type="text/javascript" src="../js/browser-close.js"></script>
	<script>
		window.onload = function() {
			//	populatedropdown("autoTransferDay");
		}
		function getState(countryId) {
			var cid = 2;
			var strURL = "findState?country=" + cid;
			var req = getXMLHTTP();
			if (req) {
				req.onreadystatechange = function() {
					if (req.readyState == 4) {
						// only if "OK"
						if (req.status == 200) {
							document.getElementById('statediv').innerHTML = req.responseText;
						} else {
							alert("There was a problem while using XMLHTTP:\n"
									+ req.statusText);
						}
					}
				}
				req.open("GET", strURL, true);
				req.send(null);
			}
		}
	</script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script>
		/* function highlightMainContent() {
			$("#navListId2").addClass("active-background");
		} */
		/* Common Navigation Include End */
		/* DatePicker Javascript Strat*/
		$(document).ready(
				function() {
					$("#navListId6").addClass("active-background");
					$(window).keydown(function(event) {
						if (event.keyCode == 13) {
							event.preventDefault();
							return false;
						}
					});

					$('#my_popup1').popup({
						blur : false
					});

					var prevAppMode = "";
					$('#appMode').on(
							'change',
							function() {
								var currentAppMode = $('#appMode').val();
								if (currentAppMode.length > 0
										&& currentAppMode != prevAppMode) {
									prevAppMode = currentAppMode;
									isParentAndAgentDetailsAvailable = false;
									/* populatePartnerAndAgentDetails(
											currentAppMode, 'merchant',
											'create', true); */
								} else {
									prevAppMode = currentAppMode;
								}
							});

				});

		$(".focus-field").click(function() {
			$(this).children('.effectiveDate').focus();
		});
		$('.effectiveDate').datetimepicker({
			timepicker : false,
			format : 'm/d/Y',
			formatDate : 'Y/m/d',
		});

		/* DatePicker Javascript End*/
		$(
				".bank-info-details-content, .legal-details-content, .legal-details-rep-content, .free-transactions-content, .pm-iso-carprogram-content , .atm-transaction-content, .pos-transaction-content")
				.hide();
		$(".account-details-content").show();
		$(".merchant-arrow").show();
		$(
				".contact-arrow, .bank-info-arrow, .legal-arrow, .legal-rep-arrow, .bank-legal-arrow, .bank-arrow, .configuration-arrow, .final-arrow,.pic-arrow")
				.hide();
		$(".account-details-list, .bank-prev")
				.click(
						function() {
							$(".merchant-circle-tab").addClass("active-circle");
							$(
									".bank-info-circle-tab, .legal-circle-tab, .legal-circle-rep-tab, .contact-circle-tab, .bank-circle-tab, .final-circle-tab,.pic-circle-tab")
									.removeClass("active-circle");
							$(".merchant-arrow").show();
							$(
									".bank-info-arrow, .legal-arrow, .legal-rep-arrow, .contact-arrow, .bank-arrow, .final-arrow,.pic-arrow")
									.hide();
							$(".account-details-content").show();
							$(
									".atm-transaction-content,.bank-info-details-content, .legal-details-content, .legal-details-rep-content, .pos-transaction-content, .free-transactions-content,.pm-iso-carprogram-content")
									.hide();
						});

		$(".bank-list, .acc-next, .legal-prev")
				.click(
						function() {
							loadMsgTitleText();
							if (!validateCreateMerchantStep1()
									| resetBankInfoErrorMsg()) {
								return false;
							}
							$(".bank-info-circle-tab")
									.addClass("active-circle");
							$(
									".merchant-circle-tab, .legal-circle-tab, .legal-circle-rep-tab, .contact-circle-tab, .bank-circle-tab, .final-circle-tab,.pic-circle-tab")
									.removeClass("active-circle");
							$(".bank-info-arrow").show();
							$(
									".merchant-arrow, .legal-arrow, .legal-rep-arrow, .contact-arrow, .configuration-arrow, .bank-arrow, .configuration-arrow, .final-arrow,.pic-arrow")
									.hide();
							$(".bank-info-details-content").show();
							$(
									".account-details-content, .legal-details-content, .legal-details-rep-content, .atm-transaction-content, .pos-transaction-content, .free-transactions-content,.pm-iso-carprogram-content")
									.hide();
							/* populatePartnerAndAgentDetails($('#appMode').val(),
									'merchant', 'create', false); */
						});

		$(".legal-entiy-list, .bank-next, .legal-rep-prev")
				.click(
						function() {
							if (!validateCreateMerchantStep2()
									| !validateCreateMerchantStep1()
									| resetLegalEntityErrorMsg()) {
								return false;
							}
							$(".legal-circle-tab").addClass("active-circle");
							$(
									".merchant-circle-tab, .bank-info-circle-tab, .legal-circle-rep-tab, .contact-circle-tab, .bank-circle-tab, .final-circle-tab,.pic-circle-tab")
									.removeClass("active-circle");
							$(".legal-arrow").show();
							$(
									".merchant-arrow, .legal-rep-arrow, .bank-info-arrow, .contact-arrow, .configuration-arrow, .bank-arrow, .configuration-arrow, .final-arrow,.pic-arrow")
									.hide();
							$(".legal-details-content").show();
							$(
									".account-details-content, .legal-details-rep-content, .bank-info-details-content, .atm-transaction-content, .pos-transaction-content, .free-transactions-content,.pm-iso-carprogram-content")
									.hide();
						});

		$(".legal-entiy-rep-list, .legal-next, .free-prev")
				.click(
						function() {
							if (!validateLegalEntity()
									| !ssnValidation()
									| !validateCreateMerchantStep2()
									| !validateCreateMerchantStep1()
									| !validateLegalDOB()
									| resetLegalEntityInfoErrorMsg()) {
								return false;
							}
							$(".legal-circle-rep-tab")
									.addClass("active-circle");
							$(
									".merchant-circle-tab, .bank-info-circle-tab, .legal-circle-tab, .contact-circle-tab, .bank-circle-tab, .final-circle-tab,.pic-circle-tab")
									.removeClass("active-circle");
							$(".legal-rep-arrow").show();
							$(
									".merchant-arrow, .bank-info-arrow, .legal-arrow, .contact-arrow, .configuration-arrow, .bank-arrow, .configuration-arrow, .final-arrow,.pic-arrow")
									.hide();
							$(".legal-details-rep-content").show();
							$(
									".account-details-content, .bank-info-details-content, .legal-details-content, .atm-transaction-content, .pos-transaction-content, .free-transactions-content,.pm-iso-carprogram-content")
									.hide();
						});

		$(".free-transactions-list, .legal-rep-next, .pic-prev")
				.click(
						function() {
							if (!validateCreateMerchantStep3()
									| !validateCreateMerchantStep1()
									| !validateCreateMerchantStep2()
									| !validateLegalEntity()
									| resetAdditionalInfoErrorMsg()) {
								return false;
							}
							$(".contact-circle-tab").addClass("active-circle");
							$(
									".merchant-circle-tab,.bank-info-circle-tab, .bank-circle-tab, .legal-circle-tab, .legal-circle-rep-tab, .final-circle-tab,.pic-circle-tab")
									.removeClass("active-circle");
							$(".contact-arrow").show();
							$(
									".merchant-arrow, .legal-arrow, .legal-rep-arrow, .bank-info-arrow, .configuration-arrow, .bank-arrow, .final-arrow,.pic-arrow")
									.hide()
							$(".free-transactions-content").show();
							$(
									".atm-transaction-content, .legal-details-content, .legal-details-rep-content, .bank-info-details-content, .pos-transaction-content, .account-details-content,.pm-iso-carprogram-content")
									.hide();
						});
		
		$(".pm-iso-carprogram-list, .free-next , .atm-prev")
				.click(
						function() {
							if (!validateCreateMerchantStep4()
									|!validateCreateMerchantStep3()
									| !validateCreateMerchantStep1()
									| !validateCreateMerchantStep2()
									| !validateLegalEntity()
									| resetpmIsoCardprogarmErrorMsg()) {
								return false;
							}
							$(".pic-circle-tab").addClass("active-circle");
							$(
									".merchant-circle-tab,.bank-info-circle-tab, .bank-circle-tab, .legal-circle-tab, .legal-circle-rep-tab, .final-circle-tab,.contact-circle-tab")
									.removeClass("active-circle");
							$(".pic-arrow").show();
							$(
									".merchant-arrow, .legal-arrow, .legal-rep-arrow, .bank-info-arrow, .configuration-arrow, .bank-arrow, .final-arrow,.contact-arrow")
									.hide()
							$(".pm-iso-carprogram-content").show();
							$(
									".atm-transaction-content, .legal-details-content, .legal-details-rep-content, .bank-info-details-content, .pos-transaction-content, .account-details-content,.free-transactions-content")
									.hide();
						});

		$(".atm-transactions-list, .pic-next, .pos-prev")
				.click(
						function() {
							if (!validatePmIsoCardprogram()
									|!validateCreateMerchantStep4()
									| !validateCreateMerchantStep2()
									| !validateCreateMerchantStep3()
									| !validateCreateMerchantStep1()
									| !validateLegalEntity()
									| !checkAmbiguity()
									| resetConfigurationsInfoErrorMsg()) {
								return false;
							}
							$(".bank-circle-tab").addClass("active-circle");
							$(
									".merchant-circle-tab,.bank-info-circle-tab, .contact-circle-tab, .legal-circle-tab, .legal-circle-rep-tab, .final-circle-tab,.pic-circle-tab")
									.removeClass("active-circle");
							$(".configuration-arrow").show();
							$(
									".contact-arrow, .merchant-arrow, .legal-arrow, .legal-rep-arrow, .bank-info-arrow, .final-arrow,.pic-arrow")
									.hide()
							$(".atm-transaction-content").show();
							$(
									".free-transactions-content, .bank-info-details-content, .legal-details-content, .legal-details-rep-content, .pos-transaction-content, .account-details-content,.pm-iso-carprogram-content")
									.hide();
						});
		$(".pos-transactions-list, .atm-next")
				.click(
						function() {
							if (!validateCreateMerchantStep5()
									| !validatePmIsoCardprogram()
									| !checkAmbiguity()
									| !validateCreateMerchantStep1()
									| !validateCreateMerchantStep2()
									| !validateCreateMerchantStep3()
									| !validateLegalEntity()
									| !validateCreateMerchantStep4()) {
								return false
							}
							$(".final-circle-tab").addClass("active-circle");
							$(
									".merchant-circle-tab, .bank-info-circle-tab, .contact-circle-tab, .legal-circle-tab, .legal-circle-rep-tab, .bank-circle-tab,.pic-circle-tab")
									.removeClass("active-circle");
							$(".final-arrow").show();
							$(
									".contact-arrow, .bank-arrow,.configuration-arrow, .bank-info-arrow, .legal-arrow, .legal-rep-arrow, .merchant-arrow,.pic-arrow")
									.hide()
							$(".pos-transaction-content").show();
							$(
									".free-transactions-content, .bank-info-details-content, .legal-details-content, .legal-details-rep-content, .atm-transaction-content, .account-details-content,.pm-iso-carprogram-content")
									.hide();
						});

		$(".pos-transactions-list, .atm-next")
				.click(
						function() {
							var selectcurrencytype = "";
							$("#currencyCodes option").each(
									function() {
										selectcurrencytype = selectcurrencytype
												+ " " + $(this).val();
									});

							$('#confirmcurrencyCodes').text(selectcurrencytype);
							var length = $('#currencyCodes').children('option').length;
							if (length == 0)
								document.getElementById("mccCodeErrorMsg").innerHTML = 'Please Select Currency';
							if (!validateCreateMerchantStep5()
									| !validateCreateMerchantStep1()
									| !validateCreateMerchantStep2()
									| !validateCreateMerchantStep3()
									| !validatePmIsoCardprogram()
									| !checkAmbiguity()
									| !validateLegalEntity()
									| !validateCreateMerchantStep4()) {
								return false
							}
							$(".final-circle-tab").addClass("active-circle");
							$(
									".merchant-circle-tab, .bank-info-circle-tab, .contact-circle-tab, .legal-circle-tab, .legal-circle-rep-tab, .bank-circle-tab")
									.removeClass("active-circle");
							$(".final-arrow").show();
							$(
									".contact-arrow, .bank-arrow,.configuration-arrow, .bank-info-arrow, .legal-arrow, .legal-rep-arrow, .merchant-arrow,.pic-arrow")
									.hide()
							$(".pos-transaction-content").show();
							$(
									".free-transactions-content, .bank-info-details-content, .legal-details-content, .legal-details-rep-content, .atm-transaction-content, .account-details-content,.pm-iso-carprogram-content")
									.hide();
						});

		function loadRadio(data) {
			if (data == '0') {
				$("#noAutoSettlement").prop("checked", true);
				$("#allowAutoSettlement").prop("checked", false);
			} else if (data == '1') {
				$("#noAutoSettlement").prop("checked", false);
				$("#allowAutoSettlement").prop("checked", true);
			}
		}
		function SelectMoveRows(left, right) {
			var SelID = '';
			var SelText = '';

			// Move rows from left to right from bottom to top
			for (i = left.options.length - 1; i >= 0; i--) {
				if (left.options[i].selected == true) {
					SelID = left.options[i].value;
					SelText = left.options[i].text;
					var newRow = new Option(SelText, SelID);
					right.options[right.length] = newRow;
					left.options[i] = null;
				}
			}
			if ($("#currencyCodes").children().length != 0) {
				document.getElementById("mccCodeErrorMsg").innerHTML = '';
			}
			SelectSort(right);
		}

		$(".hide-block").hide();
		//$(".hide-localCurrency").hide();
		$("#dcc_enable").click(function() {
			if ($(this).is(":checked")) {
				$(".hide-block").show();
				//$(".hide-localCurrency").show();
			} else {
				$(".hide-block").hide();
				//$(".hide-localCurrency").hide();
			}
		});

		$('#legalSSN').keyup(function() {
			var val = this.value.replace(/\D/g, '');
			var newVal = '';
			if (val.length > 4) {
				this.value = val;
			}
			if ((val.length > 3) && (val.length < 6)) {
				newVal += val.substr(0, 3) + '-';
				val = val.substr(3);
			}
			if (val.length > 5) {
				newVal += val.substr(0, 3) + '-';
				newVal += val.substr(3, 2) + '-';
				val = val.substr(5);
			}
			newVal += val;
			this.value = newVal;
		});
		$('#my_popup1').popup({
			blur : false
		});
		/* Select Services moving form Left to Right and Right to Left functionality Start */
		var entitiesId = [];
		var entityNameArr = [];
        function SelectMoveRows(left, right, action) {
        	var tempProgramManagerIds = [];
        	var tempEntityName = [];
			var j=0;
            var SelID = '';
            var SelText = '';
            // Move rows from left to right from bottom to top
            if(action == 'ADD'){
				for (i = left.options.length - 1; i >= 0; i--) {
					if (left.options[i].selected == true) {
						SelID = left.options[i].value;
						SelText = left.options[i].text;
						var newRow = new Option(SelText, SelID);
						right.options[right.length] = newRow;
						left.options[i] = null;
						getCardProgramByPmId(SelID);
						entitiesId.push(SelID);
						entityNameArr.push(SelText);
					}
				}				
			}else if(action == 'REMOVE'){
				for (i = left.options.length - 1; i >= 0; i--) {
					if (left.options[i].selected == true) {
						SelID = left.options[i].value;
						SelText = left.options[i].text;
						var newRow = new Option(SelText, SelID);
						right.options[right.length] = newRow;
						left.options[i] = null;
						removeCardProgramFromList(SelID);
						for(var k=0; k < entitiesId.length; k++){
							if(entitiesId[k] != SelID){
								tempProgramManagerIds[j] = entitiesId[k];
								tempEntityName[j]=entityNameArr[i];
								j++;
							}
						}
						entitiesId = tempProgramManagerIds;
						entityNameArr = tempEntityName;
						j=0;
						tempProgramManagerIds = [];
						tempEntityName = [];
					}
				}
			}
			SelectSort(right);
			//set selected pm ids
			$('#entitiesId').val(entitiesId);
			$('#confirmEntityNames').text(entityNameArr.toString());
        }
        function SelectSort(SelList) {
            var ID = '';
            var Text = '';
            for (x = 0; x < SelList.length - 1; x++) {
                for (y = x + 1; y < SelList.length; y++) {
                    if (SelList[x].text > SelList[y].text) {
                        // Swap rows
                        ID = SelList[x].value;
                        Text = SelList[x].text;
                        SelList[x].value = SelList[y].value;
                        SelList[x].text = SelList[y].text;
                        SelList[y].value = ID;
                        SelList[y].text = Text;
                    }
                }
            }
        }
        /* Select Services moving form Left to Right and Right to Left functionality End */
		var cardProgramIdList = [];
        var cardProgramArr = [];
        var selectedCpId = [];
		function addCardProgram(cardProgramId,cardProgramName,entityName,entityId){
			var tempCardProgramIds = [];
			var tempCardProgramArr = [];
			var j=0;
			var selectedId = 'cpId' + cardProgramId + entityId;
			
			if($('#' + selectedId).is(":checked")){
				cardProgramIdList.push(cardProgramId+'@'+entityId);
				cardProgramArr.push(cardProgramName);
				selectedCpId.push(cardProgramId);
			}else if(!($('#' + selectedId).is(":checked"))){
				for(var i=0; i < cardProgramIdList.length; i++){
					if(cardProgramIdList[i] != cardProgramId+'@'+entityId){
						tempCardProgramIds[j] = cardProgramIdList[i];
						tempCardProgramArr[j] = cardProgramArr[i];
						j++;
					} 
				}
				cardProgramIdList = tempCardProgramIds;
				cardProgramArr = tempCardProgramArr;
				var index = selectedCpId.indexOf(cardProgramId);
				if (index > -1) {
					selectedCpId.splice(index, 1);
				}
			}
			//set selected card pogram ids
		$('#cardProgramIds').val(cardProgramIdList);
		$('#confirmCardProgramNames').text(cardProgramArr.toString());
		}
		function doUnCheckedToCardProgram(cardProgramId,cardProgramName,entityId) {
			var tempCardProgramIds = [];
			var j = 0;
			for (var i = 0; i < cardProgramIdList.length; i++) {
				if (cardProgramIdList[i] != cardProgramId+'@'+entityId && cardProgramArr[i] != cardProgramName) {
					tempCardProgramIds[j] = cardProgramIdList[i];
					tempCardProgramName[j] = cardProgramArr[i];
					j++;
				}
			}
			cardProgramIdList = tempCardProgramIds;
			cardProgramArr = tempCardProgramName;
			var index = selectedCpId.indexOf(cardProgramId);
			if (index > -1) {
				selectedCpId.splice(index, 1);
			}
		}
		
		
		function checkAmbiguity() {
			if (!validateSelectedCardProgram()) {
				return false;
			}
			var sortedCardProgramIdList = selectedCpId.sort();
			for (var i = 0; i < sortedCardProgramIdList.length; i++) {
				for (var j = i + 1; j < sortedCardProgramIdList.length; j++) {
					if (sortedCardProgramIdList[i] == sortedCardProgramIdList[j]) {
						$('#ambiguityFlag').text(
								webMessages.DUPLICATE_CARD_RPOGRAM);
						return false;
					}
				}
			}
			$('#ambiguityFlag').text('');
			return true;

		}
		function validateAssocated() {
			document.getElementById("programManagerNameId").innerHTML = "";
			document.getElementById('programManagerNameId').options.length = 0;
			$('#ambiguityFlag').text(' ');
			$("#serviceResults").find("tr:gt(0)").remove();
			cardProgramIdList = [];
			entityNameArr = [];
			entitiesId = [];
			cardProgramArr = [];
			selectedCpId = [];
		}

		function validateSelectedCardProgram() {
			var selectedCardProgramIdList = selectedCpId;
			if (selectedCardProgramIdList === undefined
					|| selectedCardProgramIdList.length == 0) {
				$('#ambiguityFlag').text(webMessages.SELECT_CARD_PROGRAM);
				return false;
			} else {
				$('#ambiguityFlag').text(' ');
				return true;
			}
		}
		document.getElementById('lookingFor').setAttribute('maxlength', '100');
	</script>
</body>
</html>