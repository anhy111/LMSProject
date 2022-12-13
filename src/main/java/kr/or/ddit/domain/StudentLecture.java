package kr.or.ddit.domain;

import lombok.Data;

@Data
public class StudentLecture {
	private int stuNo;
	private int lecaCd;
	private int slScore;
	private String depNm;
	private String lecaTrg;
	private String lecaCate;
	private String lecaNm;
}
