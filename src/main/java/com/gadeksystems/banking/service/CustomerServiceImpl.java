package com.gadeksystems.banking.service;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

import com.gadeksystems.banking.models.Account;
import  com.gadeksystems.banking.models.Customer;

import com.gadeksystems.banking.repository.CustomerRepository;
@Transactional
@Repository

@Service("customerService")
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerRepository customerRepository;
	@Autowired
	private EntityManager em=null;
	 
	public void setEntityManager(EntityManager em){
		this.em=em;
	}
    
	@Autowired
    public void setCustomerRepository (CustomerRepository customerRepository) {
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
	 public Iterable<Customer> getAllCustomers() {
		 return customerRepository.findAll();
	}

	@Override
	public Customer getCustomerById(int cId) {
		return customerRepository.findOne(cId);
	}

	 

	
	@Override
	public void updateCustomer(Customer customer) {
		 em.merge(customer);
		
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
	@SuppressWarnings("unchecked")
	@Override
	public List getCustomerByAccount(String accountNo) {
		//return em.createQuery("FROM Account  WHERE number=:a ")
				//.setParameter("a",accountNo).getResultList();
		 
		return  (List) em.createQuery("FROM Account a where a.number=:a GROUP BY a.number").setParameter("a",accountNo).getResultList();
	 
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Customer> getCustomerByName(String name) {
		 return em.createQuery("SELECT * FROM customers WHERE concat('firstname'.' '.'othernames'.' '.'lastname' ) LIKE '%',:name,'%' ")
				.setParameter("name",name).getResultList();
	}
	@Override
	public Collection<Customer> getTransactions(String accountNo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Customer> getAccounts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getCustomerAccount(int cId) {
		Query q= em.createQuery("FROM Account a where a.customer=:a").setParameter("a",cId);
		 Account a=(Account) q.getSingleResult();
		 return a.getNumber().toString();
	}
	 

}
