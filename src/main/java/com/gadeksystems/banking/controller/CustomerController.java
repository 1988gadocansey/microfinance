package com.gadeksystems.banking.controller;

import java.math.BigDecimal;
import java.util.List;


import javax.validation.Valid;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.validation.BindingResult;

import com.gadeksystems.banking.service.AccountService;
import com.gadeksystems.banking.service.CustomerService;
import com.gadeksystems.banking.service.TransactionService;
import org.springframework.cache.annotation.Cacheable;
 
import com.gadeksystems.banking.models.Account;
import com.gadeksystems.banking.models.Customer;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import com.gadeksystems.banking.providers.*;
@Controller

public class CustomerController {

    Logger  logger = LoggerFactory.getLogger(this.getClass());

    private CustomerService customerService;
    private TransactionService transactionService;
    private AccountService accountService;

    @Autowired
    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }
    
     @Autowired
    public void setTransactionService(TransactionService transactionService) {
        this.transactionService = transactionService;
    }
     
     @Autowired
     public void setAccountService(AccountService accountService) {
         this.accountService = accountService;
     }
    
    @RequestMapping("management/customers/create")
    @ModelAttribute("customer")
    public ModelAndView create() {
        logger.info("Message at INFO level from CustomerService.create() was called");
       
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("customer", new Customer());
        modelAndView.setViewName("customers/create");
        return modelAndView;
    }

    @RequestMapping(value = "/management/customers/create", method = RequestMethod.POST)
    public String store(@Valid Customer customer, BindingResult result, ModelMap model, WebRequest request) {

		   //customerService.storeCustomer(customer);
        if (!result.hasErrors()) {
            customerService.storeCustomer(customer);

            model.addAttribute(new Customer());
            model.addAttribute("success", customer.getFirstname() + " added successfully to database");

        } else {
            model.addAttribute("error", customer.getFirstname() + " Could not be saved to database try again later");
        }
        
        return "redirect:/management/customers/account/open/" + customer.getId();
    
    }
    @RequestMapping("/management/customers/account/open/{id}")
    public String showCustomer(@PathVariable Integer id, Model model,Customer customer){
        model.addAttribute("customer", customerService.getCustomerById(id));
        /*Map<String, Object> model = new HashMap<String, Object>();
        model.put("publications",  publicationService.getPublications());
        model.put("categories",  categoryService.getCategories());
        return new ModelAndView("addPublication", model);*/
        return "accounts/create";
    }
    @RequestMapping("/management/customers/edit/{id}")
    public String editCustomer(@PathVariable Integer id, Model model,Customer customer){
        model.addAttribute("customer", customerService.getCustomerById(id));
         
        return "customers/editCustomer";
    }
    
    @RequestMapping(value="/management/customers/edit/{id}",method = RequestMethod.POST)
    public String updateCustomer(@PathVariable Integer id, @Valid Customer customer, BindingResult result, Model model, WebRequest request,RedirectAttributes redirectAttrs){
        model.addAttribute("customer", customerService.getCustomerById(id));
        if (!result.hasErrors()) {
            customerService.updateCustomer(customer);

            redirectAttrs.addAttribute("name", customer.getFirstname() ).addFlashAttribute("success", "Customer with name " + customer.getFirstname()  + " updated successfully");
            
        } else {
        	   redirectAttrs.addAttribute("name", customer.getFirstname() ).addFlashAttribute("error", "Customer with name " + customer.getFirstname()  + " could not be updated successfully");
      }
         
        return "redirect:/management/customers/";
    }
    
    
    
    
    public String index(Model model){
         
       // model.addAttribute("customers", customerService.getAllCustomers());
        return "customers/index";
    }
    //This "movieFindCache" is delcares in ehcache.xml
	//@Cacheable(value="CustomersCache", key="#p0")
    @RequestMapping("management/customers")
    @ModelAttribute("customers")
     public ModelAndView index2() {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("customers", customerService.getAllCustomers());
        modelAndView.setViewName("customers/index");
        return modelAndView;
    }
    
     
   
    
     
     @RequestMapping(value = "/management/customers", method = RequestMethod.POST)
     
     public  ModelAndView getCustomers(Model model,WebRequest request) {
    	  	
    	    ModelAndView modelAndView = new ModelAndView();
    	   // modelAndView.addObject("balance", transactionService.balance(Long.parseLong(request.getParameter("account")) throws NumberFormatException));
    	    String num=request.getParameter("account");
    	    Long d=Long.parseLong(num);
    	    modelAndView.addObject("balance", transactionService.balance(d));
            
            modelAndView.addObject("person", customerService.getCustomerByAccount(request.getParameter("account")));
            modelAndView.addObject("transaction", transactionService.getAllTransactions(Long.parseLong(request.getParameter("account"))));
            
            
            modelAndView.setViewName("customers/account");
            return modelAndView;
    }  
     
  @RequestMapping("/management/customers/show/{id}")
     
     public  ModelAndView showCustomers(@PathVariable Integer id,Model model,WebRequest request,Account account) {
    	  
	  		//account=accountService.findAccountByCustomerID(id);
    	    ModelAndView modelAndView = new ModelAndView();

            modelAndView.addObject("person", customerService.getCustomerById(id));
           // modelAndView.addObject("account", customerService.getCustomerAccount(id));
           // modelAndView.addObject("balance", transactionService.balance(Long.parseLong(customerService.getCustomerAccount(id))));
              
            
            modelAndView.setViewName("customers/show");
            return modelAndView;
    }  
   
}
