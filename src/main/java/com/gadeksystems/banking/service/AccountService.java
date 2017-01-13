package com.gadeksystems.banking.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import com.gadeksystems.banking.dao.AccountDAO;
import com.gadeksystems.banking.models.Account;
import com.gadeksystems.banking.models.Customer;
import com.gadeksystems.banking.models.Transaction;
import com.gadeksystems.banking.models.User;
import com.gadeksystems.banking.providers.SmsProvider;
import com.gadeksystems.banking.repository.AccountRepository;
import com.gadeksystems.banking.repository.CustomerRepository;
import com.gadeksystems.banking.service.user.UserService;

@Transactional
@Repository

public class AccountService implements AccountDAO {
	@Autowired
	private UserService userService;
	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private SmsProvider sms;
	@Autowired
	@PersistenceContext
	private EntityManager em = null;

	public void setEntityManager(EntityManager em) {
		this.em = em;
	}

	public void setSmsProvider(SmsProvider sms) {
		this.sms= sms;
	}
	@Autowired
	public void setCustomerRepository(AccountRepository accountRepository) {
		this.accountRepository = accountRepository;
	}

	@Override
	 
	public void createAccount(Account account, Transaction transaction, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		User user = userService.getUserByEmail(auth.getName());
		account.setName(request.getParameter("name"));
		account.setType(request.getParameter("type"));
		account.setNumber(request.getParameter("number"));
		account.setCustomer(request.getParameter("customer"));
		account.setBalance(Double.parseDouble(request.getParameter("balance")));
		account.setOwner(user.getEmail());
		em.persist(account);
	 	// inserting into the transaction table as first deposit
		transaction.setOwner(user.getEmail());
		transaction.setAmount(Double.parseDouble(request.getParameter("balance")));
		transaction.setDescription(
				"Account Opening with initial deposit amounting " + Double.parseDouble(request.getParameter("balance")));
		transaction.setAccountNumber(Integer.parseInt(request.getParameter("number")));
		transaction.setAccount(Integer.parseInt(request.getParameter("customer")));
		transaction.setType("Credit"); 
		
		em.merge(transaction);

		// sms should follow with the new account details and deposit
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		double balance = Double.parseDouble(request.getParameter("balance"));
		if (balance <= 0.0) {
			String message = "Hi " + name + " thanks for opening account with us ";
		}
		String message = "Hi " + name + " thanks for opening account with us with initial deposit of  " + balance;

		try {
			sms.sms(message, phone);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Account findAccountByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Account findAccountByNumber(String number) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Account withdraw(String number, double amount) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Account deposit(String number, double amount) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Account transfer(Account account, double amount) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Account balance(String number) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateAccount(Account account) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteAccount(int cId) {
		// TODO Auto-generated method stub

	}

	@Override
	public Iterable<Account> getAllAccount() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterable<Account> getStatements(String accountNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean accountExists(String accountNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean canWithdraw(String accountNo, double amount) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean canTransfer(String accountNo, double amount) {
		// TODO Auto-generated method stub
		return false;
	}
}
