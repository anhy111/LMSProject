package kr.or.ddit.domain;

import java.util.List;

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
	//학과명 조회 
	private String depNm;
	//단과대학명 조회
	private String colNm;
	


}
