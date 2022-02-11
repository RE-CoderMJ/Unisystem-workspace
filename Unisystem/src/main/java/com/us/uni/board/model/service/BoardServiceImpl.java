package com.us.uni.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.board.model.dao.BoardDao;
import com.us.uni.board.model.vo.Board;
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

}
