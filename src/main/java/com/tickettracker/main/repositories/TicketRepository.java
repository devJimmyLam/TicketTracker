package com.tickettracker.main.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tickettracker.main.models.Ticket;

@Repository
public interface TicketRepository extends CrudRepository<Ticket, Long>{

	List<Ticket> findAll();
	
	List<Ticket> findByCreator(Long creator_id);
//	List<Ticket> findByNotCreator(String creator);
	
	List<Ticket> findByAssignee(Long assignee_id);
//	List<Ticket> findByNotAssignee(String assignee);
	
	List<Ticket> findBySeverityType(String severityType);
//	List<Ticket> findBySeverityTypeNot(String severityType);
	
	List<Ticket> findByStatus(String status);
//	List<Ticket> findByStatusNot(String status);
}
