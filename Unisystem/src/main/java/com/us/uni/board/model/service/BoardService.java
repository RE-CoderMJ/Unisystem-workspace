package com.us.uni.board.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.us.uni.board.model.vo.Board;
import com.us.uni.common.model.vo.PageInfo;

@Service
public interface BoardService {
	
	// 1. 게시판 리스트 페이지 서비스 (페이징)
		int selectListCount();
		ArrayList<Board> selectList(PageInfo pi);

}
