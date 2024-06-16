package com.greatlearning.tta.service;

import java.time.LocalDate;
import java.util.List;

import com.greatlearning.tta.entity.Tickets;

public interface TicketsService {
	
	public List<Tickets> findAll();
	
	public void Save(Tickets ticket);
	
	public Tickets findById(int id);
	
	public void saveOrUpdate(int id, String title, String description, String content, LocalDate createdOn);
	  
	public void deleteById(int id);
	
	public List<Tickets> searchBy(String title);

}
