package com.example.ncs.controller;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.ncs.Criteria;
import com.example.ncs.PageMaker;
import com.example.ncs.service.WordService;
import com.example.ncs.vo.WordVO;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("data")
public class WordRestController {
	
	private Logger logger = LoggerFactory.getLogger(WordRestController.class);

	@Autowired
	WordService wordService;
	
	@RequestMapping(value = "/word_list.json", method = RequestMethod.GET)
	public String word_list(@RequestParam("word") String word) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String word_decode = URLDecoder.decode(word, "UTF-8");
		
		List<String> word_list = wordService.word_list(word_decode);
		map.put("word_list", word_list);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);
		
		return jsonString;
	}
}
