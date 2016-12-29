<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp" %>

<div id="page_content">
    <div id="page_content_inner">
        <div class="uk-modal" id="new_task">
            <div class="uk-modal-dialog">
                <div class="uk-modal-header">
                    <h4 class="uk-modal-title">Send sms  here</h4>
                </div>
                <> <p>Insert the following placeholders into the message [NAME] [FIRSTNAME] [SURNAME] [INDEXNO] [CGPA] [BILLS] <br/>[BILL_OWING] [PROGRAMME] [PASSWORD]</p></>
                <form action="/system/sms" method="POST">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>



                    <textarea cols="30" rows="4" name="message"class="md-input" required=""></textarea>


                    <div class="uk-modal-footer uk-text-right">
                        <button type="submit" class="md-btn md-btn-flat md-btn-flat-primary md-btn-wave" id="snippet_new_save"><i   class="material-icons"   >smartphone</i>Send</button>    
                        <button type="button" class="md-btn md-btn-flat uk-modal-close md-btn-wave">Close</button>
                    </div>
                </form>
            </div>
        </div>
        <h6 class="heading_b uk-margin-bottom">Customers</h6>

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



            </div>
        </div>
        <div class="uk-width-xLarge-1-1">
            <div class="md-card">
                <div class="md-card-content">

                    <form action=" "  method="get" accept-charset="utf-8" novalidate id="group">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>


                        <div class="uk-grid" data-uk-grid-margin="">

                            <div class="uk-width-medium-1-5">
                                <div class="uk-margin-small-top">

                                </div>
                            </div>
                            <div class="uk-width-medium-1-5">
                                <div class="uk-margin-small-top">

                                </div>
                            </div>

                            <div class="uk-width-medium-1-5">
                                <div class="uk-margin-small-top">

                                </div>
                            </div>



                            <div class="uk-width-medium-1-5">
                                <div class="uk-margin-small-top">                            
                                    <input type="text" style=" "   name="search"  class="md-input" placeholder="search by course name or course code">
                                </div>
                            </div>



                            <div class="uk-width-medium-1-5">
                                <div class="uk-margin-small-top">
                                    <input type="text" style=" "   name="search"  class="md-input" placeholder="search by course name or course code">


                                </div>
                            </div>



                        </div> 
                        <div  align=''>

                            <button class="md-btn  md-btn-small md-btn-success uk-margin-small-top" type="submit"><i class="material-icons">search</i></button> 

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
                            <center><span class="uk-text-success uk-text-bold">4 Records</span></center>
                            <table class="uk-table uk-table-hover uk-table-condensed uk-table-align-vertical uk-table-nowrap tablesorter tablesorter-altair" id="ts_pager_filter"> 
                                <thead>
                                    <tr>
                                        <th class="filter-false remove sorter-false" data-priority="6">NO</th>
                                        <th>NAME</th>
                                        <th style="text-align:">PICTURE</th>

                                        <th  style="text-align:">ACCOUNT NAME</th>
                                        <th  style="text-align:">ACCOUNT NUMBER</th>
                                        <th  style="text-align:">ACCOUNT TYPES</th>
                                        <th>PHONE</th> 
                                        <th style="text-align:">CONTACT ADDRESS</th>

                                        <th style="text-align:">OCCUPATION</th>
                                        
                                        <th  class="filter-false remove sorter-false uk-text-" colspan="2" data-priority="1">ACTION</th>   

                                    </tr>
                                </thead>
                                <tbody>
                                    <tbody>
                                       <c:forEach var="customer" items="${customers}">
                                         <tr>
                                               <td>${customer.firstname}</td>
                                                <td>pic</td>
                                                  <td>Pentecost Church</td>
                                                  <td>45455</td>
                                                   <td>Current</td>
                                                   <td>${customer.getGender()}</td>
                                                    <td>${customer.getFirstname()}</td>
                                                     <td>${customer.getFirstname()}</td>
                                                         <td>${customer.getFirstname()}</td>
                                           
                                            <td> 
                                                
                                            <a href='/show' ><i title='Click to edit course' class="md-icon material-icons">edit</i></a> 
   
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

          $(document).ready(function () {
              $('select').select2({width: "resolve"});


          });


</script>   

