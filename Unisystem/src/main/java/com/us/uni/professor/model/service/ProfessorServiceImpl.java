package com.us.uni.professor.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.professor.model.dao.ProfessorDao;
import com.us.uni.users.model.vo.Users;

@Service
public class ProfessorServiceImpl implements ProfessorService {
	
	@Autowired
	private ProfessorDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return pDao.selectListCount(sqlSession);
	}
	public ArrayList<Users> selectProfessorList(PageInfo pi){
		return pDao.selectProfessorList(sqlSession, pi);
	}
	@Override
	public ArrayList<Users> selectDepartment(String profUniv) {
		return pDao.selectDepartment(sqlSession, profUniv);
	}

}
