package kr.or.ddit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Approval {
	private int apprCd;  // 결재 코드 
	private Date apprDt; // 승인 일자
	private Date apprSdt; // 기안 일자
	private String apprYn; // 승인 여부
	private String apprRsn; // 반려 사유(*반려시 필수)
	private String apprCate; // 종류 - 강의계획서, 장학생추천
	private int proNo; // 기안자
	private int empNo; // 결재자
	private String proNm; // 기안자이름
	private String empNm; // 결재자 이름
	
	
}
