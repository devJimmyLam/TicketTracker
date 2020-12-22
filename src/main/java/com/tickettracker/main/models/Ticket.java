package com.tickettracker.main.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="tickets")
public class Ticket {

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	
	private String number;
	
    @Size(min=3, message="Must be at least 3 characters long.")
    private String name;
    
    @Size(min=5, max=255, message="Must be at least 3 characters long.")
    private String description;
    
   
    private String severityType;
   
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date dueDate;
    
    @Column(columnDefinition = "Pending") 
    private String status;
 

    //M:1 tickets are made by a user
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="creator_id")
    private User creator;
    
    //N:N many tickets can have many assignee
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
		name="tickets_assignees",
		joinColumns=@JoinColumn(name="ticket_id"),
		inverseJoinColumns=@JoinColumn(name="assigned_id")
	)
	private List<User> assignee = new ArrayList<User>() ;
    
	
    @OneToMany(mappedBy="ticket", fetch=FetchType.LAZY, cascade = {CascadeType.ALL})
    private List<Message> messages = new ArrayList<Message>();
    
    
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    public Ticket() {
    	
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
    
    public boolean userIsAssignee(User user) {
    	if(this.getAssignee().contains(user)) {
    		return true;
    	}else {
    		return false;
    	}
    }
    
    public boolean userIsCreator(User user) {
    	if(this.creator == user) {
    		return true;
    	}else {
    		return false;
    	}
    }
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSeverityType() {
		return severityType;
	}
	public void setSeverityType(String severityType) {
		this.severityType = severityType;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public User getCreator() {
		return creator;
	}
	public void setCreator(User creator) {
		this.creator = creator;
	}
	public List<User> getAssignee() {
		return assignee;
	}
	public void setAssignee(List<User> assignee) {
		this.assignee = assignee;
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
