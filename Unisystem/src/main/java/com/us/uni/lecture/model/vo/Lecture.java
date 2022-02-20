package com.us.uni.lecture.model.vo;

import java.util.ArrayList;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
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

}
