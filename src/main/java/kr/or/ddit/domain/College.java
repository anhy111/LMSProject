package kr.or.ddit.domain;

import lombok.Data;

@Data
public class College {
	
	
	private int colCd;	// 단과대코드
	private String colNm; //단과대학명
	private String colDes; //단과대설명
	private String colTel; //단과대연락처
	private String colAddr; //단과대위치
	private String colImgUrl; //단과대이미지
	
	public College() {
	}
	
	
	
}
