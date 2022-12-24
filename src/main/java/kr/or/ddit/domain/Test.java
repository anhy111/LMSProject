package kr.or.ddit.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Test {
	private int         testCd    ;   //시험코드
	private int         lecaCd    ;   //강의코드
	private String      testNm    ;   //시험명
	private String      testCon   ;   //시험내용
	private Date        testReg   ;   //시험등록일자
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date        testSdt   ;   //시험시작시간
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date        testEdt   ;   //시험종료시간
	private List<TestQ> testQList; //1 : N 시험문제
	private StudentTest stuTest;
	private List<StudentTestDetail> stdList;
	
	
	
	
	
	
	
}
