package kr.or.ddit.domain;

import lombok.Data;

@Data
public class TestQ {
	private int	   teqCd      ; //시험문제코드
	private int	   testCd     ; //시험코드
	private String teqSeq     ; //문제순서
	private String teqOption1 ; //보기1
	private String teqOption2 ; //보기2
	private String teqOption3 ; //보기3
	private String teqOption4 ; //보기4
	private String teqCon;      // 문제
	private int    teqAnswer  ; //정답

}
