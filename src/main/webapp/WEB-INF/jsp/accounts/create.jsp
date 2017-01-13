<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>
<style>
input {
	text-transform: uppercase;
}

select {
	text-transform: uppercase;
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

		<h6 class="heading_a uk-margin-bottom uk-text-success">Account
			Opening Form</h6>
		<c:if test="${not empty success}">
			<div style="text-align: center" class="uk-alert uk-alert-success"
				data-uk-alert="">
				<c:out value="${success}" />
			</div>
		</c:if>
		<c:if test="${not empty error}">
			<div style="text-align: center" class="uk-alert uk-alert-danger"
				data-uk-alert="">
				<c:out value="${error}" />
			</div>
		</c:if>


		<div class="uk-width-xLarge-1-10">
			<form commandName="account"  method="POST"  action="/account/open" class="uk-form-stacked" id="user_edit_form">
				        
				          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				  <input type="hidden" name="customer" value="${customer.id}"/>
				 <input type="hidden" name="phone" value="${customer.mobile}"/>
				 <input type="hidden" name="custName" value="${customer.getName()}"/>
				
				<div class="uk-grid" data-uk-grid-margin>
					<div class="uk-width-large-7-10">
						<div class="md-card">
							<div class="user_heading"
								data-uk-sticky="{ top: 48, media: 960 }">
								<div class="user_heading_avatar fileinput fileinput-new"
									data-provides="fileinput">
									<div class="fileinput-new thumbnail">
										<img
											src="${pageContext.request.contextPath}/photos/customers/gad.jpg"
											alt="user avatar" />
									</div>
									<div class="fileinput-preview fileinput-exists thumbnail"></div>
									<div class="user_avatar_controls">
										<span class="btn-file"> <span class="fileinput-new"><i
												class="material-icons">&#xE2C6;</i></span> <span
											class="fileinput-exists"><i class="material-icons">&#xE86A;</i></span>
											<input type="file" name="user_edit_avatar_control"
											id="user_edit_avatar_control">
										</span> <a href="#" class="btn-file fileinput-exists"
											data-dismiss="fileinput"><i class="material-icons">&#xE5CD;</i></a>
									</div>
								</div>
								<div class="user_heading_content">
									<h2 class="heading_b">
										<span class="uk-text-truncate" id="user_edit_uname"><c:out
												value="${customer.getName()}" /></span><span class="sub-heading"
											id="user_edit_position"><c:out
												value="${customer.getJob()}" /></span>
									</h2>
								</div>
								<div class="md-fab-wrapper">
									<div class="md-fab md-fab-toolbar md-fab-small md-fab-accent">
										<i class="material-icons">&#xE8BE;</i>
										<div class="md-fab-toolbar-actions">
											<button type="submit" id="user_edit_save"
												data-uk-tooltip="{cls:'uk-tooltip-small',pos:'bottom'}"
												title="Save">
												<i class="material-icons md-color-white">&#xE161;</i>
											</button>
											 
										</div>
									</div>
								</div>
							</div>
							<div class="user_content">
								<ul id="user_edit_tabs" class="uk-tab"
									data-uk-tab="{connect:'#user_edit_tabs_content'}">
									<li class="uk-active"><a href="#">Biodata</a></li>
									<li><a href="#">Open Account</a></li>

								</ul>
								<ul id="user_edit_tabs_content" class="uk-switcher uk-margin">
									<li>
										<div class="uk-margin-top">
											<h3 class="full_width_in_card heading_c">General info</h3>
											<div class="uk-grid" data-uk-grid-margin>
												<div class="uk-width-medium-1-2">
													<label for="user_edit_uname_control">Name</label> <input
														class="md-input" type="text" readonly=""
														id="user_edit_uname_control" value="${customer.getName()}" />
												</div>
												<div class="uk-width-medium-1-2">
													<label for="user_edit_position_control">Occupation</label>
													<input class="md-input" type="text" readonly=""
														id="user_edit_position_control" value="${customer.job}" />
												</div>
											</div>


											<h3 class="full_width_in_card heading_c">Contact info</h3>
											<div class="uk-grid">
												<div class="uk-width-1-1">
													<div
														class="uk-grid uk-grid-width-1-1 uk-grid-width-large-1-2"
														data-uk-grid-margin>
														<div>
															<div class="uk-input-group">
																<span class="uk-input-group-addon"> <i
																	class="md-list-addon-icon material-icons">&#xE158;</i>
																</span> <label>Address</label> <input type="text" readonly=""
																	class="md-input" value="${customer.address}" />
															</div>
														</div>
														<div>
															<div class="uk-input-group">
																<span class="uk-input-group-addon"> <i
																	class="md-list-addon-icon material-icons">&#xE0CD;</i>
																</span> <label>Phone Number</label> <input type="text"
																	readonly="" class="md-input" value="${customer.mobile}" />
															</div>
														</div>


													</div>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="uk-margin-top">
											<h3 class="full_width_in_card heading_c">Account Opening
												Section</h3>
											<div class="uk-grid" data-uk-grid-margin>
												<div class="uk-width-medium-1-2">
													<label for="user_edit_uname_control">Account Name</label> <input
														class="md-input" type="text" id="user_edit_uname_control"
														required="" name="name" />
												</div>
												<div class="uk-width-medium-1-2">
													<label for="user_edit_position_control">Account
														Number</label> <input class="md-input" type="text"
														id="user_edit_position_control" required="" name="number" />
												</div>
											</div>

											<div class="uk-grid" data-uk-grid-margin>
													<div class="uk-width-medium-1-2">
													<label class="uk-form-label" for="user_edit_role"> 
														Account Type</label> <select   required="required" class="md-input" name="type">
														<option value="">Select Accoun type</option>
														<option value="Susu">Susu Account</option>
														<option value="Child Support">Child Support Account</option>
														<option value="Current" selected>Current Account</option>
														<option value="Savings">Savings</option>
														 
													</select>
												</div>
												<div class="uk-width-medium-1-2">
													<label for="user_edit_position_control">Opening Balance
														Number</label> <input class="md-input" type="text"
														id="user_edit_position_control"   name="balance" />
												</div>

											</div>

										</div>
									</li>

								</ul>
							</div>
						</div>
					</div>
					<div class="uk-width-large-3-10">
						<div class="md-card">
							<div class="md-card-content">
								<h3 class="heading_c uk-margin-medium-bottom">Settings</h3>
								<a href="#new_task" data-uk-modal="{ :true }"> <i
									title="click to send sms to clients"
									class="material-icons md-36 uk-text-success">phonelink_ring</i></a>



							</div>
						</div>
					</div>
				</div>

			</form>
		</div>

	</div>
</div>
<div class="uk-modal" id="confirm_modal">
	<div class="uk-modal-dialog" v-el:confirm_modal>
		<div
			class="uk-modal-header uk-text-large uk-text-success uk-text-center">Confirm
			Data</div>
		Are you certain of all the info
		<div class="uk-modal-footer "></div>
	</div>
</div>
</div>

</div>




<%@include file="../layout/footer.jsp"%>
<script
	src="${pageContext.request.contextPath}/assets/js/select2.full.min.js"></script>
	<script>
  
$(document).ready(function(){
  $('select').select2({ width: "resolve" });

  
});


</script>
<!-- file input -->
<script
	src="${pageContext.request.contextPath}/assets/js/custom/uikit_fileinput.min.js"></script>

<!--  user edit functions -->
<script
	src="${pageContext.request.contextPath}/assets/js/pages/page_user_edit.min.js"></script>



<script>


//code for ensuring vuejs can work with select2 select boxes
Vue.directive('select', {
  twoWay: true,
  priority: 1000,
  params: [ 'options'],
  bind: function () {
    var self = this
    $(this.el)
      .select2({
        data: this.params.options,
         width: "resolve"
      })
      .on('change', function () {
        self.vm.$set(this.name,this.value)
        Vue.set(self.vm.$data,this.name,this.value)
      })
  },
  update: function (newValue,oldValue) {
    $(this.el).val(newValue).trigger('change')
  },
  unbind: function () {
    $(this.el).off().select2('destroy')
  }
})


var vm = new Vue({
  el: "body",
  ready : function() {
  },
 data : {
   
    
 options: [      
    ],
    in_payment_section : false,
  },
  methods : {
    go_to_payment_section : function (event){
    UIkit.modal.confirm(vm.$els.confirm_modal.innerHTML, function(){
        
      vm.$data.in_payment_section=true
})

    },
    submit_form : function(){
      return (function(modal){ modal = UIkit.modal.blockUI("<div class='uk-text-center'>Create Account<br/><img class='uk-thumbnail uk-margin-top' src='${pageContext.request.contextPath}/assets/img/spinners/spinner_success.gif' /></div>"); setTimeout(function(){ modal.hide() }, 50000) })();
    },
        
    go_to_fill_form_section : function (event){    
      vm.$data.in_payment_section=false
    }
  }
})

</script>