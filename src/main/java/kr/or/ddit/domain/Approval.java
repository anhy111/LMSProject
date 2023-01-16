package kr.or.ddit.domain;

import java.util.Date;
import java.util.List;

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
	private int apprTagCd;// 결재대상코드(강의계획서코드, 교수추천장학생코드)
	
	private List<Allocation> allocationList; // 결재시에 강의실도 함께 배정한다.
	
	private int viewPage;//페이지 번호
}
