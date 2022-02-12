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

}
