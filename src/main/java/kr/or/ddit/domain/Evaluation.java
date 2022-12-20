package kr.or.ddit.domain;

import java.util.List;

import lombok.Data;

@Data
public class Evaluation {
	private int evlqCd;	//평가항목코드
	private int stuNo;	//학번
	private int lecaCd;	//강의코드
	private double evlScore;//평가점수
	private String evlEtc;//기타의견내용
	
	// Evaluation_q 컬럼
	private String evlqCon;	//평가질문
	
	private String evlqYn; //평가여부
	private String empNm; //교수명
	private String lecaNm; // 강의명
	
	private int proNo; //교수번호
	private int lecHcnt; //수강인원
	private String lecaCate; //이수구분
	private String depNm; //학과명
	private String colNm; //단과대 명
	private int lecaYr; //개설연도
	private String lecaSem; //개설학기
	private String count; // 응답자 수
	private List<String> evlEtcList; //평가내용
	
}


