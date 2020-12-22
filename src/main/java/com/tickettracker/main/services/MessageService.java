package com.tickettracker.main.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tickettracker.main.models.Message;
import com.tickettracker.main.repositories.MessageRepository;

@Service
public class MessageService {

	@Autowired
	private MessageRepository messageRepo;
	
	public List<Message> findAllMsg(){
		return messageRepo.findAll();
	}
	
	public Message createMsg(Message message) {
		return messageRepo.save(message);
	}
}
