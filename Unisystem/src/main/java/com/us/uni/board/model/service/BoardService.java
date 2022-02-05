package com.us.uni.board.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.us.uni.board.model.vo.Board;
import com.us.uni.board.model.vo.Reply;
import com.us.uni.common.model.vo.PageInfo;

@Service
public interface BoardService {
		
		//커뮤니티 게시판
	
		// 1. 게시판(커뮤니티) 리스트 페이지 서비스 (페이징)
		int selectListCount();
		ArrayList<Board> selectList(PageInfo pi);
		
		// 2. 게시글(커뮤니티) 작성하기 서비스
		int insertBoard(Board b);
		
		// 3. 게시글(커뮤니티) 상세조회용 서비스
		int increaseCount(int boardNo);
		Board selectBoard(int boardNo);
		
		// 4. 게시글(커뮤니티) 삭제용 서비스
		int deleteBoard(int boardNo);
		
		// 5. 게시글(커뮤니티) 수정용 서비스
		int updateBoard(Board b);
		
		// 6. 댓글(커뮤니티) 리스트 조회용 서비스 (ajax)
		ArrayList<Reply> selectReplyList(int boardNo);
		
		// 7. 댓글(커뮤니티) 작성용 서비스 (ajax)
		int insertReply(Reply r);
		
		// 공지사항 게시판
		
		// 1. 공지 리스트 페이지 서비스 (페이징)
		int selectnListCount();
		ArrayList<Board> selectnList(PageInfo pi);
		
		// 2. 공지 작성하기 서비스
		int insertnBoard(Board b);
		
		// 3. 공지상세조회용 서비스
		int increasenCount(int boardNo);
		Board selectnBoard(int boardNo);
		
		// 4. 공지 삭제용 서비스
		int deletenBoard(int boardNo);
		
		// 5. 공지 수정 서비스
		int updatenBoard(Board b);
		
		// 6. 공지 리스트 조회용 서비스 (ajax)
		ArrayList<Reply> selectnReplyList(int boardNo);
		
		// 대외활동 게시판
		
		// 1. 대외활동 리스트 페이지 서비스 (페이징)
		int selectcListCount();
		ArrayList<Board> selectcList(PageInfo pi);
				
		// 2. 대외활동 작성하기 서비스
		int insertcBoard(Board b);
				
		// 3. 대외활동 상세조회용 서비스
		int increasecCount(int boardNo);
		Board selectcBoard(int boardNo);
				
		// 4. 대외활동 삭제용 서비스
		int deletecBoard(int boardNo);
				
		// 5. 대외활동 수정용 서비스
		int updatecBoard(Board b);
				
		// 6. 대외활동 리스트 조회용 서비스 (ajax)
		ArrayList<Reply> selectcReplyList(int boardNo);
				
		// 7. 대외활동 작성용 서비스 (ajax)
		int insertcReply(Reply r);
		
		// 동아리 게시판
		
		// 1. 동아리 리스트 페이지 서비스 (페이징)
		int selectvListCount();
		ArrayList<Board> selectvList(PageInfo pi);
						
		// 2. 동아리 작성하기 서비스
		int insertvBoard(Board b);
						
		// 3. 동아리 상세조회용 서비스
		int increasevCount(int boardNo);
		Board selectvBoard(int boardNo);
						
		// 4. 동아리 삭제용 서비스
		int deletevBoard(int boardNo);
						
		// 5. 동아리 수정용 서비스
		int updatevBoard(Board b);
						
		// 6. 동아리 리스트 조회용 서비스 (ajax)
		ArrayList<Reply> selectvReplyList(int boardNo);
						
		// 7. 동아리 작성용 서비스 (ajax)
		int insertvReply(Reply r);		
		
}
