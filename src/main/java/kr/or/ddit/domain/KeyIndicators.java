package kr.or.ddit.domain;

import lombok.Data;

@Data
public class KeyIndicators {
	// 차트에 필요한 데이터 domain
	private int colCd;
	private String colNm;
	private int yr;
	private String sem;
	private int depCd;
	private String depNm; 
	private String empNm;
	
	// 최대정원으로 충원율 기준잡음
	private int capacity;
	// 신입생 명수
	private int recruitmentRate;
	
	// 단과별, 학과별 총 학생
	private int allStu;
	// 재학
	private int inSchool;
	// 휴학
	private int leaveOfAbsence;
	// 제적
	private int expelled;
	// 졸업
	private int graduate;
	
	// 평점평균
	private double evlRate;	
}
