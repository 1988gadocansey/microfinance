package com.gadeksystems.banking.service;

 
import java.math.BigDecimal;
import java.util.Collection;
 

import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

import com.gadeksystems.banking.repository.CustomerRepository;
import com.gadeksystems.banking.repository.AccountRepository;

import com.gadeksystems.banking.repository.TransactionRepository;
import com.gadeksystems.banking.dao.TransactionDAO;
import com.gadeksystems.banking.models.Account;
import com.gadeksystems.banking.models.Transactions;
import java.util.List;

/**
 *
 * @author Nyame Tease
 */
@Transactional
@Repository
@Service("transactionService")
public class TransactionService implements TransactionDAO {

    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private TransactionRepository transactionRepository;
    @Autowired
    private EntityManager em = null;

    public void setEntityManager(EntityManager em) {
        this.em = em;
    }

    @Autowired
    public void setCustomerRepository(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public void setAccountRepository(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

    public void setTransactionRepository(TransactionRepository transactionRepository) {
        this.transactionRepository = transactionRepository;
    }

    @Override
    public String balance(long number) {
    	
	   Query query=em.createQuery("SELECT SUM(t.amount) FROM Transactions t WHERE t.accountNumber= :a ").setParameter("a",number);
	   String balance=(String)query.getSingleResult();
	   return balance;
   
    }
    public String balanceById(int id) {
    	
 	   Query query=em.createQuery("SELECT SUM(t.amount) FROM Transactions t WHERE t.account= :a ").setParameter("a",id);
 	   String balance=(String)query.getSingleResult();
 	   return balance;
    
     }

    @Override
    public List<Transactions> getAllTransactions(long number) {
    	//somethingRepository.findById(id).orElseThrow(NotFoundExcepti‌​on::new);
		return  (List) em.createQuery("FROM Transactions t  WHERE t.accountNumber= :a ").setParameter("a",number).getResultList();
	 
    }

	@Override
	public List<Transactions> getAllByAccountId(int id) {
		return  (List) em.createQuery("FROM Transactions t  WHERE t.account= :a ").setParameter("a",id).getResultList();
		
	}

    /*Query query = this.em.createQuery(FIND_USERDATA_STATEMENT);
    query.setParameter("table", table);
    query.setParameter("fieldName", field);

    List results = query.getResultList();
    if (results.isEmpty()) {
        return null;
    }
    else if (results.size() == 1)  {
        return results.get(0);
    }
    throw new NonUniqueResultException();*/
}
