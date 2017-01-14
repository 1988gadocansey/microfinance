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
import org.springframework.web.servlet.ModelAndView;

import com.gadeksystems.banking.models.Account;
import com.gadeksystems.banking.models.Customer;
import com.gadeksystems.banking.models.Sms;
import com.gadeksystems.banking.models.Transactions;
import com.gadeksystems.banking.providers.SmsProvider;
import com.gadeksystems.banking.service.AccountService;
import com.gadeksystems.banking.service.CustomerService;
@Controller
public class AccountController {
	Logger  logger = LoggerFactory.getLogger(this.getClass());

    private AccountService accountService;
    private CustomerService customerService;

    @Autowired
	private SmsProvider sms;
    @Autowired
    public void setAccountService(AccountService accountService) {
        this.accountService = accountService;
    }
    
   
    @Autowired
    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }
    
     
    @RequestMapping(value = "account/open", method = RequestMethod.POST)
    @ModelAttribute("account")
    public String store(@Valid Account account,Transactions transaction, BindingResult result, ModelMap model, HttpServletRequest request,Sms mysms) {

		    
        if (!result.hasErrors()) {
            accountService.createAccount(account, transaction,request,mysms);

            model.addAttribute(new Account());
            model.addAttribute("success", account.getName() + " added successfully to database");

        } else {
            model.addAttribute("error", account.getName() + " Could not be saved to database try again later");
        }
        
        return "redirect:/management/accounts/";
    
    }
   
    
    @GetMapping("management/accounts")
   
    public String viewAccounts(Model model,HttpSession session){
    	session.setAttribute("result",accountService.getAllAccount());
    	
    	model.addAttribute("account", accountService.getAllAccount());
        return "accounts/index";
    }
    
    @GetMapping("account/search")
    
    public String SearchAccount(Model model,HttpServletRequest request,HttpSession session ){
    	
    	session.setAttribute("result",accountService.findAccountByNumber(request.getParameter("account")));
    	model.addAttribute("account", accountService.findAccountByNumber(request.getParameter("account")));
        return "accounts/index";
    }
    
    @PostMapping("system/sms")
    
    public void sendSMS(HttpServletRequest request,HttpSession session){
    	 
		String message = request.getParameter("message");

		List<Object[]> result = (List<Object[]>) session.getAttribute("result");
		try {

			for (Object[] object : result) {

				sms.sms(message, (String) object[0]);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	  
    }
    
      
}
