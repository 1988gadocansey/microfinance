<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp" %>
    
<div id="page_content">
    <div id="page_content_inner">
         <h6 class="heading_a uk-margin-bottom">Account Withdrawals</h6> 

         
        <div class="uk-width-xLarge-1-10">
            <div class="md-card">
                <div class="md-card-content" style="">

	 
	  				<center>	<h4 class="uk-text-bold uk-text-danger">Make sure the correct amount is accepted into the system!!!</h4></center>
               <hr>
             
           <form id='form' method="POST" action="/transactions/accounts/withdrawals" accept-charset="utf-8"  name="applicationForm"  v-form>
                 <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
            
            <div class="uk-grid" data-uk-grid-margin data-uk-grid-match="{target:'.md-card-content'}">
                <div class="uk-width-medium-1-2">
                              <div class="uk-overflow-container">
                                <table>
                                                      
                                           
                                        
                                        
                                        
                                        <tr>
                                            <td align=""> <div  align="right" class="uk-text-primary">Amount withdrawing GHC</div></td>
                                        <td>
                                            <input type="text"  required=""  v-model="amount" v-form-ctrl=""    id="amount"  required="" name="amount"  class="md-input">
                                          
                                            
                                            
                                        </td>
                                        </tr>
                                         
                                    </table>
                                <p></p>
                                    
                                <center>
                     
                         <button  v-show="applicationForm.$valid" type="submit" class="md-btn md-btn-primary"><i class="fa fa-save" ></i>Withdraw</button>
                    
                  
            </center>
                            </div>
                        </div>
                     
                <div class="uk-width-medium-1-2">
                         <c:forEach var="client" items="${account}">
                        
                            <table>
                                <tr>
                                    <td>
                                        <table>
                                             
                                        <tr>
                                            <td  align=""> <div  align="right" >Account Name:</div></td>
                                        <td>
                                        ${client.name}
                                            
                                        </td>
                                        </tr>
                                        <tr>
                                            <td  align=""> <div  align="right" >Account Number:</div></td>
                                        <td>
                                           ${client.getNumber()} 
                                              
                                        </td>
                                        </tr>
                                        <tr>
                                            <td  align=""> <div  align="right" >Date Opened:</div></td>
                                        <td>
                                            ${client.created} 
                                        </td>
                                        </tr>
                                        <input type="hidden" name="account" value="${client.getId()}"/>
                                        
                                        <input type="hidden" name="number" value="${client.getNumber()}"/>
                                        </table>
                                    </td>
                                    <td valign="top">
                                        <img
										style="width: 190px; height: auto; margin-top: -12px"
										src="${pageContext.request.contextPath}/photos/customers/gad.jpg"
										alt="user avatar" /></td>
                                        
                                          </td>
                                </tr>
                            </table>
                            
                            </c:forEach>
                                </div>
                    </div>
                  
                </div>
            
            
            
             
    </form>

                
        </div>



</div>
 

  



<%@include file="../layout/footer.jsp" %>
    

<script>
        $(document).ready(function(){
            $("#form").on("submit",function(event){
                event.preventDefault();
       UIkit.modal.alert('Processing Deposit.Please wait.....');
         $(event.target).unbind("submit").submit();
    
                        
            });
            
    
                    
    
    });
</script>
  
   
             
 </div>
  
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
      return (function(modal){ modal = UIkit.modal.blockUI("<div class='uk-text-center'>Saving Data<br/><img class='uk-thumbnail uk-margin-top' src='${pageContext.request.contextPath}/assets/img/spinners/spinner_success.gif' /></div>"); setTimeout(function(){ modal.hide() }, 50000) })();
    },
        
    go_to_fill_form_section : function (event){    
      vm.$data.in_payment_section=false
    }
  }
})

</script>

