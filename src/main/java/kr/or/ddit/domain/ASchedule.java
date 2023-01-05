package kr.or.ddit.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ASchedule {
	private int aschCd;		// 학사일정 코드
	private String aschTtl;	// 제목
	private String aschCon; // 내용
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date aschSt;	// 시작일자
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date aschEn;	// 종료일자
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date aschRegDt; // 일정등록일자
	private int empNo;		// 작성자번호
	private String empNm;	// 작성자명
}


