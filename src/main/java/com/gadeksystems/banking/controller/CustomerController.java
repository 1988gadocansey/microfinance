package com.gadeksystems.banking.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.validation.BindingResult;
import com.gadeksystems.banking.service.CustomerService;


import com.gadeksystems.banking.models.Customer;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import com.gadeksystems.banking.providers.*;
@Controller

public class CustomerController {

    Logger log = LoggerFactory.getLogger(this.getClass());

    private CustomerService customerService;

    @Autowired
    public void setProductService(CustomerService customerService) {
        this.customerService = customerService;
    }
    
    @RequestMapping("management/customers/create")
    @ModelAttribute("customer")
    public ModelAndView create() {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("customer", new Customer());
        modelAndView.setViewName("customers/create");
        return modelAndView;
    }

    @RequestMapping(value = "/management/customers/create", method = RequestMethod.POST)
    public String store(@Valid Customer customer, BindingResult result, ModelMap model, HttpServletRequest request) {

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
    public String showProduct(@PathVariable Integer id, Model model,Customer customer){
        model.addAttribute("customer", customerService.getCustomerById(id));
        /*Map<String, Object> model = new HashMap<String, Object>();
        model.put("publications",  publicationService.getPublications());
        model.put("categories",  categoryService.getCategories());
        return new ModelAndView("addPublication", model);*/
        return "accounts/create";
    }
    // all methods should look like this Spring 4.0
    public String index(Model model){
         
       // model.addAttribute("customers", customerService.getAllCustomers());
        return "customers/index";
    }
    @RequestMapping("management/customers")
    @ModelAttribute("customers")
     public ModelAndView index2() {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("customers", customerService.getAllCustomers());
        modelAndView.setViewName("customers/index");
        return modelAndView;
    }
     
     @RequestMapping("/customers")
     
     public ModelAndView getCustomers() {
         ModelAndView modelAndView = new ModelAndView();

        //modelAndView.addObject("customer", new Customer());
        modelAndView.setViewName("customerDisplay");
        return modelAndView;
    
    }
}
