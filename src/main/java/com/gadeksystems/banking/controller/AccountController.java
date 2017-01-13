package com.gadeksystems.banking.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gadeksystems.banking.models.Account;
import com.gadeksystems.banking.models.Customer;
import com.gadeksystems.banking.models.Transaction;
import com.gadeksystems.banking.service.AccountService;
import com.gadeksystems.banking.service.CustomerService;
@Controller
public class AccountController {
	Logger  logger = LoggerFactory.getLogger(this.getClass());

    private AccountService accountService;
    private CustomerService customerService;


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
    public String store(@Valid Account account,Transaction transaction, BindingResult result, ModelMap model, HttpServletRequest request) {

		    
        if (!result.hasErrors()) {
            accountService.createAccount(account, transaction,request);

            model.addAttribute(new Account());
            model.addAttribute("success", account.getName() + " added successfully to database");

        } else {
            model.addAttribute("error", account.getName() + " Could not be saved to database try again later");
        }
        
        return "redirect:/management/accounts/";
    
    }
   
    // all methods should look like this Spring 4.0
    public String index(Model model){
         
       // model.addAttribute("customers", customerService.getAllCustomers());
        return "customers/index";
    }
    //This "movieFindCache" is delcares in ehcache.xml
	//@Cacheable(value="CustomersCache", key="#p0")
    @RequestMapping("management/account")
    @ModelAttribute("account")
     public ModelAndView index2() {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("customers", customerService.getAllCustomers());
        modelAndView.setViewName("customers/index");
        return modelAndView;
    }
    
      
}
