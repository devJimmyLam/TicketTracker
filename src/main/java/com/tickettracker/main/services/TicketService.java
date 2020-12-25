package com.tickettracker.main.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tickettracker.main.models.Ticket;
import com.tickettracker.main.repositories.TicketRepository;

@Service
public class TicketService {
	@Autowired
	private TicketRepository ticketRepo;
	
	public List<Ticket> findAllTickets(){
		return ticketRepo.findAll();
	}
	public List<Ticket> findTicketBySeverityType(String severityType){
		return ticketRepo.findBySeverityType(severityType);
	}
	public List<Ticket> findTicketByStatus(String status){
		return ticketRepo.findByStatus(status);
	}
	//Allow users to create a ticket but the ticket number is done by the server. 
	//The first creator in the DB has a ticket number of 000001. Increment by 1 every time a new creator is added.
	public Ticket createTicket(Ticket ticket) {
		//Create ticket number by converting id to string and padding zeros in front
		Long number = ticket.getCreator().getId();
		int numLength = String.valueOf(number).length();
		// Increment by 1 every time a new creator is added.
		int numZeros = 6-numLength;
		String ticketNumber = "";
		for(int i = 0; i < numZeros; i++) {
			ticketNumber = ticketNumber + "0";
		}
		ticketNumber = ticketNumber + String.valueOf(number);
		ticket.setNumber(ticketNumber);
		return ticketRepo.save(ticket);
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
