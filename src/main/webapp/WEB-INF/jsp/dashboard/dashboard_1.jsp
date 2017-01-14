<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp" %>

<div id="page_content">
	<div id="page_content_inner">
	 	<h4 class="heading_c uk-margin-bottom">System Settings</h4>
 
  			 <div class="uk-grid uk-grid-width-large-1-4 uk-grid-width-medium-1-2 uk-grid-medium uk-sortable ">
                 <div>
                    <div class="md-card">
                        <div class="md-card-content">
                            <div class="uk-float-right uk-margin-top uk-margin-small-right"><span class=""><i class="sidebar-menu-icon material-icons md-36">access_time</i></span></div>
                            <span class="uk-text-bold uk-text-small">Last Visit</span>
                            <h5 class="uk-margin-remove"><span class="uk-text-small uk-text-success"> g</span></h5>
                        </div>
                    </div>
                </div>
                 
                <div>
                    <div class="md-card">
                        <div class="md-card-content">
                         <div class="uk-float-right uk-margin-top uk-margin-small-right"><span class=""><i class="sidebar-menu-icon material-icons md-36">event_note</i></span></div>
                            <span class="uk-text-muted uk-text-small">Academic Calender</span>
                            <h5 class="uk-margin-remove"><span class="uk-text-small uk-text-success "> Semester </span></h5>
                        </div>
                    </div>
                </div>
                  
             
             <div>
                    <div class="md-card">
                        <div class="md-card-content">
                         <div class="uk-float-right uk-margin-top uk-margin-small-right"><span class=""><i class="sidebar-menu-icon material-icons md-36">event_note</i></span></div>
                            <span class="uk-text-muted uk-text-small">Total Male Students</span>
                            <h5 class="uk-margin-remove"><span class="uk-text-small uk-text-success "> Male</span></h5>
                        </div>
                    </div>
                </div>
             <div>
                    <div class="md-card">
                        <div class="md-card-content">
                         <div class="uk-float-right uk-margin-top uk-margin-small-right"><span class=""><i class="sidebar-menu-icon material-icons md-36">event_note</i></span></div>
                            <span class="uk-text-muted uk-text-small">Total Female  Students</span>
                            <h5 class="uk-margin-remove"><span class="uk-text-small uk-text-success "> Females </span></h5>
                        </div>
                    </div>
                </div>
                
               
            </div>

             <div class="uk-grid uk-grid-width-small-1-2 uk-grid-width-large-1-3 uk-grid-width-xlarge-1-5 uk-text-center uk-sortable sortable-handler" id="dashboard_sortable_cards" data-uk-sortable data-uk-grid-margin>
                   
                <div>
                    <div class="md-card md-card-hover md-card-overlay">
                        <div class="md-card-content">
                            <a target="_" href='/'>  <img src="${pageContext.request.contextPath}/assets/img/dashboard/registration.png"/></a>
                        </div>
                        <div class="md-card-overlay-content">
                            <div class="uk-clearfix md-card-overlay-header">
                                <i class="md-icon material-icons md-card-overlay-toggler">&#xE5D4;</i>
                                <h3 class="uk-text-center uk-text-upper">
                                    REGISTER STUDENTS
                                </h3>
                            </div>
                           Click here to register students
                        </div>
                    </div>
                </div>
                    
                <div>
                    <div class="md-card md-card-hover md-card-overlay">
                        <div class="md-card-content">
                            <a  href='/'>  <img src="${pageContext.request.contextPath}/assets/img/dashboard/transcript.png"/></a>
                        </div>
                        <div class="md-card-overlay-content">
                            <div class="uk-clearfix md-card-overlay-header">
                                <i class="md-icon material-icons md-card-overlay-toggler">&#xE5D4;</i>
                                <h3 class="uk-text-center uk-text-upper">
                                    PRINT RESULTS
                                </h3>
                            </div>
                            Print Official result for students after they have paid at the Accounts Office
                        </div>
                    </div>
                </div>
                     <div>
                    <div class="md-card md-card-hover md-card-overlay">
                        <div class="md-card-content">
                            <a  href='/'>  <img src="${pageContext.request.contextPath}/assets/img/dashboard/results.png"/></a>
                        </div>
                        <div class="md-card-overlay-content">
                            <div class="uk-clearfix md-card-overlay-header">
                                <i class="md-icon material-icons md-card-overlay-toggler">&#xE5D4;</i>
                                <h3 class="uk-text-center uk-text-upper">
                                   UPLOAD RESULTS
                                </h3>
                            </div>
                            <p>Upload semester results here. Only registered students results can be uploaded</p>
                            <button class="md-btn md-btn-primary">More</button>
                        </div>
                    </div>
                </div>
                  
                 
                <div>
                     <div class="md-card md-card-hover md-card-overlay">
                        <div class="md-card-content">
                            <a  href='/'>  <img src="${pageContext.request.contextPath}/assets/img/dashboard/classlist.png"/></a>
                        </div>
                        <div class="md-card-overlay-content">
                            <div class="uk-clearfix md-card-overlay-header">
                                <i class="md-icon material-icons md-card-overlay-toggler">&#xE5D4;</i>
                                <h3 class="uk-text-center uk-text-upper">
                                    CLASS LIST
                                </h3>
                            </div>
                           View registered students for your courses and enter marks
                        </div>
                    </div>
                </div>
                 <div>
                     <div class="md-card md-card-hover md-card-overlay">
                        <div class="md-card-content">
                            <a  href='/'>  <img src="${pageContext.request.contextPath}/assets/img/dashboard/classgroup.png"/></a>
                        </div>
                        <div class="md-card-overlay-content">
                            <div class="uk-clearfix md-card-overlay-header">
                                <i class="md-icon material-icons md-card-overlay-toggler">&#xE5D4;</i>
                                <h3 class="uk-text-center uk-text-upper">
                                    STAFF <small>(Total )</small>
                                </h3>
                            </div>
                           View your staffs
                        </div>
                    </div>
                </div>
                  
                
                  
                 
                
                    
            </div> 
         
        

           

            <!-- tasks -->
            <div class="uk-grid" data-uk-grid-margin data-uk-grid-match="{target:'.md-card-content'}">
                <div class="uk-width-medium-1-2">
                    <div class="md-card">
                        <div class="md-card-content">
                            <div class="uk-overflow-container">
                                <table class="uk-table">
                                    <thead>
                                        <tr>
                                            <th class="uk-text-nowrap">Class</th>
                                            <th class="uk-text-nowrap">Total Students</th>
                                            <th class="uk-text-nowrap">Registered</th>
                                            <th class="uk-text-nowrap">Non Registered</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       
                                     
                                        <tr class="uk-table-middle">
                                            <td>alumni</td>
                                          <td class=''>l</td>
                                         <td>2</td>
                                         <td>3</td>
                                        </tr>
                                      <tr class="uk-table-middle">
                                            <td>admitted</td>
                                          <td class=''>2</td>
                                         <td>2</td>
                                         <td>3</td>
                                        </tr>
                                      <tr class="uk-table-middle">
                                            <td>form 1</td>
                                          <td class=''>12</td>
                                         <td>2</td>
                                         <td>3</td>
                                        </tr>
                                    <tr class="uk-table-middle">
                                            <td>form 2</td>
                                          <td class=''> 44</td>
                                         <td>2</td>
                                         <td>3</td>
                                        </tr>
                                         <tr class="uk-table-middle">
                                            <td>form 3</td>
                                          <td class=''></td>
                                         <td>2</td>
                                         <td>3</td>
                                        </tr>
                                          <tr class="uk-table-middle">
                                            <td>form 4</td>
                                          <td class=''>44</td>
                                         <td>2</td>
                                         <td>3</td>
                                        </tr>
                                    </tbody>
                                      
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="uk-width-medium-1-2">
                    <div class="md-card">
                        <div class="md-card-content">
                            <h3 class="heading_a uk-margin-bottom">Statistics</h3>
                            <div id="ct-chart" class="chartist"></div>
                        </div>
                    </div>
                </div>
            </div>
  
  	</div>
</div>

<%@include file="../layout/footer.jsp" %>
  <!-- chartist (charts) -->
        <script src="${pageContext.request.contextPath}/assets/plugins/chartist/dist/chartist.min.js"></script>
      
 <script src="${pageContext.request.contextPath}/assets/js/pages/dashboard.min.js"></script>
       