/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gadeksystems.banking.models;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.*;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
@EntityListeners(AuditingEntityListener.class)
@EnableJpaAuditing
@Entity
@Table(name = "accounts")
public class Account implements Serializable{
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name="id")
    private int id;
    private Customer customer;
    @Column(name="name")
    private String name;
    @Column(name="type")
    private String type;
    @Column(name="accountNumber")
    private Long number;
    @Version
    private Integer version;
    @Column(name="date_created")
    private Date created;
      @Column(name="last_updated")
     private Date updated;

     @PrePersist
     protected void onCreate() {
       created = new Date();
     }

     @PreUpdate
     protected void onUpdate() {
       updated = new Date();
     }
    @ManyToOne
    @JoinColumn(name = "customer_id")
    public Customer getCustomer() {
        return customer;
    }
    public Account(Account account){
    	this.id=account.id;
    	this.name=account.name;
    	this.type=account.type;
    	this.number=account.number;
    	this.created=account.created;
    	this.updated=account.updated;
    	 
    	
    }
    public void setCustomer(Customer customer) {
        this.customer = customer;
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

	public Long getNumber() {
		return number;
	}

	public void setNumber(Long number) {
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
}
