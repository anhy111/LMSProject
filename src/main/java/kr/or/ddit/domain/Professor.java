package kr.or.ddit.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Professor {
	
	private int proNo;//교수번호
	private int depCd;//학과코드
	private String proPos;//직책명
	
    private String empNm;    //한글 이름
    private String empNme;    //영문 이름
    private String empTel;    //전화번호
    private String empTel2; //비상연락처
    private int empZip;        //우편번호
    private String empAddr1;//기본주소
    private String empAddr2;//상세주소
    private String empReg;    //주민번호
    private String empBankCd;//은행코드
    private String empDepo;    //예금주
    private String empAct;    //급여지급 계좌
    private String empPic;    //증명사진 URL
    private Date empJoin;    //입사일
    private String empRet;    //퇴사일
    
	private int colCd;		//단대코드
	private String depNm;	//학과명
	private String depDes;	//학과소개
	private int depCap;		//최대정원
	private String depTel;	//학과전화번호
	private int empNo;		//조교
	
	private String colNm; //단과대학명
	private String colDes; //단과대설명
	private String colTel; //단과대연락처
	private String colAddr; //단과대위치
	private String colImgUrl; //단과대이미지

}
