package com.greatlearning.tta.entity;

import java.time.LocalDate;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "tickets")
@Getter
@Setter
public class Tickets {
	
	  @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  @Column(name = "id")
	  private int id;

	  @Column(name = "title")
	  private String title;

	  @Column(name = "description")
	  private String description;

	  @Column(name = "created_on")
	  @Temporal(TemporalType.DATE)
	  private LocalDate createdOn;
	  
	  @Column(name = "content")
	  private String content;


	  public Tickets() {

	  }

	  public Tickets(String title, String description, String content, LocalDate createdOn) {

	    this.title = title;
	    this.description = description;
	    this.createdOn = createdOn;
	    this.content = content;
	  }

}
