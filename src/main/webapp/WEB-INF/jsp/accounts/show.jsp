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
		 
		<h6 class="heading_c uk-margin-bottom">Account Details with Latest Transactions</h6>


		<div style="" class="">
		 
			<div class="uk-margin-bottom" style="">
				  <i
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
								ACCOUNT INFO OF ${account.getName()}
							</h5>
						</center>
						<hr>
						 
							<table>
								<tr>

									<td>
										<table class="uk-table uk-table-nowrap ">

											<tr>
											<td width="210" class="uppercase" align="right"><strong>ACCOUNT NAME</strong></td>
												<td width="408" class="capitalize">${account.getName()}</td>
											</tr>
											<tr>
												<td class="uppercase" align="right"><strong>ACCOUNT NUMBER
														</strong></td>
												<td class="uk-text-upper">${account.number}</td>
											</tr>
											<tr>
												<td width="210" class="uppercase" align="right"><strong>ACCOUNT 
														TYPE<u>O</u>
												</strong></td>
												<td width="408" class="capitalize">${account.type}</td>
											</tr>
											<tr>
												<td class="uppercase" align="right"><strong>DATE CREATED</strong></td>
												<td class="uk-text-upper">${account.created}</td>
											</tr>
											<tr>
												<td class="uppercase" align="right"><strong>ACCOUNT BALANCE
													</strong></td>
												<td class="uk-text-upper">${balance}</td>
											</tr>
											 
											
											 
										</table>
										
									 
										

									</td>
									
									<td valign="top">
									<td><img
										style="width: 275px; height: auto; margin-top: -52px"
										src="${pageContext.request.contextPath}/photos/customers/${account.number}.jpg"
										alt="user avatar" /></td>

									</td>

								</tr>
							</table>
					 <fieldset class="">
							<legend class="uk-text-bold heading_c">LATEST TRANSACTIONS
								 </legend>
							<table class="uk-table uk-table-nowrap">
								<thead>
									<tr>
										<th>ID</th>
										<th>DATE</th>
										<th>DESCRIPTION</th>
										<th>TYPE</th>
										<th>AMOUNT</th>
										
									</tr>
								</thead>
								<tbody>
									<% double amount=0.00; %>
							
									<c:forEach var="tran" items="${transaction}">
										<% //double total=Double.parseDouble(tran.type.toString()); %>
									
										<tr>
											<td>${tran.id}</td>
											<td>${tran.date}</td>
											<td>${tran.description}</td>
											<td> ${tran.type}</td>
											<td>GHS${tran.amount}</td>
										</tr>

									</c:forEach>
								</tbody>
							</table>
						</fieldset>
					 
						

					</div>


				</div>

			</div>
		</div>
	</div>




</div>







<%@include file="../layout/footer.jsp"%>
 
