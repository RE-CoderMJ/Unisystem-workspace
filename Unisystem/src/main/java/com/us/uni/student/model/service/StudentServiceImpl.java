package com.us.uni.student.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.student.model.dao.StudentDao;
import com.us.uni.users.model.vo.Users;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return sDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Users> selectStudentList(PageInfo pi) {
		return sDao.selectStudentList(sqlSession, pi);
	}

	@Override
	public ArrayList<Users> selectDepartment(String studUniv) {
		return sDao.selectDepartment(sqlSession, studUniv);
	}

	@Override
	public int selectSearchCount(HashMap map) {
		return sDao.selectSearchCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<Users> searchStudent(HashMap map, PageInfo pi) {
		return sDao.searchStudent(sqlSession, map, pi);
	}

	

	
	

}
