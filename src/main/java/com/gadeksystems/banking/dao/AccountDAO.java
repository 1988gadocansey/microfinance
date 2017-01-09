package com.gadeksystems.banking.dao;

import java.util.Collection;
import java.util.List;

import com.gadeksystems.banking.models.Account;
import com.gadeksystems.banking.models.Customer;
 
public interface AccountDAO {
	Account createAccount(Account account);
	Account findAccountByName(String name);
	Account findAccountByNumber(String number);
	Account withdraw(String number,double amount);
	Account deposit(String number,double amount);
	Account transfer(Account account,double amount);
    Account balance(String number);
    void updateAccount(Account account);
    void deleteAccount(int cId);
    Iterable<Account> getAllAccount();
    Iterable<Account> getStatements(String accountNo);
    boolean accountExists(String accountNo);
    boolean canWithdraw(String accountNo,double amount);
    boolean canTransfer(String accountNo,double amount);
}
