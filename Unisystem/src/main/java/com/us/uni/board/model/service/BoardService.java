package com.us.uni.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.us.uni.board.model.vo.Board;
import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;

@Service
public interface BoardService {
	
		//게시판 리스트 페이지 서비스 (페이징)
		int selectListCount();
		ArrayList<Board> selectList(PageInfo pi);
		
		//검색어 별 조회
		int selectSearchCount(HashMap<String, String> map);
		ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi);

		//카테고리별 조회
		int selectKeywordListCount(int bokeyword);
		ArrayList<Board> selectKeyword(PageInfo pi, int bokeyword);

		//게시글등록
		int insertBoard(Board b , Attachment at);
		
		//조회수증가
		int increaseCount(int bno);
		Board selectBoard(int bno);
		Attachment selectAttachBoard(int boardNo);
		
		
}
