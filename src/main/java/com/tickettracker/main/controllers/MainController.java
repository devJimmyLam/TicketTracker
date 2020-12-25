package com.tickettracker.main.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tickettracker.main.models.Message;
import com.tickettracker.main.models.SeverityType;
import com.tickettracker.main.models.Status;
import com.tickettracker.main.models.Ticket;
import com.tickettracker.main.models.User;
import com.tickettracker.main.services.MessageService;
import com.tickettracker.main.services.TicketService;
import com.tickettracker.main.services.UserService;
import com.tickettracker.main.validators.UserValidator;

@Controller
public class MainController {

	private final UserValidator userValidator;
	private final UserService userService;
	private final TicketService ticketService;
	private final MessageService messageService;
	
	public MainController(MessageService messageService, TicketService ticketService, UserService userService, UserValidator userValidator) {
		this.userService = userService;
		this.userValidator = userValidator;
		this.ticketService = ticketService;
		this.messageService = messageService;
	}
    @GetMapping("/welcome")
    public String showWelcomePage(
    		@ModelAttribute("user") User user, 
    		Model model, 
    		HttpSession session) {
			return "welcome.jsp";
	}
	///////
	//Users Controller methods
	///////
    @PostMapping(value="/registration")
    public String registerUser(
    		Model model,
    		@Valid @ModelAttribute("user") User user,
    		BindingResult result, 
    		HttpSession session) {
        
    	userValidator.validate(user, result);
        
    	if(result.hasErrors()) {
    		System.out.println("user register error");
            return "welcome.jsp";
        }
        User u = userService.registerUser(user);
        session.setAttribute("userId", u.getId());
        return "redirect:/tickets";
    }

    @PostMapping(value="/login")
    public String loginUser(
    		@RequestParam("email") String email, 
    		@RequestParam("password") String password,
    		@ModelAttribute("user") User user,
    		HttpSession session,
    		RedirectAttributes flashMessage) {
        // if the user is authenticated, save their user id in session
    	if(userService.authenticateUser(email, password)) {
    		User thisUser = userService.findUserByEmail(email);
    		session.setAttribute("userId", thisUser.getId());
    		return "redirect:/tickets";
    	} else {
    		System.out.println("user login error");
    		flashMessage.addFlashAttribute("errors", "Failed to login.");
    		return "redirect:/welcome";
    	}
        
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // invalidate session
    	session.invalidate();
        // redirect to login page
    	return "redirect:/welcome";
    }
	////////
	//Tickets Controller methods
	////////
    @GetMapping("/tickets")
    public String showAllTickets(@ModelAttribute("ticket") Ticket ticket, Model model, HttpSession session) {
    	Long id = (Long) session.getAttribute("userId");
    	if(id != null) {
    		User user = userService.findUserById((Long) session.getAttribute("userId"));
			model.addAttribute("user", user);
			List<Ticket> tickets = ticketService.findAllTickets();
			model.addAttribute("tickets", tickets); 
    		List<User> assignee = userService.findAllUsers();
    		model.addAttribute("assignees", assignee);
			model.addAttribute("severityType", SeverityType.severityType);
			model.addAttribute("status", Status.status);
			return "allTickets.jsp";
		}else {
			return "redirect:/welcome";
		}
  	}
	
    @GetMapping("/tickets/new")
	public String newTicketPage(@ModelAttribute("ticket") Ticket ticket, Model model, HttpSession session) {
       	Long id = (Long) session.getAttribute("userId");
    	if(id != null) {
    		User user = userService.findUserById((Long) session.getAttribute("userId"));
    		model.addAttribute("user", user);
    		//create a list of users to pick as assignee
    		List<User> assignee = userService.findAllUsers();
    		model.addAttribute("assignees", assignee);
			model.addAttribute("severityType", SeverityType.severityType);
			model.addAttribute("status", Status.status);
    		return "newTicket.jsp";
    	}else {
    		return "redirect:/welcome";
    	}
    
    }
	
    @PostMapping("/tickets/add")
	public String createTicket(@Valid @ModelAttribute("ticket") Ticket ticket, BindingResult result,Model model, HttpSession session){
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.findUserById(userId);
		if(result.hasErrors()) {
			model.addAttribute("user", user);
			model.addAttribute("ticket", ticket);
    		List<User> assignee = userService.findAllUsers();
    		model.addAttribute("assignees", assignee);
			model.addAttribute("severityType", SeverityType.severityType);
			model.addAttribute("status", Status.status);
			return "newTicket.jsp";
		}else {
			ticket.setCreator(user);
			ticketService.createTicket(ticket);
			return "redirect:/tickets";
		}
	}
	
	@GetMapping("/tickets/{id}")
	public String ticketDetail(@PathVariable("id") Long ticketId,@ModelAttribute("newMessage") Message message, HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId != null) {
			User user = userService.findUserById((Long) session.getAttribute("userId"));
			model.addAttribute("user", user);
			Ticket ticket = ticketService.findTicketById(ticketId);
			model.addAttribute("ticket", ticket);
			model.addAttribute("severityType", SeverityType.severityType);
			model.addAttribute("status", Status.status);
			return "ticketDetail.jsp";
		}else {
			return "redirect:/welcome";
		}
	}
	
	@GetMapping("/tickets/{id}/edit")
	public String showEditTicketPage(@PathVariable("id") Long ticketId,Model model, HttpSession session, @ModelAttribute("ticket") Ticket editTicket) {
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.findUserById(userId);
		if(userId != null) {
			model.addAttribute("user", user);
    		List<User> assignee = userService.findAllUsers();
    		model.addAttribute("assignees", assignee);
			model.addAttribute("severityType", SeverityType.severityType);
			model.addAttribute("status", Status.status);
			Ticket ticket = ticketService.findTicketById(ticketId);
			model.addAttribute("ticketNumber", ticket.getNumber());
			model.addAttribute("name", ticket.getName());
			model.addAttribute("severity", ticket.getSeverityType());
			model.addAttribute("status", ticket.getStatus());
			model.addAttribute("dueDate", ticket.getDueDate());
			model.addAttribute("description", ticket.getDescription());
			return "editTicket.jsp";
		}else {
			return "redirect:/welcome";
		}
	}
	
	@PostMapping("/tickets/{id}/update")
	public String editTicket(@PathVariable("id") Long ticketId, Model model, HttpSession session, @Valid @ModelAttribute("ticket") Ticket editTicket, BindingResult result) {
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.findUserById(userId);
		Ticket ticket = ticketService.findTicketById(ticketId);
		if(result.hasErrors()) {
			model.addAttribute("ticketNumber", ticket.getNumber());
			model.addAttribute("name", ticket.getName());
			model.addAttribute("severity", ticket.getSeverityType());
			model.addAttribute("status", ticket.getStatus());
			model.addAttribute("dueDate", ticket.getDueDate());
			model.addAttribute("description", ticket.getDescription());
			return "editTicket.jsp";
		}else {
			ticket.setNumber(editTicket.getNumber());
			ticket.setName(editTicket.getName());
			ticket.setStatus(editTicket.getStatus());
			ticket.setSeverityType(editTicket.getSeverityType());
			ticket.setDueDate(editTicket.getDueDate());
			ticket.setDescription(editTicket.getDescription());
			ticketService.updateTicket(ticket);
			return "redirect:/tickets/" + ticket.getId();
		}
	}
	
	@PostMapping("/tickets/{id}/delete")
	public String deleteTicket(@PathVariable("id") Long ticketId, HttpSession session) {
		Ticket ticket = ticketService.findTicketById(ticketId);
		ticketService.deleteTicket(ticket);
			return "redirect:/tickets";
	}

	//////////
	//Messages Controller methods
	//////////
	@PostMapping("/tickets/{id}/message")
	public String addMessage(@PathVariable("id") Long ticketId, @RequestParam("newMessage") String message, HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId != null) {
			User user = userService.findUserById((Long) session.getAttribute("userId"));
			model.addAttribute("user", user);
			Ticket ticket = ticketService.findTicketById(ticketId);
			model.addAttribute("ticket", ticket);
    		List<User> assignee = userService.findAllUsers();
    		model.addAttribute("assignees", assignee);
			model.addAttribute("severityType", SeverityType.severityType);
			model.addAttribute("status", Status.status);
			//create new message
			Message newMessage = new Message();
			newMessage.setMessage(message);
			newMessage.setTicket(ticket);
			newMessage.setUser(user);
			messageService.createMsg(newMessage);
			return "redirect:/tickets/"+ticket.getId();
		}else {
			return "redirect:/welcome";
		}
	}

 
}
