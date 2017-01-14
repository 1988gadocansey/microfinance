package com.gadeksystems.banking.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gadeksystems.banking.models.Customer;

@Repository("customerRepository")
public interface CustomerRepository extends CrudRepository<Customer, Integer> {
	Customer findByEmail(String email);
	Customer findById(String id);
}
