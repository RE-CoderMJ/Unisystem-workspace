package com.us.uni.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.board.model.vo.Board;
import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;

@Repository
public class BoardDao {
	
		//board list count
		public int selectListCount(SqlSessionTemplate sqlSession) {
			return sqlSession.selectOne("boardMapper.selectListCount");
		}
	
		//board list
		public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
		}
	
		//검색 리스트 갯수
		public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
			
			return sqlSession.selectOne("boardMapper.selectSearchCount");
		}
		
		
		//검색 게시글 리스트
		public ArrayList<Board> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
				PageInfo pi) {
			
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			return (ArrayList)sqlSession.selectList("boardMapper.selectSearchList", map, rowBounds);
		}
		
		
		
		//board list count
		public int selectKeywordListCount(SqlSessionTemplate sqlSession, int bokeyword) {
			return sqlSession.selectOne("boardMapper.selectKeywordListCount");
		}
		
		//board list
		public ArrayList<Board> selectKeyword(SqlSessionTemplate sqlSession, PageInfo pi , int bokeyword){
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			return (ArrayList)sqlSession.selectList("boardMapper.selectKeyword", bokeyword , rowBounds);
		}

		public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
			return sqlSession.insert("boardMapper.insertBoard", b);
		}
		
		public int insertAttachBoard(SqlSessionTemplate sqlSession,Attachment at) {
			return sqlSession.insert("boardMapper.insertAttachBoard", at);
		}

		//조회수 증가
		public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
			return sqlSession.update("boardMapper.increaseCount", boardNo);
		}
		
		//게시글 상세조회
		public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
			return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
		}
		
		//게시글 상세조회(첨부파일)
		public Attachment selectAttachBoard(SqlSessionTemplate sqlSession, int boardNo) {
			//System.out.println("상세 dao: " + boardNo);
			return sqlSession.selectOne("boardMapper.selectAttachBoard", boardNo);
		}

		public int deleteBoard(SqlSessionTemplate sqlSession, int bno) {
			
			return sqlSession.update("boardMapper.deleteBoard", bno);
		}
		 
		public int deleteAttachBoard(SqlSessionTemplate sqlSession, int bno) {
			
			return sqlSession.update("boardMapper.deleteAttachBoard", bno);
		}

		public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
			
			return sqlSession.update("boardMapper.updateBoard", b);
		}
		 
		public int updateAttachBoard(SqlSessionTemplate sqlSession, HashMap<String,Object> map){
			System.out.println(map);
			
			return sqlSession.update("boardMapper.updateAttachBoard", map);
			
		}
		
		public int newUpdateAttachBoard(SqlSessionTemplate sqlSession, HashMap<String,Object> map) {
			
			return sqlSession.insert("boardMapper.newUpdateAttachBoard", map);
		}

		public int volselectListCount(SqlSessionTemplate sqlSession) {
			
			return sqlSession.selectOne("boardMapper.volselectListCount");
		}

		public ArrayList<Board> volselectList(SqlSessionTemplate sqlSession, PageInfo pi) {
			
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			return (ArrayList)sqlSession.selectList("boardMapper.volselectList", null, rowBounds);
		}

		public int cirselectListCount(SqlSessionTemplate sqlSession) {
			
			return sqlSession.selectOne("boardMapper.cirselectListCount");
		}

		public ArrayList<Board> cirselectList(SqlSessionTemplate sqlSession, PageInfo pi) {
			
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			return (ArrayList)sqlSession.selectList("boardMapper.cirselectList", null, rowBounds);
		}

		public int nselectListCount(SqlSessionTemplate sqlSession) {
			
			return sqlSession.selectOne("boardMapper.nselectListCount");
		}

		public ArrayList<Board> nselectList(SqlSessionTemplate sqlSession, PageInfo pi) {
			
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			return (ArrayList)sqlSession.selectList("boardMapper.nselectList", null, rowBounds);
		}

		
		//mapper에서 생성할 목록 
		//공지 대외활동 동아리
		public int nselectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
			
			return sqlSession.selectOne("boardMapper.nselectSearchCount");
		}

		public ArrayList<Board> nselectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
				PageInfo pi) {
			
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			return (ArrayList)sqlSession.selectList("boardMapper.nselectSearchList", map, rowBounds);
		}
		
		//봉사 검색
		public int vselectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
			
			return sqlSession.selectOne("boardMapper.nselectSearchCount");
		}

		public ArrayList<Board> vselectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
				PageInfo pi) {
			
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			return (ArrayList)sqlSession.selectList("boardMapper.nselectSearchList", map, rowBounds);
		}
		
		//동아리 검색
		public int cselectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
			
			return sqlSession.selectOne("boardMapper.cselectSearchCount");
		}

		public ArrayList<Board> cselectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
				PageInfo pi) {
			
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			return (ArrayList)sqlSession.selectList("boardMapper.cselectSearchList", map, rowBounds);
		}

		
		public int ninsertBoard(SqlSessionTemplate sqlSession, Board b) {
			
			return sqlSession.insert("boardMapper.ninsertBoard", b);
		}

		public Board nselectBoard(SqlSessionTemplate sqlSession, int bno) {
			
			return sqlSession.selectOne("boardMapper.selectBoard", bno);
		}

		public int vinsertBoard(SqlSessionTemplate sqlSession, Board b) {
			
			return sqlSession.insert("boardMapper.vinsertBoard", b);
		}

		public Board vselectBoard(SqlSessionTemplate sqlSession, int bno) {
			
			return sqlSession.selectOne("boardMapper.selectBoard", bno);
		}

		public int cinsertBoard(SqlSessionTemplate sqlSession, Board b) {
			
			return sqlSession.insert("boardMapper.cinsertBoard", b);
		}

		public Board cselectBoard(SqlSessionTemplate sqlSession, int bno) {
			
			return sqlSession.selectOne("boardMapper.selectBoard", bno);
		}
		
		
		 
}
