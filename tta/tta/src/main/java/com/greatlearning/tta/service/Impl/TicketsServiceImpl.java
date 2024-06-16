package com.greatlearning.tta.service.Impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greatlearning.tta.entity.Tickets;
import com.greatlearning.tta.repository.TicketsRepository;
import com.greatlearning.tta.service.TicketsService;

@Service
public class TicketsServiceImpl implements TicketsService {

	@Autowired
	TicketsRepository ticketsRepository;
	
	@Override
	public List<Tickets> findAll() {
		
		List<Tickets> tickets = ticketsRepository.findAll();
		return tickets;
	}

	@Override
	public void Save(Tickets ticket) {
		
		ticketsRepository.save(ticket);
	}

	@Override
	public Tickets findById(int id) {
		
		return ticketsRepository.findById(id).get();
	}

	@Override
	public void saveOrUpdate(int id, String title, String description, String content, LocalDate createdOn) {
	    System.out.println("Student ID ->" + id);

	    Tickets ticketsObj = null;
	    if (id == 0) {
	    	
	    	createdOn = LocalDate.now();

	    	ticketsObj = new Tickets(title, description, content, createdOn);
	      System.out.println("Add Title Scenario");
	    } else {

	      System.out.println("Update Title Scenario");

	      ticketsObj = this.findById(id);
	      ticketsObj.setTitle(title);
	      ticketsObj.setDescription(description);
	      ticketsObj.setCreatedOn(createdOn);
	      ticketsObj.setContent(content);
	    }

	    // Save/Update the student
	    this.Save(ticketsObj);
		
	}

	@Override
	public void deleteById(int id) {
		
		ticketsRepository.deleteById(id);
		
	}

	@Override
	public List<Tickets> searchBy(String title) {

		List<Tickets> tickets = ticketsRepository.findByTitleContaining(title);
		
		return tickets;
	}
}
