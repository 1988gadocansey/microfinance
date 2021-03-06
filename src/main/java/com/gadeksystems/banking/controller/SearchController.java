package com.gadeksystems.banking.controller;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gadeksystems.banking.models.Account;
import com.gadeksystems.banking.models.Customer;
import com.gadeksystems.banking.models.Sms;
import com.gadeksystems.banking.models.Transactions;
import com.gadeksystems.banking.providers.SmsProvider;
import com.gadeksystems.banking.service.AccountService;
import com.gadeksystems.banking.service.CustomerService;
@RestController
public class SearchController {
	Logger  logger = LoggerFactory.getLogger(this.getClass());

    private AccountService accountService;
    @Autowired
    public void setAccountService(AccountService accountService) {
        this.accountService = accountService;
    }
    @GetMapping("search/account")
    
    public List<Account> searchAccount(HttpServletRequest request){
    	List<Account> data = accountService.searchAccount(request.getParameter("term"));
    	List<Account> result =new ArrayList<Account>();
    	// iterate a list and filter by tagName
    			for (Account tag : data) {
    				 	result.add(tag);
    				 
    			}

    			return result;
    	 
 }
}
