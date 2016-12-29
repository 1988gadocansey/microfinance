package com.gadeksystems.banking.controller;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.validation.BindingResult;
import org.springframework.context.annotation.ComponentScan;
import com.gadeksystems.banking.service.CustomerService; 
import com.gadeksystems.banking.models.Customer;
import org.springframework.ui.ModelMap;

@Controller 

public class CustomerController {

	Logger log = LoggerFactory.getLogger(this.getClass());
	 
	private CustomerService customerService;
	 @Autowired
	    public void setProductService(CustomerService customerService) {
	        this.customerService = customerService;
	    } 
    @RequestMapping("management/customer/account")
    @ModelAttribute("customer")
	public ModelAndView create(){
		ModelAndView modelAndView = new ModelAndView();
		 
		modelAndView.addObject("customer", new Customer());
		modelAndView.setViewName("customers/create");
		return modelAndView;
	}
	@RequestMapping(value="/management/customer/account", method=RequestMethod.POST)
	public String store(@Valid Customer customer, BindingResult result, ModelMap model, HttpServletRequest request) {

		   //customerService.storeCustomer(customer);
		   
		   
		   if(!result.hasErrors()) {
			   customerService.storeCustomer(customer);
		    	 
					model.addAttribute(new Customer());
					model.addAttribute("success", customer.getFirstname() + " added successfully to database");
		    	 
		    }
		   else{
			   model.addAttribute("error", customer.getFirstname() + " Could not be saved to database try again later");
		   }
		   return "customers/create";
	}
	
}