package com.example.ncs.vo;

import java.util.List;

import lombok.Data;

@Data
public class WordVO {

	private int rn;
	private String word;
	private String mean;
	private List<String> mean_list;

}
