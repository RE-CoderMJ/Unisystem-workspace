package com.us.uni.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.us.uni.board.model.vo.Board;
import com.us.uni.board.model.vo.Reply;
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
		
		//게시글 삭제
		int deleteBoard(int bno);
		int deleteAttachBoard(int bno);
		
		
		int updateBoard(Board b);
		int updateAttachBoard(Attachment at);
		int newUpdateAttachBoard(Attachment at);
		
		
		int volselectListCount();
		ArrayList<Board> volselectList(PageInfo pi);
		
		int cirselectListCount();
		ArrayList<Board> cirselectList(PageInfo pi);
		
		int nselectListCount();
		ArrayList<Board> nselectList(PageInfo pi);
		
		//공지
		int nselectSearchCount(HashMap<String, String> map);
		ArrayList<Board> nselectSearchList(HashMap<String, String> map, PageInfo pi);
		int ninsertBoard(Board b, Attachment at);
		Board nselectBoard(int bno);
		int nupdateBoard(Board b);
		
		//대외활동
		int vinsertBoard(Board b);
		Board vselectBoard(int bno);
		
		//동아리
		int cinsertBoard(Board b);
		Board cselectBoard(int bno);
		
		//댓글 ajax 
		ArrayList<Reply> selectReplyList(int bno);
		int insertReply(Reply r);
		int deleteReply(int replyNo);
		
		
		
}
