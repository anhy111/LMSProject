package kr.or.ddit.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Counsel {
	//등록 데이터
	private int cnslCd; //상담코드
	private int stuNo; //학번
	private String cnslCate; //카테고리
	private int proNo; //담당교수
	private String cnslType;// 대면/비대면 선택 카테고리
	private Date cnslReg; //신청일
	private String cnslTtl; //제목
	private String cnslCon; //내용
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cnslDt; //상담답변일/대면상담신청일
	//학적 신청 연계시
	private int recCd; //학적코드 (상담 기록 확인용)
	// 받아오는 데이터
	private String cnslRpl; //답변
	private String empNm; //담당교수명
	private String stuNm; //학생명
	
}
