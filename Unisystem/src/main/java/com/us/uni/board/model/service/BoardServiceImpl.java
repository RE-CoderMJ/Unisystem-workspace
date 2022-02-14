package com.us.uni.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.board.model.dao.BoardDao;
import com.us.uni.board.model.vo.Board;
import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao bDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/*커뮤니티 리스트 조회*/
	@Override
	public int selectListCount() {
		
		return bDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		
		return bDao.selectList(sqlSession, pi);
	}

	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		
		int searchCount = bDao.selectSearchCount(sqlSession, map);
		
		return searchCount;
	}

	@Override
	public ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		
		ArrayList<Board> list = bDao.selectSearchList(sqlSession, map, pi);
		
		return list;
	}

	@Override
	public int selectKeywordListCount(int bokeyword) {
		
		int keyCount = bDao.selectKeywordListCount(sqlSession, bokeyword);
		
		return keyCount;
	}

	@Override
	public ArrayList<Board> selectKeyword(PageInfo pi, int bokeyword) {
		
		return bDao.selectKeyword(sqlSession,pi,bokeyword);
				
	
	}

	@Override
	public int insertBoard(Board b, Attachment at) {
		 System.out.println(b);
		 
		int result1 = bDao.insertBoard(sqlSession, b);
		//System.out.println("result1:"+result1);
		
		
		
		int result2 = bDao.insertAttachBoard(sqlSession, at);
		System.out.println("result2:"+result2);
		
		return result1*result2;
	}

	 

	@Override
	public int increaseCount(int boardNo) {
		return bDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return bDao.selectBoard(sqlSession, boardNo);
	}
	
	public Attachment selectAttachBoard(int boardNo) {
		
		return bDao.selectAttachBoard(sqlSession, boardNo);
		
	}

	@Override
	public int deleteBoard(int bno) {
		
		return bDao.deleteBoard(sqlSession, bno);
	}
	
	@Override
	public int deleteAttachBoard(int bno) {
		
		return bDao.deleteAttachBoard(sqlSession, bno);
	}

	@Override
	public int updateBoard(Board b) {
		
		return bDao.updateBoard(sqlSession, b);
	}
	
	@Override
	public int updateAttachBoard(HashMap<String,Object> map) {
		
		return bDao.updateAttachBoard(sqlSession, map);
	}

	@Override
	public int newUpdateAttachBoard(HashMap<String, Object> map) {
		
		return bDao.newUpdateAttachBoard(sqlSession, map);
	}

	
	@Override
	public int volselectListCount() {
		
		return bDao.volselectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> volselectList(PageInfo pi) {
		
		return bDao.volselectList(sqlSession, pi);
	}

	@Override
	public int cirselectListCount() {
		
		return bDao.cirselectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> cirselectList(PageInfo pi) {
		
		return bDao.cirselectList(sqlSession, pi);
	}

	@Override
	public int nselectListCount() {
		
		return bDao.nselectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> nselectList(PageInfo pi) {
		
		return bDao.nselectList(sqlSession, pi);
	}

	@Override
	public int nselectSearchCount(HashMap<String, String> map) {
		
		return bDao.nselectSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Board> nselectSearchList(HashMap<String, String> map, PageInfo pi) {
		
		ArrayList<Board> list = bDao.nselectSearchList(sqlSession, map, pi);
		
		return list;
	}

	@Override
	public int ninsertBoard(Board b, Attachment at) {
		
		int result1 = bDao.ninsertBoard(sqlSession, b);
		int result2 = bDao.insertAttachBoard(sqlSession, at);

		return result1*result2;
	}

	@Override
	public Board nselectBoard(int bno) {
		
		return bDao.nselectBoard(sqlSession, bno);
	}

	@Override
	public int vinsertBoard(Board b) {
		
		int result1 = bDao.vinsertBoard(sqlSession, b);
		return result1;
	}

	@Override
	public Board vselectBoard(int bno) {
		
		return bDao.vselectBoard(sqlSession, bno);

	}

	@Override
	public int cinsertBoard(Board b) {
		
		int result1 = bDao.cinsertBoard(sqlSession, b);

		return result1;
	}

	@Override
	public Board cselectBoard(int bno) {
		
		return bDao.cselectBoard(sqlSession, bno);
	}

	@Override
	public int nupdateBoard(Board b) {
		
		return bDao.nupdateBoard(sqlSession, b);
	}

}
