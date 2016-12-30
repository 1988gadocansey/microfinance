package com.gadeksystems.banking.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.validation.BindingResult;
import com.gadeksystems.banking.service.CustomerService;
import com.gadeksystems.banking.models.Customer;
import com.gadeksystems.banking.repository.CustomerRepository;
import java.util.List;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RestController;

@RestController

public class CustomersRestController {

    Logger log = LoggerFactory.getLogger(this.getClass());

    private CustomerService customerService;

    @Autowired
    public void setProductService(CustomerService customerService) {
        this.customerService = customerService;
    }

     
   
    @RequestMapping("/customer")
    
     public List<Customer> getCustomers() {
        
        return (List<Customer>) customerService.getAllCustomers();
    }
}
