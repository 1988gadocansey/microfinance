package com.gadeksystems.banking.service;

import java.util.Collection;
import java.util.List;

import com.gadeksystems.banking.models.Account;
import com.gadeksystems.banking.models.Customer;

public interface CustomerService {
	public Customer findCustomerByEmail(String email);
	Customer storeCustomer(Customer customer);
	Iterable<Customer> getAllCustomers();
	Customer getCustomerById(int cId);
	List<Customer> getCustomerByName(String name);
	List<Account> getCustomerByAccount(String accountNo);
	String getCustomerAccount(int cId);
    void updateCustomer(Customer customer);
    void deleteCustomer(int cId);
    boolean customerExists(String name);
    Collection<Customer> getTransactions(String accountNo);
    List<Customer> getAccounts();
    
    
}
