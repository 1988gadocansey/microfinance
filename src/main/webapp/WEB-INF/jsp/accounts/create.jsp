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
			 <div class="uk-modal" id="new_task">
            <div class="uk-modal-dialog">
                <div class="uk-modal-header">
                    <h4 class="uk-modal-title">Send sms  here</h4>
                </div>
               
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
  
		<h6 class="heading_a uk-margin-bottom uk-text-success">Account Opening Form</h6>
		<c:if test="${not empty success}">
		   <div style="text-align: center" class="uk-alert uk-alert-success"
			data-uk-alert=""><c:out value="${success}"/></div>
		</c:if>
		 <c:if test="${not empty error}">
		  <div style="text-align: center" class="uk-alert uk-alert-danger"
			data-uk-alert=""><c:out value="${error}"/></div>
		</c:if>
		
		 
		<div class="uk-width-xLarge-1-10">
			  <form action="#" class="uk-form-stacked" id="user_edit_form">
                <div class="uk-grid" data-uk-grid-margin>
                    <div class="uk-width-large-7-10">
                        <div class="md-card">
                            <div class="user_heading" data-uk-sticky="{ top: 48, media: 960 }">
                                <div class="user_heading_avatar fileinput fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail">
                                        <img src="${pageContext.request.contextPath}/photos/customers/gad.jpg" alt="user avatar"/>
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail"></div>
                                    <div class="user_avatar_controls">
                                        <span class="btn-file">
                                            <span class="fileinput-new"><i class="material-icons">&#xE2C6;</i></span>
                                            <span class="fileinput-exists"><i class="material-icons">&#xE86A;</i></span>
                                            <input type="file" name="user_edit_avatar_control" id="user_edit_avatar_control">
                                        </span>
                                        <a href="#" class="btn-file fileinput-exists" data-dismiss="fileinput"><i class="material-icons">&#xE5CD;</i></a>
                                    </div>
                                </div>
                                <div class="user_heading_content">
                                    <h2 class="heading_b"><span class="uk-text-truncate" id="user_edit_uname"><c:out value="${customer.getName()}"/></span><span class="sub-heading" id="user_edit_position"><c:out value="${customer.getJob()}"/></span></h2>
                                </div>
                                <div class="md-fab-wrapper">
                                    <div class="md-fab md-fab-toolbar md-fab-small md-fab-accent">
                                        <i class="material-icons">&#xE8BE;</i>
                                        <div class="md-fab-toolbar-actions">
                                            <button type="submit" id="user_edit_save" data-uk-tooltip="{cls:'uk-tooltip-small',pos:'bottom'}" title="Save"><i class="material-icons md-color-white">&#xE161;</i></button>
                                            <button type="submit" id="user_edit_print" data-uk-tooltip="{cls:'uk-tooltip-small',pos:'bottom'}" title="Print"><i class="material-icons md-color-white">&#xE555;</i></button>
                                            <button type="submit" id="user_edit_delete" data-uk-tooltip="{cls:'uk-tooltip-small',pos:'bottom'}" title="Delete"><i class="material-icons md-color-white">&#xE872;</i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="user_content">
                                <ul id="user_edit_tabs" class="uk-tab" data-uk-tab="{connect:'#user_edit_tabs_content'}">
                                    <li class="uk-active"><a href="#">Biodata</a></li>
                                    <li><a href="#">Latest Transactions</a></li>
                                    <li><a href="#">Open Account</a></li>
                                </ul>
                                <ul id="user_edit_tabs_content" class="uk-switcher uk-margin">
                                    <li>
                                        <div class="uk-margin-top">
                                            <h3 class="full_width_in_card heading_c">
                                                General info
                                            </h3>
                                            <div class="uk-grid" data-uk-grid-margin>
                                                <div class="uk-width-medium-1-2">
                                                    <label for="user_edit_uname_control">User name</label>
                                                    <input class="md-input" type="text" id="user_edit_uname_control" name="user_edit_uname_control" />
                                                </div>
                                                <div class="uk-width-medium-1-2">
                                                    <label for="user_edit_position_control">User position</label>
                                                    <input class="md-input" type="text" id="user_edit_position_control" name="user_edit_position_control" />
                                                </div>
                                            </div>
                                            <div class="uk-grid">
                                                <div class="uk-width-1-1">
                                                    <label for="user_edit_personal_info_control">About</label>
                                                    <textarea class="md-input" name="user_edit_personal_info_control" id="user_edit_personal_info_control" cols="30" rows="4">Qui perspiciatis dicta facere non incidunt tempora quisquam soluta et provident reprehenderit quo voluptatem ea nulla ullam illum unde iste corporis ea voluptatem nostrum modi modi omnis voluptatibus saepe natus ut in quisquam porro ut et quam ut doloribus laboriosam est maiores animi recusandae non dolorem exercitationem aut.</textarea>
                                                </div>
                                            </div>
                                            <h3 class="full_width_in_card heading_c">
                                                Languages
                                            </h3>
                                            <div class="uk-grid" data-uk-grid-margin>
                                                <div class="uk-width-1-1">
                                                    <select id="user_edit_languages" name="user_edit_languages" multiple>
                                                        <option value="gb" selected>English</option>
                                                        <option value="pl" selected>Polish</option>
                                                        <option value="fr" selected>French</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <h3 class="full_width_in_card heading_c">
                                                Contact info
                                            </h3>
                                            <div class="uk-grid">
                                                <div class="uk-width-1-1">
                                                    <div class="uk-grid uk-grid-width-1-1 uk-grid-width-large-1-2" data-uk-grid-margin>
                                                        <div>
                                                            <div class="uk-input-group">
                                                                <span class="uk-input-group-addon">
                                                                    <i class="md-list-addon-icon material-icons">&#xE158;</i>
                                                                </span>
                                                                <label>Email</label>
                                                                <input type="text" class="md-input" name="user_edit_email" value="ted71@gmail.com" />
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="uk-input-group">
                                                                <span class="uk-input-group-addon">
                                                                    <i class="md-list-addon-icon material-icons">&#xE0CD;</i>
                                                                </span>
                                                                <label>Phone Number</label>
                                                                <input type="text" class="md-input" name="user_edit_phone" value="958.654.3942x227" />
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="uk-input-group">
                                                                <span class="uk-input-group-addon">
                                                                    <i class="md-list-addon-icon uk-icon-facebook-official"></i>
                                                                </span>
                                                                <label>Facebook</label>
                                                                <input type="text" class="md-input" name="user_edit_facebook" value="facebook.com/envato" />
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="uk-input-group">
                                                                <span class="uk-input-group-addon">
                                                                    <i class="md-list-addon-icon uk-icon-twitter"></i>
                                                                </span>
                                                                <label>Twitter</label>
                                                                <input type="text" class="md-input" name="user_edit_twitter" value="twitter.com/envato" />
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="uk-input-group">
                                                                <span class="uk-input-group-addon">
                                                                    <i class="md-list-addon-icon uk-icon-linkedin"></i>
                                                                </span>
                                                                <label>Linkdin</label>
                                                                <input type="text" class="md-input" name="user_edit_linkdin" value="linkedin.com/company/envato" />
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="uk-input-group">
                                                                <span class="uk-input-group-addon">
                                                                    <i class="md-list-addon-icon uk-icon-google-plus"></i>
                                                                </span>
                                                                <label>Google+</label>
                                                                <input type="text" class="md-input" name="user_edit_google_plus" value="plus.google.com/+envato/about" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <p class="uk-text-muted uk-text-small">Move the draggable group by clicking and holding handler and drag it to other list.</p>
                                        <div class="uk-grid" data-uk-grid-margin>
                                            <div class="uk-width-medium-1-2">
                                                <h4 class="heading_c uk-margin-small-bottom">My groups</h4>
                                                <ul class="md-list md-list-addon uk-sortable groups_connected" id="user_groups">
                                                    <li data-group-id="1">
                                                        <div class="md-list-addon-element sortable-handler">
                                                            <i class="md-list-addon-icon material-icons">&#xE5D2;</i>
                                                        </div>
                                                        <div class="md-list-content">
                                                            <span class="md-list-heading"><a href="#">Cloud Computing</a></span>
                                                            <span class="uk-text-small uk-text-muted">206 Members</span>
                                                        </div>
                                                    </li>
                                                    <li data-group-id="2">
                                                        <div class="md-list-addon-element sortable-handler">
                                                            <i class="md-list-addon-icon material-icons">&#xE5D2;</i>
                                                        </div>
                                                        <div class="md-list-content">
                                                            <span class="md-list-heading"><a href="#">Account Manager Group</a></span>
                                                            <span class="uk-text-small uk-text-muted">170 Members</span>
                                                        </div>
                                                    </li>
                                                    <li data-group-id="3">
                                                        <div class="md-list-addon-element sortable-handler">
                                                            <i class="md-list-addon-icon material-icons">&#xE5D2;</i>
                                                        </div>
                                                        <div class="md-list-content">
                                                            <span class="md-list-heading"><a href="#">Digital Marketing</a></span>
                                                            <span class="uk-text-small uk-text-muted">93 Members</span>
                                                        </div>
                                                    </li>
                                                    <li data-group-id="4">
                                                        <div class="md-list-addon-element sortable-handler">
                                                            <i class="md-list-addon-icon material-icons">&#xE5D2;</i>
                                                        </div>
                                                        <div class="md-list-content">
                                                            <span class="md-list-heading"><a href="#">HR Professionals Association - Human Resources</a></span>
                                                            <span class="uk-text-small uk-text-muted">93 Members</span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="uk-width-medium-1-2">
                                                <h4 class="heading_c uk-margin-small-bottom">All Groups</h4>
                                                <ul class="md-list md-list-addon uk-sortable groups_connected" id="all_groups">
                                                    <li data-group-id="5">
                                                        <div class="md-list-addon-element sortable-handler">
                                                            <i class="md-list-addon-icon material-icons">&#xE5D2;</i>
                                                        </div>
                                                        <div class="md-list-content">
                                                            <span class="md-list-heading"><a href="#">Biotech & Pharma Professionals Network</a></span>
                                                            <span class="uk-text-small uk-text-muted">102 Members</span>
                                                        </div>
                                                    </li>
                                                    <li data-group-id="6">
                                                        <div class="md-list-addon-element sortable-handler">
                                                            <i class="md-list-addon-icon material-icons">&#xE5D2;</i>
                                                        </div>
                                                        <div class="md-list-content">
                                                            <span class="md-list-heading"><a href="#">The IT Sales Global Community</a></span>
                                                            <span class="uk-text-small uk-text-muted">16 Members</span>
                                                        </div>
                                                    </li>
                                                    <li data-group-id="7">
                                                        <div class="md-list-addon-element sortable-handler">
                                                            <i class="md-list-addon-icon material-icons">&#xE5D2;</i>
                                                        </div>
                                                        <div class="md-list-content">
                                                            <span class="md-list-heading"><a href="#">Healthcare Executives Network</a></span>
                                                            <span class="uk-text-small uk-text-muted">205 Members</span>
                                                        </div>
                                                    </li>
                                                    <li data-group-id="8">
                                                        <div class="md-list-addon-element sortable-handler">
                                                            <i class="md-list-addon-icon material-icons">&#xE5D2;</i>
                                                        </div>
                                                        <div class="md-list-content">
                                                            <span class="md-list-heading"><a href="#">Luxury & Lifestyle Professionals</a></span>
                                                            <span class="uk-text-small uk-text-muted">281 Members</span>
                                                        </div>
                                                    </li>
                                                    <li data-group-id="9">
                                                        <div class="md-list-addon-element sortable-handler">
                                                            <i class="md-list-addon-icon material-icons">&#xE5D2;</i>
                                                        </div>
                                                        <div class="md-list-content">
                                                            <span class="md-list-heading"><a href="#">Information Security Community</a></span>
                                                            <span class="uk-text-small uk-text-muted">120 Members</span>
                                                        </div>
                                                    </li>
                                                    <li data-group-id="10">
                                                        <div class="md-list-addon-element sortable-handler">
                                                            <i class="md-list-addon-icon material-icons">&#xE5D2;</i>
                                                        </div>
                                                        <div class="md-list-content">
                                                            <span class="md-list-heading"><a href="#">eMarketing Association Network</a></span>
                                                            <span class="uk-text-small uk-text-muted">128 Members</span>
                                                        </div>
                                                    </li>
                                                    <li data-group-id="11">
                                                        <div class="md-list-addon-element sortable-handler">
                                                            <i class="md-list-addon-icon material-icons">&#xE5D2;</i>
                                                        </div>
                                                        <div class="md-list-content">
                                                            <span class="md-list-heading"><a href="#">Finance Club</a></span>
                                                            <span class="uk-text-small uk-text-muted">290 Members</span>
                                                        </div>
                                                    </li>
                                                    <li data-group-id="12">
                                                        <div class="md-list-addon-element sortable-handler">
                                                            <i class="md-list-addon-icon material-icons">&#xE5D2;</i>
                                                        </div>
                                                        <div class="md-list-content">
                                                            <span class="md-list-heading"><a href="#">Banking Careers</a></span>
                                                            <span class="uk-text-small uk-text-muted">81 Members</span>
                                                        </div>
                                                    </li>
                                                    <li data-group-id="13">
                                                        <div class="md-list-addon-element sortable-handler">
                                                            <i class="md-list-addon-icon material-icons">&#xE5D2;</i>
                                                        </div>
                                                        <div class="md-list-content">
                                                            <span class="md-list-heading"><a href="#">Java Developers</a></span>
                                                            <span class="uk-text-small uk-text-muted">259 Members</span>
                                                        </div>
                                                    </li>
                                                    <li data-group-id="14">
                                                        <div class="md-list-addon-element sortable-handler">
                                                            <i class="md-list-addon-icon material-icons">&#xE5D2;</i>
                                                        </div>
                                                        <div class="md-list-content">
                                                            <span class="md-list-heading"><a href="#">Information Technology: Software, Hardware, Computer, Developer, Cloud & Engineering</a></span>
                                                            <span class="uk-text-small uk-text-muted">50 Members</span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <input name="user_groups_control" id="user_groups_control" type="hidden"/>
                                    </li>
                                    <li>
                                        <ul class="md-list md-list-addon" id="user_todo">
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_0" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Et voluptatibus omnis ut omnis.</span>
                                                    <span class="uk-text-small uk-text-muted">Quis vel minima dolor recusandae.</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_1" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Nihil ut rerum suscipit.</span>
                                                    <span class="uk-text-small uk-text-muted">Amet architecto id amet et eos odit vel.</span>
                                                </div>
                                            </li>
                                            <li class="md-list-item-disabled">
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_2" type="checkbox" data-md-icheck checked/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Soluta reiciendis non.</span>
                                                    <span class="uk-text-small uk-text-muted">Dolore commodi quia eveniet omnis voluptate sunt natus dignissimos ea nesciunt.</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_3" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading uk-text-danger">Officia alias aut dolorem et.</span>
                                                    <span class="uk-text-small uk-text-danger">Culpa eius aspernatur alias ipsum quis consequatur non.</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_4" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Excepturi quasi error quia delectus.</span>
                                                    <span class="uk-text-small uk-text-muted">Repellendus porro nostrum blanditiis quo et natus voluptatem commodi nihil.</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_5" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Doloremque nam et odit.</span>
                                                    <span class="uk-text-small uk-text-muted">Veniam aspernatur veniam cumque aspernatur iste aut.</span>
                                                </div>
                                            </li>
                                            <li class="md-list-item-disabled">
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_6" type="checkbox" data-md-icheck checked/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading uk-text-danger">Eum fugit debitis totam.</span>
                                                    <span class="uk-text-small uk-text-danger">Cupiditate dicta earum nisi consequatur quaerat adipisci.</span>
                                                </div>
                                            </li>
                                            <li class="md-list-item-disabled">
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_7" type="checkbox" data-md-icheck checked/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Esse eaque alias et.</span>
                                                    <span class="uk-text-small uk-text-muted">Aut exercitationem enim ducimus ut aut eum qui voluptas.</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_8" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Eos accusamus ullam repudiandae.</span>
                                                    <span class="uk-text-small uk-text-muted">Inventore laboriosam dolore ea mollitia atque facilis.</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_9" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Praesentium neque quos itaque.</span>
                                                    <span class="uk-text-small uk-text-muted">Tempore deserunt nemo distinctio iure odit repellat voluptatum qui temporibus at.</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_10" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Quia earum fuga asperiores cum.</span>
                                                    <span class="uk-text-small uk-text-muted">Sequi dolorem dicta quas consequatur dolores aut non.</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_11" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Fugiat at quo.</span>
                                                    <span class="uk-text-small uk-text-muted">Maiores perferendis ea et architecto laboriosam temporibus.</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_12" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading uk-text-danger">Ut cum mollitia dolorem odit.</span>
                                                    <span class="uk-text-small uk-text-danger">Aut aut aut tenetur vel eos quidem et.</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_13" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Magni adipisci nostrum quia non.</span>
                                                    <span class="uk-text-small uk-text-muted">Dolorum voluptas tenetur ex nemo consequatur quia eum.</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_14" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Saepe ut natus.</span>
                                                    <span class="uk-text-small uk-text-muted">Veritatis architecto porro voluptates atque in suscipit nihil illo nam aut.</span>
                                                </div>
                                            </li>
                                            <li class="md-list-item-disabled">
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_15" type="checkbox" data-md-icheck checked/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Modi adipisci dolor incidunt.</span>
                                                    <span class="uk-text-small uk-text-muted">Ut et laboriosam eius et cum odio pariatur ea voluptatem.</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_16" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Et placeat esse voluptate.</span>
                                                    <span class="uk-text-small uk-text-muted">Quidem sapiente non fuga et deleniti iste architecto dicta qui ut.</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_17" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Aspernatur est ratione minus et eaque.</span>
                                                    <span class="uk-text-small uk-text-muted">Rerum aliquid quibusdam nobis ut nihil aut.</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_18" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading">Magni quaerat nobis maxime.</span>
                                                    <span class="uk-text-small uk-text-muted">Aut nemo eveniet quaerat et enim dolorem.</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="md-list-addon-element">
                                                    <input name="todo_item_19" type="checkbox" data-md-icheck/>
                                                </div>
                                                <div class="md-list-content">
                                                    <span class="md-list-heading uk-text-danger">Iste aut autem beatae.</span>
                                                    <span class="uk-text-small uk-text-danger">Sint alias explicabo est at atque id esse alias eos.</span>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="uk-width-large-3-10">
                        <div class="md-card">
                            <div class="md-card-content">
                                <h3 class="heading_c uk-margin-medium-bottom">Settings</h3>
                                 <a  href="#new_task" data-uk-modal="{ :true }"> <i title="click to send sms to clients"   class="material-icons md-36 uk-text-success"   >phonelink_ring</i></a>

                                <hr class="md-hr">
                                <div class="uk-form-row">
                                    <label class="uk-form-label" for="user_edit_role">User Role</label>
                                    <select data-md-selectize>
                                        <option value="">Select...</option>
                                        <option value="admin">Admin</option>
                                        <option value="super_admin">Super Admin</option>
                                        <option value="editor" selected>Editor</option>
                                        <option value="author">Author</option>
                                        <option value="none">None</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
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
<!-- file input -->
    <script src="${pageContext.request.contextPath}/assets/js/custom/uikit_fileinput.min.js"></script>

    <!--  user edit functions -->
    <script src="${pageContext.request.contextPath}/assets/js/pages/page_user_edit.min.js"></script>
    
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
      return (function(modal){ modal = UIkit.modal.blockUI("<div class='uk-text-center'>Create Account<br/><img class='uk-thumbnail uk-margin-top' src='${pageContext.request.contextPath}/assets/img/spinners/spinner_success.gif' /></div>"); setTimeout(function(){ modal.hide() }, 50000) })();
    },
        
    go_to_fill_form_section : function (event){    
      vm.$data.in_payment_section=false
    }
  }
})

</script>