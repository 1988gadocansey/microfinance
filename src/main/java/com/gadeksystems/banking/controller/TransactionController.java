package com.gadeksystems.banking.controller;

import com.gadeksystems.banking.models.Account;
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

import com.gadeksystems.banking.models.Customer;
import com.gadeksystems.banking.models.Sms;
import com.gadeksystems.banking.models.Transactions;
import com.gadeksystems.banking.providers.SmsProvider;
import com.gadeksystems.banking.service.AccountService;
import com.gadeksystems.banking.service.CustomerService;
@Controller
public class TransactionController {
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
    @GetMapping("data/search")
    public String searchForm(){
    	return "search";
    }
    @GetMapping("transactions/accounts/deposit")
    public String doDeposit(){
    	return "search_deposit";
    }
    @GetMapping("transactions/accounts/withdrawals")
    public String doWithdrawal(){
        return "search_withdrawal";
    }
    @PostMapping("transactions/deposit/interface")
    public String doDepositView(Model model,HttpServletRequest request){
    	if(accountService.accountExists(request.getParameter("account"))=="1"){
    	model.addAttribute("account", accountService.findAccountByNumber(request.getParameter("account")));
        
    	return "transactions/process_deposit";
    	}
    	return "search_deposit";
    }
    
    @PostMapping("transactions/withdrawals/interface")
    public String doWithdrawalView(Model model,HttpServletRequest request){
    	if(accountService.accountExists(request.getParameter("account"))=="1"){
    	model.addAttribute("account", accountService.findAccountByNumber(request.getParameter("account")));
    	  return "transactions/process_withdrawal";
    	}
    	 return "search_withdrawal";
    	
    }
    @PostMapping("transactions/accounts/deposit")
    public String processDeposit(  Account account,Transactions transaction, BindingResult result, Model model, HttpServletRequest request,Sms mysms){
        
         
            accountService.deposit(account, transaction,request,mysms);

           
            model.addAttribute("success","Deposit was successful");

         
        
            return "redirect:/transactions/view/";
    }


    @PostMapping("transactions/accounts/withdrawals")
    public String processWithdrawals(  Account account,Transactions transaction, BindingResult result, Model model, HttpServletRequest request,Sms mysms){
        
        
            accountService.withdraw(account, transaction,request,mysms);

           
            model.addAttribute("success","Withdrawal was successful");

        
        
        return "redirect:/transactions/view/";
    }


    @GetMapping("transactions/view")
    public String  transactions(Model model){
       model.addAttribute("object", accountService.getTransactions());
        
        return "transactions/index";
    }
    
}
