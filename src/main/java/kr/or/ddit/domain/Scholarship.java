package kr.or.ddit.domain;

import lombok.Data;

@Data
public class Scholarship {
	private int sclCd;			//장학금코드
	private String sclNm;		//장학금명
	private int sclAmt;			//장학금액
	private String sclDetail;	//상세설명
	private int sclCap;			//수여인원
}
