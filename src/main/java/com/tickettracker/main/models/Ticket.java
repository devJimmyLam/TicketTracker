package com.tickettracker.main.models;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="tickets")
public class Ticket {

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	@Size(min=3, message="Must be at least 3 characters long.")
    private String name;
    private String severityType;
    private String status;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date dueDate;
    @Size(min=5, max=255, message="Must be at least 3 characters long.")
    private String description;
    
    //M:1 tickets are made by a user
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="creator_id")
    private User creator;
    
    //N:N many tickets can have many assignee
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="assignee_id")
	private User assignee;
    
	
    @OneToMany(mappedBy="ticket", fetch=FetchType.LAZY, cascade = {CascadeType.ALL})
    private List<Message> messages = new ArrayList<Message>();
   
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    public Ticket() {
    	
    }
//    TODO: need ticket constructor for search parameters to work.
    public Ticket(User creator, User assignee, String severityType, String status) {
    	this.creator = creator;
    	this.assignee = assignee;
    	this.severityType = severityType;
    	this.status = status;
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
    
    //TODO: need type list so drop down menu can function
//    private List<SeverityType> severityTypes = new ArrayList<SeverityType>();
//    private List<Status> statuses = new ArrayList<Status>();
   
    //TODO:entering date for ticket as string
    public String getDueDateString() {
    	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
    	return dateFormat.format(this.getDueDate());
    }
    
    //check if user is creator
    public boolean userIsCreator(User user) {
    	if(this.creator == user) {
    		return true;
    	}else {
    		return false;
    	}
    }
    
    //check if user is assignee
    public boolean userIsAssignee(User user) {
    	if(this.assignee == user) {
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
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSeverityType() {
		return severityType;
	}

	public void setSeverityType(String severityType) {
		this.severityType = severityType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

	public User getAssignee() {
		return assignee;
	}

	public void setAssignee(User assignee) {
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
