package kr.or.ddit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Allocation {

	private int roomCd;		// 강의실 코드
	private int lecaCd;	 	// 강의코드
	private String altDt; 	// 요일
	private String altSt;	// 시작시간
	private String altEn;	// 종료시간
	
	
	private String lecaNm;	//강의명
	private String bldSnm;  // 건물명
	private int roomNo;		// 강의실 호수
	
}
