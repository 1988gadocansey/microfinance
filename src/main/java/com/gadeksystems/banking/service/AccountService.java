package com.gadeksystems.banking.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import com.gadeksystems.banking.dao.AccountDAO;
import com.gadeksystems.banking.models.Account;
import com.gadeksystems.banking.models.Customer;
import com.gadeksystems.banking.models.Sms;
import com.gadeksystems.banking.models.Transactions;
import com.gadeksystems.banking.models.User;
import com.gadeksystems.banking.providers.SmsProvider;
import com.gadeksystems.banking.repository.AccountRepository;
import com.gadeksystems.banking.repository.CustomerRepository;
import com.gadeksystems.banking.repository.TransactionRepository;
import com.gadeksystems.banking.service.user.UserService;
import com.gadeksystems.banking.service.user.UserServiceImpl;
import java.util.Iterator;

@Transactional
@Repository

public class AccountService implements AccountDAO {
	 private static final Logger LOGGER = LoggerFactory.getLogger(AccountService.class);
	   
	@Autowired
	private UserService userService;
	@Autowired
	private AccountRepository accountRepository;
	@Autowired
	private CustomerRepository customerRepository;
	@Autowired
	private SmsProvider sms;
	@Autowired
	private TransactionRepository transactionRepository;
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
	public void setAccountRepository(AccountRepository accountRepository) {
		this.accountRepository = accountRepository;
	}
	@Autowired
    public void setCustomerRepository (CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }
    @Autowired
    public void setTransactionRepository (TransactionRepository transactionRepository) {
        this.transactionRepository = transactionRepository;
    }
	@Override
	 
	public void createAccount(Account account, Transactions transaction, HttpServletRequest request,Sms mysms) {
		LOGGER.debug("creating account for customer " + request.getParameter("name"));
		String message=null;
		String result=null;
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
		transaction.setAmount(request.getParameter("balance"));
		transaction.setDescription(
				"Account Opening with initial deposit amounting " + Double.parseDouble(request.getParameter("balance")));
		transaction.setAccountNumber(Integer.parseInt(request.getParameter("number")));
		transaction.setAccount(Integer.parseInt(request.getParameter("customer")));
		transaction.setType("Credit"); 
		
		em.persist(transaction);

		// sms should follow with the new account details and deposit
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		double balance = Double.parseDouble(request.getParameter("balance"));
		if (balance <= 0.0) {
			message = "Hi " + name + " thanks for opening account with us ";
		}
		  message = "Hi " + name + " thanks for opening account with us with initial deposit of  " + balance;

		try {
			
			result=sms.sms(message, phone);
			// persisting result to db
			mysms.setMessage(message);
			mysms.setStatus(result);
			mysms.setReceipient(name);
			mysms.setSender(user.getEmail());
			em.persist(mysms);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Iterable<Account> findAccountByName(String name) {
		 return (Iterable<Account>) accountRepository.findOneByName(name);
		 
	}

	@Override
	public List<Account> findAccountByNumber(String number) {
		return  (List) em.createQuery("FROM Account a where a.number=:a GROUP BY a.number").setParameter("a",number).getResultList();
		 
	}
 
         @Override
	public void withdraw(Account account, Transactions transaction, HttpServletRequest request,Sms mysms) {
			LOGGER.debug("withdrawing " + request.getParameter("amount") + "for account number " +request.getParameter("number"));
		String message=null;
		String result=null;
		int customer=0;
		String phone=null;
		String name=null;
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		User user = userService.getUserByEmail(auth.getName());
		Account acc= accountRepository.findOneByNumber(request.getParameter("number"));
		 
		 customer=Integer.parseInt(acc.getCustomer());
		Customer client=customerRepository.findOne(customer);
	 
			phone=client.getMobile();
			name=client.getName();
		 
	 	// inserting into the transaction table as first deposit
		transaction.setOwner(user.getEmail());
		transaction.setAmount("-"+ request.getParameter("amount") );
		transaction.setDescription(
				"Account Withdrawals amounting " + Double.parseDouble(request.getParameter("amount")));
		transaction.setAccountNumber(Integer.parseInt(request.getParameter("number")));
		transaction.setAccount(Integer.parseInt(request.getParameter("account")));
		
		transaction.setType("Debit"); 
		
		em.persist(transaction);

		// sms should follow with the new account details and deposit
		
		double amountt = Double.parseDouble(request.getParameter("amount"));
		 double balance;
            // balance = (Double)this.balance(request.getParameter("number"));
                 LOGGER.debug("Getting all transaction balance "  );
		  message = "Hi " + name + " an amount of   " + amountt + "has been withdrawn from your account";

		try {
			
			result=sms.sms(message, phone);
			// persisting result to db
			mysms.setMessage(message);
			mysms.setStatus(result);
			mysms.setReceipient(name);
			mysms.setSender(user.getEmail());
			em.persist(mysms);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	 
//	public  Transactions balance(String number) {
//            Object object;
//            Query q= em.createQuery("SELECT SUM(amount) FROM Transactions  where a.accountNumber=:a ").setParameter("a",number);
//
//            Object[] results=(Object[])q.getSingleResult();
//            for(  object:results){
//                System.out.println(object);
//            }
//        return object;
//	}
	@Override
	public void deposit(Account account, Transactions transaction, HttpServletRequest request,Sms mysms) {
		LOGGER.debug("depositing " + request.getParameter("amount") + "for account number " +request.getParameter("number"));
		String message=null;
		String result=null;
		int customer=0;
		String phone=null;
		String name=null;
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		User user = userService.getUserByEmail(auth.getName());
		Account acc= accountRepository.findOneByNumber(request.getParameter("number"));
		 
		 customer=Integer.parseInt(acc.getCustomer());
		Customer client=customerRepository.findOne(customer);
	 
			phone=client.getMobile();
			name=client.getName();
		 
	 	// inserting into the transaction table as first deposit
		transaction.setOwner(user.getEmail());
		transaction.setAmount( request.getParameter("amount") );
		transaction.setDescription(
				"Account Deposit amounting " + Double.parseDouble(request.getParameter("amount")));
		transaction.setAccountNumber(Integer.parseInt(request.getParameter("number")));
		transaction.setAccount(Integer.parseInt(request.getParameter("account")));
		
		transaction.setType("Credit"); 
		
		em.persist(transaction);

		// sms should follow with the new account details and deposit
		
		double amountt = Double.parseDouble(request.getParameter("amount"));
		 double balance;
            // balance = (Double)this.balance(request.getParameter("number"));
                 LOGGER.debug("Getting all transaction balance "  );
		  message = "Hi " + name + "you have just deposited  " + amountt ;

		try {
			
			result=sms.sms(message, phone);
			// persisting result to db
			mysms.setMessage(message);
			mysms.setStatus(result);
			mysms.setReceipient(name);
			mysms.setSender(user.getEmail());
			em.persist(mysms);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Account transfer(Account account, double amount) {
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
		  LOGGER.debug("Getting all accounts");
	        return accountRepository.findAll(new Sort("name"));
	}

	@Override
	public Iterable<Account> getStatements(String accountNo) {
		 LOGGER.debug("Getting all account statement for  " + accountNo);
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

	@Override
	public Account findAccountById(int id) {
		return accountRepository.findOne(id);
	}

	@Override
	public List<Account> searchAccount(String number) {
		
		//return  (List) em.createQuery("FROM Account a where a.number LIKE '%'.:a.'%' ").setParameter("a",number).getResultList();
		return accountRepository.findByNumberContaining(number);
	}
        
        public List<Transactions>getTransactions(){
        return transactionRepository.findAll();
        }

	
}
