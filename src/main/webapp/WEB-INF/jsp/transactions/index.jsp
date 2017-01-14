<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp" %>

<div id="page_content">
    <div id="page_content_inner">
        
        <h6 class="heading_b uk-margin-bottom">Transactions Ledger</h6>
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
        <div style="" class="">
            <!--    <div class="uk-margin-bottom" style="margin-left:910px" >-->
            <div class="uk-margin-bottom" style="" >
                <a  href="#new_task" data-uk-modal="{ :true }"> <i title="click to send sms to students"   class="material-icons md-36 uk-text-success"   >phonelink_ring message</i></a>

                <a href="#" class="md-btn md-btn-small md-btn-success uk-margin-right" id="printTable">Print Table</a>
                <div class="uk-button-dropdown" data-uk-dropdown="{mode:'click'}">
                    <button class="md-btn md-btn-small md-btn-success"> columns <i class="uk-icon-caret-down"></i></button>
                    <div class="uk-dropdown">
                        <ul class="uk-nav uk-nav-dropdown" id="columnSelector"></ul>
                    </div>
                </div>




                <div style="margin-top: -5px" class="uk-button-dropdown" data-uk-dropdown="{mode:'click'}">
                    <button class="md-btn md-btn-small md-btn-success uk-margin-small-top">Export <i class="uk-icon-caret-down"></i></button>
                    <div class="uk-dropdown">
                        <ul class="uk-nav uk-nav-dropdown">

                            <li class="uk-nav-divider"></li>
                            <li><a href="#" onClick ="$('#ts_pager_filter').tableExport({type: 'excel', escape: 'false'});"><img src='{!! url("public/assets/icons/xls.png")!!}' width="24"/> Excel</a></li>
                            <li class="uk-nav-divider"></li>

                        </ul>
                    </div>
                </div>




                <i title="click to print" onclick="javascript:printDiv('print')" class="material-icons md-36 uk-text-success"   >print</i>
				  <a href="/transactions/view" ><i   title="reload this page" class="uk-icon-refresh uk-icon-medium "></i></a>
      


            </div>
        </div>
<!--        <div class="uk-width-xLarge-1-1">
            <div class="md-card">
                <div class="md-card-content">

					<form action="/account/search" method="GET" accept-charset="utf-8" 
						id="group"  >
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="uk-grid" data-uk-grid-margin="">
							
							 

							<div class="uk-width-medium-1-5">
								<div class="uk-margin-small-top">
									<input type="text" style="" required="" name="account"
										class="md-input"
										placeholder=" Account number  ">
								</div>
							</div>
						 
							<div class="uk-width-medium-1-5">
								<div class="uk-margin-small-top">

									<button
										class="md-btn  md-btn-small md-btn-success uk-margin-small-top"
										type="submit">
										<i class="material-icons">search</i>
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
            </div>
        </div>
        <p>&nbsp</p>-->
        <div class="uk-width-xLarge-1-10">
            <div class="md-card">
                <div class="md-card-content" style="">


                   
                        <div class="uk-overflow-container" id='print'>
                               <table class="uk-table uk-table-hover   uk-table-align-vertical uk-table-nowrap tablesorter tablesorter-altair" id="ts_pager_filter"> 
                                <thead>
                                    <tr>
                                        <th class="filter-false remove sorter-false" data-priority="6">NO</th>
                                         <th  style="text-align:">DATE</th>
                                        <th>ACCOUNT NUMBER</th>
                                        <th style="text-align:">DESCRIPTION</th>

                                        
                                        <th  style="text-align:">TYPE</th>
                                        <th  style="text-align:">AMOUNT</th>
                                       
                                      
                                        <th style="text-align:">CREATED BY</th>
                                        
                                          

                                    </tr>
                                </thead>
                                <tbody>
                                    <tbody>
                                       <c:forEach var="transaction" items="${object}">
                                         <tr>
                                         		  <td>${transaction.id}</td>
                                               <td>${transaction.date}</td>
                                                 <td>${transaction.accountNumber}</td>
                                                 <td>${transaction.description}</td>    
                                             <td>${transaction.type}</td>
                                               <td>${transaction.amount}</td>
                                               <td>${transaction.owner}</td>
                                            
                                          
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

