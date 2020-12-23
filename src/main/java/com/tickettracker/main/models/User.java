package com.tickettracker.main.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="users")
public class User {

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	
    @Size(min=2, message="First Name  must be at least 2 characters long.")
    private String firstName;
    @Size(min=2, message="Last Name  must be at least 2 characters long.")
    private String lastName;
    @Email(message="Email must be present and valid format. i.e jondoe@mail")
    @Size(min=1, message="You must enter an email.")
    private String email;
    @Size(min=8, message="Password must be at least 8 characters long.")
    private String password;
    @Transient
    @Size(min=8,message="Password must match.")
    private String passwordConfirmation;
    
    //1:M user is a creator of many tickets
    @OneToMany(mappedBy="creator", fetch = FetchType.LAZY)
    private List<Ticket> createdTickets;
    
    //N:N many assignee can be assigned many tickets
    @OneToMany(mappedBy="assignee", fetch=FetchType.LAZY)
    private List<Ticket> assignedTickets;
    
    //1:M user can write many messages
    @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Message> messages;
    
    
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    public User() {
    	
    }
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
        this.updatedAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}

	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}

	public List<Ticket> getCreatedTickets() {
		return createdTickets;
	}

	public void setCreatedTickets(List<Ticket> createdTickets) {
		this.createdTickets = createdTickets;
	}

	public List<Ticket> getAssignedTickets() {
		return assignedTickets;
	}

	public void setAssignedTickets(List<Ticket> assignedTickets) {
		this.assignedTickets = assignedTickets;
	}

	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	
    
	
    

}
