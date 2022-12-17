package kr.or.ddit.domain;

import lombok.Data;

@Data
public class Evaluation {
	private int evlqCd;
	private int stuNo;
	private int lecaCd;
	private int evlScore;
	private String evlEtc;
	
	// Evaluation_q 컬럼
	private String evlqCon;
}
