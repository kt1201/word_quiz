package com.example.ncs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.ncs.Criteria;
import com.example.ncs.mapper.WordMapper;
import com.example.ncs.vo.WordVO;

@Service("com.example.ncs.service.WordService")
public class WordServiceImpl implements WordService {

	@Autowired
	WordMapper wordMapper;

	@Override
	public List<String> word_list(String word) throws Exception {
		List<String> word_list = wordMapper.word_list(word);
		return word_list;
	}

	@Override
	public List<WordVO> word(Criteria cri) throws Exception {
		List<WordVO> word = wordMapper.word(cri);
		return word;
	}
	
	@Override
	public int word_Cnt(Criteria cri) throws Exception {
		int word_Cnt = wordMapper.word_Cnt(cri);
		return word_Cnt;
	}

	@Override
	public List<String> mean(String word) throws Exception {
		List<String> mean = wordMapper.mean(word);
		return mean;
	}
	
	@Override
	public WordVO wordSelectOne(WordVO wordVO) throws Exception {
		WordVO wordSelectOne = wordMapper.wordSelectOne(wordVO);
		return wordSelectOne;
	}

	@Override
	public void insert_wm(WordVO wordVO) throws Exception {
		wordMapper.insert_wm(wordVO);
	}
	
	@Override
	public void insert_w(WordVO wordVO) throws Exception {
		wordMapper.insert_w(wordVO);
	}

	@Override
	public void update_wm(WordVO wordVO) throws Exception {
		wordMapper.update_wm(wordVO);
	}

	@Override
	public void delete_wm(WordVO wordVO) throws Exception {
		wordMapper.delete_wm(wordVO);
	}
	
	@Override
	public void delete_w(WordVO wordVO) throws Exception {
		wordMapper.delete_w(wordVO);
	}

	@Override
	public String quiz() throws Exception {
		String quiz = wordMapper.quiz();
		return quiz;
	}
	
	
}
