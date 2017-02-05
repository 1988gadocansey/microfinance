package com.gadeksystems.banking.dao;
import java.math.BigDecimal;
import java.util.List;
import com.gadeksystems.banking.models.Account;
import com.gadeksystems.banking.models.Transactions;

public interface TransactionDAO {

	String balance(long number);//After transaction
        List<Transactions> getAllTransactions(long number);//After transaction
        List<Transactions> getAllByAccountId(int id);
}
