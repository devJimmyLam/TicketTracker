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
	
	//Allow users to create a ticket but the ticket number is done by the server. 
	//The first creator in the DB has a ticket number of 000001. Increment by 1 every time a new creator is added.
	public Ticket createTicket(Ticket ticket) {
		//Create ticket number by converting id to string and padding zeros in front
		Long number = ticket.getCreator().getId();
		//expected to print person id 
		System.out.println(number);
		int numLength = String.valueOf(number).length();
		//expected to print "Length: 1
		System.out.println("Length:" + numLength);
		
		// Increment by 1 every time a new creator is added.
		int numZeros = 6-numLength;
		String ticketNumber = "";
		for(int i = 0; i < numZeros; i++) {
			ticketNumber = ticketNumber + "0";
		}
		System.out.println(ticketNumber);
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
	
	
	//find ticket by creator
	public List<Ticket> findTicketByCreator(Long creator_id){
		return ticketRepo.findByCreator(creator_id);
	}
	

	//find ticket by assignee
	public List<Ticket> findTicketByAssignee(Long assignee_id){
		return ticketRepo.findByAssignee(assignee_id);
	}
	
	
	//find ticket by severity type
	public List<Ticket> findTicketBySeverityType(String severityType){
		return ticketRepo.findBySeverityType(severityType);
	}

	//find ticket by status
	public List<Ticket> findTicketByStatus(String status){
		return ticketRepo.findByStatus(status);
	}

	public void updateTicket(Ticket ticket) {
		ticketRepo.save(ticket);
	}
	
}
