package kr.or.ddit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Record {
	private int recCd; //학적코드
	private int stuNo; //학번
	private String rgbCd; //학적구분코드 휴학,복학,자퇴,졸업
	private int recYr; //신청연도
	private String recSem; //신청학기
	private int recPer; //기간
	private String recRsn; //사유
	private Date recDt; //신청날짜
	private String recYn; //승인여부
	private String recRej;//반려사유
}
