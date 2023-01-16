package kr.or.ddit.domain;

import lombok.Data;

@Data
public class Attendence {
	private int	   atenCd		 ;
	private String atenDt        ;
	private int    lecaCd        ;
	private int    stuNo         ;
	private String atenCate      ;   //총 수업일수
	private int    atenWk        ;   //강의 주차  
	private int    atenHr        ;   //강의 시수
	private String atenAttend    ;   //출석
	private String atenAbsent    ;   //결석
	private String atenLate      ;   //지각
	private String atenEarly     ;   //조퇴
	private String atenOffically ;   //공결
	private String stuNm         ;   //이름
}
