package com.tickettracker.main.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tickettracker.main.models.SeverityType;
import com.tickettracker.main.models.Ticket;
import com.tickettracker.main.repositories.SeverityTypeRepository;
import com.tickettracker.main.repositories.TicketRepository;

@Service
public class SeverityTypeService {

	private SeverityTypeRepository severityTypeRepo;
	
	public List<SeverityType> findTicketsBySeverityType(String severityType){
		return severityTypeRepo.findBySeverityType(severityType);
	}
}
