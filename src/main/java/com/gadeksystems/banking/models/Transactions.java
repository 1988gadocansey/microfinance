package com.gadeksystems.banking.models;
import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.Set;
import javax.persistence.*;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
@EntityListeners(AuditingEntityListener.class)
@EnableJpaAuditing
@Entity
@Table(name = "transactions")
public class Transactions implements Serializable {
	
	 	private static final long serialVersionUID = -3254406057751181181L;
	 	@Id
	    @GeneratedValue(strategy = GenerationType.AUTO) 
	 	@Column(name="id")
	 	private int id;
	 	@NotNull
	    @Column(name="account_id")
	    private int account;
	 	@NotNull
	    @Column(name="account_number")
	    private int accountNumber;
	    @Column(name="description")
	    private String description;
	    @NotNull
	    @Column(name="amount")
	    private String amount;
	    @NotEmpty
	    @Column(name="type")
	    private String type;
	    
	    @NotEmpty
	    @Column(name="created_by")
	    private String owner;
	    
	    @Column(name="transaction_date")
	    private Date date;
	    @ManyToMany(cascade={CascadeType.PERSIST})
	    @JoinTable(name="account",joinColumns = @JoinColumn(name = "account_id"),
	    inverseJoinColumns = @JoinColumn(name = "account_id"))
	    @PrePersist
	    protected void onCreate() {
	       date= new Date();
	    }
	    public Transactions(){
	    	
	    }
	    public Transactions(Transactions transaction){
	    	this.id=transaction.id;
	    	this.type=transaction.type;
	    	this.amount=transaction.amount;
	    	this.accountNumber=transaction.accountNumber;
	    	this.account=transaction.account;
	    	this.date=transaction.date;
	    	this.description=transaction.description;
	    	this.owner=transaction.owner;
	    }
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getAccount() {
			return account;
		}
		public void setAccount(int account) {
			this.account = account;
		}
		public int getAccountNumber() {
			return accountNumber;
		}
		public void setAccountNumber(int accountNumber) {
			this.accountNumber = accountNumber;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getAmount() {
			return amount;
		}
		public void setAmount(String amount) {
			this.amount = amount;
		}
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getOwner() {
			return owner;
		}
		public void setOwner(String owner) {
			this.owner = owner;
		}
	    
	    

}
