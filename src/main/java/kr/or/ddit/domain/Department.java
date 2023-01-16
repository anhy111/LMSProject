package kr.or.ddit.domain;

import lombok.Data;

@Data
public class Department {

	private int depCd ;		//학과코드
	private int colCd ;		//단과대코드
	private int proNo ;		//학과장
	private String depNm ;	//학과명
	private String depDes;	//학과소개
	private int depCap;		//최대정원
	private String depTel;	//학과연락처
	private int empNo ;		//조교
	
	//단과대 이름추가
	private String colNm = "";
	// 학과장, 조교 이름
	private String proNm;
	private String empNm;
	
	private int colFee;		//단과대 등록금
	
}
