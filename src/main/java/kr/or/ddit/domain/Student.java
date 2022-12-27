package kr.or.ddit.domain;

import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Student {
	
	private int stuNo;            //학번
	private int depCd;            //학과코드
	private int stuYr;            //학년
	private int stuSem;           //재학학기
	private String stuNm;         //이름(한글)
	private String stuNme;        //이름(영문)
	private String stuTel;        //전화번호
	private int stuZip;           //우편번호
	private String stuAddr1;      //기본주소
	private String stuAddr2;      //상세주소
	private String stuReg;        //주민등록번호
	private String stuBankCd;     //은행코드
	private String stuDepo;       //예금주
	private String stuAct;        //등록/장학금계좌
	private String stuPic;        //증명사진URL
	private String stuBir;        //생년월일
	private int proNo;            //담당교수
	private String stuRgb;        //학적 구분 코드
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
	private String recRej; //반려사유
	//학과명 조회 
	private String depNm;
	//단과대학명 조회
	private String colNm;
	private int colCd;

	private String empNm;
	
	private List<SclHistory> stuSclList; //장학금 내역 조회
  private SclHistory sclHistory; //추천 장학생 상세 조회


}
