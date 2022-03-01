package com.us.uni.professor.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.lecture.model.vo.Lecture;
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
	@Override
	public int selectSearchCount(HashMap map) {
		return pDao.selectSearchCount(sqlSession, map);
	}
	@Override
	public ArrayList<Users> searchProfessor(HashMap map, PageInfo pi) {
		return pDao.searchProfessor(sqlSession, map, pi);
	}
	@Override
	public int professorDelete(String dno) {
		return pDao.professorDelete(sqlSession, dno);
	}
	@Override
	public int classInsert(Lecture lec) {
		return pDao.classInsert(sqlSession, lec);
	}
	@Override
	public int selectAppCount(int profNo) {
		return pDao.selectAppCount(sqlSession, profNo);
	}
	@Override
	public ArrayList<Lecture> classAppList(int profNo, PageInfo pi) {
		return pDao.classAppList(sqlSession, profNo, pi);
	}
	@Override
	public int changeProfessorJoin(HashMap map) {
		return pDao.changeProfessorJoin(sqlSession, map);
	}
	@Override
	public int professorInsert(Users professor) {
		return pDao.professorInsert(sqlSession, professor);
	}
	@Override
	public int selectMyStudentCount(int profNo) {
		return pDao.selectMyStudentCount(sqlSession, profNo);
	}
	@Override
	public ArrayList<Users> selectMyStudent(HashMap map, PageInfo pi) {
		return pDao.selectMyStudent(sqlSession, map, pi);
	}


}
