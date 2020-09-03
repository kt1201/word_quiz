package com.example.ncs.controller;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.ncs.Criteria;
import com.example.ncs.PageMaker;
import com.example.ncs.service.WordService;
import com.example.ncs.vo.WordVO;

@Controller
public class WordController {

	private Logger logger = LoggerFactory.getLogger(WordController.class);

	@Autowired
	WordService wordService;
	
	@RequestMapping(value = "/word.do", method = RequestMethod.GET)
	public void word(Criteria cri, Model model) throws Exception {
		
		if(cri.getWord() != null) {
			String word_decode = URLDecoder.decode(cri.getWord(), "UTF-8");
			cri.setWord(word_decode);
		} else {
			cri.setWord("");
		}

		List<WordVO> wordVO_list = wordService.word(cri);
		
		for(WordVO vo : wordVO_list) {
			List<String> mean_list = wordService.mean(vo.getWord());
			vo.setMean_list(mean_list);
			
			logger.info(vo.toString());
		}
		
		logger.info(wordVO_list.toString());
		
		model.addAttribute("word", wordVO_list);
		
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = 1;
		if (wordService.word_Cnt(cri) == 0) { 
			totalCount = 1;
		} else {
			totalCount = wordService.word_Cnt(cri);
		}
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping("/update_word.do")
	public void update_word(@RequestParam("word") String word, Model model) throws Exception {
		WordVO wordVO = new WordVO();
		List<String> mean_list = wordService.mean(word);
		wordVO.setWord(word);
		wordVO.setMean_list(mean_list);
		model.addAttribute("wordVO", wordVO);
	}
	
	@RequestMapping("/insert.do")
	public void insert(WordVO wordVO, Model model) throws Exception {
		try {			
			wordService.insert_w(wordVO);
			wordService.insert_wm(wordVO);
			model.addAttribute("result", "insertOK");
		} catch (Exception e) { 
			logger.error(e.getMessage(), e); 
			model.addAttribute("result", "insertError");
		}
	}
	
	@RequestMapping("/update.do")
	public void update(WordVO wordVO, Model model) throws Exception {
		logger.info("로그로그" + wordVO.toString());
		try {
			wordService.delete_wm(wordVO);
			wordService.delete_w(wordVO);
			
			for(String mean : wordVO.getMean_list()) {
				if(mean != null && mean.length() > 0) {
					WordVO vo = new WordVO();
					vo.setWord(wordVO.getWord());
					vo.setMean(mean);
					
					wordService.insert_w(vo);
					wordService.insert_wm(vo);
				}
			}
			model.addAttribute("result", "updateOK");
		} catch (Exception e) { 
			logger.error(e.getMessage(), e); 
			model.addAttribute("result", "updateError");
		}
	}
	
	@RequestMapping("/delete.do")
	public void delete(WordVO wordVO, Model model) throws Exception {
		try {	
			wordService.delete_wm(wordVO);
			wordService.delete_w(wordVO);
			model.addAttribute("result", "deleteOK");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			model.addAttribute("result", "deleteError");
		}
	}
	
	@RequestMapping("/quiz.do")
	public void quiz(Model model) throws Exception {
		String word = wordService.quiz();
		List<String> mean_list = wordService.mean(word);
		WordVO quiz = new WordVO();
		quiz.setWord(word);
		quiz.setMean_list(mean_list);
		model.addAttribute("quiz", quiz);
	}
}
