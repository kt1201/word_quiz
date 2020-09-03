package com.example.ncs.vo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "word")
public class Ncs_WordVO {
	
    private String word;
    private Date date;
    
}
