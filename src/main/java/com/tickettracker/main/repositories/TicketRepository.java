package com.tickettracker.main.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tickettracker.main.models.Ticket;

@Repository
public interface TicketRepository extends CrudRepository<Ticket, Long>{

	List<Ticket> findAll();
	List<Ticket> findBySeverityType(String severityType);
	List<Ticket> findByStatus(String status);

}
