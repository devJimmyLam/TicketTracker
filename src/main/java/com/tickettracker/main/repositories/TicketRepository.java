package com.tickettracker.main.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tickettracker.main.models.SeverityType;
import com.tickettracker.main.models.Status;
import com.tickettracker.main.models.Ticket;

@Repository
public interface TicketRepository extends CrudRepository<Ticket, Long>{

	List<Ticket> findAll();
	
	//TODO: need type list for drop down menu to function
	List<SeverityType> findTicketBySeverityType(String severityType);
	List<Status> findTicketByStatus(String status);

}
