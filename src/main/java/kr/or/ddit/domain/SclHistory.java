package kr.or.ddit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SclHistory {
	private int sclhAmt;		//장학생 신청 코드
	private int sclhCd;			//장학금코드
	private int sclCd;			//수여자번호
	private int stuNo;			//연도
	private int sclhYr;			//학기
	private int sclhSem;		//신청일자
	private Date sclhDt;		//승인상태
	private String sclhYn;		//지급상태
	private String sclhPayYn;	//추천인
	private int proNo;			//지급액
}
