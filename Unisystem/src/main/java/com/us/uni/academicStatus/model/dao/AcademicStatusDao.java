package com.us.uni.academicStatus.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.academicStatus.model.vo.AcademicStatus;
import com.us.uni.common.model.vo.Attachment;
import com.us.uni.student.model.vo.Student;

@Repository
public class AcademicStatusDao {

	public String selectStuInfo(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("academicMapper.selectStuInfo", userNo);
	}

	public int applyAsOff(SqlSessionTemplate sqlSession, AcademicStatus as) {
		return sqlSession.insert("academicMapper.applyAsOff", as);
	}
	
	public int applyAsBack(SqlSessionTemplate sqlSession, AcademicStatus as) {
		return sqlSession.insert("academicMapper.applyAsBack", as);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment att) {
		return sqlSession.insert("academicMapper.insertAttachment",att);
	}

	public ArrayList<AcademicStatus> selectAsList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("academicMapper.selectAsList", userNo);
	}

	public AcademicStatus selectAs(SqlSessionTemplate sqlSession, int asNo) {
		return sqlSession.selectOne("academicMapper.selectAs", asNo);
	}
	
	public ArrayList<Attachment> selectAttachmentList(SqlSessionTemplate sqlSession, int asNo) {
		return (ArrayList)sqlSession.selectList("academicMapper.selectAttachmentList", asNo);
	}

	public ArrayList<AcademicStatus> selectProfAsList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("academicMapper.selectProfAsList", userNo);
	}

	public int selectProfAsListCount(SqlSessionTemplate sqlSession, int userNo) {
		int offset = 
		return sqlSession.selectOne("academicMapper.selectProfAsListCount", userNo);
	}


}
