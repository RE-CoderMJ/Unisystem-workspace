package com.us.uni.lecture.model.vo;

public class Homework {
	
	
	// HOMEWORKP (교수가 낸 과제)
	private int homeworkpNo;             // 과제번호(seq) or 참조게시글번호
	private int classNo;					// 강의번호
	private String homeworkpName;			// 과제명
	private String homeworkpCategory;		// 제출가능(P) | 제출마감(I)
	private String homeworkpEndDateTime;    // 마감일시
	private String pstatus;                 // 게시여부(Y|N)
	private String homeworkpContent;		// 내용
	
	// HOMEWORKS (학생이 제출한 과제)
	private int homeworksNo;				// 과제번호(seq)
	private int studNo;                     // 학번
	private String gradeStatus;             // 채점(A) | 미채점(B)
	private int score;						// 점수
	private String feedback;				// 피드백
	private String sstatus;					// 게시여부(Y|N)
	private String homeworksContent;		// 내용
	
	private String korName;
	private int rownum;
	private int countHW;					// 제출상황 총 개수
	private int countGHW;					// 채점상황 총 개수
	
	
	public Homework() {}


	public Homework(int homeworkpNo, int classNo, String homeworkpName, String homeworkpCategory,
			String homeworkpEndDateTime, String pstatus, String homeworkpContent, int homeworksNo, int studNo,
			String gradeStatus, int score, String feedback, String sstatus, String homeworksContent, String korName,
			int rownum, int countHW, int countGHW) {
		super();
		this.homeworkpNo = homeworkpNo;
		this.classNo = classNo;
		this.homeworkpName = homeworkpName;
		this.homeworkpCategory = homeworkpCategory;
		this.homeworkpEndDateTime = homeworkpEndDateTime;
		this.pstatus = pstatus;
		this.homeworkpContent = homeworkpContent;
		this.homeworksNo = homeworksNo;
		this.studNo = studNo;
		this.gradeStatus = gradeStatus;
		this.score = score;
		this.feedback = feedback;
		this.sstatus = sstatus;
		this.homeworksContent = homeworksContent;
		this.korName = korName;
		this.rownum = rownum;
		this.countHW = countHW;
		this.countGHW = countGHW;
	}


	public int getHomeworkpNo() {
		return homeworkpNo;
	}


	public void setHomeworkpNo(int homeworkpNo) {
		this.homeworkpNo = homeworkpNo;
	}


	public int getClassNo() {
		return classNo;
	}


	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}


	public String getHomeworkpName() {
		return homeworkpName;
	}


	public void setHomeworkpName(String homeworkpName) {
		this.homeworkpName = homeworkpName;
	}


	public String getHomeworkpCategory() {
		return homeworkpCategory;
	}


	public void setHomeworkpCategory(String homeworkpCategory) {
		this.homeworkpCategory = homeworkpCategory;
	}


	public String getHomeworkpEndDateTime() {
		return homeworkpEndDateTime;
	}


	public void setHomeworkpEndDateTime(String homeworkpEndDateTime) {
		this.homeworkpEndDateTime = homeworkpEndDateTime;
	}


	public String getPstatus() {
		return pstatus;
	}


	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}


	public String getHomeworkpContent() {
		return homeworkpContent;
	}


	public void setHomeworkpContent(String homeworkpContent) {
		this.homeworkpContent = homeworkpContent;
	}


	public int getHomeworksNo() {
		return homeworksNo;
	}


	public void setHomeworksNo(int homeworksNo) {
		this.homeworksNo = homeworksNo;
	}


	public int getStudNo() {
		return studNo;
	}


	public void setStudNo(int studNo) {
		this.studNo = studNo;
	}


	public String getGradeStatus() {
		return gradeStatus;
	}


	public void setGradeStatus(String gradeStatus) {
		this.gradeStatus = gradeStatus;
	}


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public String getFeedback() {
		return feedback;
	}


	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}


	public String getSstatus() {
		return sstatus;
	}


	public void setSstatus(String sstatus) {
		this.sstatus = sstatus;
	}


	public String getHomeworksContent() {
		return homeworksContent;
	}


	public void setHomeworksContent(String homeworksContent) {
		this.homeworksContent = homeworksContent;
	}


	public String getKorName() {
		return korName;
	}


	public void setKorName(String korName) {
		this.korName = korName;
	}


	public int getRownum() {
		return rownum;
	}


	public void setRownum(int rownum) {
		this.rownum = rownum;
	}


	public int getCountHW() {
		return countHW;
	}


	public void setCountHW(int countHW) {
		this.countHW = countHW;
	}


	public int getCountGHW() {
		return countGHW;
	}


	public void setCountGHW(int countGHW) {
		this.countGHW = countGHW;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Homework [homeworkpNo=");
		builder.append(homeworkpNo);
		builder.append(", classNo=");
		builder.append(classNo);
		builder.append(", homeworkpName=");
		builder.append(homeworkpName);
		builder.append(", homeworkpCategory=");
		builder.append(homeworkpCategory);
		builder.append(", homeworkpEndDateTime=");
		builder.append(homeworkpEndDateTime);
		builder.append(", pstatus=");
		builder.append(pstatus);
		builder.append(", homeworkpContent=");
		builder.append(homeworkpContent);
		builder.append(", homeworksNo=");
		builder.append(homeworksNo);
		builder.append(", studNo=");
		builder.append(studNo);
		builder.append(", gradeStatus=");
		builder.append(gradeStatus);
		builder.append(", score=");
		builder.append(score);
		builder.append(", feedback=");
		builder.append(feedback);
		builder.append(", sstatus=");
		builder.append(sstatus);
		builder.append(", homeworksContent=");
		builder.append(homeworksContent);
		builder.append(", korName=");
		builder.append(korName);
		builder.append(", rownum=");
		builder.append(rownum);
		builder.append(", countHW=");
		builder.append(countHW);
		builder.append(", countGHW=");
		builder.append(countGHW);
		builder.append("]");
		return builder.toString();
	}
	
	
}
