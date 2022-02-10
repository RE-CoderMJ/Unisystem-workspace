package com.us.uni.board.model.service;

import java.util.ArrayList;

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

}
