package com.gadeksystems.banking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gadeksystems.banking.models.Account;
import com.gadeksystems.banking.models.Customer;
@Repository("accountRepository")
public interface AccountRepository extends JpaRepository<Account, Integer> {
	
	

}
