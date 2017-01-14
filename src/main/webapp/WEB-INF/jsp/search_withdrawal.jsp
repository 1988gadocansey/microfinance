<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="layout/header.jsp" %>
  <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
 
  <script src="${pageContext.request.contextPath}/assets/js/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
   
<div id="page_content">
    <div id="page_content_inner">
        <center> <h6 class="heading_a uk-margin-bottom">Search by Account Number</h6></center>

         
        <div class="uk-width-xLarge-1-10">
            <div class="md-card">
                <div class="md-card-content" style="">

	 
	 <form method="POST" action="/transactions/withdrawals/interface"  accept-charset="utf-8"  name="applicationForm"  v-form>
                <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
             <div class="uk-grid" data-uk-grid-margin style="margin-left:402px">
                 
                 <div class="uk-width-medium-1-2">
                     <div class="uk-form-row">
                         <div class="uk-grid" data-uk-grid-margin>
                             <div class="uk-width-1-1">

                                 <input type="text" value="" id="q" class="md-input md-input-success" required="" name="account" placeholder="begin typing account number here... " v-model="q" v-form-ctrl=""/>
                             </div>

                         </div>
                     </div>
                     <p>&nbsp;</p>
                    <center> <div class="uk-grid"  >
                         <div class="uk-width-1-1">
                             <input type="submit"  v-show="applicationForm.$valid" class="md-btn md-btn-primary" value="Go"  />
                         </div>
                     </div></center>
                 </div>
             </div>
             </div>
             </form>

                     
                </div>
               
            </div>
        </div>



</div>
 

 <script type="text/javascript">
           //Javascript
$(function()
{
	 $( "#qs" ).autocomplete({
	  source: '${pageContext.request.contextPath}/search/account',
	  minLength: 3,
	  select: function(event, ui) {
	  	$('#q').val(ui.item.Account.number);
                
	  }
	});
});
        </script>
<script type="text/javascript">

    $(function() {      
        $("#q").autocomplete({
            source: function (request, response) {
                $.getJSON("${pageContext.request.contextPath}/search/account", {
                    term: request.term
                }, response);
            }
        });
    });
    
</script>



<%@include file="layout/footer.jsp" %>
    

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

