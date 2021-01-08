package com.tickettracker.main.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tickettracker.main.models.SeverityType;
import com.tickettracker.main.models.Status;
import com.tickettracker.main.models.Ticket;
import com.tickettracker.main.models.User;

@Repository
public interface TicketRepository extends CrudRepository<Ticket, Long>{

	List<Ticket> findAll();
	
	//TODO: need type list for drop down menu to function
	List<SeverityType> findTicketBySeverityType(String severityType);
	List<Status> findTicketByStatus(String status);
	
	//TODO: need methods below for search features
	List<Ticket>findByCreatorContaining(User searchString);
	List<Ticket>findByAssigneeContaining(User searchString);
	List<Ticket>findBySeverityTypeContaining(String searchString);
	List<Ticket>findByStatusContaining(String searchString);
	



}
