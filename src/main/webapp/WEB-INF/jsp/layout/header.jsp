<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Remove Tap Highlight on Windows Phone IE -->
    <meta name="msapplication-tap-highlight" content="no"/>
    <meta name="_token" content="{!! csrf_token() !!}"/>
    <link rel="icon" type="image/png" href="public/assets/img/favicon-16x16.png" sizes="16x16">
    <link rel="icon" type="image/png" href="public/assets/img/favicon-32x32.png" sizes="32x32">

    <title>Banking - Savoy Microfinance</title>
	 <script>
    var myVar=setInterval(function () {myTimer()}, 1000);
    function myTimer() {
        var date = new Date();
        document.getElementById("demo").innerHTML = date.toString();
    }
    </script>
	 <%--  <!-- angular -->
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular-animate.min.js"></script>
 	<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/angular-loading-bar/0.9.0/loading-bar.min.css' type='text/css' media='all' />
	 <script type='text/javascript' src='//cdnjs.cloudflare.com/ajax/libs/angular-loading-bar/0.9.0/loading-bar.min.js'></script>
	
 	<script src="${pageContext.request.contextPath}/assets/js/app.js "></script>
	<script src="${pageContext.request.contextPath}/assets/loader.js "></script>
	 --%>
    <!-- uikit -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/uikit/css/uikit.almost-flat.min.css" media="all">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.min.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/combined.min.css " media="all">

     
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/select2.min.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dropify.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/datatables/css/jquery.dataTables.min.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/datatables/css/dataTables.uikit.min.css" >
 
     <!-- style switcher -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style_switcher.min.css" media="all">
   
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 
    <style>
    
#loading-bar .bar {
  background: #2c3e50;
}
#loading-bar-spinner .spinner-icon {
  border-top-color:  #2c3e50;
  border-left-color: #2c3e50;
}
#loading-bar .peg {
  -moz-box-shadow: #2c3e50 1px 0 6px 1px;
  -ms-box-shadow: #2c3e50 1px 0 6px 1px;
  -webkit-box-shadow: #2c3e50 1px 0 6px 1px;
  box-shadow: #2c3e50 1px 0 6px 1px;
}
     #header_main .uk-navbar{
         margin:-1px
     }
 </style>

    

</head>
<body class="top_menu ng-scope"  ng-app="LoadingBarExample" ng-controller="ExampleCtrl">

    <!-- main header -->
    <header id="header_main">
        <div class="header_main_content">
            <nav class="uk-navbar">
                <div class="main_logo_top">
                    <a href="/dashboard"><img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="" height="15" width="71"/></a>
                     <span class="" style="color:white"  >Banking</span>
                 
                </div>

               
                
                

                <div class="uk-navbar-flip">
                      <!-- main sidebar switch -->
                      
                   
                    <ul class="uk-navbar-nav user_actions">
                        <li><a href="#" id="full_screen_toggle" class="user_action_icon uk-visible-large"><i class="material-icons md-24 md-light">&#xE5D0;</i></a></li>
                          <li data-uk-dropdown="{mode:'click',pos:'bottom-right'}">
                            <a href="#" class="user_action_icon"><i class="material-icons md-24 md-light">&#xE7F4;</i><span class="uk-badge">16</span></a>
                            <div class="uk-dropdown uk-dropdown-xlarge">
                                <div class="md-card-content">
                                    <ul class="uk-tab uk-tab-grid" data-uk-tab="{connect:'#header_alerts',animation:'slide-horizontal'}">
                                        <li class="uk-width-1-2 uk-active"><a href="#" class="js-uk-prevent uk-text-small">Messages (12)</a></li>
                                        <li class="uk-width-1-2"><a href="#" class="js-uk-prevent uk-text-small">Alerts (4)</a></li>
                                    </ul>
                                    <ul id="header_alerts" class="uk-switcher uk-margin">
                                        <li>
                                            <ul class="md-list md-list-addon">
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <span class="md-user-letters md-bg-cyan">ao</span>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading"><a href="pages_mailbox.html">Consequatur ut repudiandae.</a></span>
                                                        <span class="uk-text-small uk-text-muted">Et sunt qui quod aut laborum et nisi.</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <img class="md-user-image md-list-addon-avatar" src="public/assets/img/avatars/avatar_07_tn.png" alt=""/>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading"><a href="pages_mailbox.html">Sunt sequi.</a></span>
                                                        <span class="uk-text-small uk-text-muted">Beatae quibusdam sed possimus pariatur optio repellendus.</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <span class="md-user-letters md-bg-light-green">qi</span>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading"><a href="pages_mailbox.html">Et voluptatum ut.</a></span>
                                                        <span class="uk-text-small uk-text-muted">Est et nostrum dignissimos suscipit nihil animi voluptatem quam.</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <img class="md-user-image md-list-addon-avatar" src="public/assets/img/avatars/avatar_02_tn.png" alt=""/>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading"><a href="pages_mailbox.html">Similique iure et.</a></span>
                                                        <span class="uk-text-small uk-text-muted">Laborum et alias veritatis accusamus sit consequatur quod.</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <img class="md-user-image md-list-addon-avatar" src="public/assets/img/avatars/avatar_09_tn.png" alt=""/>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading"><a href="pages_mailbox.html">Repellendus consequuntur.</a></span>
                                                        <span class="uk-text-small uk-text-muted">Nesciunt et id eum quas est soluta aut et.</span>
                                                    </div>
                                                </li>
                                            </ul>
                                            <div class="uk-text-center uk-margin-top uk-margin-small-bottom">
                                                <a href="page_mailbox.html" class="md-btn md-btn-flat md-btn-flat-primary js-uk-prevent">Show All</a>
                                            </div>
                                        </li>
                                        <li>
                                            <ul class="md-list md-list-addon">
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <i class="md-list-addon-icon material-icons uk-text-warning">&#xE8B2;</i>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading">Repudiandae accusantium.</span>
                                                        <span class="uk-text-small uk-text-muted uk-text-truncate">Et fugit ipsum quia non ducimus quo.</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <i class="md-list-addon-icon material-icons uk-text-success">&#xE88F;</i>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading">Eos earum qui.</span>
                                                        <span class="uk-text-small uk-text-muted uk-text-truncate">Accusamus nisi vitae dolorem et vel repudiandae ratione tenetur.</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <i class="md-list-addon-icon material-icons uk-text-danger">&#xE001;</i>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading">Rerum accusantium.</span>
                                                        <span class="uk-text-small uk-text-muted uk-text-truncate">Ut voluptatem eos sapiente hic qui molestiae.</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <i class="md-list-addon-icon material-icons uk-text-primary">&#xE8FD;</i>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading">Id molestias.</span>
                                                        <span class="uk-text-small uk-text-muted uk-text-truncate">Excepturi delectus rem doloribus quia fugiat.</span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li data-uk-dropdown="{mode:'click',pos:'bottom-right'}">
                            
                            <a href="#" class="user_action_image">
                                 <span class="" style="color:white"  >Hi <c:out value="${pageContext.request.remoteUser}"></c:out></span>
                 
                                
                                  <div class="uk-dropdown uk-dropdown-small">
                                <ul class="uk-nav js-uk-prevent">
                                     <li><a href='{!! url("/change_password") !!}'>Change Password</a></li>
                                       <li><a href="<c:url value="/j_spring_security_logout"/>">Logout</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="header_main_search_form">
            <i class="md-icon header_main_search_close material-icons">&#xE5CD;</i>

        </div>
    </header><!-- main header end -->
  <div id="top_bar">
    <div class="md-top-bar">
        
     
        <ul id="menu_top" class="uk-clearfix">
            <li class="uk-hidden-small"><a href='/dashboard'><i title='home'class="material-icons">&#xE88A;</i><span>Home</span></a></li>
           <security:authorize access="hasAuthority('MANAGER')">
            <li data-uk-dropdown class="uk-hidden-small">

                  
                    <a href="#"><i class="sidebar-menu-icon material-icons md-18">work</i><span>Transactions</span></a>
                    <div class="uk-dropdown uk-dropdown-scrollable">
                        <ul class="uk-nav uk-nav-dropdown">
                         <li><a href="/management/accounts/open">Open Account</a></li>
                            <li><a href="/programmes">Deposit</a></li>
                            <li><a href="/programmes">Withdrawals</a></li>
                            <li><a href="/programmes">Accounts Transfers</a></li>
                            <li><a href="/programmes">Check Account Balance</a></li>                  
                        </ul>
                    </div>
           </li>
           
            <li data-uk-dropdown class="uk-hidden-small">

                  
                    <a href="#"><i class="sidebar-menu-icon material-icons md-18">supervisor_account</i><span>Customer Care</span></a>
                    <div class="uk-dropdown uk-dropdown-scrollable">
                        <ul class="uk-nav uk-nav-dropdown">
                            <li><a href="/management/customers/create">Add Customers</a></li>
                            <li><a href="/management/customers">View Customers</a></li>
                            <li><a href="/programmes">Check Account Balance</a></li>
                            <li><a href="/programmes">Print Account Statements</a></li>
                            <li><a href="/programmes">Application for Passbook</a></li>                  
                        </ul>
                    </div>
                </li>
            
   
           <li data-uk-dropdown class="uk-hidden-small">

                  
                    <a href="#"><i class="sidebar-menu-icon material-icons md-18">work</i><span>Accounting</span></a>
                    <div class="uk-dropdown uk-dropdown-scrollable">
                        <ul class="uk-nav uk-nav-dropdown">
                            <li><a href="/programmes">Trading Profit and Loss</a></li>
                            <li><a href="/programmes">Balance Sheet</a></li>
                            <li><a href="/programmes">Cash Flow Statement</a></li>
                            <li><a href="/programmes">Amortizations</a></li>                  
                        </ul>
                    </div>
           </li>
         </security:authorize>
         <security:authorize access="hasRole('ACCOUNTANT')">
            <li data-uk-dropdown class="uk-hidden-small">

                  
                    <a href="#"><i class="sidebar-menu-icon material-icons md-18">work</i><span>Accounts</span></a>
                    <div class="uk-dropdown uk-dropdown-scrollable">
                        <ul class="uk-nav uk-nav-dropdown">
                            <li><a href="/programmes">Ledgers</a></li>
                            <li><a href="/programmes">Charts of Accounts</a></li>
                            <li><a href="/programmes">Journal Enteries</a></li>
                            <li><a href="/programmes">Transactions Logs</a></li>                  
                        </ul>
                    </div>
           </li>
           <li data-uk-dropdown class="uk-hidden-small">

                  
                    <a href="#"><i class="sidebar-menu-icon material-icons md-18">work</i><span>Accounting</span></a>
                    <div class="uk-dropdown uk-dropdown-scrollable">
                        <ul class="uk-nav uk-nav-dropdown">
                            <li><a href="/programmes">Trading Profit and Loss</a></li>
                            <li><a href="/programmes">Balance Sheet</a></li>
                            <li><a href="/programmes">Cash Flow Statement</a></li>
                                        
                        </ul>
                    </div>
           </li>
         </security:authorize>
         <security:authorize access="hasRole('HR')">
            <li data-uk-dropdown class="uk-hidden-small">

                  
                    <a href="#"><i class="sidebar-menu-icon material-icons md-18">work</i><span>HR</span></a>
                    <div class="uk-dropdown uk-dropdown-scrollable">
                        <ul class="uk-nav uk-nav-dropdown">
                            <li><a href="/programmes">Departments</a></li>
                            <li><a href="/programmes">Positions</a></li>
                            <li><a href="/programmes">Add Staffs</a></li>
                            <li><a href="/programmes">Staff Directory</a></li>                  
                        </ul>
                    </div>
                </li>
            
         </security:authorize>
         <security:authorize access="hasRole('LOAN')">
            <li data-uk-dropdown class="uk-hidden-small">

                  
                    <a href="#"><i class="sidebar-menu-icon material-icons md-18">work</i><span>Loans</span></a>
                    <div class="uk-dropdown uk-dropdown-scrollable">
                        <ul class="uk-nav uk-nav-dropdown">
                            <li><a href="/programmes">Loan Rules</a></li>
                            <li><a href="/programmes">Check Loan eligibility</a></li>
                            <li><a href="/programmes">Loan Applications</a></li>
                            <li><a href="/programmes">Loan Statement</a></li>                  
                        </ul>
                    </div>
                </li>
            
         </security:authorize>
            
              
            
            
            
        <security:authorize access="hasRole('TELLER')">
            <li data-uk-dropdown class="uk-hidden-small">

                  
                    <a href="#"><i class="sidebar-menu-icon material-icons md-18">account_balance</i><span>Banking</span></a>
                    <div class="uk-dropdown uk-dropdown-scrollable">
                        <ul class="uk-nav uk-nav-dropdown">
                            <li><a href="/programmes">Deposit</a></li>
                            <li><a href="/programmes">Withdrawals</a></li>
                            <li><a href="/programmes">Accounts Transfers</a></li>
                            <li><a href="/programmes">Check Account Balance</a></li>                  
                        </ul>
                    </div>
                </li>
            
         </security:authorize>
         <security:authorize access="hasRole('CCARE')">
            <li data-uk-dropdown class="uk-hidden-small">

                  
                    <a href="#"><i class="sidebar-menu-icon material-icons md-18">work</i><span>Customer Care</span></a>
                    <div class="uk-dropdown uk-dropdown-scrollable">
                        <ul class="uk-nav uk-nav-dropdown">
                            <li><a href="/programmes">Open Accounts</a></li>
                            <li><a href="/programmes">Check Account Balance</a></li>
                            <li><a href="/programmes">Print Account Statements</a></li>
                            <li><a href="/programmes">Application for Passbook</a></li>                  
                        </ul>
                    </div>
                </li>
            
         </security:authorize>
         <security:authorize access="hasRole('LOAN')">
            <li data-uk-dropdown class="uk-hidden-small">

                  
                    <a href="#"><i class="sidebar-menu-icon material-icons md-18">work</i><span>Loans</span></a>
                    <div class="uk-dropdown uk-dropdown-scrollable">
                        <ul class="uk-nav uk-nav-dropdown">
                            <li><a href="/programmes">Loan Rules</a></li>
                            <li><a href="/programmes">Check Loan eligibility</a></li>
                            <li><a href="/programmes">Loan Applications</a></li>
                            <li><a href="/programmes">Loan Statement</a></li>                  
                        </ul>
                    </div>
                </li>
            
         </security:authorize>
         <security:authorize access="hasRole('USER')">
                 <li data-uk-dropdown class="uk-hidden-small">
                    <a href="#"> <span class="menu_icon"><i class="material-icons">lock</i></span><span>My Account</span></a>
                    <div class="uk-dropdown uk-dropdown-scrollable">
                        <ul class="uk-nav uk-nav-dropdown">
                          <li><a href="/programmes">Change Password</a></li>
                          <li><a href="<c:url value="/logout" />">Logout</a></li>
                                
                        </ul>
                    </div>
                </li>
         </security:authorize> 
         
          
         	  <li class="uk-hidden-small"><a href='/'><i title='home'class="material-icons">timer</i><span id="demo"> </span></a></li>
         
            
            <li data-uk-dropdown="justify:'#top_bar'" class="uk-visible-small">
                <a href="#"><i class="material-icons">&#xE5D2;</i><span>Menu</span></a>
                <div class="uk-dropdown uk-dropdown-width-2">
                    <div class="uk-grid uk-dropdown-grid" data-uk-grid-margin>
                        <div class="uk-width-1-2">
                            <ul class="uk-nav uk-nav-dropdown ">
                           
                             
                            
                            </ul>
                        </div>
                      
                    </div>
                </div>
            </li>
        </ul>
     
    </div>
</div>