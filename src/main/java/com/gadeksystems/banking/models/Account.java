/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gadeksystems.banking.models;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.Set;
import javax.persistence.*;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
@EntityListeners(AuditingEntityListener.class)
@EnableJpaAuditing
@Entity
@Table(name = "account")
public class Account implements Serializable{
    private static final long serialVersionUID = -3254406057751181181L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)    
     
    @Column(name="account_id")
    
    private int id;
    @Column(name="customer")
    private String customer;
    @Column(name="name")
    private String name;
    @Column(name="type")
    private String type;
    @NotEmpty
    @Column(name="account_number",unique = true)
    private String number;
    @Column(name="opening_balance")
    private double balance;
    
    
    @Column(name="created_by")
    private String owner;
    
    @Version
    private Integer version;
   
   
    @Column(name="date_created")
    private Date created;
      @Column(name="last_update")
     private Date updated;

     @PrePersist
     protected void onCreate() {
       created = new Date();
     }

     @PreUpdate
     protected void onUpdate() {
       updated = new Date();
     }
      
     public Account(){}
   /*  public Account(int id,String name,String type,String number,Date created,Date updated){
    	 this.id=id;
     	this.name=name;
     	this.type=type;
     	this.number=number;
     	this.created=created;
     	this.updated=updated;
     }*/
    public Account(Account account){
    	this.id=account.id;
    	this.name=account.name;
    	this.type=account.type;
    	this.number=account.number;
    	this.customer=account.customer;
    	this.balance=account.balance;
    	this.created=account.created;
    	this.updated=account.updated;
    	 
    	
    }
    

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String string) {
		this.customer = string;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}
}
