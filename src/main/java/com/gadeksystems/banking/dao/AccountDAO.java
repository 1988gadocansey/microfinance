package com.gadeksystems.banking.dao;

import java.util.Collection;
import java.util.List;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;

import com.gadeksystems.banking.models.Account;
import com.gadeksystems.banking.models.Customer;
import com.gadeksystems.banking.models.Transactions;
import com.gadeksystems.banking.models.Sms;
 
public interface AccountDAO {
	void createAccount(Account account,Transactions transaction,HttpServletRequest request,Sms mysms);
	Account findAccountById(int id);
	Iterable<Account> findAccountByName(String name);
	List<Account> findAccountByNumber(String number);
	void withdraw(Account account,Transactions transaction,HttpServletRequest request,Sms mysms);
	void deposit(Account account,Transactions transaction,HttpServletRequest request,Sms mysms);
	Account transfer(Account account,double amount);
	// Transactions  balance(String number);//get customer account balance
    void updateAccount(Account account);
    void deleteAccount(int cId);
    Iterable<Account> getAllAccount();
    Iterable<Account> getStatements(String accountNo);
    boolean accountExists(String accountNo);
    boolean canWithdraw(String accountNo,double amount);
    boolean canTransfer(String accountNo,double amount);
    List<Account> searchAccount(String number);
}
