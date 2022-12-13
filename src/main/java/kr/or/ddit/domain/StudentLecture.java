package kr.or.ddit.domain;

import lombok.Data;

@Data
public class StudentLecture {
	private int stuNo;
	private int lecaCd;
	private int slScore;
	
	// 키워드검색
	private String colNm;
	private String depNm;
	private String lecaTrg;
	private String lecaCate;
	private String lecaNm;
}
