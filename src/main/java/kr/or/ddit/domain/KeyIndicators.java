package kr.or.ddit.domain;

import lombok.Data;

@Data
public class KeyIndicators {
	// 차트에 필요한 데이터 domain
	private int colCd;
	private String colNm;
	private int yr;
	
	// 최대정원으로 충원율 기준잡음
	private int capacity;
	// 신입생 명수
	private int recruitmentRate;
	
}
