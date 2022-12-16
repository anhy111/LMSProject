package kr.or.ddit.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Employee {

    private int empNo; //직원번호
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
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date empJoin;    //입사일
    private Date empRet;    //퇴사일
    private String empBir; //생년월일
    private String empDiv; //부서
	private String empPos; //직책
	
	private String empPass; //비밀번호
	private String proPos; // 보직
	private String depCd; //학과번호
	
}
