package kr.or.ddit.domain;

import lombok.Data;

@Data
public class StudentLecture {

	private int stuNo;
	private int lecaCd;
	private Double slScore;
	private int wsSn;	//장바구니 정렬 순서
	private int slSn;	//수강신청 정렬 순서

	
	// 키워드검색
	private int colCd;
	private String colNm;
	private String depNm;
	private String lecaTrg;
	private String lecaCate;
	private String lecaNm;
}
