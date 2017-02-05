<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp" %>
<style>
input{
	text-transform: uppercase;
}
select{
	text-transform: uppercase;
}
</style>
<div id="page_content">
	<div id="page_content_inner">

  
		<h6 class="heading_b uk-margin-bottom">Customers</h6>

		<%-- <c:if test="${success!=''}">
		<div style="text-align: center" class="uk-alert uk-alert-success"
			data-uk-alert=""><c:out value="${success}"/></div>
		 </c:if>
		
		 <c:if test="${error!=''}">
		<div style="text-align: center" class="uk-alert uk-alert-danger"
			data-uk-alert=""><c:out value="${error}"/></div>
		</c:if> --%>
		
		<div class="uk-width-xLarge-1-10">
			<div class="md-card">
				<div class="md-card-content" style="">
				
					 <form commandName="customer" novalidate id="wizard_advanced_form" class="uk-form-stacked"   action="" method="post" accept-charset="utf-8"  name="updateForm"  v-form>

                
                <div data-uk-observe="" id="wizard_advanced" role="application" class="wizard clearfix">
                    <div class="steps clearfix">
                        <ul role="tablist">
                            <li role="tab" class="fill_form_header first current" aria-disabled="false" aria-selected="true" v-bind:class="{ 'error' : !in_payment_section}">
                                <a aria-controls="wizard_advanced-p-0" href="#wizard_advanced-h-0" id="wizard_advanced-t-0">
                                    <span class="current-info audible">current step: </span><span class="number">1</span> <span class="title">Biodata Gathering</span>
                                </a>
                            </li>
                            <li role="tab" class="payment_header disabled" aria-disabled="true"   v-bind:class="{ 'error' : in_payment_section}" >
                                <a aria-controls="wizard_advanced-p-1" href="#wizard_advanced-h-1" id="wizard_advanced-t-1">
                                    <span class="number">2</span> <span class="title">Step 2</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class=" clearfix " style="box-sizing: border-box;display: block;padding:15px!important;position: relative;">

                        <!-- first section -->
                      
                        <section id="fill_form_section" role="tabpanel" aria-labelledby="fill form section" class="body step-0 current" data-step="0" aria-hidden="false"   v-bind:class="{'uk-hidden': in_payment_section} ">

                            <div data-uk-grid-margin="" class="uk-grid uk-grid-width-medium-1-4 uk-grid-width-large-1-4">


                                <div class="parsley-row">
                                    <div class="uk-input-group">

                                        <div class="md-input-wrapper md-input-filled"><label for="wizard_referer">First Name :</label><input type="text" id="firstname" name="firstname" class="md-input"   required="required"  value="${customer.firstname}"   v-model="firstname"  v-form-ctrl><span class="md-input-bar"></span></div>                
                                        <p  class=" uk-text-danger uk-text-small  "   v-if="updateForm.firstname.$error.required">Please enter your first name</p>                                      
                                    </div>
                                </div>

                                <div class="parsley-row">
                                    <div class="uk-input-group">

                                        <div class="md-input-wrapper md-input-filled"><label for="wizard_referer">Last Name :</label><input type="text" id="lastname" name="lastname" class="md-input"   required="required"       v-model="lastname"  v-form-ctrl><span class="md-input-bar"></span></div>                
                                        <p  class=" uk-text-danger uk-text-small  "   v-if="updateForm.lastname.$error.required">Please enter your lastname</p>                                      
                                    </div>
                                </div>

                                <div class="parsley-row">
                                    <div class="uk-input-group">

                                        <div class="md-input-wrapper md-input-filled"><label for="wizard_skype">Other Names :</label><input type="text" id="oname" name="othername" v-form-ctrl  class="md-input"    v-model="othername"      /><span class="md-input-bar"></span></div>         

                                    </div>
                                </div>
								       <div class="parsley-row">
                                    <div class="uk-input-group">

                                        <label for="">Title :</label>     
                                        <div class="md-input-wrapper md-input-filled">
                                        <select   name='title' id="title"   v-model="title" v-select="title" v-form-ctrl required="">
                                                <option value=''>Select   Title</option>
                                                <option  value='MR'>Mr</option>
                                                <option  value='MRS'>Mrs</option>
                                                <option  value='MISS'>Miss</option>
                                                <option  value='REV'>Rev</option>
                                                <option  value='PhD'>Dr</option>
                                                <option  value='PROF'>Prof</option>
                                                
                                            </select>
                                        </div>    
                                        <p class="uk-text-danger uk-text-small"  v-if="updateForm.title.$error.required">Title is required</p>                                        
                                    </div>
                                </div>
                                 
                            </div>
	<div data-uk-grid-margin="" class="uk-grid uk-grid-width-medium-1-4 uk-grid-width-large-1-4">


                                <div class="parsley-row">
                                    <div class="uk-input-group">

                                        <label for="">Gender :</label>     
                                        <div class="md-input-wrapper md-input-filled">
                                        	<select   name='gender' id="gender"   v-model="gender" v-select="gender" v-form-ctrl required="">
                                                <option value=''>Select Gender</option>
                                                <option  value='MALE'>Male</option>
                                                <option  value='FEMALE'>Female</option>
                                                 
                                                
                                            </select>
                                        		
                                             <span class="md-input-bar"></span>
                                        </div>    
                                        <p class="uk-text-danger uk-text-small"  v-if="updateForm.gender.$error.required">Gender is required</p>                                        
                                    </div>
                                </div>
                                <div class="parsley-row">
                                    <div class="uk-input-group">

                                        <label for="">Marital Status :</label>     
                                        <div class="md-input-wrapper md-input-filled">
													<select name='marital' id="marital" v-model="marital"
														v-select="marital" v-form-ctrl required="">
														<option value=''>Select Marital Status</option>
														<option value='MARRIED'>Married</option>
														<option value='SINGLE'>Single</option>
														<option value='DIVORCED'>Divorced</option>
														<option value='ENGAGED'>Engaged</option>


													</select> <span class="md-input-bar"></span>
                                        </div>    
                                        <p class="uk-text-danger uk-text-small"  v-if="updateForm.marital_status.$error.required">Marital Status is required</p>                                        
                                    </div>
                                </div>
                                <div class="parsley-row">
                                    <div class="uk-input-group">

                                        <div class="md-input-wrapper md-input-filled"><label for="wizard_referer">Phone N<u>o</u> :</label><input type="text" id="mobile" name="mobile" class="md-input" data-parsley-type="digits" minlength="10"  required="required"   maxlength="10"   pattern='^[0-9]{10}$'  v-model="mobile"  v-form-ctrl><span class="md-input-bar"></span></div>                
                                        <p  class=" uk-text-danger uk-text-small  "   v-if="updateForm.mobile.$invalid">Please enter a valid mobile number of 10 digits</p>                                      
                                    </div>
                                </div>



                                <div class="parsley-row">
                                    <div class="uk-input-group">

                                        <div class="md-input-wrapper md-input-filled"><label for="wizard_twitter">Date of Birth :</label><input type="text" name="dob" class="md-input" data-uk-datepicker="{format:'DD/MM/YYYY'}" required="required"  v-model="dob"  v-form-ctrl   ><span class="md-input-bar"></span></div>
                                        <p class="uk-text-danger uk-text-small " v-if="updateForm.dob.$error.required" >Date of birth is required</p>                                           
                                    </div>
                                </div>

                            </div>
	
                              
                            
                            <div data-uk-grid-margin="" class="uk-grid uk-grid-width-medium-1-4 uk-grid-width-large-1-4">


                               <div class="parsley-row">
                                    <div class="uk-input-group">

                                        <div class="md-input-wrapper md-input-filled"><label for="wizard_referer">Occupation :</label><input type="text" id="job" name="job" class="md-input"   required="required"      v-model="job"  v-form-ctrl><span class="md-input-bar"></span></div>                
                                        <p  class=" uk-text-danger uk-text-small  "   v-if="updateForm.job.$error.required">occupation is required</p>                                      
                                    </div>
                                </div>
                                <div class="parsley-row">
                                    <div class="uk-input-group">

                                        <div class="md-input-wrapper md-input-filled"><label for="wizard_referer">Hometown :</label><input type="text" id="hometown" name="hometown" class="md-input"   required="required"      v-model="hometown"  v-form-ctrl><span class="md-input-bar"></span></div>                
                                        <p  class=" uk-text-danger uk-text-small  "   v-if="updateForm.hometown.$error.required">Hometown is required</p>                                      
                                    </div>
                                </div>
                                         <div class="parsley-row">
                                    <div class="uk-input-group">

                                        <div class="md-input-wrapper md-input-filled"><label for="wizard_skype">Home Address :</label><input type="text" id="address" name="address"  required=""v-form-ctrl  class="md-input"    v-model="address"      /><span class="md-input-bar"></span></div>         
                                         <p class="uk-text-danger uk-text-small " v-if="updateForm.address.$error.required" >Home address is required</p>                                           
                              
                                    </div>
                                </div>
                                <div class="parsley-row">
                                    <div class="uk-input-group">

                                        <div class="md-input-wrapper md-input-filled"><label for="wizard_referer">Contact Address
                                                :</label><input type="text" id="resident" name="resident" class="md-input"   required="required"    v-model="resident"  v-form-ctrl><span class="md-input-bar"></span></div>                
                                        <p  class=" uk-text-danger uk-text-small  "   v-if="updateForm.resident.$error.required">resident resident is required</p>                                      
                                    </div>
                                </div>

                            </div>
                            
					<div data-uk-grid-margin="" class="uk-grid uk-grid-width-medium-1-4 uk-grid-width-large-1-4">


                               <div class="parsley-row">
                                    <div class="uk-input-group">

                                        <div class="md-input-wrapper md-input-filled"><label for="wizard_referer">Beneficiary Name:</label><input type="text" id="beneficiary" name="beneficiary" class="md-input"   required="required"      v-model="beneficiary"  v-form-ctrl><span class="md-input-bar"></span></div>                
                                        <p  class=" uk-text-danger uk-text-small  "   v-if="updateForm.beneficiary.$error.required">Beneficiary name is required</p>                                      
                                    </div>
                                </div>
                                <div class="parsley-row">
                                    <div class="uk-input-group">

                                        <div class="md-input-wrapper md-input-filled"><label for="wizard_referer">Relationship to Beneficiary :</label><input type="text" id="relation" name="relation" class="md-input"   required="required"      v-model="relation"  v-form-ctrl><span class="md-input-bar"></span></div>                
                                        <p  class=" uk-text-danger uk-text-small  "   v-if="updateForm.relation.$error.required">Relationship is required</p>                                      
                                    </div>
                                </div>
                                         <div class="parsley-row">
                                    <div class="uk-input-group">

                                        <div class="md-input-wrapper md-input-filled"><label for="wizard_skype">Religious Denomination :</label><input type="text" id="denomination" name="denomination"  required=""v-form-ctrl  class="md-input"    v-model="denomination"      /><span class="md-input-bar"></span></div>         
                                         <p class="uk-text-danger uk-text-small " v-if="updateForm.denomination.$error.required" >Religious denomination is required</p>                                           
                              
                                    </div>
                                </div>
                                 <div class="parsley-row">
                                    <div class="uk-input-group">
                                        
                                         <div class="md-input-wrapper md-input-filled"><label for="wizard_email">Email :</label><input type="email" id="email" name="email" class="md-input"   v-model="email"v-form-ctrl  ><span class="md-input-bar"></span></div>                                            
                                         <p class="uk-text-danger uk-text-small "  v-if="updateForm.email.$invalid"  >Please enter a valid email resident</p>
                                    
                                    </div>
                                </div>

                            </div>

      </section>

      <!-- second section -->
      
      <section id="payment_section" role="tabpanel" aria-labelledby="payment section" class="body step-1 "  v-bind:class="{'uk-hidden': !in_payment_section} "  data-step="1"  aria-hidden="true">
        <h2 class="heading_a">
         
     <div data-uk-grid-margin="" class="uk-grid uk-grid-width-medium-1-4 uk-grid-width-large-1-4">

 			 <div class="parsley-row" style="margin-left:80px">
                                    <div class="uk-input-group">

                                        <label for="">ID Type</label>     
                                         <div class="md-input-wrapper md-input-filled">
													<select name='type' id="type" class="md-input"  v-model="type"  v-select="type"  v-form-ctrl  >
														<option value=''>Select ID Type</option>
														
														<option value='Voters ID'>Voters ID</option>
														<option value='Passport'>Passport</option>
														<option value='License'>Drivers License</option>
											 	 		<option value='Not available'>Not available</option>

													</select> <span class="md-input-bar"></span>
                                        </div>       
                                        
                                    </div>
                                </div>
                                   
                                  <div class="parsley-row" v-if ="type =='Voters ID'">
                                    <div class="uk-input-group">

                                         
                                       <div class="md-input-wrapper md-input-filled"><label for="wizard_referer">ID Number:</label><input type="text" id="hostel" name="number" class="md-input"     v-model="hostel"  v-form-ctrl><span class="md-input-bar"></span></div>                
                                        <p  class=" uk-text-danger uk-text-small  "   v-if="updateForm.hostel.$error.required">Number Name is required</p>                                      
                                    

                                       </div>
                              </div>
         
     </div>

      </section>

</div>
<div class="actions clearfix "  >
    <ul aria-label="Pagination" role="menu">
        <li class="button_previous " aria-disabled="true"  v-on:click="go_to_fill_form_section()"  v-show="in_payment_section==true"  >
            <a role="menuitem" href="#previous" >
                <i class="material-icons"></i> Previous
            </a>
        </li>
        <li class="button_next button"   v-on:click="go_to_payment_section()"  aria-hidden="false" aria-disabled="false"  v-show="updateForm.$valid && in_payment_section==false"  > 
            <a role="menuitem" href="#next"  >Next 
                <i class="material-icons">
                </i>
            </a>
        </li>
        <li class="button_finish "    aria-hidden="true"  v-show="updateForm.$valid && in_payment_section==true"  >
            <input class="md-btn md-btn-primary uk-margin-small-top" type="submit" name="submit_order"  value="Submit"   v-on:click="submit_form"  />
        </li>
    </ul>
</div>
</div>
                                              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                         </form>
					
				
				</div>
			</div>
		</div>


 

	</div>
</div>
 <div class="uk-modal" id="confirm_modal"   >
                <div class="uk-modal-dialog"  v-el:confirm_modal>
                    <div class="uk-modal-header uk-text-large uk-text-success uk-text-center" >Confirm Data</div>
                    Are you certain of all the info
                     <div class="uk-modal-footer ">
        
        </div>  
                </div>
            </div>
        </div>

    </div>

 


<%@include file="../layout/footer.jsp" %>
<script src="${pageContext.request.contextPath}/assets/js/select2.full.min.js"></script>
  <script>
  
$(document).ready(function(){
  $('select').select2({ width: "resolve" });

  
});


</script>   

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
	  
	 lastname:"${customer.lastname}",
	 othername:"${customer.othername}",
	 title:"${customer.title}",
	 gender:"${customer.gender}",
	 marital:"${customer.marital}",
	 mobile:"${customer.mobile}",
	 dob:"${customer.dob}",
	 job:"${customer.job}",
	 hometown:"${customer.hometown}",
	 address:"${customer.address}",
	 resident:"${customer.resident}",
	 beneficiary:"${customer.beneficiary}",
	 relation:"${customer.relation}",
	 denomination:"${customer.denomination}",
	 email:"${customer.email}",
	 type:"${customer.type}",
	 hostel:"${customer.number}",
	
    
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
      return (function(modal){ modal = UIkit.modal.blockUI("<div class='uk-text-center'>Saving Data<br/><img class='uk-thumbnail uk-margin-top' src='${pageContext.request.contextPath}/assets/img/spinners/spinner_success.gif' /></div>"); setTimeout(function(){ modal.hide() }, 50000) })();
    },
        
    go_to_fill_form_section : function (event){    
      vm.$data.in_payment_section=false
    }
  }
})

</script>