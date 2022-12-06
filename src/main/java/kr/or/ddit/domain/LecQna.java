package kr.or.ddit.domain;

import java.util.Date;

public class LecQna {

	private int lqnaCd; //질문게시글 코드
	private int lecaCd; //강의 코드
	private int stuNo; //학번
	private String lqnaTtl; //제목
	private String lqnaCon; //내용
	private Date lqnaDt; //작성일자
	private int lqnaHit; //조회수
	
	
	public LecQna() {
	}


	public int getLqnaCd() {
		return lqnaCd;
	}


	public void setLqnaCd(int lqnaCd) {
		this.lqnaCd = lqnaCd;
	}


	public int getLecaCd() {
		return lecaCd;
	}


	public void setLecaCd(int lecaCd) {
		this.lecaCd = lecaCd;
	}


	public int getStuNo() {
		return stuNo;
	}


	public void setStuNo(int stuNo) {
		this.stuNo = stuNo;
	}


	public String getLqnaTtl() {
		return lqnaTtl;
	}


	public void setLqnaTtl(String lqnaTtl) {
		this.lqnaTtl = lqnaTtl;
	}


	public String getLqnaCon() {
		return lqnaCon;
	}


	public void setLqnaCon(String lqnaCon) {
		this.lqnaCon = lqnaCon;
	}


	public Date getLqnaDt() {
		return lqnaDt;
	}


	public void setLqnaDt(Date lqnaDt) {
		this.lqnaDt = lqnaDt;
	}


	public int getLqnaHit() {
		return lqnaHit;
	}


	public void setLqnaHit(int lqnaHit) {
		this.lqnaHit = lqnaHit;
	}


	@Override
	public String toString() {
		return "LecQNA [lqnaCd=" + lqnaCd + ", lecaCd=" + lecaCd + ", stuNo=" + stuNo + ", lqnaTtl=" + lqnaTtl
				+ ", lqnaCon=" + lqnaCon + ", lqnaDt=" + lqnaDt + ", lqnaHit=" + lqnaHit + "]";
	}
	
	
}
