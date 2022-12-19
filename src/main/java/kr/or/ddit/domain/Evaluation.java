package kr.or.ddit.domain;

import lombok.Data;

@Data
public class Evaluation {
	private int evlqCd;	//평가항목코드
	private int stuNo;	//학번
	private int lecaCd;	//강의코드
	private int evlScore;//평가점수
	private String evlEtc;//기타의견내용
	
	// Evaluation_q 컬럼
	private String evlqCon;	//평가질문
	
	private String evlqYn; //평가여부
	private String empNm; //교수명
	private String lecaNm; // 과목명
}
