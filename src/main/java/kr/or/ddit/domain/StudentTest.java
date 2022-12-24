package kr.or.ddit.domain;

import java.util.List;

import lombok.Data;

@Data
public class StudentTest {
	private int	   stCd;
	private int    stuNo  ; 
	private int    lecaCd ; 
	private int    testCd ; 
	private int    stScore;
	private String stYn   ;
	private List<StudentTestDetail> stdList;
}
