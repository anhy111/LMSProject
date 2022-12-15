package kr.or.ddit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Counsel {
	private Long cnslCd; //상담코드
	private int stuNo; //학번
	private String cnslCate; //카테고리
	private String cnslTtl; //제목
	private String cnslCon; //내용
	private Date cnslReg; //신청일
	private Date cnslDt; //상담일
	private String cnslRpl; //답변
	private int proNo; //담당교수
	private String empNm; //담당교수명
	
	private String answerState;// 대면/비대면
}
