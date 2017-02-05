package com.gadeksystems.banking.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Query;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import com.gadeksystems.banking.dao.AccountDAO;
import com.gadeksystems.banking.handlers.NotFoundException;
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
	private TransactionService transactionService;
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
	if(this.accountExists(request.getParameter("number"))=="1"){
		if(this.canWithdraw(Long.parseLong(request.getParameter("number")),Double.parseDouble(request.getParameter("amount")))==true){
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
        balance = Double.parseDouble(transactionService.balance(Long.parseLong(request.getParameter("number"))));
             LOGGER.debug("Getting all transaction balance "  );
	  message = "Hi " + name  + amountt + "has been withdrawn from your account your account balance is GHS"+balance; ;

		  //message = "Hi " + name + " an amount of   " + amountt + "has been withdrawn from your account";

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
		else{
			}
		}
		 
	

	else{
		 
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
		if(this.accountExists(request.getParameter("number"))=="1"){
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
            balance = Double.parseDouble(transactionService.balance(Long.parseLong(request.getParameter("number"))));
                 LOGGER.debug("Getting all transaction balance "  );
		  message = "Hi " + name + "you have just deposited  " + amountt + "your account balance is GHS"+balance; ;

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
		else{
			
		}
	}

	@Override
	public Account transfer(Account account, double amount) {
		// TODO Auto-generated method stub
		return null;
	}

	 

	@Override
	public void updateAccount(int id,double balance,String name,String type,String number) {
				try {
				Account account = accountRepository.findOne(id);
				account.setNumber(number);
				account.setName(name);
				account.setType(type);
				account.setBalance(balance);
				accountRepository.saveAndFlush(account);
				}
				catch (Exception ex) {
				ex.toString();
				}
				 

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
	public String accountExists(String accountNo){
		String output=null;
		 
			
		 Query q=em.createQuery("FROM Account a WHERE a.number=:num").setParameter("num", accountNo);
		/*Account account=(Account)q.getSingleResult();
		  if(account.getNumber().toString()=="0" || account.getNumber().toString()==""){
			  return "0";
		  }
		  else{
			  return "1";
		  }*/
		 
			 List results = q.getResultList();
			 if (results.isEmpty()) {
				 return "0";
			 }
		     else {
		    	 return "1";
		     }
			 
			
		 
		 
	}

	@Override
	public boolean canWithdraw(long accountNo, double amount) {
		Query query=em.createQuery("SELECT SUM(t.amount) FROM Transactions t WHERE t.accountNumber= :a ").setParameter("a",accountNo);
		   String balance=(String)query.getSingleResult();
		    double amounts=Double.parseDouble(balance);
		    if(amounts>amount){
		    	return true;
		    }
		    else{
		   return false;
		    }
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
	public Account findAccountByCustomerID(int id) {
		//return accountRepository.findOneByCustomerEquals(id);
		return (Account) em.createQuery("FROM Account a WHERE customer=:a").setParameter("a",id).getResultList();
	 
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
