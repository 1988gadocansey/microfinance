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
		<h6 class="heading_b uk-margin-bottom">Customer Details with Latest Transactions</h6>


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
								ACCOUNT INFORMATION AS AT
								<%java.text.DateFormat df = new java.text.SimpleDateFormat("d/M/Y") ; %>
								<%= df.format(new java.util.Date()) %>
							</h5>
						</center>
						<hr>
						 
						<c:forEach var="client" items="${person}">

							<table>
								<tr>
									 
									<td>
										<table class="uk-table uk-table-nowrap ">

											<tr>
												<td width="210" class="uppercase" align="right"><strong>ACCOUNT
														NAME</strong></td>
												<td width="408" class="capitalize">${client.getName()}</td>
											</tr>
											<tr>
												<td width="210" class="uppercase" align="right"><strong>ACCOUNT
														N<u>O</u>
												</strong></td>
												<td width="408" class="capitalize">${client.number}</td>
											</tr>
											<tr>
												<td class="uppercase" align="right"><strong>ACCOUNT
														TYPE:</strong></td>
												<td class="uk-text-upper">${client.type}</td>
											</tr>
											<tr>
												<td class="uppercase" align="right"><strong>ACCOUNT
														BALANCE </td>
												<td class="capitalize">GHS${balance}</td>
											</tr>
											<tr>
												<td class="uppercase" align="right"><strong>CUSTOMER SINCE</strong></td>
												<td class="capitalize">${client.created}</td>
											</tr>
											

										</table>

									</td>
									<td valign="top">
									<td><img
										style="width: 275px; height: auto; margin-top: -52px"
										src="${pageContext.request.contextPath}/photos/customers/${client.number}.jpg"
										alt="user avatar" /></td>

									</td>

								</tr>
							</table>
						</c:forEach>
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
<script
	src="${pageContext.request.contextPath}/assets/js/select2.full.min.js"></script>
<script>

                        $(document).ready(function () {
                            $('select').select2({width: "resolve"});


                        });


</script>

<script>


//code for ensuring vuejs can work with select2 select boxes
    Vue.directive('select', {
        twoWay: true,
        priority: 1000,
        params: ['options'],
        bind: function () {
            var self = this
            $(this.el)
                    .select2({
                        data: this.params.options,
                        width: "resolve"
                    })
                    .on('change', function () {
                        self.vm.$set(this.name, this.value)
                        Vue.set(self.vm.$data, this.name, this.value)
                    })
        },
        update: function (newValue, oldValue) {
            $(this.el).val(newValue).trigger('change')
        },
        unbind: function () {
            $(this.el).off().select2('destroy')
        }
    })


    var vm = new Vue({
        el: "body",
        ready: function () {
        },
        data: {
            options: [
            ],
            in_payment_section: false,
        },
        methods: {
            go_to_payment_section: function (event) {
                UIkit.modal.confirm(vm.$els.confirm_modal.innerHTML, function () {

                    vm.$data.in_payment_section = true
                })

            },
            submit_form: function () {
                return (function (modal) {
                    modal = UIkit.modal.blockUI("<div class='uk-text-center'>Saving Data<br/><img class='uk-thumbnail uk-margin-top' src='${pageContext.request.contextPath}/assets/img/spinners/spinner_success.gif' /></div>");
                    setTimeout(function () {
                        modal.hide()
                    }, 50000)
                })();
            },
            go_to_fill_form_section: function (event) {
                vm.$data.in_payment_section = false
            }
        }
    })

</script>

