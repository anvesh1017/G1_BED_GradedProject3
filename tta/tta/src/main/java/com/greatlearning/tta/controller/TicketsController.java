package com.greatlearning.tta.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;

import com.greatlearning.tta.entity.Tickets;
import com.greatlearning.tta.service.TicketsService;

@Controller
@RequestMapping("/tickets")
public class TicketsController {
	
	@Autowired
	private TicketsService ticketsService;
	
	@RequestMapping("/list")
	public String listTickets(Model theModel) {
		
		List<Tickets> tickets = ticketsService.findAll();
		
		theModel.addAttribute("tickets", tickets);
		
		
		return "list-tickets";
	}
	
	
	@RequestMapping("/displayTicketsForm")
	public String addTicket_step1(Model theModel) {
		
		Tickets tickets = new Tickets();
		
		theModel.addAttribute("tickets", tickets);
		
		theModel.addAttribute("mode", "new");
		
		return "tickets-form";
	}
	
	@PostMapping("/save")
	public String saveTicket(@RequestParam("id") int id, @RequestParam("title") String title,
	    @RequestParam("description") String description,  @RequestParam(value = "content", required = false) String content, @RequestParam(value = "createdOn", required = false) LocalDate createdOn) {
		
        // If createdOn is not provided, set it to current date for new tickets
        if (createdOn == null && id == 0) {
            createdOn = LocalDate.now();
        }
		
		ticketsService.saveOrUpdate(id, title, description, content, createdOn);

	  // use a redirect to 'tickets-listing'
	  return "redirect:/tickets/list";
		
	}  
	
	@RequestMapping("/displayTicketForm_Update")
	public String updateStudent_Step1(@RequestParam("ticketId") int ticketId, Model theModel) {

		Tickets tickets = ticketsService.findById(ticketId);

		// set 'student' as a model attribute to pre-populate the form
		theModel.addAttribute("tickets", tickets);
		
		theModel.addAttribute("mode", "edit");

		// send over to our form
		return "tickets-form";
	}
	
	@RequestMapping("/displayTicketForm_View")
	public String viewStudent_Step1(@RequestParam("ticketId") int ticketId, Model theModel) {

		Tickets tickets = ticketsService.findById(ticketId);

		theModel.addAttribute("tickets", tickets);
		
		theModel.addAttribute("mode", "view");

		return "tickets-form";
	}
	
	
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("ticketId") int ticketId) {

	    // delete the student
		ticketsService.deleteById(ticketId);

	    // redirect to 'students-listing'
	    return "redirect:/tickets/list";
	}  
	
	@RequestMapping("/search")
	public String search(@RequestParam("title") String title, Model theModel) {


	  if (title.trim().isEmpty()) {
	    return "redirect:/tickets/list";
	  } else {

	    // search by 'ticket title'
	    List<Tickets> tickets = ticketsService.searchBy(title);

	    // Add it to the UI Model
	    theModel.addAttribute("tickets", tickets);

	    // Returns the 'tickets-listing' page
	    return "list-tickets";
	  }
	}            
	

}
