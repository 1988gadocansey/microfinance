package com.gadeksystems.banking.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gadeksystems.banking.models.Account;
import com.gadeksystems.banking.models.Customer;
@Repository("accountRepository")
public interface AccountRepository extends JpaRepository<Account, Integer> {
	
	Account findOneByNumber(String number);
	Account findOneByName(String name);
	Account findOneById(int id);
	List<Account> findByNumberContaining(String number);
	 
}
