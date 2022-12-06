package kr.or.ddit.domain;

import java.util.Date;

public class LecNotice {
	private int lntcCd; //강의 공지사항 코드
	private String lntcTtl; //강의 공지사항 제목
	private String lntcCon; //강의 공지사항 내용
	private Date lntcReg; // 작성일자
	private Date lntcUpd; //수정일자
	private int lecaCd; //강의 코드
	
	public LecNotice() {
	}
	
	public int getLntcCd() {
		return lntcCd;
	}
	public void setLntcCd(int lntcCd) {
		this.lntcCd = lntcCd;
	}
	public String getLntcTtl() {
		return lntcTtl;
	}
	public void setLntcTtl(String lntcTtl) {
		this.lntcTtl = lntcTtl;
	}
	public String getLntcCon() {
		return lntcCon;
	}
	public void setLntcCon(String lntcCon) {
		this.lntcCon = lntcCon;
	}
	public Date getLntcReg() {
		return lntcReg;
	}
	public void setLntcReg(Date lntcReg) {
		this.lntcReg = lntcReg;
	}
	public Date getLntcUpd() {
		return lntcUpd;
	}
	public void setLntcUpd(Date lntcUpd) {
		this.lntcUpd = lntcUpd;
	}
	public int getLecaCd() {
		return lecaCd;
	}
	public void setLecaCd(int lecaCd) {
		this.lecaCd = lecaCd;
	}

	@Override
	public String toString() {
		return "LectureNotice [lntcCd=" + lntcCd + ", lntcTtl=" + lntcTtl + ", lntcCon=" + lntcCon + ", lntcReg="
				+ lntcReg + ", lntcUpd=" + lntcUpd + ", lecaCd=" + lecaCd + "]";
	}
	
	
	
}
