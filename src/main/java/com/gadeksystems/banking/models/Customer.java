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

@Table(name = "customers")
public class Customer implements Serializable {

	private static final long serialVersionUID = 1L;
   
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
  @Transient 
   private Set<Account> accounts;
  @OneToMany(mappedBy = "account", cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    public Set<Account> getAccounts() {
        return accounts;
    }
  public void setAccounts(Set<Account> accounts) {
      this.accounts = accounts;
  }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name="id")
    private int id;

    @Column(name="enabled")
    private int enabled;

	@Column(name = "code")
    private String code;   
    @Column(name = "name")
    private String name;  
	@Column(name = "firstname")
    private String firstname;   

	@Column(name = "lastname")
    private String lastname;
    
	@Column(name ="othernames")
	private String othername;

	@Column(name ="title")
	private String title;

	@Column(name ="gender")
	private String gender;

	@Column(name ="job_title")
	private String job;
	@Column(name ="dob")
	private String dob;
	
	@Column(name ="mobile")
	private String mobile;

	@Column(name ="email")
	private String email;
	@Column(name ="denomination")
	private String denomination;
	@Column(name ="hometown")
	private String hometown;

	@Column(name ="contact_address")
	private String address;

	@Column(name ="relationship")
	private String relation;

	@Column(name ="beneficiaries")
	private String beneficiary;

	@Column(name ="residential_address")
	private String resident;
	@Column(name ="marital")
	private String marital;

          
	@Column(name ="type")
	private String type;
         
               
          
        
	public Customer(){
		
	}
	 
	public Customer(Customer customer) {
	        
	        this.firstname = customer.firstname;
	        this.lastname= customer.lastname;
	        this.othername = customer.othername;
	        this.gender = customer.gender;
	        this.title= customer.title;
	        this.job= customer.job;
	        this.dob= customer.dob;
	        this.code = customer.code;
	        this.mobile= customer.mobile;
	        this.email= customer.email;
	        this.address= customer.address;
	        this.resident= customer.resident;
	        this.hometown= customer.hometown;
	        this.relation= customer.relation;
	        this.beneficiary= customer.beneficiary;
	        this.type= customer.type;
                this.name= customer.name;
	        this.marital= customer.marital;
	        this.denomination= customer.denomination;
	               
	}
	
	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
	return	this.name = this.getTitle() + " " + this.getFirstname() + " " + othername + " " + lastname;
		
	}

	public void setName(String name) {
		this.name = this.getTitle() + " " + this.getFirstname() + " " + othername + " " + lastname;
	}
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	 
	public String getOthername() {
		return othername;
	}

	public void setOthername(String othername) {
		this.othername = othername;
	}

	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @return the job
	 */
	public String getJob() {
		return job;
	}

	/**
	 * @param job the job to set
	 */
	public void setJob(String job) {
		this.job = job;
	}

	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * @return the house
	 */
	public String getHometown() {
		return hometown;
	}

	/**
	 * @param house the house to set
	 */
	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the relation
	 */
	public String getRelation() {
		return relation;
	}

	/**
	 * @param relation the relation to set
	 */
	public void setRelation(String relation) {
		this.relation = relation;
	}

	/**
	 * @return the beneficiary
	 */
	public String getBeneficiary() {
		return beneficiary;
	}

	/**
	 * @param beneficiary the beneficiary to set
	 */
	public void setBeneficiary(String beneficiary) {
		this.beneficiary = beneficiary;
	}

	/**
	 * @return the resident
	 */
	public String getResident() {
		return resident;
	}

	/**
	 * @param resident the resident to set
	 */
	public void setResident(String resident) {
		this.resident = resident;
	}

	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return the denomination
	 */
	public String getDenomination() {
		return denomination;
	}

	/**
	 * @param denomination the denomination to set
	 */
	public void setDenomination(String denomination) {
		this.denomination = denomination;
	}

	public String getMarital() {
		return marital;
	}

	public void setMarital(String marital) {
		this.marital = marital;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}
	 
	 @Override
	    public String toString() {
	        String result = String.format(
	                "Customer[id=%d, firstname='%s']%n",
	                id, firstname);
	        if (accounts != null) {
	            for(Account account : accounts) {
	                result += String.format(
	                        "Account[id=%d, name='%s']%n",
	                        account.getId(), account.getName());
	            }
	        }

	        return result;
	    }
	
  
}