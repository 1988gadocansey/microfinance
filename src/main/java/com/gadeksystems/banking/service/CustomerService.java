package com.gadeksystems.banking.service;

import java.util.List;

import com.gadeksystems.banking.models.Customer;

public interface CustomerService {
	public Customer findCustomerByEmail(String email);
	 Customer storeCustomer(Customer customer);
	 Iterable<Customer> getAllCustomers();
	Customer getCustomerById(int cId);
	Customer getCustomerByAccount(String accountNo);
   
    void updateCustomer(Customer customer);
    void deleteCustomer(int cId);
    boolean customerExists(String name);
}
