package com.us.uni.lecture.model.vo;

import java.util.ArrayList;


public class Lecture {
	
	private int classNo;              // 강의번호
	private int profNo;				  // 교수번호
	private int classCode;            // 과목코드
	private String classKorName;      // 강의명(국문)
	private String classEngName;      // 강의명(영문)
	private String classCategory;     // 대면(1) | 비대면(2)
	private String classYear;         // 년도
	private int classSemester;        // 1학기(1) | 2학기(2)
	private int classCredit;          // 학점
	private String classLocation;     // 강의실
	private String classDay;          // 강의요일
	private String classTime;         // 강의시간
	private String classStart;        // 강의시작시간
	private int classDivision;        // 이수구분
	private String classKorOutline;   // 개요 (한글)
	private String classEngOutline;   // 개요 (영문)
	private String classGoal;         // 수업목표
	private String classStatus;       // 강의승인여부
	private String adminAnswer;       // 관리자답변
	private String classPhone;        // 교수 연락처
	private String profLocation;      // 연구실위치
	private String classPlan;         // 강의계획
	private int scoreAtt;             // 출석(%)
	private int scoreTask;            // 과제(%)
	private int scoreMid;             // 중간(%)
	private int scoreFin;             // 기말(%)
	private int maxStud;              // 최대수강인원
	private int currStud;             // 현재수강인원
	
	private String profMajor; 		  // 교수 전공
	private String appdate; 		  // 강의 신청 날짜
	
	// 강의별 수강학생
	private int classStudNo;          // 강의별 수강학생번호(seq)
	//private int classNo; 위에 중복된 항목 있음
	private int studNo;               // 학번
	private String status;            // 수강중(Y) | 수강완료(N)
	
	private String korName;			  
	private int userNo;				  // 학번 및 교번
	private int totalSemester;        // 이수학기
	
	// attendance 테이블
	private int attendanceNo;
	private String classTitle;
	private String attendanceDateA;  // YYYY.MM.DD
	private String attendanceDateB;  // YYYYMMDD
	private String attendanceStatus;
	
	private int rownum;
	private int stuGrade;
	
	private ArrayList<Lecture> studsNo;
	private ArrayList<Lecture> attStatusList;

	public Lecture(){}

	public Lecture(int classNo, int profNo, int classCode, String classKorName, String classEngName,
			String classCategory, String classYear, int classSemester, int classCredit, String classLocation,
			String classDay, String classTime, String classStart, int classDivision, String classKorOutline,
			String classEngOutline, String classGoal, String classStatus, String adminAnswer, String classPhone,
			String profLocation, String classPlan, int scoreAtt, int scoreTask, int scoreMid, int scoreFin, int maxStud,
			int currStud, String profMajor, String appdate, int classStudNo, int studNo, String status, String korName,
			int userNo, int totalSemester, int attendanceNo, String classTitle, String attendanceDateA,
			String attendanceDateB, String attendanceStatus, int rownum, int stuGrade, ArrayList<Lecture> studsNo,
			ArrayList<Lecture> attStatusList) {
		super();
		this.classNo = classNo;
		this.profNo = profNo;
		this.classCode = classCode;
		this.classKorName = classKorName;
		this.classEngName = classEngName;
		this.classCategory = classCategory;
		this.classYear = classYear;
		this.classSemester = classSemester;
		this.classCredit = classCredit;
		this.classLocation = classLocation;
		this.classDay = classDay;
		this.classTime = classTime;
		this.classStart = classStart;
		this.classDivision = classDivision;
		this.classKorOutline = classKorOutline;
		this.classEngOutline = classEngOutline;
		this.classGoal = classGoal;
		this.classStatus = classStatus;
		this.adminAnswer = adminAnswer;
		this.classPhone = classPhone;
		this.profLocation = profLocation;
		this.classPlan = classPlan;
		this.scoreAtt = scoreAtt;
		this.scoreTask = scoreTask;
		this.scoreMid = scoreMid;
		this.scoreFin = scoreFin;
		this.maxStud = maxStud;
		this.currStud = currStud;
		this.profMajor = profMajor;
		this.appdate = appdate;
		this.classStudNo = classStudNo;
		this.studNo = studNo;
		this.status = status;
		this.korName = korName;
		this.userNo = userNo;
		this.totalSemester = totalSemester;
		this.attendanceNo = attendanceNo;
		this.classTitle = classTitle;
		this.attendanceDateA = attendanceDateA;
		this.attendanceDateB = attendanceDateB;
		this.attendanceStatus = attendanceStatus;
		this.rownum = rownum;
		this.stuGrade = stuGrade;
		this.studsNo = studsNo;
		this.attStatusList = attStatusList;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public int getProfNo() {
		return profNo;
	}

	public void setProfNo(int profNo) {
		this.profNo = profNo;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public String getClassKorName() {
		return classKorName;
	}

	public void setClassKorName(String classKorName) {
		this.classKorName = classKorName;
	}

	public String getClassEngName() {
		return classEngName;
	}

	public void setClassEngName(String classEngName) {
		this.classEngName = classEngName;
	}

	public String getClassCategory() {
		return classCategory;
	}

	public void setClassCategory(String classCategory) {
		this.classCategory = classCategory;
	}

	public String getClassYear() {
		return classYear;
	}

	public void setClassYear(String classYear) {
		this.classYear = classYear;
	}

	public int getClassSemester() {
		return classSemester;
	}

	public void setClassSemester(int classSemester) {
		this.classSemester = classSemester;
	}

	public int getClassCredit() {
		return classCredit;
	}

	public void setClassCredit(int classCredit) {
		this.classCredit = classCredit;
	}

	public String getClassLocation() {
		return classLocation;
	}

	public void setClassLocation(String classLocation) {
		this.classLocation = classLocation;
	}

	public String getClassDay() {
		return classDay;
	}

	public void setClassDay(String classDay) {
		this.classDay = classDay;
	}

	public String getClassTime() {
		return classTime;
	}

	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}

	public String getClassStart() {
		return classStart;
	}

	public void setClassStart(String classStart) {
		this.classStart = classStart;
	}

	public int getClassDivision() {
		return classDivision;
	}

	public void setClassDivision(int classDivision) {
		this.classDivision = classDivision;
	}

	public String getClassKorOutline() {
		return classKorOutline;
	}

	public void setClassKorOutline(String classKorOutline) {
		this.classKorOutline = classKorOutline;
	}

	public String getClassEngOutline() {
		return classEngOutline;
	}

	public void setClassEngOutline(String classEngOutline) {
		this.classEngOutline = classEngOutline;
	}

	public String getClassGoal() {
		return classGoal;
	}

	public void setClassGoal(String classGoal) {
		this.classGoal = classGoal;
	}

	public String getClassStatus() {
		return classStatus;
	}

	public void setClassStatus(String classStatus) {
		this.classStatus = classStatus;
	}

	public String getAdminAnswer() {
		return adminAnswer;
	}

	public void setAdminAnswer(String adminAnswer) {
		this.adminAnswer = adminAnswer;
	}

	public String getClassPhone() {
		return classPhone;
	}

	public void setClassPhone(String classPhone) {
		this.classPhone = classPhone;
	}

	public String getProfLocation() {
		return profLocation;
	}

	public void setProfLocation(String profLocation) {
		this.profLocation = profLocation;
	}

	public String getClassPlan() {
		return classPlan;
	}

	public void setClassPlan(String classPlan) {
		this.classPlan = classPlan;
	}

	public int getScoreAtt() {
		return scoreAtt;
	}

	public void setScoreAtt(int scoreAtt) {
		this.scoreAtt = scoreAtt;
	}

	public int getScoreTask() {
		return scoreTask;
	}

	public void setScoreTask(int scoreTask) {
		this.scoreTask = scoreTask;
	}

	public int getScoreMid() {
		return scoreMid;
	}

	public void setScoreMid(int scoreMid) {
		this.scoreMid = scoreMid;
	}

	public int getScoreFin() {
		return scoreFin;
	}

	public void setScoreFin(int scoreFin) {
		this.scoreFin = scoreFin;
	}

	public int getMaxStud() {
		return maxStud;
	}

	public void setMaxStud(int maxStud) {
		this.maxStud = maxStud;
	}

	public int getCurrStud() {
		return currStud;
	}

	public void setCurrStud(int currStud) {
		this.currStud = currStud;
	}

	public String getProfMajor() {
		return profMajor;
	}

	public void setProfMajor(String profMajor) {
		this.profMajor = profMajor;
	}

	public String getAppdate() {
		return appdate;
	}

	public void setAppdate(String appdate) {
		this.appdate = appdate;
	}

	public int getClassStudNo() {
		return classStudNo;
	}

	public void setClassStudNo(int classStudNo) {
		this.classStudNo = classStudNo;
	}

	public int getStudNo() {
		return studNo;
	}

	public void setStudNo(int studNo) {
		this.studNo = studNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getKorName() {
		return korName;
	}

	public void setKorName(String korName) {
		this.korName = korName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getTotalSemester() {
		return totalSemester;
	}

	public void setTotalSemester(int totalSemester) {
		this.totalSemester = totalSemester;
	}

	public int getAttendanceNo() {
		return attendanceNo;
	}

	public void setAttendanceNo(int attendanceNo) {
		this.attendanceNo = attendanceNo;
	}

	public String getClassTitle() {
		return classTitle;
	}

	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}

	public String getAttendanceDateA() {
		return attendanceDateA;
	}

	public void setAttendanceDateA(String attendanceDateA) {
		this.attendanceDateA = attendanceDateA;
	}

	public String getAttendanceDateB() {
		return attendanceDateB;
	}

	public void setAttendanceDateB(String attendanceDateB) {
		this.attendanceDateB = attendanceDateB;
	}

	public String getAttendanceStatus() {
		return attendanceStatus;
	}

	public void setAttendanceStatus(String attendanceStatus) {
		this.attendanceStatus = attendanceStatus;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getStuGrade() {
		return stuGrade;
	}

	public void setStuGrade(int stuGrade) {
		this.stuGrade = stuGrade;
	}

	public ArrayList<Lecture> getStudsNo() {
		return studsNo;
	}

	public void setStudsNo(ArrayList<Lecture> studsNo) {
		this.studsNo = studsNo;
	}

	public ArrayList<Lecture> getAttStatusList() {
		return attStatusList;
	}

	public void setAttStatusList(ArrayList<Lecture> attStatusList) {
		this.attStatusList = attStatusList;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Lecture [classNo=");
		builder.append(classNo);
		builder.append(", profNo=");
		builder.append(profNo);
		builder.append(", classCode=");
		builder.append(classCode);
		builder.append(", classKorName=");
		builder.append(classKorName);
		builder.append(", classEngName=");
		builder.append(classEngName);
		builder.append(", classCategory=");
		builder.append(classCategory);
		builder.append(", classYear=");
		builder.append(classYear);
		builder.append(", classSemester=");
		builder.append(classSemester);
		builder.append(", classCredit=");
		builder.append(classCredit);
		builder.append(", classLocation=");
		builder.append(classLocation);
		builder.append(", classDay=");
		builder.append(classDay);
		builder.append(", classTime=");
		builder.append(classTime);
		builder.append(", classStart=");
		builder.append(classStart);
		builder.append(", classDivision=");
		builder.append(classDivision);
		builder.append(", classKorOutline=");
		builder.append(classKorOutline);
		builder.append(", classEngOutline=");
		builder.append(classEngOutline);
		builder.append(", classGoal=");
		builder.append(classGoal);
		builder.append(", classStatus=");
		builder.append(classStatus);
		builder.append(", adminAnswer=");
		builder.append(adminAnswer);
		builder.append(", classPhone=");
		builder.append(classPhone);
		builder.append(", profLocation=");
		builder.append(profLocation);
		builder.append(", classPlan=");
		builder.append(classPlan);
		builder.append(", scoreAtt=");
		builder.append(scoreAtt);
		builder.append(", scoreTask=");
		builder.append(scoreTask);
		builder.append(", scoreMid=");
		builder.append(scoreMid);
		builder.append(", scoreFin=");
		builder.append(scoreFin);
		builder.append(", maxStud=");
		builder.append(maxStud);
		builder.append(", currStud=");
		builder.append(currStud);
		builder.append(", profMajor=");
		builder.append(profMajor);
		builder.append(", appdate=");
		builder.append(appdate);
		builder.append(", classStudNo=");
		builder.append(classStudNo);
		builder.append(", studNo=");
		builder.append(studNo);
		builder.append(", status=");
		builder.append(status);
		builder.append(", korName=");
		builder.append(korName);
		builder.append(", userNo=");
		builder.append(userNo);
		builder.append(", totalSemester=");
		builder.append(totalSemester);
		builder.append(", attendanceNo=");
		builder.append(attendanceNo);
		builder.append(", classTitle=");
		builder.append(classTitle);
		builder.append(", attendanceDateA=");
		builder.append(attendanceDateA);
		builder.append(", attendanceDateB=");
		builder.append(attendanceDateB);
		builder.append(", attendanceStatus=");
		builder.append(attendanceStatus);
		builder.append(", rownum=");
		builder.append(rownum);
		builder.append(", stuGrade=");
		builder.append(stuGrade);
		builder.append(", studsNo=");
		builder.append(studsNo);
		builder.append(", attStatusList=");
		builder.append(attStatusList);
		builder.append("]");
		return builder.toString();
	}

}

