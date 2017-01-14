package com.gadeksystems.banking.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gadeksystems.banking.models.Account;
import com.gadeksystems.banking.models.Transactions;
@Repository("transactionRepository")
public interface TransactionRepository extends JpaRepository<Transactions, Integer> {

}
