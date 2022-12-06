package kr.or.ddit.domain;

import lombok.Data;

@Data
public class Subject {

	private int subCd; //과목코드
	private int proNo; //담당교수
	private int depCd; //담당학과
	private String subNm;//과목명
}
