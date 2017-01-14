/*
 * This table stores sms messages sent.
 *  */
package com.gadeksystems.banking.models;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.Set;
import javax.persistence.*;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
@EntityListeners(AuditingEntityListener.class)
@EnableJpaAuditing
@Entity

@Table(name = "sms")
public class Sms implements Serializable {
    /**
	 * @param id
	 * @param created
	 * @param message
	 * @param status
	 * @param sender
	 * @param receipient
	 */
	public Sms(Sms sms) {
		 
		this.id = sms.id;
		this.created = sms.created;
		this.message = sms.message;
		this.status = sms.status;
		this.sender = sms.sender;
		this.receipient = sms.receipient;
	}

	/**
	 * 
	 */
	public Sms() {
		 
	}

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name="id")
    private int id;
    private static final long serialVersionUID = 1L;
    @Column(name="date")
    private Date created;
      
    @PrePersist
    protected void onCreate() {
       created = new Date();
    }
    
     @Column(name="message")
     private String message;
     
     @Column(name="status")
     private String status;
     
     @Column(name="sender")
     private String sender;
     
     @Column(name="receipient")
     private String receipient;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceipient() {
		return receipient;
	}

	public void setReceipient(String receipient) {
		this.receipient = receipient;
	}
     
     
   
}
