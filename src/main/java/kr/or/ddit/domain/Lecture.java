package kr.or.ddit.domain;

import lombok.Data;

@Data
public class Lecture {

	private String test;

	private int lecaCd;// 강의코드
	private int subCd;// 과목코드
	private int lecYn;// 개강 상태
	private int lecHcnt;// 수강인원
	private int lecaYn;// 승인여부
	private int depCd;// 학과코드
}
