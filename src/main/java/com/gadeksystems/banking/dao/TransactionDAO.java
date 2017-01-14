package com.gadeksystems.banking.dao;

import com.gadeksystems.banking.models.Account;

public interface TransactionDAO {

	Account balance(String number);//After transaction
}
