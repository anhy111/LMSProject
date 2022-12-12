package kr.or.ddit.domain;

import lombok.Data;

@Data
public class GraduateCredit {
	private int depCd;	//학과
	private int rdcYr;	//연도
	private int rdcGrd; //성적평점평균
	private int rdcMrc; //전필요구학점
	private int rdcMoc; //전선요구학점
	private int rdcCrc; //교필요구학점
	private int rdcCoc; //교선요구학점
	private int rdcReqCrd; //졸업요구학점
	
	
	private String depNm; //학과명
	private String stuYr; //연도
	private String stuSem; //학기
	
}
