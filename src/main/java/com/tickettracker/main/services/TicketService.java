package com.tickettracker.main.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tickettracker.main.models.SeverityType;
import com.tickettracker.main.models.Status;
import com.tickettracker.main.models.Ticket;
import com.tickettracker.main.models.User;
import com.tickettracker.main.repositories.TicketRepository;

@Service
public class TicketService {
	@Autowired
	private TicketRepository ticketRepo;
	
	public List<Ticket> findAllTickets(){
		return ticketRepo.findAll();
	}
	
//	public List<Ticket> findTicketsBySeverityType(String severityType){
//		return ticketRepo.findBySeverityType(severityType);
//	}
//	public List<Ticket> findTicketsByStatus(String status){
//		return ticketRepo.findByStatus(status);
//	}
	
	public Ticket createTicket(Ticket ticket) {
		return ticketRepo.save(ticket);
	}
	
	public List<Ticket> findByStatus(String searchString) {
		return ticketRepo.findByStatusContaining(searchString);
	}
	
	public Ticket findTicketById(Long id) {
		Optional<Ticket> ticket = ticketRepo.findById(id);
		if(ticket.isPresent()) {
			return ticket.get();
		}else {
			return null;
		}
	}
	public void deleteTicket(Ticket ticket) {
		ticketRepo.delete(ticket);
	}
	public void updateTicket(Ticket ticket) {
		ticketRepo.save(ticket);
	}
	
}
