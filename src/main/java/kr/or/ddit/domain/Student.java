package kr.or.ddit.domain;

import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Student {
	
	private int stuNo;
	private int depCd;
	private int stuYr;
	private int stuSem;
	private String stuNm;
	private String stuNme;
	private String stuTel;
	private int stuZip;
	private String stuAddr1; 
	private String stuAddr2;
	private String stuReg;
	private String stuBankCd;
	private String stuDepo;
	private String stuAct;
	private String stuPic;
	private String stuBir;
	private int proNo;
	private String empNm;
	//학적 승인여부
	//학적 구분
	private String recYr; //신청연도
	private String recSem; //신청학기
	private String rgbCd; //학적 구분
	private String recPer; //기간
	private String recRsn; //사유
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String recDt; //신청날짜
	private String recYn; //승인여부
	//학과명 조회 
	private String depNm;
	//단과대학명 조회
	private String colNm;
	private int colCd;
	


}
