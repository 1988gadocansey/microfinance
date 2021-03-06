<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp" %>

<div id="page_content">
    <div id="page_content_inner">
        
        <h6 class="heading_b uk-margin-bottom">Accounts</h6>
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
				  <a href="/management/accounts" ><i   title="reload this page" class="uk-icon-refresh uk-icon-medium "></i></a>
      


            </div>
        </div>
        <div class="uk-width-xLarge-1-1">
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
        <p>&nbsp</p>
        <div class="uk-width-xLarge-1-10">
            <div class="md-card">
                <div class="md-card-content" style="">


                   
                        <div class="uk-overflow-container" id='print'>
                               <table class="uk-table uk-table-hover   uk-table-align-vertical uk-table-nowrap tablesorter tablesorter-altair" id="ts_pager_filter"> 
                                <thead>
                                    <tr>
                                        <th class="filter-false remove sorter-false" data-priority="6">NO</th>
                                        <th>ACCOUNT NAME</th>
                                        <th style="text-align:">ACCOUNT NUMBER</th>

                                        
                                        <th  style="text-align:">ACCOUNT TYPE</th>
                                        <th  style="text-align:">DATE CREATED</th>
                                       
                                      
                                        <th style="text-align:">CREATED BY</th>
                                        
                                        <th  class="filter-false remove sorter-false uk-text-" colspan="2" data-priority="1">ACTION</th>   

                                    </tr>
                                </thead>
                                <tbody>
                                    <tbody>
                                       <c:forEach var="object" items="${account}">
                                         <tr>
                                         		  <td>${object.id}</td>
                                               <td>${object.name}</td>
                                                 <td>${object.number}</td>
                                                 <td>${object.type}</td>    
                                             <td>${object.created}</td>
                                               <td>${object.owner}</td>
                                            <td class="uk-text-nowrap">
                                                <a href="/management/accounts/show/${object.id}"><i class="material-icons md-24">&#xE8F4;</i></a> 
                                                <a href="/management/accounts/edit/${object.id}" class="uk-margin-left"><i class="material-icons md-24">edit</i></a>
                                                
                                            </td>
                                          
                                        </tr>
                                        </c:forEach>
                                          
                                    </tbody>
                                    
                             </table>
                        </div>
                   
                </div>
                <div class="md-fab-wrapper">
        <a title="Add new customer"class="md-fab md-fab-small md-fab-accent md-fab-wave" href="/management/customers/create">
            <i class="material-icons md-18">&#xE145;</i>
        </a>
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

