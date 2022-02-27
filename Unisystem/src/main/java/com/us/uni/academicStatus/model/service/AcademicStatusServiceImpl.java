package com.us.uni.academicStatus.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.academicStatus.model.dao.AcademicStatusDao;
import com.us.uni.academicStatus.model.vo.AcademicStatus;
import com.us.uni.common.model.vo.Attachment;
import com.us.uni.student.model.vo.Student;

@Service
public class AcademicStatusServiceImpl implements AcademicStatusService{

	@Autowired
	private AcademicStatusDao acDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public String selectStuInfo(int userNo) {
		
		return acDao.selectStuInfo(sqlSession, userNo);
	}
	
	@Override
	public int applyAsOff(AcademicStatus as, ArrayList<Attachment> attList) {
		
		int result = acDao.applyAsOff(sqlSession, as);
		
		int result2 = 1;
		if(!attList.isEmpty()) {
			for(Attachment att : attList) {
				result2 = acDao.insertAttachment(sqlSession, att);
			}
		}
		
		return result * result2;
	}

	@Override
	public int applyAsBack(AcademicStatus as) {
		int result = acDao.applyAsBack(sqlSession, as);
		return result;
	}
	
	@Override
	public ArrayList<AcademicStatus> selectAsList(int userNo) {
		return acDao.selectAsList(sqlSession, userNo);
	}

	@Override
	public AcademicStatus selectAs(int asNo) {
		return acDao.selectAs(sqlSession, asNo);
	}

	@Override
	public ArrayList<Attachment> selectAttachmentList(int asNo) {
		return acDao.selectAttachmentList(sqlSession, asNo);
	}

	@Override
	public ArrayList<AcademicStatus> selectProfAsList(int userNo) {
		return acDao.selectProfAsList(sqlSession, userNo);
	}

	@Override
	public int selectProfAsListCount(int userNo) {
		return acDao.selectProfAsListCount(sqlSession, userNo);
	}

}
