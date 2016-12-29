package com.gadeksystems.banking.service;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;
import  com.gadeksystems.banking.models.Customer;

import com.gadeksystems.banking.repository.CustomerRepository;
@Transactional
@Repository

@Service("customerService")
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerRepository customerRepository;
	 
	 //private HibernateTemplate  hibernateTemplate;
    
	@Autowired
    public void setProductRepository(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }
	@Override
	public Customer findCustomerByEmail(String email) {
		return customerRepository.findByEmail(email);
	}

	@Override
	public Customer  storeCustomer(Customer customer) {
		 
        
		return customerRepository.save(customer);
	}

	@Override
	public List<Customer> getAllCustomers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Customer getCustomerById(int cId) {
		// TODO Auto-generated method stub
		return null;
	}

	 

	@Override
	public void updateCustomer(Customer customer) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCustomer(int cId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean customerExists(String name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Customer getCustomerByAccount(String accountNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
