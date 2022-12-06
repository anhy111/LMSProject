package kr.or.ddit.domain;

import java.util.Date;

public class Approval {
	private int apprCd;  // 결재 코드 
	private Date apprDt; // 승인 일자
	private int apprYn; // 승인 여부 - 0: 반려, 1: 승인, 2:미처리
	private String apprRsn; // 반려 사유(*반려시 필수)
	private String apprCate; // 종류 - 강의계획서, 장학생추천
	private int proNo; // 결재 대상(결재 요청자)
	
	public Approval() {
	}

	public int getApprCd() {
		return apprCd;
	}

	public void setApprCd(int apprCd) {
		this.apprCd = apprCd;
	}

	public Date getApprDt() {
		return apprDt;
	}

	public void setApprDt(Date apprDt) {
		this.apprDt = apprDt;
	}

	public int getApprYn() {
		return apprYn;
	}

	public void setApprYn(int apprYn) {
		this.apprYn = apprYn;
	}

	public String getApprRsn() {
		return apprRsn;
	}

	public void setApprRsn(String apprRsn) {
		this.apprRsn = apprRsn;
	}

	public String getApprCate() {
		return apprCate;
	}

	public void setApprCate(String apprCate) {
		this.apprCate = apprCate;
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	@Override
	public String toString() {
		return "Approval [apprCd=" + apprCd + ", apprDt=" + apprDt + ", apprYn=" + apprYn + ", apprRsn=" + apprRsn
				+ ", apprCate=" + apprCate + ", proNo=" + proNo + "]";
	}
	
	
}
