package com.example.ncs.vo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "word_mean")
public class Ncs_Word_MeanVO {

    private String word;
    private String mean;
    private Date date;
   
}
