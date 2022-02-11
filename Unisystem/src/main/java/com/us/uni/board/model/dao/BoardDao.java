package com.us.uni.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.board.model.vo.Board;
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
	
 
		public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
			
			return sqlSession.selectOne("boardMapper.selectSearchCount");
		}

		public ArrayList<Board> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
				PageInfo pi) {
			
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			return (ArrayList)sqlSession.selectList("boardMapper.selectSearchList", map, rowBounds);
		}
}
