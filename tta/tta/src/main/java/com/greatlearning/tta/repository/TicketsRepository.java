package com.greatlearning.tta.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

import com.greatlearning.tta.entity.Tickets;

public interface TicketsRepository extends JpaRepository<Tickets, Integer> {

	List<Tickets> findByTitleContaining(String title);  
}
