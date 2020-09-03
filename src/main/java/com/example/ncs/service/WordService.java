package com.example.ncs.service;

import java.util.List;

import com.example.ncs.Criteria;
import com.example.ncs.vo.WordVO;

public interface WordService {
	
	// 단어 리스트(검색 제시어)
	List<String> word_list(String word) throws Exception;
	
	// 단어 리스트
	List<WordVO> word(Criteria cri) throws Exception;
	
	// 단어 리스트
	int word_Cnt(Criteria cri) throws Exception;
	
	// 단어에 맞는 뜻 리스트
	List<String> mean(String word) throws Exception;
	
	// 단어 수정 및 삭제 페이지
	WordVO wordSelectOne(WordVO wordVO) throws Exception;
	
	// 단어 등록
	void insert_wm(WordVO wordVO) throws Exception;
	void insert_w(WordVO wordVO) throws Exception;
	
	// 단어 수정
	void update_wm(WordVO wordVO) throws Exception;
	
	// 단어 삭제
	void delete_wm(WordVO wordVO) throws Exception;
	void delete_w(WordVO wordVO) throws Exception;
	
	// 퀴즈
	String quiz() throws Exception;
}
