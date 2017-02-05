<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>
<style>
@media print {
	#page1 {
		page-break-before: always;
	}
	.condition {
		page-break-before: always;
	}
	#page2 {
		page-break-before: always;
	}
	#page3 {
		page-break-before: always;
	}
	#page4 {
		page-break-before: always;
	}
	.school {
		page-break-before: always;
	}
	.page9 {
		page-break-inside: avoid;
		page-break-after: auto
	}
}

.biodata {
	padding: 1px;
}

.uk-table td {
	border: none;
}

.capitalize {
	font-size: 12px;
}

strong {
	font-size: 12px;
}
</style>

<div id="page_content">
	<div id="page_content_inner">
		<div class="uk-modal" id="new_task">
			<div class="uk-modal-dialog">
				<div class="uk-modal-header">
					<h4 class="uk-modal-title">Send sms here</h4>
				</div>
				<form action="/system/sms" method="POST">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

                     <input type="hidden" name="phone" value="${person.mobile}"/>

					<textarea cols="30" rows="4" name="message" class="md-input"
						required=""></textarea>


					<div class="uk-modal-footer uk-text-right">
						<button type="submit"
							class="md-btn md-btn-flat md-btn-flat-primary md-btn-wave"
							id="snippet_new_save">
							<i class="material-icons">smartphone</i>Send
						</button>
						<button type="button"
							class="md-btn md-btn-flat uk-modal-close md-btn-wave">Close</button>
					</div>
				</form>
			</div>
		</div>
		<h6 class="heading_c uk-margin-bottom">Customer Details with Latest Transactions</h6>


		<div style="" class="">
			<!--    <div class="uk-margin-bottom" style="margin-left:910px" >-->
			<div class="uk-margin-bottom" style="">
				<a href="#new_task" data-uk-modal="{ :true }"> <i
					title="click to send sms to students"
					class="material-icons md-36 uk-text-success">phonelink_ring </i></a> <i
					title="click to print" onclick="javascript:printDiv('print')"
					class="material-icons md-36 uk-text-success">print</i>



			</div>
		</div>
		<div class="uk-width-xLarge-1-10">
			<div class="md-card">
				<div class="md-card-content" style="">
					<div class="uk-overflow-container" id='print'>
						<center>
							<h5>
								 BIODATA OF ${person.getName()}
							</h5>
						</center>
						<hr>
						 
							<table>
								<tr>

									<td>
										<table class="uk-table uk-table-nowrap ">

											<tr>
											<td width="210" class="uppercase" align="right"><strong>FULL NAME</strong></td>
												<td width="408" class="capitalize">${person.getName()}</td>
											</tr>
											<tr>
												<td class="uppercase" align="right"><strong>GENDER
														</strong></td>
												<td class="uk-text-upper">${person.gender}</td>
											</tr>
											<tr>
												<td width="210" class="uppercase" align="right"><strong>PHONE
														N<u>O</u>
												</strong></td>
												<td width="408" class="capitalize">${person.mobile}</td>
											</tr>
											<tr>
												<td class="uppercase" align="right"><strong>RESIDENTIAL ADDRESS</strong></td>
												<td class="uk-text-upper">${person.resident}</td>
											</tr>
											<tr>
												<td class="uppercase" align="right"><strong>OCCUPATION
													</strong></td>
												<td class="uk-text-upper">${person.job}</td>
											</tr>
											<tr>
												<td class="uppercase" align="right"><strong>REGIOUS DENOMINATION
													</strong></td>
												<td class="uk-text-upper">${person.denomination}</td>
											</tr>
											 
											 <tr>
												<td class="uppercase" align="right"><strong>BENEFICIARY NAME
													</strong></td>
												<td class="uk-text-upper">${person.beneficiary}</td>
											</tr>
											<tr>
												<td class="uppercase" align="right"><strong>RELATIONSHIP TO BENEFICIARY
													</strong></td>
												<td class="uk-text-upper">${person.relation}</td>
											</tr>
											<tr>
											
											 
										</table>
										
									 
										

									</td>
									
									<td valign="top">
									<td><img
										style="width: 275px; height: auto; margin-top: -52px"
										src="${pageContext.request.contextPath}/photos/customers/${account}.jpg"
										alt="user avatar" /></td>

									</td>

								</tr>
							</table>
					 
						

					</div>


				</div>

			</div>
		</div>
	</div>




</div>







<%@include file="../layout/footer.jsp"%>
 
