package com.example.ncs.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.ncs.Criteria;
import com.example.ncs.vo.WordVO;

@Repository("com.example.ncs.mapper.WordMapper") // 해당 클래스가 데이터베이스에 접근하는 클래스임을 명시
public interface WordMapper {

	// 단어 리스트(검색 제시어)
	public List<String> word_list(String word) throws Exception;
	
	// 단어 리스트
	public List<WordVO> word(Criteria cri) throws Exception;
	
	// 단어 리스트 Cnt
	public int word_Cnt(Criteria cri) throws Exception;
	
	// 단어에 맞는 뜻 리스트
	public List<String> mean(String word) throws Exception;
	
	// 단어 수정 및 삭제 페이지
	public WordVO wordSelectOne(WordVO wordVO) throws Exception;
	
	// 단어 등록
	public void insert_wm(WordVO wordVO) throws Exception;
	public void insert_w(WordVO wordVO) throws Exception;
	
	// 단어 수정
	public void update_wm(WordVO wordVO) throws Exception;
	
	// 단어 삭제
	public void delete_wm(WordVO wordVO) throws Exception;
	public void delete_w(WordVO wordVO) throws Exception;
	
	// 퀴즈
	public String quiz() throws Exception;
	
}
