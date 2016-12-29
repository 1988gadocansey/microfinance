 
<script src="${pageContext.request.contextPath}/assets/js/common.min.js "></script>
    <script src="${pageContext.request.contextPath}/assets/js/dropify.min.js "></script>
    <script src="${pageContext.request.contextPath}/assets/js/file_input.min.js "></script>
    <!-- uikit functions -->
    <script src="${pageContext.request.contextPath}/assets/js/uikit_custom.min.js "></script>

    <!-- altair common functions/helpers -->
    <script src="${pageContext.request.contextPath}/assets/js/altair_admin_common.min.js "></script>
    <script src="${pageContext.request.contextPath}/assets/js/uikit/uikit.min.js "></script>
     
     
    <script src="${pageContext.request.contextPath}/assets/js/vue.min.js "></script>
    <script src="${pageContext.request.contextPath}/assets/js/vue-form.min.js "></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery-ui.min.js "></script>
    <script src="${pageContext.request.contextPath}/assets/tableexport/tableExport.js "></script>
    <script src="${pageContext.request.contextPath}/assets/tableexport/jquery.base64.js "></script>

    <script src="${pageContext.request.contextPath}/assets/tableexport/html2canvas.js "></script>

    <script src="${pageContext.request.contextPath}/assets/tableexport/jspdf/libs/sprintf.js "></script>

    <script src="${pageContext.request.contextPath}/assets/tableexport/jspdf/jspdf.js "></script>
    <script src="${pageContext.request.contextPath}/assets/tableexport/jspdf/libs/base64.js "></script>
    <script src="${pageContext.request.contextPath}/datatables/js/jquery.dataTables.min.js "></script>

    <script src="${pageContext.request.contextPath}/datatables/js/dataTables.uikit.min.js "></script> 
    <script src="${pageContext.request.contextPath}/datatables/js/plugins_datatables.min.js "></script>
    <script src="${pageContext.request.contextPath}/datatables/js/datatables_uikit.min.js "></script> 
    
    <script>
        $(function() {
            if(isHighDensity) {
                // enable hires images
                altair_helpers.retina_images();
            }
            if(Modernizr.touch) {
                // fastClick (touch devices)
                FastClick.attach(document.body);
            }
        });
        $window.load(function() {
            // ie fixes
            altair_helpers.ie_fix();
        });
    </script>
     <div id="style_switcher">
        <div id="style_switcher_toggle"><i class="material-icons">&#xE8B8;</i></div>
        <div class="uk-margin-medium-bottom">
            <h4 class="heading_c uk-margin-bottom">Colors</h4>
            <ul class="switcher_app_themes" id="theme_switcher">
                <li class="app_style_default active_theme" data-app-theme="">
                    <span class="app_color_main"></span>
                    <span class="app_color_accent"></span>
                </li>
                <li class="switcher_theme_a" data-app-theme="app_theme_a">
                    <span class="app_color_main"></span>
                    <span class="app_color_accent"></span>
                </li>
                <li class="switcher_theme_b" data-app-theme="app_theme_b">
                    <span class="app_color_main"></span>
                    <span class="app_color_accent"></span>
                </li>
                <li class="switcher_theme_c" data-app-theme="app_theme_c">
                    <span class="app_color_main"></span>
                    <span class="app_color_accent"></span>
                </li>
                <li class="switcher_theme_d" data-app-theme="app_theme_d">
                    <span class="app_color_main"></span>
                    <span class="app_color_accent"></span>
                </li>
                <li class="switcher_theme_e" data-app-theme="app_theme_e">
                    <span class="app_color_main"></span>
                    <span class="app_color_accent"></span>
                </li>
                <li class="switcher_theme_f" data-app-theme="app_theme_f">
                    <span class="app_color_main"></span>
                    <span class="app_color_accent"></span>
                </li>
                <li class="switcher_theme_g" data-app-theme="app_theme_g">
                    <span class="app_color_main"></span>
                    <span class="app_color_accent"></span>
                </li>
                <li class="switcher_theme_h" data-app-theme="app_theme_h">
                    <span class="app_color_main"></span>
                    <span class="app_color_accent"></span>
                </li>
                <li class="switcher_theme_i" data-app-theme="app_theme_i">
                    <span class="app_color_main"></span>
                    <span class="app_color_accent"></span>
                </li>
            </ul>
        </div>
        <div class="uk-visible-large uk-margin-medium-bottom">
            <h4 class="heading_c">Sidebar</h4>
            <p>
                <input type="checkbox" name="style_sidebar_mini" id="style_sidebar_mini" data-md-icheck />
                <label for="style_sidebar_mini" class="inline-label">Mini Sidebar</label>
            </p>
        </div>
        <div class="uk-visible-large uk-margin-medium-bottom">
            <h4 class="heading_c">Layout</h4>
            <p>
                <input type="checkbox" name="style_layout_boxed" id="style_layout_boxed" data-md-icheck />
                <label for="style_layout_boxed" class="inline-label">Boxed layout</label>
            </p>
        </div>
        <div class="uk-visible-large">
            <h4 class="heading_c">Main menu accordion</h4>
            <p>
                <input type="checkbox" name="accordion_mode_main_menu" id="accordion_mode_main_menu" data-md-icheck />
                <label for="accordion_mode_main_menu" class="inline-label">Accordion mode</label>
            </p>
        </div>
    </div>

    <script>
    var myVar=setInterval(function () {myTimer()}, 1000);
    function myTimer() {
        var date = new Date();
        document.getElementById("demo").innerHTML = date.toISOString();
    }
        $(function() {
            var $switcher = $('#style_switcher,
                $switcher_toggle = $('#style_switcher_toggle,
                $theme_switcher = $('#theme_switcher,
                $mini_sidebar_toggle = $('#style_sidebar_mini,
                $boxed_layout_toggle = $('#style_layout_boxed,
                $accordion_mode_toggle = $('#accordion_mode_main_menu,
                $body = $('body;


            $switcher_toggle.click(function(e) {
                e.preventDefault();
                $switcher.toggleClass('switcher_active;
            });

            $theme_switcher.children('li.click(function(e) {
                e.preventDefault();
                var $this = $(this),
                    this_theme = $this.attr('data-app-theme;

                $theme_switcher.children('li.removeClass('active_theme;
                $(this).addClass('active_theme;
                $body
                    .removeClass('app_theme_a app_theme_b app_theme_c app_theme_d app_theme_e app_theme_f app_theme_g app_theme_h app_theme_i
                    .addClass(this_theme);

                if(this_theme == ' {
                    localStorage.removeItem('altair_theme;
                } else {
                    localStorage.setItem("altair_theme", this_theme);
                }

            });

            // hide style switcher
            $document.on('click keyup', function(e) {
                if( $switcher.hasClass('switcher_active ) {
                    if (
                        ( !$(e.target).closest($switcher).length )
                        || ( e.keyCode == 27 )
                    ) {
                        $switcher.removeClass('switcher_active;
                    }
                }
            });

            // get theme from local storage
            if(localStorage.getItem("altair_theme") !== null) {
                $theme_switcher.children('li[data-app-theme='+localStorage.getItem("altair_theme")+'].click();
            }


        // toggle mini sidebar

            // change input's state to checked if mini sidebar is active
            if((localStorage.getItem("altair_sidebar_mini") !== null && localStorage.getItem("altair_sidebar_mini") == '1 || $body.hasClass('sidebar_mini) {
                $mini_sidebar_toggle.iCheck('check;
            }

            $mini_sidebar_toggle
                .on('ifChecked', function(event){
                    $switcher.removeClass('switcher_active;
                    localStorage.setItem("altair_sidebar_mini", '1;
                    location.reload(true);
                })
                .on('ifUnchecked', function(event){
                    $switcher.removeClass('switcher_active;
                    localStorage.removeItem('altair_sidebar_mini;
                    location.reload(true);
                });


        // toggle boxed layout

            if((localStorage.getItem("altair_layout") !== null && localStorage.getItem("altair_layout") == 'boxed || $body.hasClass('boxed_layout) {
                $boxed_layout_toggle.iCheck('check;
                $body.addClass('boxed_layout;
                $(window).resize();
            }

            $boxed_layout_toggle
                .on('ifChecked', function(event){
                    $switcher.removeClass('switcher_active;
                    localStorage.setItem("altair_layout", 'boxed;
                    location.reload(true);
                })
                .on('ifUnchecked', function(event){
                    $switcher.removeClass('switcher_active;
                    localStorage.removeItem('altair_layout;
                    location.reload(true);
                });

        // main menu accordion mode
            if($sidebar_main.hasClass('accordion_mode) {
                $accordion_mode_toggle.iCheck('check;
            }

            $accordion_mode_toggle
                .on('ifChecked', function(){
                    $sidebar_main.addClass('accordion_mode;
                })
                .on('ifUnchecked', function(){
                    $sidebar_main.removeClass('accordion_mode;
                });


        });
    </script>
    

    <script type="text/javascript">
                $.ajaxSetup({
                headers: { 'X-CSRF-Token' : $('meta[name=_token].attr('content }
                });    </script>
     
    <script src="${pageContext.request.contextPath}/assets/js/jquery.form.js "></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js "></script>

    <script language="javascript" type="text/javascript">
                      $(document).ready(function(){
            $('.saves.on('click', function(e){


            var name = $(this).closest('tr.find('.name.val();
                    var program = $(this).closest('tr.find('.program.val();
                     var level= $(this).closest('tr.find('.level.val();
                     
                     //alert(hall);
                    UIkit.modal.confirm("Are you sure you want to add this group "
                            , function(){
                            modal = UIkit.modal.blockUI("<div class='uk-text-center'>Creating Group <br/><img class='uk-thumbnail uk-margin-top' src='${pageContext.request.contextPath}/assets/img/spinners/spinner.gif  ' /></div>");
                                    //setTimeout(function(){ modal.hide() }, 500) })()            
                                    $.ajax({
                                     
                                            type: "POST",
                                            url:"admit",
                                            data: { applicant:student, program:program,hall:hall,admit:admit}, //your form data to post goes 
                                            dataType: "html",
                                    }).done(function(data){
                            modal.hide();
                                    
                                     UIkit.modal.alert("Group created successfully");
                                   // $("#ts_pager_filter").load(window.location + " #ts_pager_filter");
                                    // console.log(data);
                                     location.reload();
//        return (function(modal){ modal = UIkit.modal.blockUI("<div class='uk-text-center'>Processing Transcript Order<br/><img class='uk-thumbnail uk-margin-top' src='${pageContext.request.contextPath}/assets/img/spinners/spinner.gif  ' /></div>"); setTimeout(function(){ modal.hide() }, 500) })();
                            });
                            }
                    );
            });
             
            });
                function printDiv(divID) {
                //Get the HTML of div
                var divElements = document.getElementById(divID).innerHTML;
                        //Get the HTML of whole page
                        var oldPage = document.body.innerHTML;
                        //Reset the page's HTML with div's HTML only
                        document.body.innerHTML =
                        "<html><head><title></title></head><body>" +
                        divElements + "</body>";
                        //Print Page
                        window.print();
                        //Restore orignal HTML
                        document.body.innerHTML = oldPage;
                }
    </script>
    <script>
        function recalculateSum()
        {
        var num1 = parseFloat(document.getElementById("pay").value);
                var num2 = parseFloat(document.getElementById("bill").value);
                document.getElementById("amount_left").value = (num2 - num1);
        }
        function MM_openBrWindow(theURL, winName, features) { //v2.0
        window.open(theURL, winName, features);
        }

        function recalculateTranAmt(){
        var copies = document.getElementById("copies").value;
                var price = parseFloat(document.getElementById("price").value);
                document.getElementById("amount").value = (copies * price);
        }
    </script>
    <script>


        $(document).ready(function(){

        function checkFormElements(){}



        $("#insertPaymentRow").bind('click', function(){

        var numOrgs = $(" table#paymentTable tr[payment_row]").length + 1;
                var newOrg = $("table#paymentTable tr:first ").clone(true);
                $(newOrg).children(' td#insertPaymentCell .html('<button  type="button" id="removePaymentRow_' + numOrgs + '" class="md-btn md-btn-danger md-btn-small uk-margin-small-top"  title="remove this row"><i class="sidebar-menu-icon material-icons">remove</i></button>;
                var amountLine = $(newOrg).children('td[2];
                $(amountLine).children(':last-child.prop('value', ';
                var amountInput = $(amountLine).children(':last-child;
                $(amountInput).prop('id', 'amt_' + numOrgs);
                $(newOrg).attr('id', 'paymentRow_' + numOrgs);
                $(newOrg).insertAfter($("table#paymentTable tr:last"));
                $('#removePaymentRow_' + numOrgs).bind("click", function(){
// $(amountInput).trigger('keyup;
        $('#paymentRow_' + numOrgs).remove();
                var count = 0;
                });
// $('#amt_'+numOrgs).bind('focus',function(){
//   console.log('hello from here;
// });

//});


                $('#paymentTable .pay_type  :selected.parent().each(function(){
        if ($(this).prop('selectedIndex <= 0){
        //$('#new_payment_individual_form :submit.prop('disabled','disabled;
        //  $('#alertInfo.css('display','block.html("Please select a payment type!");
        }
        });
//console.log($(this).prop('name+"->"+$('#paymentTable .pay_type  :selected.parent().length);

                });
                $('#save.on('click', function(e) {
        return (function(modal){ modal = UIkit.modal.blockUI("<div class='uk-text-center'>Processing data<br/><img class='uk-thumbnail uk-margin-top' src='${pageContext.request.contextPath}/assets/img/spinners/spinner_success.gif  ' /></div>"); setTimeout(function(){ modal.hide() }, 50000) })();
                });
                });    </script>
    <!-- google web fonts -->
    <script>
                 WebFontConfig = {
                google: {
                families: [
                        'Source+Code+Pro:400,700:latin',
                        'Roboto:400,300,500,700,400italic:latin'
                ]
                }
                };
                (function() {
                var wf = document.createElement('script;
                        wf.src = ('https:' == document.location.protocol ? 'https' : 'http +
                        '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
                        wf.type = 'text/javascript';
                        wf.async = 'true';
                        var s = document.getElementsByTagName('script[0];
                        s.parentNode.insertBefore(wf, s);
                })();      </script>
    <script src="${pageContext.request.contextPath}/assets/plugins/tablesorter/dist/js/jquery.tablesorter.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/tablesorter/dist/js/jquery.tablesorter.widgets.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/tablesorter/dist/js/widgets/widget-alignChar.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/tablesorter/dist/js/widgets/widget-columnSelector.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/tablesorter/dist/js/widgets/widget-print.min.js"></script>
    <!--  tablesorter functions -->
    <script src="${pageContext.request.contextPath}/assets/js/pages/plugins_tablesorter.min.js"></script>
    
</body>
</html>